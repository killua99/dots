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
CURRENT=$(pwd)

cat <<EOF

We're about to install all dots in your ${LOCATION} directory

    📌 .config/fish
    📌 .config/karabiner
    📌 .bash_profile
    📌 .gitconfig
    📌 .viminfo

If you want to know more, please ask for help: ``./install.sh -h|--help``

EOF

if [[ -d "${LOCATION}/.config/fish" ]]; then
    if [[ -L "${LOCATION}/.config/fish" ]]; then
        unlink "${LOCATION}/.config/fish"
    else
        mv "${LOCATION}/.config/fish" "${LOCATION}/.config/fish.bkp"
    fi
fi

[ ! -d "${LOCATION}/.config" ] && mkdir ${LOCATION}/.config

ln -s "${CURRENT}/.config/fish" "${LOCATION}/.config/fish"

echo "Fish installed ✅"

if [[ -d "${LOCATION}/.config/karabiner" ]]; then
    if [[ -L "${LOCATION}/.config/karabiner" ]]; then
        unlink "${LOCATION}/.config/karabiner"
    else
        mv "${LOCATION}/.config/karabiner" "${LOCATION}/.config/karabiner.bkp"
    fi
fi

ln -s "${CURRENT}/.config/karabiner" "${LOCATION}/.config/karabiner"

echo "Karabiner installed ✅"

if [[ -f "${LOCATION}/.bash_profile" ]]; then
    if [[ -L "${LOCATION}/.bash_profile" ]]; then
        unlink "${LOCATION}/.bash_profile"
    else
        mv "${LOCATION}/.bash_profile" "${LOCATION}/.bash_profile.bkp"
    fi
fi

ln -s "${CURRENT}/.bash_profile" "${LOCATION}/.bash_profile"

echo "Config bash_profile installed ✅"

if [[ -f "${LOCATION}/.gitconfig" ]]; then
    if [[ -L "${LOCATION}/.gitconfig" ]]; then
        unlink "${LOCATION}/.gitconfig"
    else
        mv "${LOCATION}/.gitconfig" "${LOCATION}/.gitconfig.bkp"
    fi
fi

ln -s "${CURRENT}/.gitconfig" "${LOCATION}/.gitconfig"

echo "Config gitconfig installed ✅"

if [[ -f "${LOCATION}/.gitignore" ]]; then
    if [[ -L "${LOCATION}/.gitignore" ]]; then
        unlink "${LOCATION}/.gitignore"
    else
        mv "${LOCATION}/.gitignore" "${LOCATION}/.gitignore.bkp"
    fi
fi

ln -s "${CURRENT}/.gitignore.tmp" "${LOCATION}/.gitignore"

echo "Config gitignore installed ✅"
