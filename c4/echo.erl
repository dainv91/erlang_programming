-module(echo).
-export([go/0, loop/0]).

% Start from here
%
go() ->
    register(echo, spawn(echo, loop, [])),
    % Pid = spawn(echo, loop, []),
    % Pid ! {self(), hello},
    echo ! {self(), hello},
    receive
        {_Pid, Msg} -> io:format("~w in pid ~w~n", [Msg, _Pid])
    end.
loop() ->
    receive
        {From, Msg} ->
            From ! {self(), io:format("Message received: ~w", [Msg])},
            loop();
        stop ->
            true
    end.