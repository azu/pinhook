BIN_DIR      := ./bin

LEFTHOOK_VERSION           := 1.6.11

LEFTHOOK           := $(abspath $(BIN_DIR)/lefthook-$(LEFTHOOK_VERSION))
.PHONY: setup
setup: $(LEFTHOOK)
	@git config --local core.hooksPath .githooks

.PHONY: lefthook
lefthook: $(LEFTHOOK)
$(LEFTHOOK):
	@curl -sSL "https://github.com/evilmartians/lefthook/releases/download/v$(LEFTHOOK_VERSION)/lefthook_$(LEFTHOOK_VERSION)_$(shell uname -s | sed 's/Darwin/MacOS/g')_$(shell uname -m)" -o $(LEFTHOOK) && chmod +x $(LEFTHOOK)
	@cp $(LEFTHOOK) $(BIN_DIR)/lefthook

