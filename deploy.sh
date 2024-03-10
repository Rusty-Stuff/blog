#!/usr/bin/env 
# -S guix shell pnpm node awscli@1 -- bash

guix shell ruby make gcc-toolchain -- sh -c "BUNDLE_PATH=~/.bundler bundle exec jekyll build" || exit 1

# Prompt the user which folder to upload
FOLDER_NAME="./_site"
AWS_BUCKET_URL="s3://blog.rusty-forms.com"
PROFILE_NAME="rusty"
CLOUDFRONT_ID="E3CNCFXR2Y9JNU"

echo "Using AWS profile: $PROFILE_NAME"
echo "Uploading folder: $FOLDER_NAME"
echo "Destination: $AWS_BUCKET_URL"

# Upload the folder to S3 using AWS CLI
guix shell awscli@1 -- aws s3 sync $FOLDER_NAME $AWS_BUCKET_URL --profile $PROFILE_NAME

# Invalidate CloudFront (Uncomment if you need this)
guix shell awscli@1 -- aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_ID --paths "/*" --profile $PROFILE_NAME