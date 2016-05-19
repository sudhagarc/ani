all:
	rebar3 compile
	@erl -noshell -pa '_build/default/lib/ani/ebin' -s ani start
