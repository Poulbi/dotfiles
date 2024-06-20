.PHONY: check format check-luacheck check-format

LUA_FILES := $(shell find -name "*.lua")

check: check-luacheck 

all: check check-format

check-luacheck:
	luacheck --globals=vis -- $(LUA_FILES)

check-format:
	set -e; for lf in $(LUA_FILES); do tools/check-format "$${lf}"; done

format:
	lua-format -i $(LUA_FILES)
