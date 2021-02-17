#!/bin/bash

set -e
set -x

DEPLOY_REPO="https://${GH_TOKEN}@github.com/gemoc/gemoc.github.io.git"

function main {
	clean
	get_current_site
	build_site
    deploy
}

function clean {
	echo "cleaning _site folder"
	if [ -d "_site" ]; then rm -Rf _site; fi
}

function get_current_site {
	echo "getting latest site"
	git clone --depth 1 $DEPLOY_REPO _site
}


function build_site {
	echo "building site"
	bundle exec jekyll build
}

function deploy {
	echo "deploying changes"

     if [ "$TRAVIS_PULL_REQUEST" != "false" ]
     then
         echo "Pull request are not deployed"
         exit 0
     fi

     if [ "$TRAVIS_BRANCH" != "gh-pages-edit" ]; then
         echo "except we should only publish the gh-page-edit branch. stopping here"
         exit 0
     fi


	cd _site
	git config --global user.name "Travis CI"
    git config --global user.email didier.vojtisek@inria.fr
	git add -A
	git status
	git commit -m "Lastest site built on successful travis build $TRAVIS_BUILD_NUMBER auto-pushed to github"
	git push -f $DEPLOY_REPO HEAD:master
}


main
