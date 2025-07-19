#!/bin/bash

ARK_DIR="/home/steam/ARK"

# ================================================================================

DEFAULT_MAP_NAME="TheIsland"
DEFAULT_SESSION_NAME="MyArkSession"
DEFAULT_PORT="7777"
DEFAULT_QUERY_PORT="27015"
DEFAULT_DISABLE_BATTLEYE="False"

MAP_NAME="${MAP_NAME:=$DEFAULT_MAP_NAME}"
SESSION_NAME="${SESSION_NAME:=$DEFAULT_SESSION_NAME}"
PORT="${PORT:=$DEFAULT_PORT}"
QUERY_PORT="${QUERY_PORT:=$DEFAULT_QUERY_PORT}"
DISABLE_BATTLEYE="${DISABLE_BATTLEYE:=$DEFAULT_DISABLE_BATTLEYE}"

# ================================================================================
# Build command

CMD=("$ARK_DIR/ShooterGame/Binaries/Linux/ShooterGameServer")

ARG="$MAP_NAME?listen?SessionName=$SESSION_NAME?Port=$PORT?QueryPort=$QUERY_PORT"
CMD+=("$ARG")
if [[ "$DISABLE_BATTLEYE" = "True" ]]; then
    CMD+=("-NoBattlEye")
fi
CMD+=("-automanagedmods")

# ================================================================================
# Run

cd $ARK_DIR/ShooterGame/Binaries/Linux || exit

# Update server
/home/steam/steamcmd/steamcmd.sh +force_install_dir "$ARK_DIR" +login anonymous +app_update 376030 -beta preaquatica +quit

# Run
"${CMD[@]}"
