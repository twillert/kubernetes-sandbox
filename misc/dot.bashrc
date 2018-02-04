# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export AWS_SECRET_KEY=
export AWS_ACCESS_KEY=

export EC2_REGION=eu-central-1
export ANSIBLE_HOST_KEY_CHECKING=False

# to support ec2.py
export AWS_REGION=${EC2_REGION}
export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_KEY}

export ANSIBLE_PRIVATE_KEY_FILE=/root/.ssh/id_rsa_thomas_home
export ANSIBLE_REMOTE_USER=ec2-user


export HISTTIMEFORMAT="%d.%m.%y %T "
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r;"
export HISTCONTROL=ignoreboth

#
# GIT BASH magic
#
export Color_Off="\033[0m"
export Red="\033[0;31m"
export Green="\033[0;32m"
export Purple="\033[0;35"

# set up command prompt
function __prompt_command()
{
    # capture the exit status of the last command
    EXIT="$?"
    PS1=""
 
    if [ $EXIT -eq 0 ]; then PS1+="\[$Green\][\!]\[$Color_Off\] "; else PS1+="\[$Red\][\!]\[$Color_Off\] "; fi
 
    # basic information (user@host:path)
    PS1+="\[$BRed\]\u\[$Color_Off\]@\[$BRed\]\h\[$Color_Off\]:\[$BPurple\]\w\[$Color_Off\] "
 
    # check if inside git repo
    local git_status="`git status -unormal 2>&1`"    
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        # parse the porcelain output of git status
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local Color_On=$Green
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local Color_On=$Purple
        else
            local Color_On=$Red
        fi
 
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
        else
            # Detached HEAD. (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null || echo HEAD`)"
        fi
 
        # add the result to prompt
        PS1+="\[$Color_On\][$branch]\[$Color_Off\] "
    fi
 
    # prompt $ or # for root
    PS1+="\$ "
}

PROMPT_COMMAND=__prompt_command

