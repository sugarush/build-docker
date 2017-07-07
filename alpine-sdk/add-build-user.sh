#!/usr/bin/env sh

local FILE="/etc/sudoers"
local LINE="build ALL=NOPASSWD: /sbin/apk"

if ! grep -xq "${LINE}" "${FILE}"; then
  echo "${LINE}" >> "${FILE}"
fi
