#!/bin/bash

# Add your Vultr API key
VULTR_API_KEY=
# Add the ssh-key id
vultr_ssh_key_id=
vultr_script_key_id=


if [[ -z $1 ]]; then echo "Must include an operating system for parameter 1.  Example: cent or ubuntu";exitsoon="1";fi
if [[ -z $2 ]]; then echo "Must include a region for parameter 2.  Example: syd sgp dfw sea";exitsoon="1" ;fi
if [[ -z $3 ]]; then echo "Must include a hostname for parameter 3.  Example: testserver01";exitsoon="1" ;fi
if [[ $exitsoon == "1" ]]; then echo "Exiting... "; exit 1;fi


if [[ $1 == "cent" ]] || [[ $1 == "CENT" ]] || [[ $1 == "CentOS" ]]; then OSVER="362";fi
if [[ $1 == "ubuntu" ]] || [[ $1 == "UBUNTU" ]] || [[ $1 == "Ubuntu" ]]; then OSVER="270";fi
if [[ $2 == "syd" ]] || [[ $2 == "sydney" ]] || [[ $2 == "Sydney" ]]; then REGIONVER="syd";fi
if [[ $2 == "sgp" ]] || [[ $2 == "singapore" ]] || [[ $2 == "Singapore" ]]; then REGIONVER="sgp";fi


vultr-cli instance create \
	--region $REGIONVER \
	--plan vc2-1c-1gb \
	--os $OSVER \
	--host $3 \
	--label $3 \
	--ipv6 false \
	--script-id $vultr_ssh_key_id \
	--ssh-keys $vultr_script_key_id
