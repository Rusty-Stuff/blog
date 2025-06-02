# Formoxy

Preview

```bash
guix shell ruby make gcc-toolchain
BUNDLE_PATH=.bundler bundle install
BUNDLE_PATH=.bundler bundle exec jekyll serve
```

Quick-preview:

```bash
guix shell ruby make gcc-toolchain -- sh -c "BUNDLE_PATH=~/.bundler bundle exec jekyll serve"
```

Build

```bash
BUNDLE_PATH=.bundler bundle exec jekyll build
```