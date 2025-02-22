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
or SAP upgrade release will affect the custom code and cause trouble in Zreports or else due to custom code, upgrade will break.
so sap is suggesting to use standard API's which are upgrade safe and doesnt cause any trouble after upgrades and
we can also build our own custom API's to communicate with the database and perform CRUDQ operations .Ex; call BaPi's classes Etc..

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

   User will logion to broswer from our end and connect with S4 HANA cloud system which intend have HANA database all will be managed by SAP.
   Here SAP allows developer to build our own extensions which is called as Embedded steampunk and we can create side by side extensions 

   **RISE with SAP** means : As SAP moving a ahead we will be also taken foward 

**Note** S4 HANA cloud will be an SaaS Application


**CDS- Core Data & Services**

CDS is the new approach of building semantically rich data models.

CDS consists of
1. **DDL - Data Defintion Lnaguage** -design new models- new tables , structures , data elements etc,
2. **DQL - Data Query Language** -(CDS Views & Entities - new views to extract data (aggregate, join ,assosciate, load , calculate , formulas)
3. **DEL - Dta Expression Language** (Path Expression , Case Expression)
4. **DCL - Data Control Language** ( for restricting data & security )

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

We usually use JSON code to upload data to cloud database table
There is an HTTP Service provided by SAP : **ZABAP_FILE_UPLOADER** using its URL we can upload the json file directly 
through browser into our database table
only JSON files are allowed in Cloud system because SAP utility allows us to upload only JSON


Example database tables
```
@EndUserText.label : 'Business Partner Master table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table ztbc_bp_mstr {

  key client   : abap.clnt not null;
  key bp_id    : zlbc_id not null;
  key bp_role  : zlbc_bptyp not null;
  @EndUserText.label : 'Company Name'
  company_name : abap.sstring(256);
  @EndUserText.label : 'Street'
  street       : abap.string(256);
  @EndUserText.label : 'Country'
  country      : abap.string(256);
  region       : zlbc_region;
  @EndUserText.label : 'City'
  city         : abap.char(100);

}

@EndUserText.label : 'Database table for Product Master'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table ztbc_prd_mast {

  key client     : abap.clnt not null;
  key product_id : zlbc_id not null;
  name           : abap.string(256);
  category       : abap.char(40);
  @Semantics.amount.currencyCode : 'ztbc_prd_mast.currency'
  price          : abap.curr(10,2);
  currency       : abap.cuky;
  discount       : abap.int4;

}

@EndUserText.label : 'Sales order Header table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table ztbc_so_hdr {

  key client    : abap.clnt not null;
  key order_id  : zlbc_id not null;
  order_no      : int4;
  @AbapCatalog.foreignKey.screenCheck : true
  buyer         : zlbc_id not null
    with foreign key [0..*,1] ztbc_bp_mstr
      where bp_id = ztbc_so_hdr.buyer;
  @Semantics.amount.currencyCode : 'ztbc_so_hdr.currency_code'
  gross_amount  : abap.curr(10,2);
  currency_code : abap.cuky;
  include zsbc_admin_data;

}

@EndUserText.label : 'Sales order item table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table ztbc_so_item {

  key client    : abap.clnt not null;
  key item_id   : zlbc_id not null;
  order_id      : zlbc_id;
  @AbapCatalog.foreignKey.screenCheck : false
  product       : zlbc_id not null
    with foreign key [0..*,1] ztbc_prd_mast
      where product_id = ztbc_so_item.product;
  @Semantics.amount.currencyCode : 'ztbc_so_item.currency_code'
  gross_amount  : abap.curr(10,2);
  currency_code : abap.cuky;
  @Semantics.quantity.unitOfMeasure : 'ztbc_so_item.unit'
  qty           : abap.quan(5,2);
  unit          : abap.unit(3);
  include zsbc_admin_data;

}
@EndUserText.label : 'administration data'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
define structure zsbc_admin_data {

  create_by  : abap.char(16);
  create_on  : timestampl;
  changed_by : abap.char(16);
  changed_on : timestampl;

}
```






  



 





