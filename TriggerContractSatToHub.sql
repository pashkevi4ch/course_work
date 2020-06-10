USE [course_work]
GO
/****** Object:  Trigger [dbo].[contract_sat_to_hub]    Script Date: 08.06.2020 16:51:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[contract_sat_to_hub]
ON [dbo].[sat_contracts]
Instead of INSERT
AS
INSERT INTO hub_contracts(id) 
SELECT id 
FROM INSERTED
INSERT INTO sat_contracts(id, date) select * from inserted