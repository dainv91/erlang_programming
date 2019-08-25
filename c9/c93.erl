-module(c93).
-export([zip/2, zipWith/3, zipWith/2]).

% Start here
%
zip([], _) -> [];
zip(_, []) -> [];
zip([H1 | T1], [H2 | T2]) ->
    [{H1, H2} | zip(T1, T2)].


zipWith(_, [], _) -> [];
zipWith(_, _, []) -> [];
zipWith(F, [H1 | T1], [H2 | T2]) ->
    [F(H1, H2) | zipWith(F, T1, T2)].
zipWith(List1, List2) ->
    zipWith(fun(X, Y) -> X+Y end, List1, List2).