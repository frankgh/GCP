# Deploying a MapR cluster on Google Compute Platform   

(updated on 4/19/2018 by James Sun, MapR Technologies)

1. Scripts that install a demo five node MapR cluster (version 6.0.1 and MEP version 5.0.0) on Google Cloud 
   Platform in us-east1 region)

   The scripts can be customized to fit your own specific GCP environment needs

2. Each node is based on machine type: 
   n1-standard-16, with 3 x 120GB SSDs per node as data drives
   
   Make sure you have enough CPU/DISKS quotas on us-east1 region
   vCPUs >= 80, DISKs >= 1800GB

3. Prerequisites:
 
   a. You have signed up for an account on GCP (https://cloud.google.com)
   
   b. Install Cloud SDK on your local machine (https://cloud.google.com/sdk/downloads)
   
   c. Make sure that you can successfully execute gcloud commands on your local machine after the
      SDK installation

4. Infrastructure installation steps (local machine): 

   a. Create a VPC (maprvpc) and firewall rules by executing this command on your local machine with Cloud SDK installed:
   
      curl -L https://raw.githubusercontent.com/maprpartners/GCP/master/vpc.sh | bash

   
   b. Create the VMs for MapR cluster by executing the following command
   
      curl -L https://raw.githubusercontent.com/maprpartners/GCP/master/buildsrv | bash

5. MapR installation (on the first VM: maprvm1): 
   
   a. Now ssh into your first VM (maprvm1) as root, you can find its IP by executing "gcloud compute instances list --zones=us-east1-b"
      the password is 'mapr'
      
   b. Install MapR cluster by executing the following command
   
      curl -L https://raw.githubusercontent.com/maprpartners/GCP/master/install_mapr | bash
     
      Installation takes about 20 minutes, you can go to https://[IP of first VM]:9443 to monitor the progress of the installation. 

      login: mapr/mapr 

6. Start exploring MapR:
   
   a. Once the installation is complete, you can go to https://[IP of first VM]:8443, login as mapr/mapr to access the MapR Control System (MCS) UI

   b. You can also ssh in to any VM to start exploring MapR. 
 
   c. Also check out MapR online documentation at https://maprdocs.mapr.com/home/


7. Extra: run Real-Time Twitter analytics demo with Data Science Refinery on the MapR cluster 
   
   a. Spin up an edge node (mapredge) by executing the following command on the machine that has SDK installed:
  
      curl -L https://raw.githubusercontent.com/maprpartners/GCP/master/buildedge | bash

   b. Follow this instruction to complete the setup

      https://github.com/maprpartners/lenovo-demo/blob/master/readme.pdf

      You will need these environment info handy:

      MAPR_CLDB_HOSTS :  Use the internap IP of the first MapR VM (maprvm1)

      CL_NAME : Use mapr601-500

      HOST_IP : Use the internal IP of the edge VM (mapredge)

      Also, you can go to the installer page to see what services are installed in the cluster:

      https://[IP of the first VM]/#:9443

<span style="color: red">** Important! Please make sure that you change your passwords for user root and mapr immediately after you ssh into the VMs by issuing 'passwd" command to enforce good security practice. </span>
   
