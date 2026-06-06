#!/usr/bin/env bash
set -euo pipefail

# Install pinned Quarto extensions used by the reports
cd reports
# quarto add West-End-Statistics/quarto-ext-acr@v0.1.0 --no-prompt
quarto add West-End-Statistics/quarto-ext-cmt@v0.1.0 --no-prompt
