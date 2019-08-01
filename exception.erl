-module(exception).
-export([try_return/1]).
-export([try_wildcard/1]).
-export([add/2]).
-export([return/1]).

% Program start here
%

return_error(X) when X < 0 ->
    throw({'EXIT', {badarith, [{exception, return_error, 1}, 
                                {erl_eval, do_apply, 5},
                                {shell, exprs, 6}, 
                                {shell,eval_exprs, 6}, 
                                {shell, eval_loop, 3}]}});
return_error(X) when X == 0 -> 1/X;
return_error(X) when X > 0 ->
    {'EXIT', {badarith, [{exception, return_error, 1}, 
                            {erl_eval,do_apply, 5}, 
                            {shell, exprs, 6}, 
                            {shell, eval_exprs, 6}, 
                            {shell, eval_loop, 3}]}}.

try_return(X) when is_integer(X) ->
    try return_error(X) of
        Val -> {normal, Val}
    catch
        exit: Reason -> {exit, Reason};
        throw: Throw -> {throw, Throw};
        error: Error -> {error, Error}
    end.
try_wildcard(X) when is_integer(X) ->
    try return_error(X)
    catch
    throw: Throw -> {throw, Throw};
    error: _     -> error;
    Type: Error  -> {Type, Error};
    _            -> other; %% Will never be returned
    _:_          -> other  %% Will never be returned
end.

add(X, Y) ->
    test_int(X),
    test_int(Y),
    X + Y.
test_int(Int) when is_integer(Int) -> true;
test_int(Int) -> throw({error, {non_integer, Int}}).

return(X) when is_integer(X) -> catch return_error(X).