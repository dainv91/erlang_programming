-module(shapes).
%-import(math, [sqrt/1]).
-export([area/1]).

% This is a comment.
% #################.
area({square, Side}) ->
    Side * Side;
area({circle, Radius}) ->
    math:pi() * Radius * Radius;
area({triangle, A, B, C}) ->
    S = (A+B+C)/2,
    math:sqrt(S*(S-A)*(S-B)*(S-C));
area(_Other) ->
    {error, invalid_object, [parameter|[_Other]]}.
