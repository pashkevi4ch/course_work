USE [course_work]
GO
/****** Object:  Trigger [dbo].[user_dor]    Script Date: 08.06.2020 16:48:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[user_dor]
ON [dbo].[sat_user]
AFTER INSERT
AS
UPDATE sat_user
SET DOR = CONVERT(date, GETDATE())
WHERE id = (SELECT id FROM inserted)
