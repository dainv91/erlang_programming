-module(ex3).
-export([filter/2]).
-export([reverse/1]).
-export([concatenate/1]).
%-export([flatten/1]).
-export([quicksort/1]).

% Start program here
%

% filter(List, Element) -> filter_acc(reverse(List), Element, []).
filter(List, Element) -> filter_acc(List, Element, []).

filter_acc([H | T], Element, NewList) when H =< Element -> 
    filter_acc(T, Element, NewList ++ [H]);
filter_acc([_H|T], Element, NewList) -> filter_acc(T, Element, NewList);
filter_acc([], _Element, NewList) -> NewList.

reverse(List) -> reverse_acc(List, []).
reverse_acc([], New) -> New;
reverse_acc([H|T], New) -> reverse_acc(T, [H | New]).

concatenate(List) ->
    concatenate_acc(List, []).
concatenate_acc([], NewList) -> NewList;
%concatenate_acc([[H1|T1]|T], NewList) -> concatenate_acc([[T1] | T], [H1|NewList]);
concatenate_acc([[] | T], NewList) -> concatenate_acc(T, NewList); 
concatenate_acc([H | T], NewList) -> concatenate_acc(T, NewList ++ H).

flatten(List) ->
    flatten_acc(List, []).
flatten_acc(List, NewList) ->
    concatenate_acc(List, NewList).

% 3.6
quicksort([]) -> [];
quicksort([H|T]) -> 
    [Low, Hi] = partition(T, H, [], []),
    quicksort(Low) ++ [H] ++ quicksort(Hi).
partition([H|T], Pivot, ListLow, _ListHi) when H < Pivot ->
    io:format("Number < :~p,~p~n", [ListLow, H]),
    partition(T, Pivot, [H |ListLow], _ListHi);
partition([H|T], Pivot, _ListLow, ListHi)->
    io:format("Number >=:~p,~p~n", [ListHi, H]),
    partition(T, Pivot, _ListLow, [H |ListHi]);
partition([], _, ListLow, ListHi) -> 
    [ListLow, ListHi].

% quicksort([]) -> [];
% quicksort([P|T]) ->
%   [L, H] = split(P, T, [], []),
%   quicksort(L) ++ [P] ++ quicksort(H).

% split(P, [F|T], L, H) when F < P -> split(P, T, [F|L], H);
% split(P, [F|T], L, H) -> split(P, T, L, [F|H]);
% split(_, [], L, H) -> [L, H].

merge([]) -> [].

% 3.9
