#!/usr/bin/env zsh

# Powerlevel10k instant prompt
# https://github.com/romkatv/powerlevel10k/tree/d394a4e#how-do-i-enable-instant-prompt
if [ -r "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]; then
  . "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from Bash you might have to change your PATH.
# export PATH=${HOME}/bin:/usr/local/bin:${PATH}

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# powerlevel10k
# https://github.com/romkatv/powerlevel10k/blob/48c6ff4/README.md#oh-my-zsh
# ZSH_THEME
if [ -d "${ZSH}/custom/themes/powerlevel10k" ]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
else
  ZSH_THEME="robbyrussell"
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often, in days, to autoupdate.
export UPDATE_ZSH_DAYS=1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst awaiting completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# set maximum number of lines in history file
# https://unix.stackexchange.com/a/273863
export HISTSIZE=2147483647
export SAVEHIST=${HISTSIZE}

# Use a custom folder other than $ZSH/custom
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM=${ZSH}/custom
ZSHCUSTOM=${ZSH_CUSTOM}

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins
# Custom plugins may be added to $ZSH_CUSTOM/plugins
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins+=(
  git
  gunstage
)
if [ "$(uname)" = Darwin ]; then
  plugins+=(
    zsh-syntax-highlighting
  )
fi

# trapd00r/LS_COLORS: .dircolors to override Oh My Zsh’s `ls -G` for coreutils
# https://github.com/ohmyzsh/ohmyzsh/blob/d0d01c0/lib/theme-and-appearance.zsh
# https://github.com/trapd00r/LS_COLORS/tree/6a4d29b#installation
# https://github.com/paulirish/dotfiles/blob/ccccd07/.dircolors
[ -e "${HOME}/.local/share/lscolors.sh" ] && . "${HOME}/.local/share/lscolors.sh"

. "${ZSH}/oh-my-zsh.sh"



# User configuration



# MANPATH
# export MANPATH="/usr/local/man:${MANPATH}"
[ -z "${MANPATH}" ] && MANPATH="$(man -w)"
export MANPATH

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# $EDITOR: access favorite with `edit`
# Set preferred editor if it is available
# https://stackoverflow.com/a/14755066
# https://github.com/wililupy/snapd/commit/0573e7b
if command -v nvim >/dev/null 2>&1; then
  # https://unix.stackexchange.com/q/4859#comment5812_4861
  EDITOR="$(command -v nvim)"
elif command -v vim >/dev/null 2>&1; then
  EDITOR="$(command -v vim)"
elif command -v vi >/dev/null 2>&1; then
  EDITOR="$(command -v vi)"
else
  EDITOR="$(command -v nano)"
fi
export EDITOR
# https://github.com/koalaman/shellcheck/wiki/SC2139/db553bf16fcb86b2cdc77b835e75b9121eacc429#this-expands-when-defined-not-when-used-consider-escaping
alias editor='$EDITOR'
alias edit="editor"
# https://unix.stackexchange.com/a/4861
VISUAL="${EDITOR}"
export VISUAL

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# iTerm
[ -e "${HOME}/.iterm2_shell_integration.zsh" ] && . "${HOME}/.iterm2_shell_integration.zsh"

# GPG signing with macOS-compatible Linux
# https://docs.github.com/en/github/authenticating-to-github/telling-git-about-your-signing-key#telling-git-about-your-gpg-key
# https://reddit.com/comments/dk53ow/_/f50146x
GPG_TTY=$(tty)
export GPG_TTY

# Homebrew
# https://github.com/Homebrew/brew/blob/a5b6c5f/Library/Homebrew/diagnostic.rb#L432-L435
[ -d /usr/local/sbin ] && PATH="/usr/local/sbin:${PATH}"

# GNU Core Utils
# for `date`, `cat`, `ln`
# https://apple.stackexchange.com/a/135749
[ -d /usr/local/opt/coreutils/libexec/gnubin ] && PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"

# GNU Find Utils
# for `find`, `xargs`, `locate`
[ -d /usr/local/opt/findutils/libexec/gnubin ] && PATH="/usr/local/opt/findutils/libexec/gnubin:${PATH}"

# grep
# use latest via Homebrew but without the `g` prefix
# https://github.com/Homebrew/homebrew-core/blob/ba7a70f/Formula/grep.rb#L43-L46
[ -d /usr/local/opt/grep/libexec/gnubin ] && PATH="/usr/local/opt/grep/libexec/gnubin:${PATH}"

# make
# use latest via Homebrew but without the `g` prefix
# https://github.com/Homebrew/homebrew-core/blob/9591758/Formula/make.rb#L37-L41
[ -d /usr/local/opt/make/libexec/gnubin ] && PATH="/usr/local/opt/make/libexec/gnubin:${PATH}"

# sed
# https://github.com/Homebrew/homebrew-core/blob/8ec6f0e/Formula/gnu-sed.rb#L35-L39
[ -d /usr/local/opt/gnu-sed/libexec/gnubin ] && PATH="/usr/local/opt/gnu-sed/libexec/gnubin:${PATH}"

# Rust Cargo
# if its `bin` is a directory, then add it to `PATH`
[ -d "${HOME}/.cargo/bin" ] && PATH="${HOME}/.cargo/bin:${PATH}"

# Bashhub.com
[ -e "${HOME}/.bashhub/bashhub.zsh" ] && . "${HOME}/.bashhub/bashhub.zsh"

# npm without sudo
# https://github.com/sindresorhus/guides/blob/285270f/npm-global-without-sudo.md#3-ensure-npm-will-find-installed-binaries-and-man-pages
NPM_PACKAGES="${HOME}/.npm-packages"
[ -d "${NPM_PACKAGES}/bin" ] && PATH="${PATH}:${NPM_PACKAGES}/bin"
[ -d "${NPM_PACKAGES}/share/man" ] && MANPATH="${MANPATH}:${NPM_PACKAGES}/share/man"

# RVM and rbenv are incompatible and shell references to RVM have to be removed
# https://github.com/rbenv/rbenv/blob/577f046/README.md#installation
# Add RVM to PATH for scripting
# Make sure this is the last PATH variable change
# export PATH="${PATH}:${HOME}/.rvm/bin"

# dotfiles
# set to where they are syncing if it exists, or else use the default: $HOME
# https://github.com/ohmyzsh/ohmyzsh/blob/5ffc0d0/oh-my-zsh.sh#L20-L24
# https://stackoverflow.com/a/13408590
if [ -z "${DOTFILES}" ] || [ -e "${HOME}/Dropbox/dotfiles" ]; then
  export DOTFILES=${HOME}/Dropbox/dotfiles
else
  export DOTFILES="${HOME}"
fi
if [ -d "${HOME}/Code/ Template" ] || [ -d "${HOME}/Code/Template" ]; then
  export TEMPLATE="${HOME}/Code/ Template"
fi

# completion dots
# https://git.io/completion-dots-in-.zshrc
expand-or-complete-with-dots () {
  print -Pn "%F{red}...%f"
  zle expand-or-complete
  zle redisplay
}

# include hidden files in tab completion
# https://unix.stackexchange.com/a/366137
setopt globdots
# but hide `./` and `../`
# https://unix.stackexchange.com/q/308315#comment893697_308322
zstyle ':completion:*' special-dirs false

# zsh-completions
# https://github.com/Homebrew/homebrew-core/blob/7cf42e0/Formula/zsh-completions.rb#L18-L23
#
# https://github.com/zsh-users/zsh-completions/tree/f68950a#oh-my-zsh
if [ -d ${ZSH:-${HOME}/.oh-my-${0##*[-/]}}/custom/plugins/zsh-completions/src ]; then
  FPATH="${ZSH:-${HOME}/.oh-my-${0##*[-/]}}/custom/plugins/zsh-completions/src:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# share all commands from everywhere
# https://github.com/mcornella/dotfiles/blob/047eaa1/zshrc#L104-L105
setopt share_history

# pyenv
# https://git.io/init_-_--no-rehash
command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init - --no-rehash "${SHELL##*[-/]}")"

# C, C++ headers
# https://apple.stackexchange.com/a/372600
if command -v xcrun >/dev/null 2>&1; then
  CPATH=$(xcrun --show-sdk-path)/usr/include
  export CPATH
fi

# Flutter
# https://github.com/flutter/website/blob/e5f725c/src/docs/get-started/install/_path-mac.md#user-content-update-your-path
# if `~/Code/Flutter/bin/flutter`’s an executable
# and `flutter`’s not in the PATH, then add it
if [ -x "${HOME}/Code/Flutter/bin/flutter" ]; then
  if ! command -v flutter >/dev/null 2>&1; then
    PATH="${PATH}:${HOME}/Code/Flutter/bin"
  fi
fi

# Android SDK
# if it’s a directory, then assign it the name `ANDROID_SDK_ROOT`
[ -d "${HOME}/Library/Android/sdk" ] && export ANDROID_SDK_ROOT=${HOME}/Library/Android/sdk

# pip
# location of Python packages on Linux
[ -d "${HOME}/.local/bin" ] && PATH="${HOME}/.local/bin:${PATH}"

# rbenv
# https://hackernoon.com/the-only-sane-way-to-setup-fastlane-on-a-mac-4a14cb8549c8#6a04
# https://git.io/init_-_--no-rehash
# export PATH="${HOME}/.rbenv/bin:${PATH}"
command -v rbenv >/dev/null 2>&1 && eval "$(rbenv init - --no-rehash "${SHELL##*[-/]}")"

# Radicle
# https://github.com/radicle-dev/radicle-docs/blob/a0f08f4/docs/getting-started/doc1-1.md#configuring-your-system
[ -d "${HOME}/.radicle/bin" ] && PATH="${HOME}/.radicle/bin:${PATH}"

# automatically remove PATH duplicates
# https://github.com/mcornella/dotfiles/blob/e62b0d4/zshenv#L63-L67
# https://github.com/zsh-users/zsh/blob/a9061cc/StartupFiles/zshrc#L56-L57
# https://github.com/zsh-users/zsh/commit/db3f2d2
[ -n "${ZSH_VERSION}" ] && typeset -U PATH path CDPATH cdpath FPATH fpath MANPATH manpath
# export PATH for other sessions
export PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ ! -f "${HOME}/.p10k.zsh" ] || . "${HOME}/.p10k.zsh"
