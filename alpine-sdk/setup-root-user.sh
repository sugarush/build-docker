## Set "root" shell to "zsh"
#  Replace "/bin/ash" with "/bin/zsh" in "/etc/passwd"
sed -i "s/\/bin\/ash/\/bin\/zsh/" /etc/passwd
