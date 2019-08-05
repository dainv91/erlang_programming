-module(db).
%-export([new/0, write/3, read/2, delete/2, destroy/1]).
-export([new/0, destroy/1, write/3, delete/2, read/2, convert/2]).
%-vsn(1.1).
-vsn(1.2).

% Start here
%
%new()               -> dict:new().
new()               -> gb_trees:empty().

%write(Key, Data, Db)-> dict:store(Key, Data, Db).
write(Key, Data, Db)-> gb_trees:insert(Key, Data, Db).

read(Key, Db) ->
    %case dict:find(Key, Db) of
    case gb_trees:lookup(Key, Db) of
        none       -> {error, instance};
        {value, Data}  -> {ok, Data}
    end.
%delete(Key, Db)     -> dict:erase(Key, Db).

delete(Key, Db)     -> gb_trees:delete(Key, Db).

destroy(_Db)        -> ok.

convert(dict, Dict) ->
    dict(dict:fetch_keys(Dict), Dict, new());
convert(_, Data) ->
    Data.
dict([Key | Tail], Dict, GbTree) ->
    Data = dict:fetch(Key, Dict),
    NewGbTree = gb_trees:insert(Key, Data, GbTree),
    dict(Tail, Dict, NewGbTree);
dict([], _, GbTree) -> GbTree.