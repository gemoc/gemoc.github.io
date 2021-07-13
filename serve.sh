#!/bin/bash

set -e
set -x


bundle install
bundle exec jekyll serve -H 0.0.0.0