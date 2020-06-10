USE [course_work]
GO
/****** Object:  Trigger [dbo].[link_estate_contract_availability]    Script Date: 08.06.2020 16:52:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[link_estate_contract_availability]
ON [dbo].[link_estate_contract]
AFTER INSERT
AS
UPDATE sat_estate
SET availability = 0
WHERE id = (SELECT estate_id FROM inserted)
