-module(echo2).
-export([start/0, print/1, stop/0]).

% Start here
%
start() -> 
    register(echo, spawn(echo, loop, [])),
    0.
print(Term) -> ok.
stop() -> ok.

loop() ->
    receive
        {From, Msg} ->
            From ! {self(), io:format("Message received: ~w", [Msg])},
            loop();
        stop -> ok
    end.