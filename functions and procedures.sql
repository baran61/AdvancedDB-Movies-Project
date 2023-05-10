CREATE FUNCTION GETCUSTOMERNOTIFICATIONMSG (@customerMembershipStatus AS VARCHAR(50))
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @NOTIFICATIONMSG AS VARCHAR(100)
	IF(@customerMembershipStatus = 'REGISTERED')
		SET @NOTIFICATIONMSG = 'Please make to payment to confirm your membership'
	ELSE IF(@customerMembershipStatus = 'PAYMENT FAILED')
		SET @NOTIFICATIONMSG = 'Please retry payement, your payment failed'
	ELSE IF(@customerMembershipStatus = 'RENEW MEMBERSHIP')
		SET @NOTIFICATIONMSG = 'Please make payement to renew your menbership'
	ELSE IF(@customerMembershipStatus = 'MEMBERSHIP CONFIRMED')
		SET @NOTIFICATIONMSG = 'Welcome!'
	ELSE
		SET  @NOTIFICATIONMSG = 'Not A Member'
	RETURN @NOTIFICATIONMSG
END
GO


CREATE FUNCTION customerRenewalAlert(@customerMembershipValidUntil AS date)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @renewalNotification AS VARCHAR(100)
	IF(DATEDIFF(day, GETDATE(), @customerMembershipValidUntil) < 30)
		SET @renewalNotification = 'Your membership will expire in less than 30 days'
	RETURN @renewalNotification
END
GO


CREATE PROC USP_GETCUSTOMERNOTIFICATIONMSG
AS

SELECT [customerId],[customerName] ,[customerPhone],[customerEmail] ,
[customerMembershipStatus],[customerMembershipValidUntil]
,dbo.GETCUSTOMERNOTIFICATIONMSG([customerMembershipStatus]) as notification
  FROM [dbo].[Customer]
go

CREATE PROC USP_customerRenewalAlert
AS
SELECT [customerId],[customerName] ,[customerPhone],[customerEmail] ,
[customerMembershipStatus],[customerMembershipValidUntil]
,dbo.customerRenewalAlert([customerMembershipValidUntil]) as renewalNotification
  FROM [dbo].[Customer]
go

CREATE PROC USP_GET_PACKAGE_DETAILS
@CustomerId CHAR(4),
@BookingId CHAR(4)
AS
SELECT b.bookingId, b.bookingStartDate, b.bookingEndDate, b.bookingStatus, b.paymentStatus, p.packageName,
p.activity, p.accomodation, p.internaltransit, p.transit, p.packageCost
From dbo.Booking b INNER JOIN dbo.Package p ON b.packageId = p.packageId 
WHERE b.customerId = @CustomerId AND b.bookingId = @BookingId  
go


CREATE PROC USP_GET_SERVICE_PROVIDER_SERVICES
@ServiceProviderId CHAR(4),
@ServiceStatus CHAR(4)
AS
SELECT s.serviceName, s.serviceCategory,  s.serviceStatus
From dbo.[Service Provider] sp INNER JOIN dbo.Service s ON sp.providerId = s.providerId 
WHERE sp.providerId = @ServiceProviderId
go


CREATE PROC USP_GET_NEW_SERVICE_PROVIDER_DETAILS
@ServiceStatus VARCHAR(50)
AS
SELECT SP.providerName, SP.providerEmail, sp.providerAddress, sp.providerMembershipStatus, sp.providerPhone, sp.providerMembershipValidUntil, s.serviceName, s.serviceCategory, s.serviceRating, s.serviceStartDate, s.serviceCost
From dbo.[Service Provider] sp INNER JOIN dbo.Service s ON sp.providerId = s.providerId 
WHERE s.serviceStatus = @ServiceStatus
go



CREATE PROC USP_GET_CUSTOMER_MEMBERSHIP_RENEWAL_CRITERIA
@costLimit VARCHAR(50)
AS
SELECT b.customerId, c.customerName ,sum(p.packageCost)  as totalBookingAMount
From dbo.Booking b INNER JOIN dbo.Package p ON b.packageId = p.packageId 
INNER JOIN dbo.Customer c ON c.customerId = b.customerId  
GROUP BY b.customerId, c.customerName
HAVING sum(p.packageCost) > @costLimit
go



CREATE PROC USP_GET_SERVICES_THAT_NEEDS_REVIEW
@ReviewLimit int
AS
select srl.reviewId, srl.serviceId, srl.adminId, srl.timestamp,
s.serviceName, s.serviceStartDate, s.serviceStatus, s.serviceCategory, s.serviceRating, sp.providerName,
sp.providerMembershipStatus, sp.providerEmail, sp.providerPhone, sp.providerMembershipValidUntil FROM [dbo].[Service Review Log] srl INNER JOIN dbo.Service s ON srl.serviceId = s.serviceId 
INNER JOIN dbo.[Service Provider] sp ON sp.providerId = s.providerId
where abs(DATEDIFF(YEAR, GETDATE(), srl.timestamp)) >= @ReviewLimit
go


CREATE PROC USP_getXMLDataFOrActivity
@packageId int
AS
SELECT p.packageName, p.activity.value('(/activities/activity/activityName)[1]', 'varchar(50)')
FROM dbo.Package p
WHERE p.packageId = @packageId

SELECT p.packageName, p.activity.query('/activities/activity/activityName')
FROM dbo.Package p
WHERE p.packageId = @packageId
go


--delete Activity
CREATE PROC USP_ModifyXMLDataFOrTransit
@packageId int
AS
UPDATE Package 
SET [transit].modify(' delete /transits[1]')
WHERE packageId = @packageId
go