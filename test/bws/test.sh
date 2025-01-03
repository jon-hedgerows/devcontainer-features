#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'keyring' Feature with no options.

set -e

# Optional: Import test library bundled with the devcontainer CLI
# See https://github.com/devcontainers/cli/blob/HEAD/docs/features/test.md#dev-container-features-test-lib
# Provides the 'check' and 'reportResults' commands.
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib. Syntax is...
# check <LABEL> <cmd> [args...]
check "bws help" bash -c "bws help"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
