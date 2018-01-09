USE [DEPQ]
GO

/****** Object:  StoredProcedure [dbo].[spRemoveMin]    Script Date: 1/9/2018 12:31:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spRemoveMin]
as
  set nocount on;
  ;with cte as (
    select top(1) id, priorityLevel, content
      from Dequeue with (rowlock, readpast)
	  where priorityLevel = (select min(priorityLevel) from Dequeue)	  
    order by id)

  insert into History (id, priorityLevel, content, operation) 
  select id, priorityLevel, content, 'RemoveMin' from cte;

  ;with cte as (
    select top(1) id, priorityLevel, content
      from Dequeue with (rowlock, readpast)
	  where priorityLevel = (select min(priorityLevel) from Dequeue)	  
    order by id)
  
  delete from cte
    output deleted.priorityLevel, deleted.content;


GO

