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

# Benchmark url script
install_gist benchmark_url https://gist.githubusercontent.com/dersam/95d13721dee1165f0c2c52856d7de40d/raw
