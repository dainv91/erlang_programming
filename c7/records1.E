-file("records1.erl", 1).

-module(records1).

-export([birthday/1,joe/0,showPerson/1]).

-record(person,{name, age = 0, phone}).

-record(name,{first, surname}).

birthday({person, _, Age, _} = P) ->
    begin
        rec0 = Age + 1,
        rec1 = P,
        case rec1 of
            {person, _, _, _} ->
                setelement(3, rec1, rec0);
            _ ->
                error({badrecord, person})
        end
    end.

joe() ->
    {person, "Joe", 21, "999-999"}.

showPerson({person, Name, Age, Phone}) ->
    io:format("name: ~p, age: ~p, phone: ~p~n", [Name, Age, Phone]).



