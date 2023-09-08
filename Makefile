SHELL=/bin/bash
help:
	@echo ""
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  list-test                📑 list all the test under the tests directory"
	@echo "  test                     ✅ Run the test"
	@echo "  test/watch               🔍 Automatically run the test every second"

# Directory where your tests scripts are located
SRC_SCRIPTS_DIR=src
TEST_SCRIPTS_DIR=tests

# Find all *_test.sh scripts in the specified directory
TEST_SCRIPTS = $(wildcard $(TEST_SCRIPTS_DIR)/*/*[tT]est.sh)

# Display the list of tests scripts found
init-hooks:
	$(SRC_SCRIPTS_DIR)/init.sh

# Display the list of tests scripts found
list-tests:
	@echo "Test scripts found:"
	@echo $(TEST_SCRIPTS)

# Run all tests scripts
test: $(TEST_SCRIPTS)
	./bashunit $(TEST_SCRIPTS)

test/watch: $(TEST_SCRIPTS)
	watch --color -n 1 ./bashunit $(TEST_SCRIPTS)

.PHONY: test list-tests
