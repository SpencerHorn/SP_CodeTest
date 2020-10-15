# Test Automation Code Challenge as assigned by Signal Path
Tests are written with Ruby, WATiR, rspec, and cucumber so you need to setup Ruby environment. Depending on your OS you can setup Ruby by [this link](https://www.ruby-lang.org/en/documentation/installation/)

### Install Bundler<br>
When Ruby setup is done, you can install bundler<br>
`gem install bundler`

### Install Requirements With Bundler<br>
```
# go to root folder where the Gemfile is located
bundle install
```

### Example of how to run a test locally

`cucumber --format pretty --quiet RUN_LOCAL=true BROWSER=headless --tag @todo_test_1`

1. BROWSER options:
  * headless: will run tests in headless headless mode
  * chrome: will run your tests locally in chrome
  * firefox: - will run your test locally in firefox
  * safari: will run your tests locally in safari
  * remote: will run your tests against a remote browser, useful for running tests in docker
  * default: chrome if no BROWSER is specified it will default to using chrome.
  
2. --tag options
  * no tag will run all tests in suite
    example
    `cucumber --format pretty --quiet RUN_LOCAL=true BROWSER=headless`
  * appending `--tag` followed by any of the tags listed in the feature files will run only the tests with those tags.
