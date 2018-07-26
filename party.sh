function party {
  if ! command -v figlet; then
    if ! command -v brew; then
      echo Requires figlet or brew to be installed
      return 1
    fi
    brew install figlet
  fi

  if [ -z "$1" ]; then
    echo "Enter party word: "
    read PARTY_WORD
  else
    PARTY_WORD=$1
  fi

  if [ -z "$2" ]; then
    echo "Enter party word emoji (without colons): "
    read WORD_EMOJI
  else
    WORD_EMOJI=$2
  fi

  if [ -z "$3" ]; then
    echo "Enter background emoji (without colons): "
    read BACKGROUND_EMOJI
  else
    BACKGROUND_EMOJI=$3
  fi

  echo
  figlet -f banner $PARTY_WORD | sed -e "s/#/:$WORD_EMOJI:/g" -e 's/^/ /g' -e "s/ /:$BACKGROUND_EMOJI:/g"
}
