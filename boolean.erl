-module(boolean).
-export([b_not/1]).
-export([b_and/2]).
-export([b_or/2]).
-export([b_nand/2]).

% Start from here
b_not(Value) ->
    %is_boolean(Value) and (Value /= true).
    case is_boolean(Value) of
        true -> Value /= true;
        _    -> false
    end.
b_and(true, true) ->
    true;
b_and(_, _) ->
    false. 
% b_or(true, _) ->
%     true;
% b_or(_, true) ->
%     true;
% b_or(_, _) ->
%     false.
b_or(X, Y) ->
    b_or({X, Y}).
b_or(Z) ->
    case Z of
        {true, _} -> true;
        {_, true} -> true;
        _         -> false
    end.
b_nand(X, Y) ->
    b_not(b_and(X, Y)).
