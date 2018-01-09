USE [DEPQ]
GO

/****** Object:  StoredProcedure [dbo].[spClear]    Script Date: 1/9/2018 12:28:20 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[spClear]
as
	delete from Dequeue

	DBCC CHECKIDENT('Dequeue', RESEED, 0)

	insert into History (operation) values ('Clear');

GO

