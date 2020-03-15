#!/usr/bin/env bash

set -e

POSITIONAL=()

while [[ $# -gt 0 ]]; do
    key="$1"

    case "$key" in
        -h|--help)
            cat <<EOF

Comman usage:

./install.sh [<path>] -d|--debug -h|--help

Arguments:

  🔰 path           Path where to install symlinks of dots

Options:

  🔰 d|--debug      Print commands
  🔰 h|--help       Print this message

Help:

  This bash script helps to install dots in your $HOME or path you define:

    ``./install.sh``

    ``./install.sh /path/to/custom/home``

EOF
            exit 0
            ;;
        -d|--debug)
            set -x
            shift
            ;;
        *)
            POSITIONAL+=("$1")
            shift
            ;;
    esac
done

set -- "${POSITIONAL[@]}"

LOCATION="${1:-$HOME}"

cat <<EOF

We're about to install all dots in your ${LOCATION} directory

    📌 .config/fish
    📌 .config/karabiner
    📌 .bash_profile
    📌 .gitconfig
    📌 .viminfo

If you want to know more, please ask for help: ``./install.sh -h|--help``

EOF
