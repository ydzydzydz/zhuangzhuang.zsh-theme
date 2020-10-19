local line='$FG[250]${(l.${COLUMNS}..-.)}%{$reset_color%}'
local time='%{$FG[226]%}%D{[%H:%M:%S]}%{$reset_color%}'
local user='%{$FG[207]%}[%n@%m]%{$reset_color%}'
local pwd='%{$FG[087]%}[%c]%{$reset_color%}'
local tty='%{$FG[000]%}[%y]%{$reset_color%}'
local error_code='%(?..%{$FG[196]%}[code: %?]%{$reset_color%})'

########################################################################

local git_info='$(git_prompt_info)%{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[040]%}[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[197]%}*%{$FG[040]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

########################################################################

local svn_info='$(svn_prompt_info)%{$reset_color%}'
ZSH_THEME_SVN_PROMPT_PREFIX="%{$FG[040]%}[svn:"
ZSH_THEME_SVN_PROMPT_SUFFIX="%{$FG[197]%}"
ZSH_THEME_SVN_PROMPT_DIRTY=" *%{$FG[040]%}]"
ZSH_THEME_SVN_PROMPT_CLEAN=""

########################################################################

local ruby_info='$(ruby_prompt_info)%{$reset_color%}'
ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}["
ZSH_THEME_RUBY_PROMPT_SUFFIX="]%{$reset_color%}"

########################################################################

local env_for_python="conda"
local python_info='$(python_version_prompt_info ${env_for_python})'
python_version_prompt_info() {
	# echo "export VIRTUAL_ENV_DISABLE_PROMPT=true" >> ~/.zshrc 
	# echo "changeps1: False" >> ~/.condarc 
	if command -v python > /dev/null 2>&1; then
		local PYTHON_VERSION="$(python -V 2>&1)"
		local PYTHON_VERSION=${PYTHON_VERSION/Python /Python-}
		local PYTHON_VERSION=${PYTHON_VERSION/ */}
		local VIRTUAL_ENV_NAME=''
		local CONDA_DEFAULT_ENV_NAME=''
		[ -n "$VIRTUAL_ENV" ] && local VIRTUAL_ENV_NAME="$(basename $VIRTUAL_ENV): "
    		[ -n "$CONDA_DEFAULT_ENV" ] && local CONDA_DEFAULT_ENV_NAME="$CONDA_DEFAULT_ENV: "
		case $1 in
			("venv")
    				echo -n "%{$FG[120]%}[${VIRTUAL_ENV_NAME}${PYTHON_VERSION}]%{$reset_color%}";;		
			("conda")
				echo -n "%{$FG[120]%}[${CONDA_DEFAULT_ENV_NAME}${PYTHON_VERSION}]%{$reset_color%}";;
			(*)
				echo -n "%{$FG[120]%}[${PYTHON_VERSION}]%{$reset_color%}";;
		esac
	fi
}

########################################################################

PROMPT="${line}
${time}${user}${pwd}${git_info}${svn_info}${error_code} "
# RPROMPT="${ruby_info}"
RPROMPT="${python_info}"
PS2='%{$FG[043]%}>>> %{$reset_color%}'

setopt PROMPT_SUBST
TMOUT=1
TRAPALRM() {
	zle reset-prompt
}
