USE [course_work]
GO
/****** Object:  Trigger [dbo].[view_history_date]    Script Date: 08.06.2020 16:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[view_history_date]
ON [dbo].[sat_view_history]
AFTER INSERT
AS
UPDATE sat_view_history
SET date = CONVERT(date, GETDATE())
WHERE id = (SELECT id FROM inserted)