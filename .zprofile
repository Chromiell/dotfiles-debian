if [ "$XDG_SESSION_TYPE" = wayland ] ; then
    if [[ $PATH != *"games"* ]]; then
        export PATH="/usr/local/games:$PATH"
        export PATH="/usr/games:$PATH"
    fi
fi

export QT_QPA_PLATFORMTHEME=gtk2

export PATH="$PATH:$HOME/.config/composer/vendor/bin"
