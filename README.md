# Script Overview

This script is designed to send a notification to a specified Slack channel when a user logs into the system via SSH, **excluding logins from the local machine (localhost)**. It uses environment variables provided by **PAM (Pluggable Authentication Module)**, specifically `PAM_TYPE`, `PAM_USER`, and `PAM_RHOST`, to gather information about the SSH session.

---

# `deploy.yml`

## Overview

This **Ansible playbook** is designed to deploy the `notify_slack.sh` Bash script across all specified hosts within an infrastructure. The primary objective of this playbook is to automate the setup process of the script on every host, ensuring that it gets executed upon SSH logins.

## Key Tasks

The specific tasks accomplished by this playbook include:

1. **Verification and Creation** of the necessary directory (`/usr/local/bin`) to store the script.
2. **Secure Copying** of the `notify_slack.sh` script from the local machine to the specified directory on all the target hosts, setting appropriate permissions and ownership.
3. **Configuration of the PAM** to incorporate the script in the SSH login process. This involves modifying the `/etc/pam.d/sshd` file to call our script during SSH sessions.
4. **Conditional Restarting of the SSH Service** using Ansible's handler mechanism, which is triggered if any changes are made to the PAM configuration. This ensures that the new configuration is applied without requiring manual intervention.

## Benefits of Using Ansible

By utilizing Ansible, this deployment process becomes highly efficient, scalable, and repeatable, allowing for consistent configuration across multiple hosts with minimal manual effort. The integration of the `notify_slack.sh` script with the SSH login process serves as an effective way to enhance monitoring and alerting capabilities for system administrators.

