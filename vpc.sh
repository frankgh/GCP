gcloud compute networks create maprvpc
gcloud compute firewall-rules create allowmapr --network maprvpc --allow tcp:22,tcp:8443,tcp:9443 --source-ranges 0.0.0.0/0
gcloud compute firewall-rules create allowmaprint --network maprvpc --allow all --source-ranges 0.0.0.0
