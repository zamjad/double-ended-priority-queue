USE [DEPQ]
GO

/****** Object:  Table [dbo].[Dequeue]    Script Date: 1/9/2018 12:23:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dequeue](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[priorityLevel] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[enqueueDate] [datetime] NOT NULL,
 CONSTRAINT [Queue__PriorityLevel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Dequeue] ADD  DEFAULT (getdate()) FOR [enqueueDate]
GO

ALTER TABLE [dbo].[Dequeue]  WITH CHECK ADD FOREIGN KEY([priorityLevel])
REFERENCES [dbo].[Priority] ([priorityLevel])
GO

