---
title: Getting a Blog running on Github with Jekyll
date: 2017-02-27T20:00:00+00:00
author: edgriebel
layout: post
permalink: /first-jekyll/
tags:
   - Blogging
   - Jekyll
   - Ruby
---
# Overall thoughts
Jekyll is complicated! I had a very hard time convering an existing Wordpress
blog to Jekyll (~20 hours), and I'm still not happy with the theme.

When there are any errors in the numerous cookbook-style blogs about how to convert,
there is a lot to know about Ruby, Jekyll, `bundle`, `Gemfile`s, RubyGems, etc.
to get all the moving parts working.

# Exporting from existing wordpress blog
This was tons of trouble. It seems that the exporter I used (_fill in blank_)
would export the post content and images, etc. but doesn't preserve
the theme. When the `_posts` contents copied into a newly-initialized
`jekyll new testblog`, there are errors about specified layouts not found.
A barely acceptable solution is to create a new jekyll blog and then copy Gemfile,
make changes in `_config.yml`, and futz with stuff to get `jekyll build` to complete.
Some of the problems could also have been because of trying to use Windows. **DO NOT USE WINDOWS!!**


# Steps to get Jekyll working on Ubuntu MATE
**Do not try to use Windows until you _completely_ understand Jekyll!!!**

## Install requisite libraries to preview github-themed pages
~~~~ bash
sudo apt-get install ruby
sudo apt-get install libz-dev
sudo apt-get install g++
sudo gem install jekyll
# change perms so gem doesn't have to be run with sudo
sudo chmod -R a+w /var/lib/gems
gem install bundler
gem install jekyll-feed
gem install jekyll-instant
gem install minima # originally used the minima theme
gem install nokogiri
gem install therubyracer # For coffeescript used by github-pages build
# need to remove newer version of Jekyll as github pages supports older version
gem uninstall jekyll 
# choose newer version from list
~~~~~~~~~

## Troubleshooting Notes
`Gemfile.lock` is required to be in the repo. 
It is NOT a lockfile to prevent multiple edits, but a listing of 
all the library versions used the last time `gem update` was run.

Most of the github themes don't list an individual page's 
title at the top of the page. The `default.html` page was copied from the
theme's `_layout` directory and then `<h2>{{ page.title }}</h2>` was added
inside the page. A title was similarly added to `<h2 class='title'>` block
as almost every stock github-pages theme uses the site's title.

`gem "therubyracer"` was required in `Gemfile` due to error about needing a
javascript engine. Node.js would have been usable as well if installed.

Need to fix `gem "jekyll", "~> 3.3"` because this is the version that 
Github uses and `github-pages` requires this version.

_NOTE_ that jekyll __does not__ run on Windows with this arrangement even if 
Ruby and Jekyll are installed.
