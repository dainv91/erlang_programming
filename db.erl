-module(db).
-export([new/0]).
-export([write/3]).
-export([read/2]).
-export([delete/2]).
-export([match/2]).
%-export([destroy/1]).

% Start program here
%
new() ->
    Db = [],
    Db.
% destroy(Db) ->
%     f(Db).
write(Key, Element, Db) ->
    NewDb = [{Key, Element} | Db], NewDb.
% delete(Key, [H | T]) -> delete(Key, [H | T], []);
% delete(Key, [{Key, Element}|T]) -> delete(Key, [{Key, Element}|T], []).
% delete(Key, [{Key, _}|T], NewDb) -> delete(Key, T, NewDb);
% delete(Key, [H | T], NewDb) -> delete(Key, T, [H | NewDb]);
% delete(_, [], NewDb) -> NewDb.

delete(Key, Db) -> delete(Key, Db, new()).

delete(Key, [{Key, _} | T], NewDb) -> delete(Key, T, NewDb);
delete(Key, [H | T], []) -> delete(Key, T, [H]);
delete(Key, [H | T], NewDb) -> delete(Key, T, [H | NewDb]);
delete(_, [], NewDb) -> NewDb.

read(_, []) -> {error, instance};
read(Key, [{Key, Element} | _]) -> {ok, Element};
read(Key, [_ | T]) -> read(Key, T).

match(Element, Db) ->
    match(Element, Db, []).
match(Element, [{Key, Element} | T], []) -> match(Element, T, [Key]);
match(Element, [{Key, Element} | T], List) -> match(Element, T, [List] ++ [Key]);
match(Element, [_H | T], List) -> match(Element, T, List);
match(_Element, [], List) -> List.
