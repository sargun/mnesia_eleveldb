suite=$(if $(SUITE), suite=$(SUITE), )

.PHONY: all deps check test clean

all: deps
	./rebar compile

deps:
	./rebar get-deps

docs:
	./rebar doc

check:
	./rebar check-plt
	./rebar dialyze

test:
	./rebar eunit $(suite) skip_deps=true


conf_clean:
	@:

clean:
	./rebar clean
	$(RM) doc/*
