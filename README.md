# Formshive

Preview

```bash
guix shell ruby make gcc-toolchain
BUNDLE_PATH=.bundle bundle install
BUNDLE_PATH=.bundle bundle exec jekyll serve
```

Quick-preview:

```bash
guix shell ruby make gcc-toolchain -- sh -c "BUNDLE_PATH=~/.bundle bundle exec jekyll serve"
```

Build

```bash
BUNDLE_PATH=.bundle bundle exec jekyll build
```
