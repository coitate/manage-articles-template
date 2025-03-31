#!/bin/bash

INPUT_FILE="$1"
FILE_NAME=$(basename $INPUT_FILE)
QIITA_ARTICLE_DIR="qiita/public"
QIITA_FILE_PATH="$QIITA_ARTICLE_DIR/$FILE_NAME"

# convert to Qiita article format
awk '
  BEGIN { in_block=0 }
  /^---/ {
    in_block++
    if (in_block==2) exit
    next
  }
  in_block==1 { print }
' "$INPUT_FILE" | \
yq eval '
    .tags=.topics |
    .private= true |
    del(.emoji, .type, .topics, .published) |
    .updated_at= "" |
    .id= "" |
    .organization_url_name= null |
    .slide= false |
    .ignorePublish= false
' - | awk 'BEGIN {print "---"} {print} END {print "---"}' > $QIITA_FILE_PATH

sed -n '8,$p' "$INPUT_FILE" >> $QIITA_FILE_PATH