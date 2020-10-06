#!/usr/bin/env zsh

# aliases.zsh
# for all active aliases, run `alias`


# Atom
# https://github.com/jeefberkey/dotfiles/blob/2ded1c3a813957909687a8ddce8a9befcc6b51d1/.zshrc#L48-L61
alias atom-beta="atom-nightly"
alias apm-beta="apm-nightly"
alias atom="atom-nightly"
alias apm="apm-nightly"


# dotfiles
alias mu="cd ${DOTFILES:-$HOME/Dropbox/Mackup} && mackup backup --force --root && git fetch --all --verbose && git submodule update --init --recursive && git status"
alias mux="cd ${DOTFILES:-$HOME/Dropbox/Mackup} && find . -type f -iname '.DS_Store' -delete && mackup backup --force --root --verbose && git fetch --all --verbose && git submodule update --init --recursive --remote && git status --verbose"


# Git
alias gap="git add --patch --verbose" # override `git apply` alias
alias gca="git commit --amend --verbose --gpg-sign"
alias gc="git commit --verbose --gpg-sign"
alias gcm="git commit --verbose --gpg-sign --message"
alias gco="git checkout --progress"
alias gfgs="git fetch --all --verbose && git status"
alias ggc="git fetch --prune --prune-tags --verbose && git gc --aggressive --prune=now"
alias gmv="git mv --verbose"
if command -v gpg2 > /dev/null 2>&1; then
  alias gpg="gpg2"
fi
alias gpull="git pull --rebase --autostash --verbose" # ohmyzsh/ohmyzsh@3d2542f
alias gtake="git checkout -b"
alias gti="git"
gu () {
  if [ -n "$1" ]; then
    cd ~/Code/"$1" || cd .
  fi

  # https://stackoverflow.com/a/53809163
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    git fetch --all --verbose

    # `git submodule update` with `--remote` appears to slow Git to a crawl
    # https://docs.google.com/spreadsheets/d/14W8w71DK0YpsePbgtDkyFFpFY1NVrCmVMaw06QY64eU
    git submodule update --init --recursive

    git status
  fi
}

# https://github.com/tarunsk/dotfiles/blob/5b31fd648bcfe4de54e27388a1e1e733fca80ab9/.always_forget.txt#L1957
alias gvc="git verify-commit HEAD"


# Python
alias python="python3"
alias pip="pip3"


# shell
# https://mywiki.wooledge.org/BashPitfalls?rev=524#Filenames_with_leading_dashes
alias cp="cp -r -i --"
cy () {
  if [[ -n $2 ]]; then
    cp "$1" "$2"
  else
    # if there is no second argument,
    # then copy to the current directory
    cp "$1" "$PWD"
  fi
}
alias mv="mv -v -i" # https://unix.stackexchange.com/a/30950
alias unixtime="date +%s" # via @Naresh https://stackoverflow.com/a/12312982
alias which="which -a"
alias whcih="which"
alias whihc="which"
alias whuch="which"
alias wihch="which"


# Zsh
alias aliases="edit $ZSH_CUSTOM/aliases.zsh; source ~/.zshrc && exec zsh"
alias ohmyzsh="cd ${ZSH:-$HOME/.oh-my-zsh}"
alias zshconfig="edit ~/.zshrc; source ~/.zshrc && exec zsh" # see ~/.zshrc for `edit`
alias zshrc="zshconfig"
