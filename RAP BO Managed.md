
**Managed RAP Implementaion**

![image](https://github.com/user-attachments/assets/7f58d6cf-8abf-426e-8e4b-460d6c6237cb)

**Business Use case**

![image](https://github.com/user-attachments/assets/e882762d-f02f-45d9-90fe-63e1872f99bf)

**Business Object**

![image](https://github.com/user-attachments/assets/b7862e6c-2d43-42c1-ab03-7f6fc061e353)

**Association VS Composition**

![image](https://github.com/user-attachments/assets/9289d720-fac0-41ab-b7f5-7c99cae98fda)

**ETag**

Example

Traim ticket booking 

assume a train has 1 seat left
2 users are trying to book the ticket at a time but only one seat is available
the person who makes payment first the seat will be booked 

TO Manage concurrency we have ETag ( its a timestamp )

If user 1 and user 2 has opened sales order both are editing
system allows them because of optimistic lock it allows to edit in their own session for all users
user 2 changed the data at 10:20 and try to save 
user 1 has changed the data at 10:10 and saved the data
when user2 try to save data it checks if time1 < Time 2 show error message else allow to save 
This will be managed by RAP Framework by using ETag

![image](https://github.com/user-attachments/assets/e94a811c-5f0d-4a4b-bd4d-ae98ac420205)


![image](https://github.com/user-attachments/assets/a84dcc01-c5a4-4e63-93dc-d5eec20e6543)

**Layers in Metadata**

#CORE --> Which can be used by SAP to build standard fiori application

#PARTNER --> partner company will create a MDE over standard CDS view and this will be used when customer executes the UI application overriding CORE

#CUSTOMER --> Customer himself have developer(Product based company) their developer will create MDE so when executing UI it will prefer Customer overriding all 

When customer is executing UI it will give preference to CUSTOMER if available and if not then PARTNER and if not then CORE

#CUSTOMER--->#PARTNER--->#CORE
![image](https://github.com/user-attachments/assets/6cf42694-c785-402c-b518-d337bcc58b65)


 


























