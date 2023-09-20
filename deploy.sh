#!/bin/bash
git add .
git commit -a -m "Site update `date`"
git push
bundle exec jekyll build
rsync -avz --rsh='ssh -p20022' _site/ isieo@collectskin.com:/home/isieo/sites/collectskin.com/public_html --progress