# contact-tracing-database-application

Design and Develop a relational database that can be used to build a contact tracing database useful to epidemiologists or epidemiological research.

Technologies: MySQL, R, SQL

### Features Implemented:
- Create a profile for each user.
- Maintain a database to track the health, testResults, contact information, etc,. for each user profile.
- If a user is tested positive then raise a case is logged and a tracing team is alloted to track down the contacts who were in touch with this infected user.
- Areas in which infected user moved around is also updated when the test results is positive.
- Test reports generated also maintain information regarding testing facility.

UML_ClassDiagram.pdf : Gives an clear idea of the design used to implement the database application.
Logical Data Model : Gives a conceptual model of the database application and the relationships between entities [Entity-relationship model].

### Implementation Details:
- From the logical model, a relational schema is designed in at least BCNF. Using functional dependencies, it is shown that the schema is in at least BCNF.
- A set of SQL data definition statements for the model is shown and the schema is realized in MySQL by executing the script from the MySQL console or via R.
- Shows that the tables were created and conform to the constraints through screen shots or other means.
- Populated the tables with test data. 
- Defined and executed at least five queries that show the database implemented. 
    - A join of at least three tables
    - A query that contains a subquery
    - A query with a group by with a having clause
    - A query with complex search criterion
- Connected to the database in R and loaded some of the data into R using one of the queries.
