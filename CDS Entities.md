CDS Views are obsolete now , so it was replaced by CDS Entities

Its Just an Extension of CDS Views
There is no much difference in CDS View entitiy compared to CDS Views , Below mentioned are the only difference
1. No SQL View will be generated
  *if it generates one HANA View(CDS) & one DDIC View Activation Time was more
  *in earlier cds views a view have 3 names -- file name , cds name , ddic name , CDS entity has simplified and have only one name
2. Automatic Client Handling (Earlier Annotations was used)
3.Strict Syntax & Annotation Check
4.SAP Improved runtime engine for entities to make run faster
5. New Functionalities Introduced ( Regex, Replace, New, Except, Intersect )
6. Client field is not allowed (As automatic client handling introduced)

#ABAP on Cloud System

SAP does not allow direct acces to some of standard database tables in ABAP on Cloud Environment.these Objects are called ureleased objects.
SAP have built CDS Entities on top of these objects, these entities are marked as Released.

#Alias Name Importance 

Assume we have a field in Database table called unit , and same will be used in Cds entity and those will be consumed by many other reports
Suppose if some one changes the field in DB Table it will affect all tha report and we need to replace all of them

Suppose if we create an alias name in CDS Entity and instead of field name alias name would have been used in reports or class etc
we just need to replace a field name in CDS Entity and rest will work fine
![image](https://github.com/user-attachments/assets/51529c7b-3c32-4271-b25e-4cf23833fd9e)











