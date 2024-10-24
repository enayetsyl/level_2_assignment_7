# How to create new user, and database in Postgres and grant and revoke permission

- Open SQL Shell. 

- Provide your user name and password.

- Type following command

```sql
CREATE DATABASE your_database_name;
```

- If database create successfully you will see "CREATE DATABASE" message.

- Type following command to see all the database.

```sql
\l
```

- If you want to see your user name and database in which you are connected you can run following command.

```sql
\conninfo
```

- You will see a message like following

`You are connected to database "postgres" as user "postgres" on host "localhost" (address "::1") at port "5432".
postgres=#`

- It will show your database name, user name, host and port. In my case db name is postgres, user name is postgres, host is localhost and port is 5432.

- If we want to see the schema then you can type following command

```sql
\dn
```

- For me it is showing following 

```sql
      List of schemas
  Name  |       Owner
--------+-------------------
 public | pg_database_owner
(1 row)
```

- If you want to see the users you can run following command

```sql
\du
```
- For me it is showing following  
  
```sql
                             List of roles
 Role name |                         Attributes

-----------+------------------------------------------------------------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS
```

- Currently there is one user named "postgres" and he has "Superuser, Create role, Create DB, Replication, Bypass RLS" attributes. Attributes are collection of privileges. In simple term we can say the permission of the user to do certain task in the database.

- If you want to create an user with password you can use following command

```sql
CREATE USER abd WITH LOGIN ENCRYPTED PASSWORD '123456';
```

- It will create an user with the name of abd and the password will be 123456.

- If user is created successfully you will see CREATE ROLE message in the terminal.
  

- If you want to create a role you can use following command

```sql
CREATE ROLE efg WITH LOGIN ENCRYPTED PASSWORD '654321';
```

- It will create a role with the name of efg and the password will be 654321.

- If user is created successfully you will see CREATE ROLE message in the terminal.

If you type \du then you will see the user and role name.

- By default the newly created user does not have any permission. Super admin have to grant permission and can also revoke permission.

- Below is the command for granting all the privileges to an user on a specific table.

```sql
GRANT ALL PRIVILEGES ON TABLE table_name TO user_name;
```

- If you see "GRANT" message then the permission successfully granted. And the user now can perform read, write, update and delete operation in that table. 

- Instead of granting all the privileges you can grant specific permission. 

```sql
GRANT SELECT ON TABLE table_name TO user_name;
```

- If you see "GRANT" message then the permission successfully granted. And the user now can perform read operation in that table. Like this you can grant individual permission like update, delete etc.

- If you want to revoke permission you can use following command

```sql
REVOKE SELECT ON TABLE table_name FROM user_name;
```

- If you see "REVOKE" message then the permission successfully revoked. And the user now can not perform read operation in that table. Like this you can revoke individual permission like update, delete etc. Similarly you can revoke all the permission.


- We can grant permission for a database to a specific user. 

```sql
GRANT ALL PRIVILEGES ON DATABASE database_name TO user_name;  
```























