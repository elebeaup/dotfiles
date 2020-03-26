set -Ux TF_PLUGIN_CACHE_DIR "$HOME/.terraform.d/plugin-cache"

function tfw --description "terraform - choose a different workspace to use for further operations"
  set -l workspace (terraform workspace list | sed '/^$/d' | fzf +m | sed 's/[[:space:]\*]*//')
  test ! -z "$workspace" ; and terraform workspace select $workspace
end
