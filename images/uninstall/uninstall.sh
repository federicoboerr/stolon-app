#!/bin/sh

for resource_file in utils rpc keeper sentinel
do
	kubectl --namespace=kube-system delete -f /var/lib/gravity/resources/${resource_file}.yaml
done
kubectl --namespace=kube-system delete secret stolon
kubectl label nodes -l stolon-keeper=yes stolon-keeper-
