-module(ani).
-export([start/0]).

start() ->
    io:format("Hello world! My name is Anirudh!!~n"),
    Handle = bitcask:open("my_db", [read_write]),
    N = fetch(Handle),
    store(Handle, N + 1),
    io:format("I have been executed ~B times~n", [N]),
    bitcask:close(Handle),
    init:stop().

store(H, N) ->
    bitcask:put(H, <<"num_runs">>, term_to_binary(N)).

fetch(H) ->
    case bitcask:get(H, <<"num_runs">>) of
        not_found -> 1;
        {ok, Bin} -> binary_to_term(Bin)
    end.

