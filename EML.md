**Content ID ( %CID )**

A single line item in RAP application is an instance.
while creating a data in our application primary key has not been created yet because we are still in interaction phase data has not yet been saved in DB commit had not happened in this scenario RAP Framewrok will auatomatically creates an ID which is called as Content ID in runtime which can be useful
but in Deletion and update already BO Instance ID will be generated so %Cid is not required here 
![image](https://github.com/user-attachments/assets/cc93faf9-d77c-4442-afcc-128625c65225)
the number in bracket (24) is an key
![image](https://github.com/user-attachments/assets/54523455-0f04-4374-b796-ee6fe91020fc)

Framework Keys

![image](https://github.com/user-attachments/assets/81077f36-1d89-413a-a0cb-85b6f270a5a4)

**EML**
![image](https://github.com/user-attachments/assets/e7805d3f-d838-4405-84ca-8a3d808d05c6)

**Basic EML Syntax**

![image](https://github.com/user-attachments/assets/1cda20f5-93b0-420a-b1e9-8ef144c84dcc)

IN read mode if we use addtional IN LOCAL MODE It will bypass the security checks assosciated to it

![image](https://github.com/user-attachments/assets/e18b081f-1c9b-4f24-a3e8-c8f3197dba2d)


Example report 

Usually we use MODIFY ENTITIES for CREATE UPDATE AND DELETE statement.

''    CASE lv_op.
      WHEN 'R'.
        READ ENTITIES OF zc_trav_proc
             ENTITY travel
             "ALL FIELDS WITH
             FIELDS ( TravelId AgencyId CustomerId criticality CreatedBy Description ) WITH
             VALUE #( ( TravelId = '12345678' )
                      ( TravelId = '00000067' )
                      ( TravelId = '99998768' ) )
             RESULT DATA(lt_result)
             FAILED DATA(lt_failed)
             REPORTED DATA(lt_reported).

        out->write( lt_result ).
        out->write( lt_failed ).
        out->write( lt_reported ).

      WHEN 'C'.
        DATA(lv_descp) = 'ARMAN LOVES RAP'.
        DATA(lv_agencyid) = '070017'.
        DATA(lv_custid)   = '1234'.

        MODIFY ENTITIES OF zc_trav_proc ENTITY travel
               CREATE FIELDS ( TravelId AgencyId CurrencyCode BeginDate EndDate Description OverallStatus )
               WITH VALUE #( ( %cid          = 'ARMANMOHAMMED' " Mandatory( Unique for every record)
                               TravelId      = '00000001'
                               Description   = lv_descp
                               AgencyId      = lv_agencyid
                               BeginDate     = cl_abap_context_info=>get_system_date( )
                               EndDate       = cl_abap_context_info=>get_system_date( ) + 30
                               OverallStatus = 'A' )
                             ( %cid          = 'ARMANMOHAMMED2'
                               TravelId      = '11112233'
                               AgencyId      = lv_agencyid
                               BeginDate     = cl_abap_context_info=>get_system_date( )
                               EndDate       = cl_abap_context_info=>get_system_date( ) + 30
                               OverallStatus = 'R' )
                             ( %cid          = 'ARMANMOHAMMED3'
                               TravelId      = '11112232'
                               AgencyId      = lv_agencyid
                               BeginDate     = cl_abap_context_info=>get_system_date( )
                               EndDate       = cl_abap_context_info=>get_system_date( ) + 30
                               OverallStatus = 'O' )
                             ( %cid          = 'ARMANMOHAMMED4'
                               TravelId      = '11112231'
                               AgencyId      = lv_agencyid
                               BeginDate     = cl_abap_context_info=>get_system_date( )
                               EndDate       = cl_abap_context_info=>get_system_date( ) + 30
                               OverallStatus = 'O' ) )
               MAPPED DATA(lt_mapped)
               FAILED lt_failed
               REPORTED lt_reported.
        out->write( lt_result ).
        out->write( lt_failed ).
        out->write( lt_reported ).
        COMMIT ENTITIES.
      WHEN 'U'.
        lv_descp = 'UPDATED Descr.'.
        lv_agencyid = '070017'.
        lv_custid   = '1234'.
        MODIFY ENTITIES OF zc_trav_proc ENTITY travel
               UPDATE FIELDS ( TravelId AgencyId CurrencyCode BeginDate EndDate Description OverallStatus )
               WITH VALUE #( ( TravelId      = '00000004'
                               AgencyId      = lv_agencyid
                               BeginDate     = cl_abap_context_info=>get_system_date( )
                               EndDate       = cl_abap_context_info=>get_system_date( ) + 30
                               OverallStatus = 'R' )
                             ( TravelId      = '00000005'
                               AgencyId      = lv_agencyid
                               BeginDate     = cl_abap_context_info=>get_system_date( )
                               EndDate       = cl_abap_context_info=>get_system_date( ) + 30
                               OverallStatus = 'R' )
                             ( TravelId      = '00000007'
                               AgencyId      = lv_agencyid
                               BeginDate     = cl_abap_context_info=>get_system_date( )
                               EndDate       = cl_abap_context_info=>get_system_date( ) + 30
                               OverallStatus = 'R' )
                             ( TravelId      = '000000048'
                               AgencyId      = lv_agencyid
                               BeginDate     = cl_abap_context_info=>get_system_date( )
                               EndDate       = cl_abap_context_info=>get_system_date( ) + 30
                               OverallStatus = 'R' ) )
               MAPPED lt_mapped
               FAILED lt_failed
               REPORTED lt_reported.
        out->write( lt_result ).
        out->write( lt_failed ).
        out->write( lt_reported ).
        COMMIT ENTITIES.
      WHEN 'D'.

        MODIFY ENTITIES OF zc_trav_proc ENTITY travel
               DELETE FROM VALUE #( ( TravelId      = '00000001' ) )
               MAPPED lt_mapped
               FAILED lt_failed
               REPORTED lt_reported.

        COMMIT ENTITIES.
    ENDCASE.
 ''






