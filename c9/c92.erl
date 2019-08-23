-module(c92).
-export([div3/2, filter_num/1, intersect/2, symmetric/2]).

% Start here
%
div3(From, To) ->
    [X || X <- lists:seq(From, To), X rem 3 == 0].
filter_num(List) ->
    IsNumber = fun(X) -> is_number(X) end,
    [X || X <- List, IsNumber(X)].

intersect(L1, L2) ->
    [X || X <- L1, Y <- L2, X == Y].

symmetric(L1, L2) ->
    IsNotIn = fun(List, N) -> lists:all(fun(X) -> X =/=N end,List) end,
    [X || X <- L1, IsNotIn(L2, X)] ++ [Y || Y <- L2, IsNotIn(L1, Y)].
