# Defined in - @ line 1
function gcn --wraps='git checkout -b' --description 'alias gcn=git checkout -b'
  git checkout -b $argv;
end
