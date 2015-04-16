alias gitsvnrv='pushd ~/PycharmProjects/puppet-dev/ && git checkout master && git fetch && git pull && git submodule update --init && git status && git br && popd && pushd ~/PycharmProjects/deployment/ && svn up && popd'
alias rvupd='sudo apt-get update; sudo apt-get upgrade -y'
alias mc='mc -S dark'
