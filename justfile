set default-list := true

log := ".quarto/preview/log"
lock := ".quarto/preview/lock"

# Start Quarto's live preview at http://127.0.0.1:10001.
[arg("no_browser", long="no-browser", value="--no-browser")]
@dev no_browser="":
    mkdir -p .quarto/preview
    nohup quarto preview --port 10001 {{no_browser}} >{{log}} 2>&1 < /dev/null &
    echo "Quarto preview starting at http://127.0.0.1:10001 (log: {{log}})"

# Stop the preview process recorded in Quarto's lock file.
dev-stop:
    #!/usr/bin/env bash
    set -euo pipefail

    if [[ ! -f "{{ lock }}" ]]; then
      echo "No running Quarto preview found."
      exit 0
    fi

    preview_pid="$(< "{{ lock }}")"
    if ! kill -0 "$preview_pid" 2>/dev/null; then
      echo "No running Quarto preview found."
      exit 0
    fi

    kill "$preview_pid"
    while kill -0 "$preview_pid" 2>/dev/null; do
      sleep 0.1
    done
    echo "Quarto preview stopped."

# Stop the old preview before starting a replacement on the fixed port.
@dev-restart:
    just dev-stop
    just dev --no-browser

# Follow the live preview log.
dev-follow:
    tail -n 50 -f {{log}}

# Render the site to HTML.
build:
    quarto render
