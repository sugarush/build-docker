## Add user "build"
#  Set ${USER} local variable
local USER="build"

#  (-D) Don't assign a password
#  (-s) Set login shell
adduser -D -s "/bin/zsh" "${USER}"


## Run "apk" as user "build"
#  Set variables
local FILE="/etc/sudoers"
local LINE="build ALL=NOPASSWD: /sbin/apk"

#  Add ${LINE} to ${FILE} if ${LINE} doesn't exist in ${FILE}
if ! grep -xq "${LINE}" "${FILE}"; then
  echo "${LINE}" >> "${FILE}"
fi


## Initialize ZShell
#  Set ${HOME} local variable
local HOME="$(getent passwd ${USER} | cut -d ':' -f '6')"

#  Create blank .zshrc
touch "${HOME}/.zshrc"
