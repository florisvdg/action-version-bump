#!/bin/sh

VERSION=$(echo $GITHUB_REF | sed -e 's/.*release\/v//g')
PATTERN=$(echo "$INPUT_SED" | sed -e "s/\$VERSION/$VERSION/g")
sed -i -e "$PATTERN" $INPUT_FILE

git config --local user.name "$INPUT_AUTHOR_NAME"
git config --local user.email "$INPUT_AUTHOR_EMAIL"

git add $INPUT_FILE
git commit -m "Update version to v$VERSION in $INPUT_FILE"
git push
