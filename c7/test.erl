-module(test).
-define(Multiple(X, Y), X rem Y == 0).
% -define(DBG(Str, Args), ok).  
-define(DBG(Str, Args), io:format(Str, Args)).
-define(VALUE(Call), io:format("~p=~p~n", [??Call, Call])).

-record(person, {name, age=0, phone}).

-export([tstFun/2, birthday/1, test1/0, test2/0]).
%
tstFun(Z, W) when ?Multiple(Z, W) -> true;
tstFun(_Z, _W)                      -> false.

birthday(#person{age = Age} = P) ->
    ?DBG("in records1:birthday(~p)~n", [P]),
    P#person{age=Age+1}.

test1() -> ?VALUE(length([1, 2, 3])).
test2() ->
    ?DBG("?MODULE = ~p~n", [?MODULE]),
    ?DBG("?MODULE_STRING = ~p~n", [?MODULE_STRING]),
    ?DBG("?FILE = ~p~n", [?FILE]),
    ?DBG("?LINE = ~p~n", [?LINE]),
    ?DBG("?MACHINE = ~p~n", [?MACHINE]).