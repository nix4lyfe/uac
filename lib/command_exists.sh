#!/bin/sh
# SPDX-License-Identifier: Apache-2.0

# Check if command exists.
# Arguments:
#   string command: command
# Returns:
#   boolean: true on success
#            false on fail
command_exists()
{
  __co_command="${1:-}"

  if [ -z "${__co_command}" ]; then
    return 1
  fi

  if eval type type >/dev/null 2>/dev/null; then
    eval type "${__co_command}" >/dev/null 2>/dev/null
  elif command >/dev/null 2>/dev/null; then
    command -v "${__co_command}" >/dev/null 2>/dev/null
  else
    which "${__co_command}" >/dev/null 2>/dev/null
  fi

}