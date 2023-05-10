use [Travel DB]
GO

CREATE XML SCHEMA COLLECTION activities
AS
'<?xml version="1.0"?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
<xsd:element name="activities">
<xsd:complexType>
<xsd:sequence>
<xsd:element ref="activity"/>
</xsd:sequence>
</xsd:complexType>
</xsd:element>
<xsd:element name="activity">
<xsd:complexType>
<xsd:sequence>
<xsd:element name="activityId" type="xsd:int" />
<xsd:element name="activityName" type="xsd:string" />
<xsd:element name="activityTarrif" type="xsd:string" />
</xsd:sequence>
</xsd:complexType>
</xsd:element>
</xsd:schema>'

CREATE XML SCHEMA COLLECTION accomodations
AS
'<?xml version="1.0"?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
<xsd:element name="accomodations">
<xsd:complexType>
<xsd:sequence>
<xsd:element ref="accomodation"/>
</xsd:sequence>
</xsd:complexType>
</xsd:element>
<xsd:element name="accomodation">
<xsd:complexType>
<xsd:sequence>
<xsd:element name="accomodationName" type="xsd:string" />
<xsd:element name="accomodationAddress" type="xsd:string" />
<xsd:element name="accomodationType" type="xsd:string" />
<xsd:element name="phoneNumber" type="xsd:string" />
</xsd:sequence>
</xsd:complexType>
</xsd:element>
</xsd:schema>'

CREATE XML SCHEMA COLLECTION internalTransits
AS
'<?xml version="1.0"?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
<xsd:element name="internalTransits">
<xsd:complexType>
<xsd:sequence>
<xsd:element ref="internalTransit"/>
</xsd:sequence>
</xsd:complexType>
</xsd:element>
<xsd:element name="internalTransit">
<xsd:complexType>
<xsd:sequence>
<xsd:element name="internalTransitservice" type="xsd:string" />
<xsd:element name="internalTransitType" type="xsd:string" />
<xsd:element name="internalTransitDriversPlate" type="xsd:string" />
<xsd:element name="contactNumber" type="xsd:string" />
</xsd:sequence>
</xsd:complexType>
</xsd:element>
</xsd:schema>'

CREATE XML SCHEMA COLLECTION transits
AS
'<?xml version="1.0"?>
<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema">
<xsd:element name="transits">
<xsd:complexType>
<xsd:sequence>
<xsd:element ref="transit"/>
</xsd:sequence>
</xsd:complexType>
</xsd:element>
<xsd:element name="transit">
<xsd:complexType>
<xsd:sequence>
<xsd:element name="transitType" type="xsd:string" />
<xsd:element name="transitMode" type="xsd:string" />
<xsd:element name="transitSource" type="xsd:string" />
<xsd:element name="transitDestination" type="xsd:string" />
</xsd:sequence>
</xsd:complexType>
</xsd:element>
</xsd:schema>'