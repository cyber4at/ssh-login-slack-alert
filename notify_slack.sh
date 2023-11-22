#!/bin/bash
# This line specifies the interpreter to execute the script, in this case, Bash.

if [[ "${PAM_TYPE}" != "close_session" ]] && [[ "${PAM_RHOST}" != "127.0.0.1" ]]; then
# Begins an 'if' block that checks two conditions:
# 1. If the PAM session type is not a closed session (meaning it's an opening session).
# 2. If the SSH connection is not coming from localhost (127.0.0.1).

  url='https://hooks.slack.com/services/uour_slack_hook_id_here'
  # Sets the URL for the Slack webhook.
  
  channel="#your_channel"
  # Specifies the Slack channel where the message will be sent.

  host="$(hostname)"
  # Retrieves the hostname of the server where the script is running and stores it in the 'host' variable.

  content="\"attachments\": [ { \"mrkdwn_in\": [\"text\", \"fallback\"], \"fallback\": \"SSH login: $PAM_USER from $PAM_RHOST on $host\", \"text\": \"SSH login: $PAM_USER from $PAM_RHOST on $host\", \"color\": \"#36a64f\" } ]"
  # Constructs the JSON payload for the Slack message. This includes details like the user who logged in (PAM_USER), the remote host (PAM_RHOST), and the server's hostname. Also sets the message color.

  curl -X POST --data-urlencode "payload={\"channel\": \"$channel\", \"mrkdwn\": true, \"username\": \"SSH Alerts\", $content}" $url
  # Uses 'curl' to send a POST request to the Slack webhook URL. The payload includes the channel, message format (markdown), a custom username for the alert, and the constructed content.

fi
# End of the 'if' block.
