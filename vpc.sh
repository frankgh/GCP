gcloud compute networks create maprvpc

subnet=`gcloud compute networks subnets list | grep us-east1 | grep maprvpc | awk '{print $4}'`

gcloud compute firewall-rules create allowmapr --network maprvpc --allow tcp:22,tcp:8443,tcp:9443 --source-ranges 0.0.0.0/0
gcloud compute firewall-rules create allowmaprint --network maprvpc --allow all --source-ranges ${subnet}
