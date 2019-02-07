git clone $CIRCLE_REPOSITORY_URL out
cd out
git checkout gh-pages || git checkout --orphan gh-pages
git rm -rf .
cd ..
npm run build
cp -a www/. out/.
mkdir -p out/.circleci && cp -a .circleci/. out/.circleci/.
cd out
git config user.name "$USER_NAME"
git config user.email "$USER_EMAIL"
git add -A
git commit -m "Automated deployment to GitHub Pages: ${CIRCLE_SHA1}" --allow-empty
git push origin gh-pages

echo "deployed successfully"
