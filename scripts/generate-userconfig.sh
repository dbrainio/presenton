#!/usr/bin/env sh

set -eu

APP_DATA_DIR=${APP_DATA_DIR:-/app_data}
USER_CONFIG_PATH=${USER_CONFIG_PATH:-$APP_DATA_DIR/userConfig.json}

mkdir -p "$APP_DATA_DIR"

# Defaults
: "${LLM:=openai}"
: "${OPENAI_MODEL:=gpt-4o}"
: "${IMAGE_PROVIDER:=ideogram}"
: "${OLLAMA_URL:=http://localhost:11434}"

cat > "$USER_CONFIG_PATH" <<EOF
{
  "LLM": "${LLM}",
  "OPENAI_API_KEY": "${OPENAI_API_KEY:-}",
  "OPENAI_MODEL": "${OPENAI_MODEL}",
  "OLLAMA_URL": "${OLLAMA_URL}",
  "IMAGE_PROVIDER": "${IMAGE_PROVIDER}",
  "IDEOGRAM_API_KEY": "${IDEOGRAM_API_KEY:-}"
}
EOF

echo "Generated $USER_CONFIG_PATH"


