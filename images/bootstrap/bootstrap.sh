#!/bin/sh

/usr/local/bin/stolonboot -sentinels 1 -rpc 1 -access-key $AWS_ACCESS_KEY_ID -secret-key $AWS_SECRET_ACCESS_KEY

if [[ $(kubectl get nodes -l stolon-keeper=yes -o name | wc -l) -ge 3 ]]
then
    kubectl scale --replicas=3 deployment stolon-sentinel
fi

# do first base backup
for pod in $(kubectl get po -l stolon-keeper=yes -o custom-columns=NAME:.metadata.name --no-headers=true)
do
    kubectl exec $pod -c cron /usr/local/bin/cron-wal-e.sh
done
