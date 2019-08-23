-module(hof1).
-export([doubleAll/1, revAll/1]).
-export([evens/1, palins/1, palin/1]).
-export([filter/2]).
-export([foreach/2]).
-export([times/1]).

% Start here
%

%doubleAll([]) -> [];
%doubleAll([X | Xs]) ->
%    [X*2 | doubleAll(Xs)].

revAll([]) -> [];
revAll([X | Xs]) ->
    %[reverse(X) | revAll(Xs)].
    [X | revAll(Xs)].

reverse([]) -> [];
reverse([X | Xs]) -> [reverse(Xs) | X].

doubleAll(Xs) -> 
    map(fun(X) -> X*2 end, Xs).
palins(Xs) ->
    filter(fun(X) -> X == reverse(X) end, Xs).

map(_, []) -> [];
map(F, [H | T]) ->
    [F(H) | map(F, T)].

evens([]) -> [];
evens([X | Xs]) ->
    case X rem 2 == 0 of
        true ->
            [X | evens(Xs)];
        _    ->
            evens(Xs)
    end.
%palins([]) -> [];
%palins([X | Xs]) ->
%    case palin(X) of 
%        true -> [X | palins(Xs)];
%        _    -> palins(Xs)
%end.
%palin(X) -> X == reverse(X).
palin(X) -> X == X.

filter(_P, []) -> [];
filter(P, [X | Xs]) ->
    case P(X) of
        true    ->
            [X | filter(P, Xs)];
        _       -> filter(P, Xs)
    end.

foreach(_F, []) -> ok;
foreach(F, [X | Xs]) ->
    F(X), foreach(F, Xs).

times(X) ->
    fun (Y) -> X*Y end.