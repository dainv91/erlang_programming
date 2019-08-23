-module(sequence).
-export([next/1]).


% Start here
%
next(Seq) ->
    fun() -> [Seq | next(Seq+1)] end.