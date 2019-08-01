-module(test).
-export([unsafe/1]).
-export([preferred/1]).
-export([factorial/1]).
-export([guard/2]).
-export([guard2/2]).
-export([even/1, number/1]).
-export([bump/1]).
-export([average/1]).
%-export([even/1]).
-export([member/2]).
-export([sum_acc/2]).
-export([bump_acc/2]).
-export([merge/2]).
-export([average_acc/3]).
-export([test1/1]).
-export([test2/1]).

% Program start here
%
unsafe(X) -> 
    case X of
        one -> Y = 12;
        _   -> Y = 196 
    end,
    Y.
preferred(X) ->
    Y =     case X of
                one -> 12;
                _   -> 196
            end,
    X+Y.
% factorial(0) -> 1;
% factorial(N) ->
%     N * factorial(N-1).
factorial(N) when N > 0 -> 
    N * factorial(N-1);
    factorial(0) -> 1.
guard(X, Y)
    when not (((X>Y) or not(is_atom(X))) and (is_atom(Y) or (X==3.4))) ->
        X + Y.
guard2(X, Y) 
    when not(X>Y), is_atom(X); not(is_atom(Y)), x =/= 3.4 ->
        X+Y.
% even(Int) when Int rem 2 == 0 -> true;
% even(Int) when Int rem 2 == 1 -> false.

number(Num) when is_integer(Num)-> integer;
number(Num) when is_float(Num)  -> float;
number(_Other)                  -> false.

bump([]) -> [];
bump([Head|Tail]) -> [Head + 1 | bump(Tail)].

average([]) -> 0;
average(List) -> sum(List) / len(List).
sum([]) -> 0;
sum([Head | Tail]) -> Head + sum(Tail).
len([]) -> 0;
len([_ | Tail]) -> 1 + len(Tail).

even([]) -> [];
even([Head | Tail]) when Head rem 2 == 0 -> [Head | even(Tail)];
even([_ | Tail]) -> even(Tail).

member(_, []) -> false;
member(H, [H | _]) -> true;
member(H, [_|T]) -> member(H, T).

sum_acc([], Sum) -> Sum;
sum_acc([Head | Tail], Sum) -> sum_acc(Tail, Head + Sum).

bump_acc([], Acc) -> reverse(Acc);
bump_acc([Head | Tail], Acc) -> bump_acc(Tail, [Head + 1 | Acc]).

reverse(List) -> reverse_acc(List, []).
reverse_acc([], Acc) -> Acc;
reverse_acc([H | T], Acc) -> reverse_acc(T, [H | Acc]).

merge(Xs, Ys) ->
    lists:reverse(mergeL(Xs, Ys, [])).
mergeL([X | Xs], Ys, Zs) ->
    mergeR(Xs, Ys, [X | Zs]);
mergeL([], [], Zs) -> Zs.
mergeR(Xs, [Y|Ys], Zs) ->
    mergeL(Xs, Ys, [Y|Zs]);
mergeR([], [], Zs) -> Zs.

average_acc([], Sum, Length) when Length /= 0 -> Sum/Length;
average_acc([], _Sum, _Length) -> 0;
average_acc([H|T], Sum, Length) -> average_acc(T, Sum + H, Length + 1).

test1(N) ->
    case N of
        -1 -> false;
        1  -> true
    end.
test2(N) ->
    if
        N < 0   -> false;
        N > 0   -> true
    end.