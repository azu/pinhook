BIN_DIR      := ./bin

LEFTHOOK_VERSION           := 1.6.11
PINACT_VERSION             := 1.3.0
LEFTHOOK           := $(abspath $(BIN_DIR)/lefthook-$(LEFTHOOK_VERSION))
PINACT             := $(abspath $(BIN_DIR)/pinact-$(PINACT_VERSION))

.PHONY: setup
setup: $(LEFTHOOK)
	@git config --local core.hooksPath .githooks

.PHONY: lefthook
lefthook: $(LEFTHOOK)
$(LEFTHOOK):
	@curl -sSL "https://github.com/evilmartians/lefthook/releases/download/v$(LEFTHOOK_VERSION)/lefthook_$(LEFTHOOK_VERSION)_$(shell uname -s | sed 's/Darwin/MacOS/g')_$(shell uname -m)" -o $(LEFTHOOK) && chmod +x $(LEFTHOOK)
	@cp $(LEFTHOOK) $(BIN_DIR)/lefthook

.PHONY: pinact
pinact: $(PINACT)
$(PINACT):
	@curl -sSL "https://github.com/suzuki-shunsuke/pinact/releases/download/v$(PINACT_VERSION)/pinact_$(shell uname -s | sed 's/Darwin/MacOS/g')_$(shell uname -m)" -o $(PINACT) && chmod +x $(PINACT)
	@cp $(PINACT) $(BIN_DIR)/pinact

