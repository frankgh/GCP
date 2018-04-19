# GCP

1. Scripts that install a demo five node MapR cluster on Google Cloud Platform (us-east1 region)
   Scripts can be customized to fit your own specific GCP environment needs

2. Each node is based on machine type: n1-standard-16, with 3 x 120GB SSDs per node as data drives
   Make sure you have enough CPU/DISKS quotas on us-east1 region
   vCPUs >= 80, DISKs >= 1800GB

3. Prerequisites:
   a. You have sign up for an account on GCP (https://cloud.google.com/)
   b. Install Cloud SDK on your local machine (https://cloud.google.com/sdk/downloads)
   c. Make sure that you can successfully execute gcloud command on your local machine after the
      SDK installation

4. Installation steps: 
   a. Create a VPC (maprvpc) and create firewall rules by executing this command on your local machine with Cloud SDK installed:
      curl -L https://raw.githubusercontent.com/jsunmapr/pacc-mssql/master/vpc.sh | bash

   b. Create the VMs for MapR cluster by executing the following command
      curl -L https://raw.githubusercontent.com/jsunmapr/pacc-mssql/master/build_srv | bash

   c. Install MapR cluster by executing the following command
      curl -L https://raw.githubusercontent.com/jsunmapr/pacc-mssql/master/install_mapr | bash
      
    
