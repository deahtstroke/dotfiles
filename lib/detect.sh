# lib/detect.sh
#
# Sets three globals when detect_os is called:
#		OS_FAMILY		- alpine | debian | rhel | arch | macos | unknown
#		PKG_MANAGER - apk | apt | dnf | yum | pacman | brew | none
#		IS_MUSL			- true | false
detect_os() {
	if [ -f /etc/alpine-release ]; then
		OS_FAMILY="alpine"
		PKG_MANAGER="apk"
	elif [ -f /etc/debian_version ]; then
		OS_FAMILY="debian"
		PKG_MANAGER="apt"
	elif [ -f /etc/redhat-release ]; then
		OS_FAMILY="rhel"
		if command -v dnf >/dev/null 2>&1; then
			PKG_MANAGER="dnf"
		else
			PKG_MANAGER="yum"
		fi
	elif [ -f /etc/arch-release ]; then
		OS_FAMILY="arch"
		PKG_MANAGER="pacman"
	elif [ "$(uname -s)" = "Darwin" ]; then
		OS_FAMILY="macos"
		PKG_MANAGER="brew"
	else
		OS_FAMILY="unknown"
		PKG_MANAGER="none"
	fi

	IS_MUSL=false
	if [ "$OS_FAMILY" = "alpine" ]; then
		IS_MUSL=true
	elif command -v ldd >/dev/null 2>&1 && ldd --version 2>&1 | grep -qi musl; then
		IS_MUSL=true
	fi

	echo "Detected OS: $OS_FAMILY (package manager: $PKG_MANAGER, musl: $IS_MUSL)"
}
