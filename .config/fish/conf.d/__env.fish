# Fzf
set -Ux FZF_DEFAULT_COMMAND 'rg --files --glob "!.git/*"'
set -Ux FZF_FIND_FILE_COMMAND "$FZF_DEFAULT_COMMAND"
set -Ux FZF_CD_COMMAND "$FZF_DEFAULT_COMMAND"
set -Ux FZF_CD_WITH_HIDDEN_COMMAND "$FZF_DEFAULT_COMMAND --hidden"
set -Ux FZF_OPEN_COMMAND "$FZF_CD_WITH_HIDDEN_COMMAND"
set -Ux FZF_LEGACY_KEYBINDINGS 0
set -Ux FZF_DEFAULT_OPTS "--exact --border --cycle --reverse --height '80%'"

# Ydiff https://github.com/ymattw/ydiff
set -Ux YDIFF_OPTIONS '-s -w0 --wrap'

alias cat=bat

# Git
function fbr
  set -l branch (git --no-pager branch -vv | fzf | sed 's/[[:space:]\*]*\([^ ]*\)[[:space:]].*/\1/') 
  git checkout "$branch"
end
