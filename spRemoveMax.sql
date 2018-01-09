USE [DEPQ]
GO

/****** Object:  StoredProcedure [dbo].[spRemoveMax]    Script Date: 1/9/2018 12:30:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spRemoveMax]
as
  set nocount on;
  ;with cte as (
    select top(1) id, priorityLevel, content
      from Dequeue with (rowlock, readpast)
	  where priorityLevel = (select max(priorityLevel) from Dequeue)	  
    order by id)

  insert into History (id, priorityLevel, content, operation) 
  select id, priorityLevel, content, 'RemoveMax' from cte;

  ;with cte as (
    select top(1) id, priorityLevel, content
      from Dequeue with (rowlock, readpast)
	  where priorityLevel = (select max(priorityLevel) from Dequeue)	  
    order by id)
  
  delete from cte
    output deleted.priorityLevel, deleted.content;


GO

