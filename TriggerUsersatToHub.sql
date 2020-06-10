USE [course_work]
GO
/****** Object:  Trigger [dbo].[user_sat_to_hub]    Script Date: 08.06.2020 16:49:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[user_sat_to_hub]
ON [dbo].[sat_user]
INSTEAD OF INSERT
AS
INSERT INTO hub_user (id) 
SELECT id 
FROM INSERTED
INSERT INTO sat_user(id, username, password) 
SELECT id, username, password FROM INSERTED

