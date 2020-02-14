#!/bin/sh
# How to set up TravisCI for projects that push back to github:
# Inspired by:
# https://gist.github.com/willprice/e07efd73fb7f13f917ea

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_pdfs() {
  git checkout --orphan "travis"
  git rm --cached $(git ls-files)
  git add -f index.html
  echo `git status`
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-login https://github.com/konstantin-morenko/web-page-template.git
  git push --set-upstream -f origin-login "travis"
  # git push --set-upstream origin travisbranch
}

setup_git
commit_pdfs
upload_files
