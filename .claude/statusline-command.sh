#!/usr/bin/env bash
input=$(cat)

# Line 1: model name + git branch
model=$(echo "$input" | jq -r '.model.display_name // "Unknown Model"')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
branch=""
if [ -n "$cwd" ]; then
  branch=$(git -C "$cwd" --no-optional-locks rev-parse --abbrev-ref HEAD 2>/dev/null)
fi
if [ -n "$branch" ]; then
  printf "\033[1;36m%s\033[0m  \033[1;33m %s\033[0m\n" "$model" "$branch"
else
  printf "\033[1;36m%s\033[0m\n" "$model"
fi

# Line 2: context used % + 5-hour rate limit as daily usage
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
five_pct=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')

ctx_part=""
if [ -n "$used" ]; then
  ctx_part=$(printf "Ctx: %.0f%% used" "$used")
fi

rate_part=""
if [ -n "$five_pct" ]; then
  remaining_rate=$(echo "$five_pct" | awk '{printf "%.0f", 100 - $1}')
  rate_part=$(printf "Daily: %s%% remaining" "$remaining_rate")
fi

if [ -n "$ctx_part" ] && [ -n "$rate_part" ]; then
  printf "\033[0;90m%s  |  %s\033[0m\n" "$ctx_part" "$rate_part"
elif [ -n "$ctx_part" ]; then
  printf "\033[0;90m%s\033[0m\n" "$ctx_part"
elif [ -n "$rate_part" ]; then
  printf "\033[0;90m%s\033[0m\n" "$rate_part"
fi
