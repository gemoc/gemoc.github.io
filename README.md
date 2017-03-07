# website of the gemoc initiative


```bash
$ bundle exec jekyll serve
```

It should then work.
If you have any problems, remove the Gemfile.lock in the website and run

```bash
bundle install
```

# Running the site using docker

```bash
$ docker run -it --rm -p 4000:4000 -v "$(pwd):/srv/jekyll" jekyll/jekyll jekyll serve
```
