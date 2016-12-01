#!/bin/bash

LIST_HOSTS=false
INV=""

while getopts ":i:l" opt; do
  case $opt in
    i)
      INV=$OPTARG
      ;;
    l)
      LIST_HOSTS=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

INV_FLAG=""

if [ "$INV" != "" ]; then
    if [ -e $INV ] && [ -f $INV ]; then
        INV_FLAG="--inventory $INV"
    else
        echo "Error: Inventory $INV does not exist."
        exit 1
    fi
fi

if $LIST_HOSTS; then
    HOSTS=`ansible all $INV_FLAG --list-hosts | grep -v 'hosts' | sed 's/^[ \t]*//' | tr '\n' ' ' 2>/dev/null`
    echo $HOSTS
    exit 0
fi

shift $((OPTIND-1))

if [ $# -gt 1 ]; then
    echo "Error: Too many arguments, only one argument allowed"
    exit 0
elif [ $# -lt 1 ]; then
    echo "Error: Too little arguments, one argument requried"
    exit 0
fi

HOST=$@

SSH_ARGS=""

if [ -e ./ansible.cfg ] && [ -f ./ansible.cfg ]; then
    LINE=`grep "ssh_args" ./ansible.cfg`
    SSH_ARGS="${LINE#*=}"
fi

echo "$HOST"
ssh $SSH_ARGS $HOST

if [ $? -ne 0 ]; then
    echo "Error: connection failed"
fi
