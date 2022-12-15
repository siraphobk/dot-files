#!/bin/sh

git config --global alias.pushc  "push origin @" # push to the current remote branch
git config --global alias.pullc  "pull origin @" # pull from the current remote branch
git config --global alias.fuckit "reset --hard"
git config --global alias.s      "status"
git config --global alias.aa     "add -A" # resembles "add all"
git config --global alias.adog   "log --all --decorate --oneline --graph" # decorated oneline git graph
