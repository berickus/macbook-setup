# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git colorize github jira vagrant virtualenv pip python osx)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:~/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Customize to your needs...
fpath=(
    ~/.zfunc
    ~/.zfunc/**/*~*/(CVS)#(/N)
    "${fpath[@]}"
)

# autoload
autoload -Uz items
autoload -Uz gdp
autoload -Uz initHybris

# EXPORTS
source $HOME/.aliases
export MYSQL_HOME=/usr/local/mysql
export LC_ALL=en_US.UTF-8
export PATH="/usr/local/bin:$PATH"
export ANSIBLE_HOSTS=/Users/ajgg/ansible_hosts
export PATH="/usr/local/sbin:$PATH"

# PATH
PATH="/Users/ajgg/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/Users/ajgg/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/ajgg/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/ajgg/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/ajgg/perl5"; export PERL_MM_OPT;

# aliases
alias install='sudo apt-get install'
alias aa='ant all'
alias aca='ant clean all'
alias gpp='git fetch; git pull; git status'
alias gcod='gco develop'
alias gcoi='gco feature/DEVS-ON-IGR'
alias guc='git reset --soft HEAD^'
alias gcom='gco master'
alias gs='git show'
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias temp='iStats'
alias fucking='sudo'
alias start_mysql='sudo $MYSQL_HOME/bin/mysqld_safe &'
alias stop_mysql='sudo $MYSQL_HOME/bin/mysqladmin shutdown'
alias mysql57='brew services stop mysql55; brew unlink mysql55; brew switch mysql 5.7.18_1; brew link mysql; brew services start mysql'
alias prettyJson="python -m json.tool"

# GIT
itemsxml() { git diff --name-only $1 | fgrep "items.xml" }

eval "$(thefuck --alias)"
