-file("test.erl", 1).

-module(test).

-record(person,{name, age = 0, phone}).

-export([tstFun/2,birthday/1,test1/0,test2/0]).

tstFun(Z, W) when Z rem W == 0 ->
    true;
tstFun(_Z, _W) ->
    false.

birthday({person, _, Age, _} = P) ->
    io:format("in records1:birthday(~p)~n", [P]),
    begin
        rec0 = Age + 1,
        rec1 = P,
        case rec1 of
            {person, _, _, _} ->
                setelement(3, rec1, rec0);
            _ ->
                error({badrecord, person})
        end
    end.

test1() ->
    io:format("~p=~p~n",
              ["length ( [ 1 , 2 , 3 ] )", length([1, 2, 3])]).

test2() ->
    io:format("?MODULE = ~p~n", [test]),
    io:format("?MODULE_STRING = ~p~n", ["test"]),
    io:format("?FILE = ~p~n", ["test.erl"]),
    io:format("?LINE = ~p~n", [23]),
    io:format("?MACHINE = ~p~n", ['BEAM']).



