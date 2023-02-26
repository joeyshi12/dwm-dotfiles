alias \
    ls="ls --color=auto" \
    grep="grep --color=auto" \
    v="$EDITOR" \
    sv="sudo -E $EDITOR" \
    m="neomutt" \
    copy="xclip -sel c" \
    diff="diff --color" \
    ssh="kitty +kitten ssh"  # kitty ssh patch

# pacman abbreviations
alias \
    pacs="sudo pacman -S" \
    pacss="pacman -Ss" \
    pacqs="pacman -Qs" \
    pacsyu="sudo pacman -Syu" \
    pacrs="sudo pacman -Rs" \
    pacsc="sudo pacman -Sc"

pacar() {
    orphan_packages="$(pacman -Qdtq)"
    if [ -z "$orphan_packages" ]; then
        echo "error: no orphan packages found"
    else
        sudo pacman -Rs "$orphan_packages"
    fi
}

# git abbreviations
alias \
    g="git" \
    ga="git add" \
    gaa="git add --all" \
    grm="git rm --cached" \
    gb="git branch" \
    gc="git commit -vm" \
    gca="git commit -vam" \
    gcl="git clone --recurse-submodules" \
    gl="git pull" \
    gup="git pull --rebase" \
    gm="git merge" \
    gp="git push" \
    gf="git fetch" \
    gco="git checkout" \
    gst="git status" \
    gd="git diff" \
    gdc="git diff --cached" \
    glg="git log --graph" \
    gr="git remote"

# tmux abbreviations
alias \
    t="tmux" \
    ta="tmux attach-session" \
    tl="tmux list-sessions" \
    tk="tmux kill-session"

# Compiles and executes C file and removes binary
# $1 path to the C file
crun() {
    gcc "$1" && ./a.out "${@:2}" && rm a.out
}

# lf with ueberzug image preview
lf() {
    cleanup() {
        ~/.dotfiles/.config/lf/cleaner
        exec 3>&-
        rm "$LF_UEBERZUG_TEMPDIR/fifo"
        rm -rf "$LF_UEBERZUG_TEMPDIR"
    }
    trap cleanup INT HUP

    # Set up temporary directory.
    export LF_UEBERZUG_TEMPDIR="$(mktemp -d -t lf-ueberzug-XXXXXX)"

    # Launch ueberzug.
    mkfifo "$LF_UEBERZUG_TEMPDIR/fifo" || exit 1
    ueberzug layer --silent < "$LF_UEBERZUG_TEMPDIR/fifo" &
    exec 3> "$LF_UEBERZUG_TEMPDIR/fifo"
    UEBERZUGPID=$!

    # Add this script's directory to PATH so that the lf config will find
    # lf-ueberzug-cleaner and lf-ueberzgu-previewer. If no startup directory is
    # provided, start lf in the examples directory.
    export PATH="$PATH:${ZSH_ARGZERO:A:h}"
    /bin/lf -last-dir-path "$LF_UEBERZUG_TEMPDIR/lfdir"
    cd "$(cat $LF_UEBERZUG_TEMPDIR/lfdir)"
    cleanup
}
