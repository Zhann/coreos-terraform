#!/bin/bash
token=`curl -sw "\n" https://discovery.etcd.io/new`

/usr/local/bin/gsed -i 's|TF_VAR_etcd_token.*$|TF_VAR_etcd_token='"$token"'|' ~/.zshrc
