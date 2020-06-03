#! /bin/bash

set -ux

echo "join worker node"

#generate ssh key for access
echo -e "${SSH_KEY//_/\\n}" > /tmp/ssh.key
chmod 600 /tmp/ssh.key
echo "end chmod"

# Ask kubeadm on master to generate a fully formed join command, suitable for
JOIN_COMMAND="$(ssh -i  /tmp/ssh.key -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@$MASTER_EXT_IP kubeadm token create --print-join-command)"

echo $JOIN_COMMAND

#execute join command on worker node1
WORKER1=$(ssh -i /tmp/ssh.key -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@$WORKER1_EXT_IP sudo $JOIN_COMMAND)
echo "****** worker1 join message $WORKER1"

#execute join command on worker node1
WORKER2=$(ssh -i /tmp/ssh.key -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ubuntu@$WORKER2_EXT_IP sudo $JOIN_COMMAND)
echo "****** worker2 join message $WORKER2"

# clean up 
rm -f /tmp/ssh.key || true
