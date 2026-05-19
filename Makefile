.PHONY: fmt fmt-check lint test

fmt:
	stylua .

fmt-check:
	stylua --check .

lint:
	luacheck . --config .luacheckrc

