-module(server).
-export([start/2, stop/1, call/2]).
-export([init/1]).

% Start here
%
start(Name, Data) ->
    % Pid = spawn(generic_handler, init, [Data]),
    Pid = spawn(?MODULE, init, [Data]),
    register(Name, Pid), ok.
    % register(dainv, spawn(generic_handler, init, [Data])).
stop(Name) ->
    Name ! {stop, self()},
    receive
        {reply, Reply} -> Reply
    end.
call(Name, Msg) ->
    Name ! {request, self(), Msg},
    receive
        {reply, Reply} -> Reply
    end.
reply(To, Msg) ->
    To ! {reply, Msg}.
init(Data) ->
    loop(initialize(Data)).
loop(State) ->
    receive
        {request, From, Msg} ->
            {Reply, NewState} = handle_msg(Msg, State),
            reply(From, Reply),
            loop(NewState);
        {stop, From} ->
            reply(From, terminate(State))
    end.
initialize(Data) -> {started, Data}.
handle_msg(Msg, {State, Data}) ->
    {{Msg, Data}, {running, {Data, State}}}.
terminate(_State) -> {ok, terminated_success}.
