-module(prime).
-export([is_prime/1, split_num/1]).

% Start here
%
is_prime(Num) when Num < 2 -> false;
%is_prime(2) -> true;
is_prime(Num) -> is_prime(Num, lists:seq(2, trunc(math:sqrt(Num)))).

is_prime(_Num, []) -> true;
is_prime(Num, [Num | T]) -> is_prime(Num, T);
is_prime(Num, [H | _]) when Num rem H == 0 -> false;
is_prime(Num, [_ | T]) -> is_prime(Num, T).

split_num(N) -> split_num(N, 2).

split_num(N, M) when M > N -> [N, 1];
split_num(N, M) when M rem 4 == 0; M rem 6 == 0, M rem 10 == 0-> split_num(N, M+1);
split_num(N, M) ->
    P = {is_prime(M), is_prime(N - M)},
    case P of
        {true, true} -> ok;
        _ -> split_num(N, M+1)
    end,
    [N, M].
