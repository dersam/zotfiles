###############
# gister.zsh
#
# Fetch scripts stored as github gists and make them available in the path.
##############3

mkdir -p $HOME/zotfiles/bin/gist

# Add custom bin directory
export PATH="$HOME/zotfiles/bin:$HOME/zotfiles/bin/gist:$PATH"

install_gist () {
  local name=$HOME/zotfiles/bin/gist/$1
  if [ ! -f $name ]; then
    wget $2 --output-document=$name
    chmod u+x $name
  fi
}

install_tmuxinator_gist () {
  local name=$HOME/.tmuxinator/$1.yml
  if [ ! -f $name ]; then
    wget $2 --output-document=$name
  fi
}

install_tmuxinator_gist salesfloor https://gist.github.com/dersam/0bb70debeda51411d6c205dd2a0e1af5/raw

# # Behatbox docker container loader
# install_gist behatbox https://gist.githubusercontent.com/dersam/70de2d7e505fa9bb32378f953d295ada/raw

# # Benchmark url script
# install_gist benchmark_url https://gist.githubusercontent.com/dersam/95d13721dee1165f0c2c52856d7de40d/raw

# install_gist weatherfunk.zsh https://gist.githubusercontent.com/dersam/eeaaac2a1209e8dd2f42f4b4a0c3cd6e/raw
