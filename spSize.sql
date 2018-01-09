USE [DEPQ]
GO

/****** Object:  StoredProcedure [dbo].[spSize]    Script Date: 1/9/2018 12:31:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[spSize]
	@count int OUTPUT
as
	SET @count = (select count(*) as size from Dequeue)

	insert into History (operation) values ('Size');
GO

