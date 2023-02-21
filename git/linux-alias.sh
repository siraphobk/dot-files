gch() {
  target=$(git branch | fzf | tr -d '[:space:]')

  # If the first character of the target variable is an asterisk, then prompt the user that they cannot checkout from the current branch
  if [[ ${target:0:1} == "*" ]]; then
    echo "Cannot checkout from the current branch!"
    return
  fi

  # Otherwise, checkout to the target branch
  git checkout $target
}
