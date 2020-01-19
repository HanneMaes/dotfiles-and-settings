# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.2-3

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour (meaning put * after executable, / after dir, @ after symbolic link)
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle () 
# { 
#   echo -ne "\e]2;$@\a\e]1;$@\a"; 
# }
# 
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping, 
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
# 
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
# 
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
# 
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
# 
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
# 
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
# 
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
# 
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
# 
#   return 0
# }
# 
# alias cd=cd_func

##############
### colors ###
##############

# # the first line makes ls use the --color parameter by default, which tells ls to display files in different colours based on the setting of the LS_COLORS variable
# # the second lines defines what colors to use
# # The *.rpm=90 parameter at the end tells ls to display any files ending in .rpm in the specified colour, in this case colour 90 (dark grey). This can be applied to any types of files (eg. you could use '*.png=35' to make jpeg files appear purple.) As many or as few parameters as you like can go into the LS_COLORS variable, as long as the parameters are separated by colons.
# # di = directory, fi = file, ln = symbolic link, pi = fifo file, so = socket file, bd = block (buffered) special file, cd = character (unbuffered) special file, or = symbolic link pointing to a non-existent file (orphan), mi = non-existent file pointed to by a symbolic link (visible when you type ls -l), ex = file which is executable (ie. has 'x' set in permissions).
# alias ls='ls --color'
# LS_COLORS='di=1;0:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
# export LS_COLORS

alias open=cygstart

##########################
### remote connections ###
##########################

alias sshremote='ssh -p 44 RanzigenDanny@84.197.221.131'
alias sftpremote='sftp RanzigenDanny@84.197.221.131'

##################
### CD & Paths ###
##################

# windows auto start apps dir 
alias cdautostart='cd "C:\Users\Hanne\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" && ls'

# pub
alias cdpub='cd "D:\Pub" && ls'

# downloads
alias cddownloads='cd "D:\Downloads" && ls'

# cloudstation
alias cdcloudstation='cd "C:\CloudStation" && ls'
alias cdangle='cd "C:\CloudStation\Cloudstation" && ls'
alias cdscriptingph='cd "C:\CloudStation\CloudStation\Scripting-Photoshop" && ls'
alias cdscriptingphscripts='cd "C:\CloudStation\CloudStation\Scripting-Photoshop\scripts" && ls'
alias cdlitlauncher='cd "C:\CloudStation\CloudStation\Scripting-Photoshop\lit-launcher" && ls'
alias cdlitlaunchersrc='cd "C:\CloudStation\CloudStation\Scripting-Photoshop\lit-launcher\src" && ls'
alias cdalta='cd "C:\CloudStation\CloudStation\Automation\ALTY" && ls'
alias cdaltasrc='cd "C:\CloudStation\CloudStation\Automation\ALTY\src" && ls'
alias cdae='cd "C:\CloudStation\CloudStation\Automation\ae-characters" && ls'
alias cdaesrc='cd "C:\CloudStation\CloudStation\Automation\ae-characters\src" && ls'
alias cdperfectproject='cd "C:\CloudStation\Form-Follows-Function\development-web\perfect-project" && ls'
alias cdperfectfrontsrc='cd "C:\CloudStation\Form-Follows-Function\development-web\perfect-project\front-end\src" && ls'
alias cdperfectfront='cd "C:\CloudStation\Form-Follows-Function\development-web\perfect-project\front-end" && ls'
alias cdperfectback='cd "C:\CloudStation\Form-Follows-Function\development-web\perfect-project\back-end" && ls'
alias cdperfectbacksrc='cd "C:\CloudStation\Form-Follows-Function\development-web\perfect-project\back-end\src" && ls'
alias cdperfectelectron='cd "C:\CloudStation\Form-Follows-Function\development-web\perfect-project\electron" && ls'
alias cdperfectelectronsrc='cd "C:\CloudStation\Form-Follows-Function\development-web\perfect-project\electron\src" && ls'

# videoslots
alias cdvideoslots='cd "D:\Svn\Art\Casino\Games\Videoslots" && ls'

# tesla
alias cdtesla='cd "D:\Svn\Art\Casino\Games\Videoslots\TeslaSlot" && ls'
alias cdteslaa='cd "D:\Svn\Art\Casino\Games\Videoslots\TeslaSlot\Assets" && ls'
alias cdteslag='cd "D:\Svn\Art\Casino\Games\Videoslots\TeslaSlot\Game" && ls'

# connie & blyde
alias cdconny='cd "D:\Svn\Art\Casino\Games\Videoslots\ConnyAndBlyde" && ls'
alias cdconnya='cd "D:\Svn\Art\Casino\Games\Videoslots\ConnyAndBlyde\Assets" && ls'
alias cdconnyg='cd "D:\Svn\Art\Casino\Games\Videoslots\ConnyAndBlyde\Game" && ls'