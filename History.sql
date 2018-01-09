USE [DEPQ]
GO

/****** Object:  Table [dbo].[History]    Script Date: 1/9/2018 12:27:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[History](
	[id] [bigint] NULL,
	[priorityLevel] [int] NULL,
	[content] [nvarchar](max) NULL,
	[enqueueDate] [datetime] NOT NULL,
	[operation] [varchar](8) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[History] ADD  DEFAULT (getdate()) FOR [enqueueDate]
GO

