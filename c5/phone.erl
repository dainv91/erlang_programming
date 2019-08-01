-module(phone).
%-export([idle/0, ringing/1, start_ringing/0, start_tone/0, stop_ringing/0]).
%-export([connected/1]).
% Start here
%

idle() ->
    receive
        {Number, incoming} ->
            start_ringing(),
            ringing(Number);
        off_hook ->
            start_tone(),
            dial()
    end.
ringing(Number) ->
    receive
        {Number, other_on_hook} ->
            stop_ringing(),
            idle();
        {Number, off_hook} ->
            stop_ringing(),
            connected(Number)
    end.

start_ringing() -> ok.
start_tone() -> ok.
stop_ringing() -> ok.
connected(_Number) -> ok.
dial() -> ok.