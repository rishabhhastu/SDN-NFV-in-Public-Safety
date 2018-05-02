# SDN-NFV-in-Public-Safety

## Additional work appreciated for HSS syncronization. HSS synchronization would not work in these containers, but would be achievable if the mongoDB is updated to version 3.6.4 in the nextepc-vepc container.

### Description:

1. Automates the creation nextepc and nodeJS containers which would be used for the vEPC and WebGUI service respectively. 
2. Using config-templates in the nextepc_config folder which would be used to dynamically update the images.
3. Running the two images in different containers and inter-networking between them to display output
4. Fast spinning up of the vEPC service thereby minimizing the time to bring up the communication network. 

### Pre-requisites
1. Git Clone the repository into your local machine. 
```
git clone https://github.com/rishabhhastu/SDN-NFV-in-Public-Safety
```

2. Install docker-compose in your system. The below commands are for Linux OS. You can find the respective commands for your own flavor of OS
```
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
```

3. Modify the config-templates to set the IP address set in the enodeB (s1ap addr field). Alter all the values according to your environmnet. 


### USAGE:
Run the following commands after doing the pre-requisites.
```
sudo docker-compose build 
sudo docker-compose up -d nextepc-vepc nextepc-webui
```

##### To verify that the containers are running use the below command:
```
sudo docker-compose ps
```

The vEPC service should get connected with the enodeB at this time, and it would take less than 5 seconds after the container are up.

##### To update the HSS database

1. Open 127.0.0.1:3000 in the browser and enter the default credentials (user: admin, pass: 1423)
2. Update the subscribers according to the SIM information

##### To synchronize the HSS database with central DB

1. Upgrade the mongoDB database inside the vEPC container to v3.6.4
2. Update the mongo-sync.sh file to reflect the IP address of the remote central DB.
3. Enable replication by updating the /etc/mongod.conf file:
```
replication:
  replSetName: 'rs'
```
4. Install pymongo using pip.
5. Run the script pymongo.sh in the background

```
sudo chmod +x pymongo.sh
./pymongo.sh &
```

Add / Update a record in the mongoDB using the WebGUI. Verify the update in the remote central DB automatically. 



