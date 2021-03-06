
function _delim() {
  default_delim="\t"

  if [[ "$#" == 1 ]]; then
    echo -e "$1"
  else
    echo -e "$default_delim"
  fi
}


function shape() {
  delim=$(_delim $2)
  rows=$(cat $1 | wc -l);
  cols=$(head -n1 $1 | tr "$delim" " " | wc -w);
  echo "$rows, $cols";
}

function hd() {
  delim=$(_delim $2)
  head -n1 $1 | tr "$delim" "\n" | less -N
}


function pyclaen() {
  find . -name "__pycache__" -exec rm -r "{}" \;
  find . -name ".mypy_cache" -exec rm -r "{}" \;
  find . -name "*.pyc"       -delete
  find . -name "*.pye"       -delete
  find . -name "*.ipynbe"    -delete
  rm -f .coverage .coverage.*
}


function pp() {
  if [ "$#" -eq 1 ]; then
    dir="$1"
  else
    dir=$(pwd)
  fi

  # abspath
  dir=$(cd "$dir" && pwd)

  export PATH="$dir":$PATH
  echo $PATH
}

function pyp() {
  if [ "$#" -eq 1 ]; then
    dir="$1"
  else
    dir=$(pwd)
  fi

  dir=$(cd "$dir" && pwd)

  export PYTHONPATH="$dir":$PYTHONPATH
  echo $PYTHONPATH
}
