USE [course_work]
GO
/****** Object:  Trigger [dbo].[view_history_sat_to_hub]    Script Date: 08.06.2020 16:48:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[view_history_sat_to_hub]
ON [dbo].[sat_view_history]
INSTEAD OF INSERT
AS
INSERT INTO hub_view_history (id) 
SELECT id 
FROM INSERTED
INSERT INTO sat_view_history(id) SELECT id FROM inserted