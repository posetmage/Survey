
git config --local user.name "PosetMage"
git config --local user.email "mail@posetmage.com"
git remote set-url origin git@POM:PosetMage/Survey.git

git submodule update --recursive --remote

git pull
git add .
git commit -m "upload"
git push
