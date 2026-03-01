#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cache_file="$script_dir/.carapace.generated.zsh"

carapace_bin=${CARAPACE_BIN:-$(command -v carapace)}
"$carapace_bin" _carapace zsh | sed '1,5d' > "$cache_file"
