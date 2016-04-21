set -o errexit

rm -rf public
mkdir public

git config --global user.email "rebot@frontseat.com"
git config --global user.name "Rebot"

jekyll build

cp -r ./_site/* ./public

cd ./public
git init
git add .
git commit -m "Deploy to GitHub Page"
git push -f "https://${GH_TOKEN}@${GH_REF}" master:gh-pages
