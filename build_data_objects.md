Use cases 

**use case 1 :**
**Buidling Full stack application**
![image](https://github.com/user-attachments/assets/aec5cac4-41de-41e3-918a-88ea147a3ab8)

create our own databases and create CDS entities over them and create a business logic using RAP Model(Classes)
and create a service layer and expose it to UI for End user access in browser

**Use case 2:**
**side by side extensions**
![image](https://github.com/user-attachments/assets/fe7e038e-2f86-40ea-a87a-c382516ac41e)

Here side by side without affecting the existing architecture we create something called as API's
we should keep our core stable , because sometimes our custom changes in standard reports will affect the standard reports(BADI , user exits)
or SAP upgrade release will affect the custom code and cause trouble in Zreports or else due to custom code upgrade will break
so sap is suggesting to use standard API's which are upgrade safe and doesnt cause any trouble after upgrades and
we can also build our own custom API's to communicate with the database and perform CRUDQ operations call BaPi's classes Etc..

**Cloud connector** : it is an agent to connect API with cloud securely

We can consume this API of ERP data using Cloud thing called as RAP Extensibility

we have database and we can create logics using classes and create service over it and expose it to UI apps in browser
Usually in ABAP upgrades will be regular basis not unlike abap it will have couple of upgrades in a year

By this way we can keep our core clean and build side by side extensions , so that we will have faster innovation cycle 

**Use case 3:**
**S/4 HANA Cloud Extension**
![image](https://github.com/user-attachments/assets/98e91831-ae10-4939-ad70-a481ba94ced9)

in S4 HANA  they provide two types 
1. on premise : very similar to existing approach what we use with SAP GUi access and build our code using ABAP
2. Cloud : There will be no SAP GUI Access only we can access using browser

   User will logion to broswer from our end and connect with S4 HANA cloud system which intend have HANA database all will be managed by SAP
   Here SAP allows developer to build our own extensions which is called as Embedded steampunk and we can create side by side extensions 

   RISE with SAP means : As SAP moving a ahead we will be also taken foward 

S4 HANA cloud will be an SaaS Application


**CDS- Core Data & Services**

CDS is the new approach of building semantically rich data models.
CDS consists of
DDL - Data Defintion Lnaguage -design new models- new tables , structures , data elements etc,
DQL - Data Query Language -(CDS Views & Entities - new views to extract data (aggregate, join ,assosciate, load , calculate , formulas)
DEL - Dta Expression Language (Path Expression , Case Expression)
DCL - Data Control Language ( for restricting data & security )

**JSON**
JSON is a ligh weight data format to transmit data from one sytem to another system(peer)

Syntax :
 {
"empid":1001,
"empname":"Madhuchandan",
"salary": 50000
}

Nested structure :
```
{
"empstr": {
            "empid":1001,
            "empname":"Madhuchandan",
            "salary": 50000
            },
"emptab": [ // its an array
            {
            "empid":1001,
            "empname":"Madhuchandan",
            "salary": 50000
            }
            {
            "empid":1002,
            "empname":"Charan",
            "salary": 60000
            }
            ]
}
```






  



 





