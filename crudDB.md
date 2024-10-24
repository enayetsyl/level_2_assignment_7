# How to Create, Update, and Delete Database in Postgres



- Open SQL Shell.
- Provide your username and password.
- Type the following command

```SQL  
CREATE DATABASE your_database_name;
```

- If the database is created successfully you will see the "CREATE DATABASE" message.
- Type the following command to see all the databases.
```SQL
\l
```

- If you want to change the name of the database you can use the following command
```SQL
ALTER DATABASE your_database_name RENAME TO new_database_name;
```

- If the database name is changed successfully you will see an "ALTER DATABASE" message.

- If you want to delete the database you can use the following command
```SQL
DROP DATABASE your_database_name;
```

- If the database deletes successfully you will see a "DROP DATABASE" message.

