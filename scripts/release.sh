#!/bin/bash

set -euo pipefail

echo "--- Pushing gorillastack/buildkite-agent-node"
docker push "gorillastack/buildkite-agent-node"
