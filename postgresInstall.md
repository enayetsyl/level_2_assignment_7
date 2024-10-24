# How to install postgres in your windows machine

- Open this [link](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)  and download the latest version of postgres.

- Click the downloaded file and install it. Keep everything default and click next.

- It will ask for password. Enter the password and click on next.

- Go to C drive and go to Program Files and open the PostgreSQL folder. Go to the bin folder. Copy the path of the bin folder.
  
- In the search bar type env. You will see 
Edit the system environment variables. Click on it.

- In the system properties, click on the environment variables.

- Click on the Path and click on edit.


- Click on New button and paste the path of the bin folder. Click on ok.

- Now you can use postgres in the SQL terminal. For this in the search bar type SQL. It will show you a name called "SQL Shell (psql)". Click on it.

- You can also use the command prompt to use postgres. For this in the search bar type cmd. It will show you a name called "Command Prompt". Click on it.

- Type psql -U postgres. It will ask for password. Enter the password and click on enter.

- Now you can create a database and use it.