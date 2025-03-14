![image](https://github.com/user-attachments/assets/d72edd03-897a-4bd0-8e85-75485f8b4bc5)**RAP Introduction**

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











