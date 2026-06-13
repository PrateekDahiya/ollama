#!/bin/bash

# Start Ollama
ollama serve &

# Wait for server startup
sleep 10

# Download model if missing
ollama pull qwen2.5:0.5b

# Keep container running
wait
