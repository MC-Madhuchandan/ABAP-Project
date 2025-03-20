![image](https://github.com/user-attachments/assets/367d9588-7669-46c4-a8b4-429e89fa2b3e)![image](https://github.com/user-attachments/assets/d72edd03-897a-4bd0-8e85-75485f8b4bc5)**RAP Introduction**

**Challenges in ABAP Development**

Common Needs which we use in traditional method
1. Create application logic - CRUD
2. Perform Validation
3. Check customizing
4. Handle Locks
.....

**Challenges**
1. Every Developer thinks differently which will lead to conflict of code
2. Adapat application code ( There is no standardization every company follows their own coding format )
3. High maintainance 
4. No Standardization
5. Lack of Standard

To overcome these challenges SAP Introduced RAP Framework , it brings standardization , which speeds up the devlopment 
Less Coding, Framework will care more of our code, There is no common best practice to follow for everyone

**Evolution of RAP**
![image](https://github.com/user-attachments/assets/3e8192fa-df85-43e8-bc9c-6ec6c46bc237)

SAP Released RAP 09/2019 Version for on prem
first they released for cloud -- 08/2018

**Introduction to RAP**
![image](https://github.com/user-attachments/assets/34a57718-7573-499d-8140-20c6c872e9dc)

The ABAP RAP Model defines the architecture for efficient application development for HANA optimized ABAP Apploication
It supports 1. Green field implementation -- start completely new application from scratch
            2. Brown field implementation -- A new/ Extension of application using old code

It is based on proven technologies and framework such as CDS entities to define semantically rich data model 
and service model infrastrcuture for creating and binding OData services for different use cases

**Components in RAP**
- CDS Entities - To develop RAP BO ( Business Object )
- Business object: its a node inside a TREE data structure
  which is composed of multiple nodes( parent , child) , The tree starts from a root node
- once our BO is ready , we define the behaviour of the BO Like can this object be created , updated deleted .
BO is a static structure ( like class ) and records of actual data is the instance of BO( like object of class)
- Finally we create service definition and service Binding
- UI layer to consume the service to build application

**Development Approach**

![image](https://github.com/user-attachments/assets/e75121d4-63bb-4ffb-9e1a-58cb5ee66ad6)

**RAP Big Picture**
![image](https://github.com/user-attachments/assets/d7beb611-0550-4851-b900-1df2a65d8006)

**Bueiness Object **

![image](https://github.com/user-attachments/assets/559bbd0e-f085-4df4-85ce-3e055fa74afe)

These Three are the important nodes of Business object
1. Data Model - Where we build an composition tree with root , parent , child nodes
2. Behaviour - Includes CRUD operations , Actions , Functions Locks , Etag , Authorization , Feature Control , Draft
3. Runtime Implementation 
Ex : Interaction phase referes to user interaction screen (ex: selection screen )
   TX Buffer is kind of temporary memory to store the data (ex: internal tables , draft tables)
   Save Sequence is where we update the database table

**Types of Implementation in RAP**

![image](https://github.com/user-attachments/assets/15b1aaa7-f6a2-479c-980b-5b583d4bb5cc)



**BO Runtime Implementation types **
![image](https://github.com/user-attachments/assets/9d60968e-fcc6-496e-b8ca-5f8e29dbf27c)














