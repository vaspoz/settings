# source ~/.bashrc
eval "$(/opt/homebrew/bin/brew shellenv)"

# Enable colors for the bash -ls command
export CLICOLOR=1
export LSCOLORS="ExfxcxdxExegDxabagacDx"
export KUBE_EDITOR="cursor --wait"

# Configure terminal formatting colors & styles
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red4d9zzvbt
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
undblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

# Colorized aliases
# Basic log
alias log="printf '$bldcyn' && git log --pretty=format:'%D' -1 && git log --pretty=format:'%C(green)%h%Creset ≁ %C(yellow)%>(12,trunc)%cr%C(white) %>(11,trunc)%an%C(green) ⟹  %C(blue) %s' --abbrev-commit --date=relative"

# Basic log with graph
alias logg="printf '$bldcyn' && git log --pretty=format:'%D' -1 && git log --graph --pretty=format:'%C(green)%h%Creset ≁ %C(yellow)%>(12,trunc)%cr%C(white) %>(11,trunc)%an%C(green) ⟹  %C(blue) %s' --abbrev-commit --date=relative"

# Verbose log
alias logv="printf '$bldcyn' && git log --pretty=format:'%D' -1 && git log --pretty=format:'%C(green)%h%Creset ≁ %C(yellow)%>(12,trunc)%cr%C(white) %>(11,trunc)%an %Creset%ce%C(green) ⟹  %C(blue) %s' --abbrev-commit --date=relative"

# Verbose log with graph
alias loggv="printf '$bldcyn' && git log --pretty=format:'%D' -1 && git log --graph --pretty=format:'%C(green)%h%Creset ≁ %C(yellow)%>(12,trunc)%cr%C(white) %>(11,trunc)%an %Creset%ce%C(green) ⟹  %C(blue) %s' --abbrev-commit --date=relative"

# Log with full commit messages
alias logm="printf '$bldcyn' && git log --pretty=format:'%D' -1 && git log --format=format:'%Creset%Cgreen%h%Creset | %C(white)%an | %C(yellow)%cr%n%Creset%s%n%n%b%n'"

# Show refs
alias refs="printf '$bldcyn' && git show-ref --abbrev && printf '$txtrst'"

# Show remote refs and urls
alias remotes="printf '$txtpur' && git remote -v && printf '$bldcyn\n' && git branch -r --no-color && printf '$txtrst'"

# Alias for colorized -ls command
alias ls='ls -Gp'

# Custom aliases
alias reload="source ~/.bashrc && source ~/.bash_profile"
alias ls='gls -hp --group-directories-first --color=auto'
alias ll='pwd && ls -l'
alias la='ls -la'
alias l='ls -CF'
alias cll="clear; ls -lAh"
alias ..="cd .."
alias ..2="cd ../../"
alias ..3="cd ../../../"
alias back='cd -'
alias ~='cd ~'
alias trash='safe-rm'
alias grep='grep -H -n'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias where="pwd"
alias h='history'
alias ppath="echo $PATH | tr ':' '\n'"
alias untar="tar -xvf"
alias py="python3"
alias tf="terraform"
alias myip="curl ipinfo.io/ip"
alias gcommit="git add . && aicommits --generate 4"
alias k="kubectl"
alias kx="k config set-context --current --namespace "
alias kaf="k apply -f"
alias grep="grep -i --color"
alias tfi="MSYS_NO_PATHCONV=1 tf import"
alias azl="az login --use-device-code"
alias azs="az account set --subscription"
alias rust-stakeholder="rust-stakeholder --dev-type fullstack --complexity extreme --alerts --framework 'Custom Engine'"
function awsprofile {
        export AWS_PROFILE=$1
}

function awsshell {
        export AWS_CLI_AUTO_PROMPT=$1
}

function tfa() {
        terraform $1 -auto-approve
}

eval "$(starship init bash)"

alias assume="source assume"
complete -C aws_completer aws

source <(kubectl completion bash)
complete -o default -F __start_kubectl k

export PATH="$HOME/.local/bin:$PATH"

#[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
export PATH="/opt/homebrew/opt/go@1.20/bin:$PATH"

# Some history settings
# removes all duplicates
export HISTCONTROL="erasedups:ignoreboth"
export HISTFILESIZE=500000
export HISTSIZE=100000
# dont remember exit commands
export HISTIGNORE="&:[ ]*:exit"
# append history with every fresh session
shopt -s histappend 
# save multiline commands as a single command
shopt -s cmdhist


. "$HOME/.cargo/env"
