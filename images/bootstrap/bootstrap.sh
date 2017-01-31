#!/bin/sh

/usr/local/bin/stolonboot -sentinels 1 -rpc 1 -namespace kube-system

if [[ $(kubectl --namespace=kube-system get nodes -l stolon-keeper=yes -o name | wc -l) -ge 3 ]]
then
    kubectl --namespace=kube-system scale --replicas=3 deployment stolon-sentinel
fi
