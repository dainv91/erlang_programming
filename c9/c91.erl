-module(c91).
-export([map/2, each/2, print/1, le/2]).
-export([even_to/1, concat/1, sum/1]).

% Start here
%
%print_acc([]) -> io:format("~n");
%print_acc([H | T]) ->
 %   io:format("~w ", [H]), print_acc(T).
%print(N) -> print_acc(lists:seq(1, N)).
print(_, []) -> io:format("~n");
print(F, [H | T]) -> F(H), print(F, T).
print(N) -> print(fun(X) -> io:format("~w ", [X]) end, lists:seq(1, N)).

each(_, []) -> print(ok, []);
each(F, [H | T]) ->
    F(H), each(F, T).

map(_, []) -> [];
map(F, [H | T]) ->
    [F(H) | map(F, T)].

% le([], _) -> [];

% le([H|T], N) ->
%     %[X || X <- List, X =< N].
%     LessThan = fun(X, Y) -> X=<Y end,
%    case LessThan(H, N) of
%        true -> [H | le(T, N)];
%        _    -> le(T, N)
%    end.
le(_List = [H | T], N) when H > N->
    %lists:filter(fun (X) -> X =< N end, List).
    le(T, N);
le([], _N) -> [];
le([H | T], N) ->
    [H | le(T, N)].


even_to(N) ->
    PrintEven = fun(X) when X rem 2 == 0 ->
        io:format("~w ", [X]);
        (_) -> io:format("")
            end,
        each(PrintEven, lists:seq(1, N)).

concat([]) -> [];
%concat(List) -> lists:append(List).
concat([E]) -> E;
concat([H | T]) -> H ++ concat(T).

sum(List) ->
    Func = fun(X, Sum) -> X + Sum end,
    lists:foldl(Func, 0, List).