#!/bin/bash

set -e

echo "Starting Ollama..."

# Start Ollama in background
ollama serve &

# Wait for API to become ready
until curl -s http://127.0.0.1:11434/api/tags >/dev/null 2>&1
do
  echo "Waiting for Ollama..."
  sleep 2
done

echo "Pulling qwen2.5:0.5b..."

# Pull model if not present
ollama pull qwen2.5:0.5b

echo "Model ready."

# Keep Ollama running
wait
