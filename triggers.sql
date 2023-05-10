
--- when the status of service provider is expired all the services related to the servie provider status has to be set to renewal required

CREATE TRIGGER UPDATE_SERVICE_STATUS  
ON [SERVICE PROVIDER] 
AFTER UPDATE 
AS
BEGIN
    -- Update the booking status in the Booking table for customers whose membership status has changed
    UPDATE [Service] 
    SET  [serviceStatus] = 'renew required' -- Set the booking status to 'Upgraded' for customers whose membership status has changed
    FROM [Service] s
    JOIN  [SERVICE PROVIDER] sp ON  s.providerId = sp.providerId
    WHERE sp.providerMembershipStatus = 'expired' -- Update booking status only for expired membership members
END;



-------
UPDATE [dbo].[Service Provider] 
   SET providerMembershipStatus = 'expired'
 WHERE providerId = 'SP101'
GO

--- when the status of customer is expired all the bookings relatedted to the customer whose status is not confirmed is set to renewal required


CREATE TRIGGER UPDATE_CUSTOMER_BOOKING_STATUS  
ON [CUSTOMER] 
AFTER UPDATE 
AS
BEGIN
    -- Update the booking status in the Booking table for customers whose membership status has changed
    UPDATE [Booking] 
    SET  bookingStatus = 'renew required' -- Set the booking status to 'Upgraded' for customers whose membership status has changed
    FROM [Customer] c
    JOIN  [Booking] b ON  b.customerId = c.customerId
    WHERE NOT b.bookingStatus = 'Confirmed' AND c.customerMembershipStatus = 'expired'  -- Update booking status only for expired membership members
END;



UPDATE [dbo].[Customer] 
   SET customerMembershipStatus = 'expired'
 WHERE customerId = 'C105'