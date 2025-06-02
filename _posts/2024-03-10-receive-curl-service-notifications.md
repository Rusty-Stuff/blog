---
title: "Receive Service Notifications from Bash Scripts"
tags: [bash, curl, monitoring]
categories: [How-To, Forms]
---

TL;DR: Utilize Formoxy to get alerts from your bash scripts or cron jobs.

There are times when you need to be alerted if something goes awry in a bash script or cron job, but you don't want to deal with the hassle of setting up complex monitoring tools or spending a lot of money—especially if you don't anticipate frequent issues.

In my experience, I often run a build script that tends to fail due to upstream changes. Previously, I wouldn't realize there was a problem until my laptop began compiling the Linux kernel during the next update.

To adopt a more proactive strategy, I configured the bash script to report errors via Formoxy.

```bash
notify_failure() {
  command="$1"
  exit_code="$2"
  error_message="$3"
  time="$(date)"

  curl -X POST \
    -H "Content-Type: application/json" \
    -d '{
      "command": "'"$command"'",
      "exit_code": "'"$exit_code"'",
      "error_message": "'"$error_message"'",
      "time": "'"$time"'"
    }' \
    https://api.formoxy.com/v1/digest/e6300c9b-XXX
}

buildARMPackages () {
    guix build --system=aarch64-linux -m packages-aarch64.scm || notify_failure "guix build --system=aarch64-linux -m packages-aarch64.scm" "$?" "Build failed"
}

buildX86Packages () {
    guix build --system=x86_64-linux -m packages-x86_64.scm || notify_failure "guix build --system=x86_64-linux -m packages-x86_64.scm" "$?" "Build failed"
}

runBuild () {
    guix pull --channels=$SCRIPT_DIR/production-channels.scm || notify_failure "guix pull --channels=$SCRIPT_DIR/production-channels.scm" "$?" "Pull failed"
    hash guix || notify_failure "hash guix" "$?" "Hash failed"
    buildARMPackages
    buildX86Packages
}

runBuild
```

There's a lot going on here; let's break it down:

1. The build kicks-off with `runBuild`.
2. `runBuild` starts by pulling the latest Guix channels and continues to build the ARM and x86 packages.
3. If any of the commands fail, the `notify_failure` function is called with the command, exit code, and error message as arguments.

Important details related to the failure are send to Formoxy:

```bash
curl -X POST \
    -H "Content-Type: application/json" \
    -d '{
      "command": "'"$command"'",
      "exit_code": "'"$exit_code"'",
      "error_message": "'"$error_message"'",
      "time": "'"$time"'"
    }' \
    https://api.formoxy.com/v1/digest/e6300c9b-XXX
```

Then I receive an email notification about the failure:

```bash
command: guix build --system=x86_64-linux -m packages-x86_64.scm
exit_code: 1
error_message: Build failed
time: Tue Mar  5 06:14:55 PM CET 2024


Form: SERVICE NOTIFICATIONS
https://formoxy.com/#/account/forms/e6300c9b-XXX
```

Formoxy also supports Webhooks, so you can integrate it with other services like Slack, Discord, or Microsoft Teams.