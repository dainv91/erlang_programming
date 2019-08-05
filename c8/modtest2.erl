-module(modtest2).
-export([main/0, loop/0, a/1, do/1]).

% Start here
%
main() ->
    register(foo, spawn(?MODULE, loop, [])).
loop() ->
    receive
        {Sender, N} ->
            Sender ! a(N)
    end,
    io:put_chars("boo!~n"),
    modtest2:loop().
do(M) ->
    foo ! {self(), M},
    receive Y ->
        Y
    end.

a(N) -> N+5.