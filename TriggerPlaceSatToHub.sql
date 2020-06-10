USE [course_work]
GO
/****** Object:  Trigger [dbo].[place_sat_to_hub]    Script Date: 08.06.2020 16:49:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[place_sat_to_hub]
ON [dbo].[sat_place]
INSTEAD OF INSERT
AS
INSERT INTO hub_place (id) 
SELECT id 
FROM INSERTED
INSERT INTO sat_place(id, street, house, appartment) select id, street, house, appartment from inserted