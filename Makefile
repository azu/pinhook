OS   := $(shell uname | awk '{print tolower($$0)}')
ARCH := $(shell case $$(uname -m) in (x86_64) echo amd64 ;; (aarch64) echo arm64 ;; (*) echo $$(uname -m) ;; esac)
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
	@curl -sSL "https://github.com/suzuki-shunsuke/pinact/releases/download/v$(PINACT_VERSION)/pinact_$(OS)_$(ARCH).tar.gz" | tar -C $(BIN_DIR) -xzv pinact
	@mv $(BIN_DIR)/pinact $(PINACT)
	@ln -s -f $(notdir $(PINACT)) $(BIN_DIR)/pinact

