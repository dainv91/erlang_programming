-module(exercise).
-export([create/1]).
-export([reverse_create/1]).
-export([print/1]).
-export([print_even/1]).

% Program start here
%

create(N) when N > 0 ->
    create_acc([N], N).
create_acc([H | T], Pos) when Pos > 1 ->
    create_acc([H-1 | [H|T]], Pos-1);
create_acc(List, _Pos) ->
    List.
reverse_create(N) ->
    lists:reverse(create(N)).
% reverse_create(N) ->
%     reverse_create_acc([N], N).
% reverse_create_acc([H|T], Pos) when Pos > 1 ->
%     reverse_create_acc([[H|T] | H-Pos + 1], Pos - 1);
% reverse_create_acc(List, _Pos) ->
%     List.

print(N) when N > 1 ->
    print(N-1), print_acc(N);
print(N) ->
    print_acc(N).
print_even(N) when N rem 2 == 0, N > 0 ->
    print_even(N-1), print_acc(N);
print_even(N) when N > 1 -> print_even(N-1);
print_even(_) -> ok.
print_acc(N) ->
    io:format("Number:~p~n", [N]).