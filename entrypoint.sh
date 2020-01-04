#!/bin/bash -l
GITHUB_NAME=$1
GITHUB_EMAIL=$2
GITHUB_TOKEN=$3
COMMIT_MESSAGE=$4

echo $1
echo $2

WORKDIR=/${GITHUB_REPOSITORY}
git clone -b master https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY} $WORKDIR
#git remote set-url origin https://${GITHUB_NAME}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}
#git checkout -b master

git config --local user.name "${GITHUB_NAME}"
git config --local user.email "${GITHUB_EMAIL}"

cd $WORKDIR

echo ::build-asciidoc
./gradlew clean
./gradlew asciidoc
result=$?

if [$result != "0"]; then
    exit $result
fi
ls -al
echo ::git add
git add docs
echo ::git commit
git commit -m "${COMMIT_MESSAGE}"
echo ::git push
git push origin HEAD
result=$?
exit $result
