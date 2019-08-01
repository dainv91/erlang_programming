-module(my_db).
-export([start/0, stop/0, write/2, delete/1, read/1, match/1]).
-export([init/0]).

% Start here
%
start() ->
    register(my_db, spawn(?MODULE, init, [])),
    ok.
stop() ->
    my_db ! {stop, self()},
    receive
        {reply, Reply} -> Reply
    end.
write(Key, Element) -> call({write, Key, Element}).
delete(Key) -> call({delete, Key}).
read(Key) -> call({read, Key}).
match(Element) -> call({match, Element}).

% private functions
init() ->
    loop(initialize([])).
reply(To, Msg) ->
    To ! {reply, Msg}.
loop(State)->
    receive
        {request, From, Msg} ->
            {Reply, NewState} = handle_msg(Msg, State),
            reply(From, Reply),
            loop(NewState);
        {stop, From} ->
            reply(From, ok)
    end.

initialize([]) ->
    db:new().
handle_msg({write, Key, Element}, LoopData) ->
    NewDb = db:write(Key, Element, LoopData), {ok, NewDb};
handle_msg({delete, Key}, LoopData) ->
    NewDb = db:delete(Key, LoopData), {ok, NewDb};
handle_msg({read, Key}, LoopData) ->
    Element = db:read(Key, LoopData), {Element, LoopData};
handle_msg({match, Element}, LoopData) ->
    List = db:match(Element, LoopData), {List, LoopData};
handle_msg(Msg, State) ->
    Reply = Msg, NewState = State,
    {Reply, NewState}.
call(Msg) ->
    my_db ! {request, self(), Msg},
    receive
        {reply, Reply} -> Reply
    end.