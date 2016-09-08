#!/bin/bash

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" != "master" ]
then
  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
  exit 0
fi

rev=$(git rev-parse --short HEAD)

cd school-website
mkdir build
cd build
git init
git config user.name "Rhys Moyne"
git config user.email "rhys@creativekidssa.com.au"

git remote add upstream "https://$GH_TOKEN@github.com/CreativeKids/website.git"
git fetch upstream
git pull upstream master

rm -rf projects/
cp -R ../lektor_build projects/

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream master
