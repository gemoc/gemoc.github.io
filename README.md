# website of the gemoc initiative


```bash
$ bundle exec jekyll serve
```

It should then work.
If you have any problems, remove the Gemfile.lock in the website and run

```bash
bundle install
```

More details on how to install, run and troubleshoot a jekyll installation are available at https://jekyllrb.com/docs/home/.

# Running the site using docker

## Simple version

Serve the site on port 4000 on the local machine and install all the dependencies from scratch.
```bash
$ docker run -it --rm -p 4000:4000 -v "$(pwd):/srv/jekyll" jekyll/jekyll jekyll serve
```

## Advanced version

Serve the site on port 4000 on the local machine. Dependencies are installed and saved in `./vendor/bundle`, allowing a quicker startup time after the first run.

```bash
$ docker run -it --rm -p 4000:4000 -v "$(pwd):/srv/jekyll" --volume=$PWD/vendor/bundle:/usr/local/bundle jekyll/jekyll:latest bash -c "bundle update ; bundle install ; jekyll s"
```
