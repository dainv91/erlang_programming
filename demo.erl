-module(demo).
-export([double/1]).
-export([test/2]).

% This is a comment.
% Everything on a line after % is ignored.

double(Value) ->
    times(Value, 2).
times(X, Y) ->
    X*Y.
test(X, Y) ->
    times(X, Y).
