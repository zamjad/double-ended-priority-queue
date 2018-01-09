USE [DEPQ]
GO

/****** Object:  StoredProcedure [dbo].[spGetMin]    Script Date: 1/9/2018 12:29:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spGetMin]
as
  with cte as (
    select top(1) id, priorityLevel, content
      from Dequeue with (rowlock, readpast)
	  where priorityLevel = (select min(priorityLevel) from Dequeue)	  
    order by id)

  insert into History (id, priorityLevel, content, operation) 
  select id, priorityLevel, content, 'Peek' from cte;

  with cte as (
    select top(1) id, priorityLevel, content
      from Dequeue with (rowlock, readpast)
	  where priorityLevel = (select min(priorityLevel) from Dequeue)	  
    order by id)

    select priorityLevel, content
      from cte

GO

