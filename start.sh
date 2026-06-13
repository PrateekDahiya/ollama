#!/bin/bash

set -e

echo "Starting Ollama..."

ollama serve &
OLLAMA_PID=$!

until curl -s http://127.0.0.1:11434/api/tags >/dev/null 2>&1
do
  sleep 2
done

echo "Pulling model..."

ollama pull qwen2.5:0.5b

echo "Ready."

wait $OLLAMA_PID
