USE [course_work]
GO
/****** Object:  Trigger [dbo].[country_sat_to_hub]    Script Date: 08.06.2020 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[country_sat_to_hub]
ON [dbo].[sat_country]
INSTEAD OF INSERT
AS
INSERT INTO hub_country (country_code) 
SELECT country_code 
FROM INSERTED
INSERT INTO sat_country(country_code, name, population) select * from inserted