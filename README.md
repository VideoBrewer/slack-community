# Slack Community Helper [![license](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square)](https://github.com/VideoBrewer/slack-community/blob/master/LICENSE)

> Invite new members to public Slack community

### Usage
```
invite.sh [-h] [-t legacyToken] [-e email] [-f filename]
usage:
  -h show this help text
  -t Slack legacy token (api.slack.com/custom-integrations/legacy-tokens)
  -e invite by email
  -f invite multiple emails from file
```

### Example
```
./invite.sh -t ttt -e xxx@yyy.com
./invite.sh -t ttt -f emails.txt
```

