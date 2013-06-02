Grails Inventory Application
============================

This application is an inventory application written using the Grails web framework. It keeps track of assets owned by a company by recording the asset's state, location, description, and what client the asset is issue to. It handles user authentication, as well as authorization. It keeps track of every update applied to a piece of equipment as well.

Dependencies
------------

- Java Development Kit
- Groovy 2.1.3
- Grails 2.2.2
- MySQL 5 (can be removed to use H2)

Setting Up the Database
-----------------------

The application connects to a localhost MySQL database. The settings for the database are located at /grails-app/conf/DataSource.groovy. For a simpler setup or to just check out the application, you can comment out the MySQL data source and uncomment out the H2 sections (H2 is used by default in Grails and is held in memory. It requires no additional setup). Here are the data source settings currently being used for MySQL:

```groovy
// MySQL Settings

dataSource {
	dbCreate = "update"
	url = "jdbc:mysql://localhost:3306/harbor"
	driverClassName = "com.mysql.jdbc.Driver"
	username = "root"
	password = "root"
	properties {
		maxActive = 100
		maxIdle = 25
		minIdle = 5
		initialSize = 10
		minEvictableIdleTimeMillis = 60000
		timeBetweenEvictionRunsMillis = 60000
		maxWait = 10000
	}
}
```

To run the application using MySQL or H2, ensure that your database has been created with the name 'harbor' and the credentials are like the above settings, then uncomment the commented lines in the BootStrap.groovy file located at grails-app/conf/BootStrap.groovy. The application should then populate with some sample data on application start.

Running the Application
-----------------------

Download the repository as a ZIP archive and extract it or clone the repository, then run the following from the command line:
```
grails run-app
```
You may also need to run a grails upgrade if you are using a newer version of Grails.

After running the application, navigate to [http://localhost:8080/harbor][harbor] in your browser.  You can then log in using the username 'cscarborough' and the password 'password'.

[harbor]: http://localhost:8080/harbor