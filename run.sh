#!/bin/sh

validate_key() {
  local private_key=$1;

  if [ -z "$private_key" ]; then
    if [ -z "${WERCKER_ADD_SSH_KEY_KEYNAME}" ] ; then
      message="Private key not found. The keyname was blank, may indicate dollar sign prepended to the keyname."
    else
      tmp=$(echo "$WERCKER_ADD_SSH_KEY_KEYNAME" | sed -e 's/.*\(_PRIVATE\)$/\1/')
      if [ "$tmp" = "_PRIVATE" ] ; then
        message="Private key not found. The keyname should not have _PRIVATE at the end."
      else
        message="Private key not found. Be sure to create an environment variable named ${WERCKER_ADD_SSH_KEY_KEYNAME}_PRIVATE (X_${WERCKER_ADD_SSH_KEY_KEYNAME}_PRIVATE if using the CLI) containing the SSH private key."
      fi
    fi
    fail "$message"
  fi
}

main() {

  local ssh_key_path=$(mktemp);

  local private_key=$(eval echo "\$${WERCKER_ADD_SSH_KEY_KEYNAME}_PRIVATE");
  local host=$WERCKER_ADD_SSH_KEY_HOST;

  validate_key "$private_key";

  echo -e "$private_key" > $ssh_key_path

  # Add for current user if that isn't root
  [[ $(id -u) -ne 0 ]] && $WERCKER_STEP_ROOT/addKey.sh $HOME $USER $ssh_key_path $WERCKER_ADD_SSH_KEY_HOST

  # Also add it for root
  sudo $WERCKER_STEP_ROOT/addKey.sh /root root $ssh_key_path $WERCKER_ADD_SSH_KEY_HOST
}

main;
