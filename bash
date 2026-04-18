#!/bin/bash

if [ -z "$ASK_API_URL" ] || [ -z "$ASK_MODEL" ] || [ -z "$ASK_API_KEY" ]; then
  echo "Error: ASK_API_URL, ASK_MODEL, and ASK_API_KEY must be set." >&2
  exit 1
fi

user_prompt="$*"

if [ -z "$user_prompt" ]; then
  echo "Usage: ask <prompt>" >&2
  exit 1
fi

echo "Connecting to system... Prompt to send: $user_prompt"