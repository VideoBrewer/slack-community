#!/bin/bash

function invite() {
  curl \
    -X POST \
    "https://slack.com/api/users.admin.invite?token=${token}&email=${1}"
  printf "\n"
}

function usage() {
  printf "${usage}"
  exit $1 $token
}

usage="$(basename "$0") [-h] [-e email] [-f filename]
Invite members to public Slack community
usage:
  -h show this help text
  -t Slack legacy token (api.slack.com/custom-integrations/legacy-tokens)
  -e invite by email
  -f invite multiple emails from file
"
token=""

# TODO: Split while to extract token from any order of flags
while getopts 'ht:e:f:' flag; do
  case "${flag}" in
    h) 
      usage
      ;;
    t)
      # TODO: Error if missing token
      token="${OPTARG}"
      ;;
    e) 
      printf "Inviting ${OPTARG}: "
      invite ${OPTARG}
      exit
      ;;
    f) 
      [[ "`stat ${OPTARG} 2> /dev/null`" == "" ]] && usage 1

      while read email; do
        printf "Inviting ${email}: "
        invite $email
      done < ${OPTARG}
      exit
      ;;
    *)
      usage 1
      ;;
  esac
done
