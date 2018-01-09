USE [DEPQ]
GO

/****** Object:  StoredProcedure [dbo].[spGetMax]    Script Date: 1/9/2018 12:28:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spGetMax]
as
  with cte as (
    select top(1) id, priorityLevel, content
      from Dequeue with (rowlock, readpast)
	  where priorityLevel = (select max(priorityLevel) from Dequeue)	  
    order by id)

  insert into History (id, priorityLevel, content, operation) 
  select id, priorityLevel, content, 'GetMax' from cte;

  with cte as (
    select top(1) id, priorityLevel, content
      from Dequeue with (rowlock, readpast)
	  where priorityLevel = (select max(priorityLevel) from Dequeue)	  
    order by id)

    select priorityLevel, content
      from cte

GO

