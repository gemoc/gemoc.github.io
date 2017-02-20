# website of the gemoc initiative

You will need to add the plugin jekyll-scholar-extras-gemoc by hand...

```bash
git clone https://github.com/jbourcie/gemoc-jekyll-scholar-extras.git
gem build jekyll-scholar-extras-gemoc.gemspec 
sudo gem install jekyll-scholar-extras-gemoc-<version-number>.gem   
```

It should then work.
If you have any problems, remove the Gemfile.lock in the website and run

```bash
bundle install
```
