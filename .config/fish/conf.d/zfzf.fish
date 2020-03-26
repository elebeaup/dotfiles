function z -d "jump around"
  if test (count $argv) -gt 0
    __z $argv
  else
	  cd (__z -l 2>&1 | fzf | sed 's/^[0-9,.]* *//')
  end
end
