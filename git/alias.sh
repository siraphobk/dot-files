#!/bin/sh

git config --global alias.pushc  "push origin HEAD"
git config --global alias.fuckit "reset --hard"
git config --global alias.s      "status"
git config --global alias.aa     "add -A"
git config --global alias.c      "commit"
git config --global alias.adog   "log --all --decorate --oneline --graph"
git config --global alias.wip    "!git add -A && git commit -m 'work in progress'"
