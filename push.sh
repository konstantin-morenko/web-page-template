#!/bin/sh
# How to set up TravisCI for projects that push back to github:
# Inspired by:
# https://gist.github.com/willprice/e07efd73fb7f13f917ea

setup_git() {
  git config --global user.email "actions@github.com"
  git config --global user.name "Github.Actions"
}

commit_pdfs() {
  git checkout --orphan "github"
  git rm --cached $(git ls-files)
  git add -f index.html
  echo `git status`
  git commit --message "Github action"
}

upload_files() {
  git remote add origin-login https://github.com/konstantin-morenko/list-of-scholarly-writings.git
  git push --set-upstream -f origin-login "github"
  # git push --set-upstream origin travisbranch
}

setup_git
commit_pdfs
upload_files
