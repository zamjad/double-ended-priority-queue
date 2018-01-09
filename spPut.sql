USE [DEPQ]
GO

/****** Object:  StoredProcedure [dbo].[spPut]    Script Date: 1/9/2018 12:30:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spPut]
	@content nvarchar(max),
	@priorityLevel int
as
  set nocount on;
  insert into Dequeue (content, priorityLevel) 
  values (@content, @priorityLevel) ;

  insert into History (id, content,  priorityLevel, operation) 
  values (@@IDENTITY, @content, @priorityLevel, 'Put') ;

GO

