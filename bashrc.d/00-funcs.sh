function _warn_n() {
	echo -en "\033[0;31m$(tput bold)$@$(tput sgr0)\033[0m"
}

function _warn() {
	_warn_n $1
	echo ""
}
