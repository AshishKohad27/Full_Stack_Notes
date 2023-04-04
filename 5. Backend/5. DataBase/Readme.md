# 1. What are Models?

# 1 . What is Schema?
-  A schema is a JSON object that defines the the structure and contents of your data.

src:- https://www.mongodb.com/docs/atlas/app-services/schemas/#:~:text=Overview-,What%20is%20a%20Schema%3F,created%2C%20changed%2C%20or%20deleted.

# 1. Explain why mongoose does not return a promise but has a .then

# 1. What are aggregation pipelines with mongoose?
An aggregation pipeline consists of one or more stages that process documents: Each stage performs an operation on the input documents. For example, a stage can filter documents, group documents, and calculate values. The documents that are output from a stage are passed to the next stage.
# 1. I'm using an arrow function for a virtual, middleware, getter/setter, or method and the value of this is wrong. Why?

# 1. Should I create/destroy a new connection for each database operation?

# 1. My query/update seems to execute twice. Why is this happening?

# 1. How do you create indexes with mongoose ?

# 1. What are pre and post hooks?



Databases
Theory
A database is nothing but a place to store your data. it is mostly a dedicated software that handles all types of CRUD operations on your data. a database software gives you multiple ways to access/update your data.

There are multiple types of databases. every one of them only differs in "How" they store data. ultimate goal of every database is same: Store and get data as effectively as possible

NOTE: every type of database are super fast. Imagine the fastest thing you have seen so far, not multiply it by 100, and more 100. All the professional grade databases are even faster than that. So it's completely normal that a thought will come to your mind, "Which one is better" or "Which one is faster", the answer to that is as always: it depends.

Relational Databases
These types of databases are the most common ones so far. They are one of the oldest Database systems as well. A relational DB stores the data in rows and column format.

eg:

---

id | name | age |
---+-----------+--------|
1 | John | 33 |
---+-----------+--------|
2 | Jack | 50 |
---+-----------+--------|
3 | Jenna | 45 |
---+-----------+--------|
here, id, name, age and the columns, and every row represent the data stored in the database. We call these types of databases 'relational' because you can represent the data in terms of 'relations' to other data.

Such databases make up majority of applications in the world. (eg, facebook, apple, amazon etc all big company's use them for many of their products)

The LMS uses relational database called MySQL.

Few examples of Relational DBs: PostgresSQL, MySQL, Oracle SQL, MS-SQL etc if you notice, there are many ending with -sql. SQL stands for "Structured Query Language". pronounced as Sequel or S Q L. both are valid.

Because the data we are seeing is in a 'structured' format (table), the language that is used to manipulate the data in relational databases are also commonly known as "SQL databases"

Non relational Databases
These are just opposite of Databases. which is why it's common to call them "no-sql" (pronounced as no-sequel)

In NoSQL databases, the data stored in DB has no relation with other data. in simple words you can store whatever you want without worrying about any structure.

i.e. One Table can store { name: "John" } the other can store { color: "red" }.

it's totally upto you what you want to store. these types of databases are very flexible. Mongodb is one example of NoSQL DB.

Key-Value
Another way to store the data is key-value pairs. This is also a no-sql type of db. Imagine localStorage just like that you can store anything and give it a key. and based on this key you can later fetch this data, update, or delete as well.

These types of databases are mostly used as caching mecanism instead of primary source of data.

the examples of k-v store is: redis, lowdb, rocksdb etc

GraphDB
The GraphDBs are relatively newer in the database domain. And they could be a little bit hard to imagine as well. in Graph DB, every data is stored as a "Node". this data doesn't have to follow any structure whatsoever.

But if you have two just data "Nodes" you can form a relation between them with an "Edge". See this image

here we are storing Multiple Person, Multiple Cities, Teams And Stadiums. when you store any of these things, a "Node" is created for it. So if you create 2 Nodes:

Person {
name: "john",
age: 13
}
and

City {
name: "Banglore"
}
you can form an edge between them which represents how this person is related to that city. here the edge name is 'likes'. i.e. If you want to find all people who likes banglore, or even if you want to find all cities a person likes, it's extremly easy to do that now.

If you have guessed, this is nothing but Relational + Non-Relational Both at the same time. GraphDBs are very versatile, since you can store whatever data you want + have relation between data

MongoDB
Mongodb, as discussed above is a non-relational or No-SQL db. The reason why it's included in MERN stack is, everything is JS in mongodb. The database itself is written in C++, but the language that is used to connect to DB, request data from DB, add new data to DB is JavaScript.

So thankfully you don't have to learn any new language to learn Mongodb. it makes learning mongo very easy.

Installation
MongoDB comes with 2 types, Enterprise and Community. the Community Edition is fully free and includes complete features of the database. Enterprise is the version that needs to pay, but it only includes "extra" features like 0% downtime etc. which are rarely needed for learning purpose.

head to this link, Download the Community Edition based on your operating system, and install it. it will mostly be just double click and next -> next -> next etc.

MongoSh
The above link only installs the database itself. to connect with database you will need another tool called as mongosh. install it from here;

Document
Every Single smallest unit you can store in the mongodb, is called as a document. a document is nothing but a object from JS. it's as simple as that. thus, { name: "john" } is a valid mongodb 'document' and you can store it in mongodb, and perform any operation on it.

Collection
A collection is just set of documents. if you have 10 users information you want to store in your database, So you can create a "collection", give it a name, and then store the documents in it. Collections only job is to group similar types of documents. (here you can give it a name like "users" then later it becomes easy to ask mongodb give me first 2 users from "users" collection)

Database
Above we collectively referred "database" as a software that manages your data. but once you have that software (here mongodb) installed, a database is usually referred to as "set of similar type of data". overall it's a Group of collections. eg: now you have Users collection that has documents on users personal information, you can create one more collection that stores users Employment information, call it, employee etc.

you can have multiple such databases.

To summerize:

--------------------+
Database |
+------------- |
| Collections |
| +------------|
| | Document |
| | |
| | |
--------------------+












Their are differnt databases with different purpose, having their own advantages and disadvantages.


SQL
Often known as Sequential Database/Relational Database/ Structured Database


Advantages
Fast read operations.
hard to make changes once created.
Disadvantages
slow to write.
Extra infromation can be stored easily.
Not preferred for unstructured data.
NoSQL
Often known as Non-Sequential Database
Advantages
Fast write operations.
Extra infromation can be stored easily.
Disadvantages
slow read operations.
Not preferred for Structured data.
Difference between SQL and NoSQL


MongoDB
MongoDB is a source-available cross-platform document-oriented database program. Classified as a NoSQL database program, MongoDB uses JSON-like documents with optional schemas. MongoDB is developed by MongoDB Inc.

Installing Mongodb

You can download mongo from this link Mongodb installation link
Download it from the link and then follow the instructions
Once installed open a terminal and type mongo and if it opens an interactive shell then we are good else you might need to open another terminal window and type mongod to start mongo deamon and then in another window try mongo again.
MongoDB follows mongodb protocol and generally listens on port 27017
Some basic commands for mongo

show dbs # shows you all the databases on the mongo system.
use test # this will get us into that db and if db does not exists then it will create one and then take us inside it
db.dropDatabase() # this will drop the current database
show collections # shows all the collections in the current db
db.createCollection('users') # creates a users collection in the current db
db.users.insert({"firstName": "Ritesh", "lastName": "Firodiya"}) # this will create a new document inside users
db.users.find({}) # this will return all the documents inside users collection
** Note ** :- Mongodb by default adds a unique _id which is unique across all collections and similar concept to MySQL

db.users.insertMany([{"firstName": "Prateek", "lastName": "Shukla"}, {"firstName": "Prateek", "lastName": "Sharma"}])# this will create 2 documents
db.users.find({}).pretty() # this shows the query results in a pretty format
db.users.find({"firstName": "Prateek"}).pretty() # shows all the documents with firstName => Prateek
db.users.findOne({"firstName": "Prateek"}) # shows the first document that it came across when looking for firstName => Prateek
db.users.update({"_id": "Object Id here"}, {$set: {"lastName": "Shah"}}) # updates document with id and replaces the lastName with Shah and if the lastName was not there then it will create it
db.users.update({"firstName": "Prateek"}, {$set: {"lastName": "Shah"}}) # updates the first document with firstName => Prateek and replaces the lastName with Shah and if the lastName was not there then it will create it.
db.users.updateMany({"firstName": "Prateek"}, {$set: {"religion": "Hindu"}})
db.users.remove({"firstName": "Prateek"}) # removes all documents with firstName => Prateek
If we want to ensure only 1 document is removed then the best way is to pass a unique key .. in most cases Id db.users.remove({"_id": ObjectId of the document })
If we do not know a unique key but still want to remove just 1 document then we can do db.users.remove({"firstName": "Prateek"}, 1) # removes the first document with firstName => Prateek

// 1. show dbs; // show the databases
// 2. use DB_name // create/select a database;
// 3. db.createCollection("users") // tyo create a users collection.
// 4. show collections;

// CRUD
// insertOne
// insertMany

// find({ name: "ritesh"}) 
// findOne({name: "ritesh" })

// updateOne({find condistion}, {$set: {changes}}) 
// updateMany({find condition}, {$set: {changes}})

// deleteOne({find condition}) 
// deleteMany({find condition})

// db.users.drop() // drop users collection
// db.dropDatabase() // drop current database












Steps Importing in MongoDB
Create Mock JSON using Mockaroo or create it manually. users.json
mongoimport --drop --db b20 --collection users --file ~/users.json --jsonArray
[MongDB Compass] - Download
Download
Connect
Import
View
Content Filter and only specific fields
Second argument of Find function

0 Means NO and is default value.
1 means YES and it will add the key.
Note _id is default field and will always be retuirned unless we removed manually.
Examples
db.users.find({}, {"age": 1})
db.users.find({}, {"age": 1, "email": 1})
db.users.find({}, {"age": 1, "email": 1, "_id": 0})
Math in Mongo
Equals: db.users.find({age: {$eq: 40}})
Not Equals: db.users.find({age: {$ne: 40}})
Greater than: db.users.find({age: {$gt: 40}})
Greater than or equals: db.users.find({age: {$gte: 40}})
Less than: db.users.find({age: {$lt: 40}})
Less than or equals: db.users.find({age: {$lte: 40}})
IN Range: db.users.find({"age": {$in: [40, 41, 42]}}, {"age": 1, "_id": 0})
Not IN Range: db.users.find({"age": {$nin: [40, 41, 42]}}, {"age": 1, "_id": 0})
LOGICAL OPERATORS
AND: db.users.find({$and: [{"gender": "Male"}, {"age": 42}]})
OR: db.users.find({$or: [{"gender": "Male"}, {"age": 42}]})
Not : db.users.find({"age": {$not: {$gt: 40}}})
NOR: db.users.find({$nor: [{"gender": "Male"}, {"age": 42}]})
Math + Logical
We can write comparison operators also along with logical operators for
Example 1:
Q1: we will get all males whose age is in the range of 40 to 45.
A1: db.users.find({$and: [{"gender": "Male"}, {"age": {$in: [40, 41, 42, 43, 44, 45]}}).
Example 2:
Q2: GET Either females or users with age greater then 25.
A2: db.users.find({$or: [{"gender": "Female"}, {"age": {$gt: 25}}]})
ELEMENT OPERATORS
Checking Exists:- in this we check if a field exists and if it does then does it match a condition for example :
db.users.find({first_name: {$exists: true}})
if your collection has all documents with same number of fields and still want to test then you can remove a field by writing below query
Set Data : db.users.update({ "_id" : "Object_ID"}, {$set: {"first_name": "Geralda"}})There are a lot of such operators
Unset data: db.users.update({ "_id" : "Object_ID"}, {$unset: {"first_name": "Ritesh"}})There are a lot of such operators and we will touch base on some of them later in the course and you can check them out on the documentation link below
SORT
db.users.find({"age": {$lt: 80}}, {"age": 1, "_id": 0}).sort({age: -1})
Limit
Limit 5: db.users.find({"age": {$lt: 80}}, {"age": 1, "_id": 0}).limit(5)
Sorting and then limitig: db.users.find({"age": {$lt: 80}}, {"age": 1, "_id": 0}).sort({age: -1}).limit(5)
Skip
Offseting :- we can use the skip() to skip a few documents as shown below
db.users.find({"age": {$lt: 80}}, {"age": 1, "_id": 0}).sort({age: -1}).skip(2).limit(5)
Mongoose