USE [course_work]
GO
/****** Object:  Trigger [dbo].[city_sat_to_hub]    Script Date: 08.06.2020 16:51:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[city_sat_to_hub]
ON [dbo].[sat_city]
iNstead of INSERT
AS
INSERT INTO hub_city (id) 
SELECT id 
FROM INSERTED
INSERT INTO sat_city(id, time_zone, name) select * from inserted