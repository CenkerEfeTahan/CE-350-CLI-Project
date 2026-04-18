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

payload=$(jq -n \
  --arg model "$ASK_MODEL" \
  --arg sys_msg "You are a CLI tool. Output plain text only. No yapping. Keep the output concise." \
  --arg usr_msg "$user_prompt" \
  '{model: $model, messages: [{role: "system", content: $sys_msg}, {role: "user", content: $usr_msg}]}')

response=$(curl -s -X POST "$ASK_API_URL" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $ASK_API_KEY" \
  -d "$payload")

echo "$response" | jq -r '.choices[0].message.content'