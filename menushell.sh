#!/bin/bash

while getopts "u:p:" opt; do
  case $opt in
    u) user=$OPTARG ;;
    p) pass=$OPTARG ;;
    *) echo "Usage: $0 -u username -p password"; exit 1 ;;
  esac
done

shift $((OPTIND - 1))

echo "User: $user"
echo "Pass: $pass"
echo "Remaining args: $@"