#!/bin/bash
crontab /confs/crontab
crond

# 挂载oss卷到/oss-data/bucket_name目录
echo "$BUCKET_NAME:$ACCESS_KEY:$ACCESS_KEY_SECRET" > /etc/passwd-ossfs
chmod 640 /etc/passwd-ossfs
mkdir -p /oss-data/$BUCKET_NAME
ossfs $BUCKET_NAME /oss-data/$BUCKET_NAME -ourl=$OSS_URL

touch /var/log/cron.log
tail -f /var/log/cron.log
