-module(db).
-export([new/0, write/3, read/2, delete/2, destroy/1]).
-vsn(1.1).

% Start here
%
new()               -> dict:new().
write(Key, Data, Db)-> dict:store(Key, Data, Db).
read(Key, Db) ->
    case dict:find(Key, Db) of
        error       -> {error, instance};
        {ok, Data}  -> {ok, Data}
    end.
delete(Key, Db)     -> dict:erase(Key, Db).
destroy(_Db)        -> ok.