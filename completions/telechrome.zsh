if [[ ! -o interactive ]]; then
    return
fi

compctl -K _telechrome telechrome

_telechrome() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(telechrome commands)"
  else
    completions="$(telechrome completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
