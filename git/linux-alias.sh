# Checkout a local branch
gch() {
  target=$(git branch | fzf | tr -d '[:space:]')

  # If the first character of the target variable is an asterisk, then prompt the user that they cannot checkout from the current branch
  if [[ ${target:0:1} == "*" ]]; then
    RED='\033[31m'
    RESET='\033[0m'

    echo -e "\n${RED}Cannot checkout from the current branch!${RESET}\n"
    return
  fi

  # Otherwise, checkout to the target branch
  git checkout $target
}

# Checkout a remote branch onto the local machine
gchr() {
  git branch -r | sed 's/^[^\/]*\///' | fzf | xargs git checkout
}

