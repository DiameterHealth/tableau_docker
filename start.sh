#!/bin/bash




setup_tool='https://downloads.tableau.com/esdalt/2022.3.1/tableau-server-container-setup-tool-2022.3.1.tar.gz'

rpm_tool='https://downloads.tableau.com/esdalt/2022.3.1/tableau-server-2022-3-1.x86_64.rpm'


## Downloads tools for centos environment
sudo yum install -y wget
sudo yum install -y unzip

## Downloads tableau setup tools
wget ${setup_tool}
## uncompress the file 
tar -xzf tableau-server-container-setup-tool-2022.3.1.tar.gz
### delete thw compressed file 
rm tableau-server-container-setup-tool-2022.3.1.tar.gz

###Copies already made files OR Overwrites the default files to our settings

cat reg-info.json > '/home/centos/tableau_docker/tableau-server-container-setup-tool-2022.3.1/reg-info.json'


cat setup-script > '/home/centos/tableau_docker/tableau-server-container-setup-tool-2022.3.1/customer-files/setup-script'
cat env.txt > '/home/centos/tableau_docker/tableau-server-container-setup-tool-2022.3.1/env.txt'

### enter the setup files 
cd tableau-server-container-setup-tool-2022.3.1


wget ${rpm_tool}


#Install the rpm installer and download the dependencies
cd customer-files
wget https://downloads.tableau.com/drivers/linux/postgresql/postgresql-42.3.3.jar
wget https://dev.mysql.com/get/Downloads/Connector-ODBC/8.0/mysql-connector-odbc-8.0.26-1.el7.x86_64.rpm
wget https://databricks-bi-artifacts.s3.us-east-2.amazonaws.com/simbaspark-drivers/odbc/2.6.26/SimbaSparkODBC-2.6.26.1045-LinuxRPM-64bit.zip
unzip SimbaSparkODBC-2.6.26.1045-LinuxRPM-64bit.zip
cd ..
######## builds docker image

./build-image --accepteula -i tableau-server-2022-3-1.x86_64.rpm -e env.txt

sleep 10

docker images ls
