USE [course_work]
GO
/****** Object:  Trigger [dbo].[estate_sat_to_hub]    Script Date: 08.06.2020 16:50:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[estate_sat_to_hub]
ON [dbo].[sat_estate]
INSTEAD OF INSERT
AS
INSERT INTO hub_estate (id) 
SELECT id 
FROM INSERTED
INSERT INTO sat_estate(id, availability, price, parking_capacity, type, pets_allowed, floor_space, number_of_bedrooms, number_of_bathrooms) 
select * from inserted