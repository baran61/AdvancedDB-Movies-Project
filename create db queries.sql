
CREATE TABLE [Service Provider] (
  [providerId] char(5),
  [providerName] varchar(50),
  [providerPhone] varchar(25),
  [providerEmail] varchar(50),
  [providerAddress] varchar(50),
  [providerIdentityProof] varchar(50),
  [providerMembershipStatus] varchar(25),
  [providerMembershipValidUntil] date,
  PRIMARY KEY ([providerId])
);

CREATE TABLE [Customer] (
  [customerId] char(4),
  [customerName] varchar(50),
  [customerAge] int,
  [customerPhone] varchar(25),
  [customerEmail] varchar(50),
  [customerMembershipStatus] varchar(25),
  [customerMembershipValidUntil] date,
  PRIMARY KEY ([customerId])
);

ALTER TABLE [dbo].[Customer]
ADD CHECK ([customerAge]>=18);



CREATE TABLE [Service] (
  [serviceId] char(4),
  [serviceName] varchar(50),
  [providerId] char(5),
  [serviceCategory] varchar(25),
  [serviceStatus] varchar(25),
  [serviceCost] int,
  [serviceRating] int,
  [serviceStartDate] date,
  PRIMARY KEY ([serviceId]),
  CONSTRAINT [FK_Service.providerId]
    FOREIGN KEY ([providerId])
      REFERENCES [Service Provider]([providerId])
);

CREATE TABLE [Admin] (
  [adminId] char(4),
  [adminName] varchar(50),
  PRIMARY KEY ([adminId])
);

CREATE TABLE [Service Review Log] (
  [reviewId] char(4),
  [serviceId] char(4),
  [adminId] char(4),
  [timestamp] datetime,
  PRIMARY KEY ([reviewId]),
  CONSTRAINT [FK_Service Review Log.adminId]
    FOREIGN KEY ([adminId])
      REFERENCES [Admin]([adminId])
);

CREATE TABLE [Package] (
  [packageId] char(4),
  [packageName] varchar(50),
  [Destination] varchar(50),
  [accomodation] xml,
  [transit] xml,
  [internaltransit] xml,
  [activity] xml,
  [packageCost] int,
  [builtBy] varchar(10),
  [packageRating] int,
  PRIMARY KEY ([packageId])
);


CREATE TABLE [Booking] (
  [bookingId] char(4),
  [bookingStartDate] date,
  [bookingEndDate] date,
  [customerId] char(4),
  [packageId] char(4),
  [bookingStatus] varchar(25),
  [paymentStatus] varchar(25),
  PRIMARY KEY ([bookingId]),
  CONSTRAINT [FK_Booking.packageId]
    FOREIGN KEY ([packageId])
      REFERENCES [Package]([packageId]),
  CONSTRAINT [FK_Booking.customerId]
    FOREIGN KEY ([customerId])
      REFERENCES [Customer]([customerId])
);


