**Metadata Overview**

UI Header Info will provice all headerr related details

"First Screen
UI Selection Field annotation refers selection fields in report
UI LineItem annotation refers fields which should be displayed in report when we click go

"OverView Screen
UI Facet is used to design the second or overview screen
example 
`[{
              purpose: #HEADER,
              type : #DATAPOINT_REFERENCE,
              label : 'Flight Ticket Price',
              position: 10,
              targetQualifier: 'price_data'
              }]`

Type will indetifies what type of reference DATAPoint is used to identify as an header details
target qualifier acts as an key where it will search below fields if any field has given qualifier to display

Once thea Header in over view screen is designed we try to design item level display for that we use a concept called collection facet

**Collection Facet**
It is used to design a container in item level in overview screen,
It consists of Identification Refrence and Field Groups
In a container we can have only one identification reference and multiple field groups 

              
