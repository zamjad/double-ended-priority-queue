USE [DEPQ]
GO

/****** Object:  Table [dbo].[Priority]    Script Date: 1/9/2018 12:22:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Priority](
	[priorityLevel] [int] NOT NULL,
	[description] [varchar](32) NOT NULL,
	[updatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Priority__PriorityLevel] PRIMARY KEY CLUSTERED 
(
	[priorityLevel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Priority] ADD  DEFAULT (getdate()) FOR [updatedTime]
GO

