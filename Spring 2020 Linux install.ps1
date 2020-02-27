## Pull the latest SQL Server 2019 Ubuntu image 
docker pull mcr.microsoft.com/mssql/server:2019-latest
## Verify that the docker image is on your system
docker image ls -a
##  You can customise the container by modifying any of the parameters or not
##	docker container run 
##	--name linux-sql2k19   								You can change linux-sql2k19
##	-p 12001:1433 										You can change 12001 
##	-e "ACCEPT_EULA=Y" -e "SA_PASSWORD=PH@123456789" 	You can change PH@123456789
##	-e  "MSSQL_LOG_DIR=/var/opt/mssql/log/" 
##	-e  "MSSQL_BACKUP_DIR=/var/opt/mssql/backup/" 
##	-e  "MSSQL_AGENT_ENABLED=true" 
##	-h csci331-server 									You can change csci331-server to any hostname
##	-d mcr.microsoft.com/mssql/server:2019-latest

## Run the command below to start the container as is with no changes if you would like.
docker container run --name linux-sql2k19 -p 12001:1433 -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=PH@123456789" -e  "MSSQL_LOG_DIR=/var/opt/mssql/log/" -e  "MSSQL_BACKUP_DIR=/var/opt/mssql/backup/" -e  "MSSQL_AGENT_ENABLED=true" -h csci331-server -d mcr.microsoft.com/mssql/server:2019-latest
## Check that your container is started
docker container ls -a
##
##	Download CSCI331-Backup.zip and extract to the same name folder.  My system has it on the W drive.  Your can download wherever you like.
##	docker cp "Your fully qualified path to this folder\CSCI331-Backup\" linux-sql2k19:/var/opt/mssql/backup/
docker cp "W:\CSCI331-Backup\" linux-sql2k19:/var/opt/mssql/backup/
##
##  Validate that SQL server 2019 is working
## executing sqlcmd  -S "localhost,12001" -U sa -P PH@123456789 put you into SQL server and execute the select @@version,db_name() followed by go
sqlcmd  -S "localhost,12001" -U sa -P PH@123456789 
select @@version,db_name()
go
## if information comes back about SQL server  then you are good

## Now connect to the docker container using the bash shell use ls -ls
docker exec -it linux-sql2k19 bash
cd /var/opt/mssql/backup/
