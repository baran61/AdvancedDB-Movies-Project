
------------ Bookings of Customer can view -------------------------------------------
CREATE VIEW BOOKING_VIEW_FOR_CUSTOMER AS 
SELECT b.bookingID, b.bookingStartDate, c.customerName, c.customerMembershipStatus, b.packageID
FROM Booking b
JOIN Customer c ON b.customerId = c.customerId WHERE customerMembershipStatus = 'confirmed';

------------------Select from view ----------------------------------------------
SELECT * FROM BOOKING_VIEW_FOR_CUSTOMER;

------------ Customer can view on those service that are approved -------------------------------------------
CREATE VIEW CUSTOMER_SERVICE_VIEW AS 
SELECT s.serviceName, s.serviceCategory, s.serviceCost, s.serviceRating, s.serviceStartDate, sp.providerName
FROM  [dbo].[Service] s JOIN [dbo].[Service Provider] sp ON s.providerId = sp.providerId  
where s.serviceStatus = 'approved' and sp.providerMembershipStatus = 'confirmed'


------------------Select from view ----------------------------------------------
SELECT * FROM CUSTOMER_SERVICE_VIEW;


  