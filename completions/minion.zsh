if [[ ! -o interactive ]]; then
    return
fi

compctl -K _minion minion

_minion() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(minion commands)"
  else
    completions="$(minion completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
