USE [ADODOTNET]
GO

CREATE TABLE [dbo].[Person](
	[user_id] [int] IDENTITY(300,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fullname] [varchar](30) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[joined] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


-------
CREATE TABLE [dbo].[Follower](
	[FR_ID] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[follower_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Follower]  WITH CHECK ADD  CONSTRAINT [FK_PersonFolloer1] FOREIGN KEY([follower_Id])
REFERENCES [dbo].[Person] ([user_id])
GO

ALTER TABLE [dbo].[Follower] CHECK CONSTRAINT [FK_PersonFolloer1]
GO

ALTER TABLE [dbo].[Follower]  WITH CHECK ADD  CONSTRAINT [FK_PersonFollower] FOREIGN KEY([user_id])
REFERENCES [dbo].[Person] ([user_id])
GO

ALTER TABLE [dbo].[Follower] CHECK CONSTRAINT [FK_PersonFollower]
GO


-------------

CREATE TABLE [dbo].[Following](
	[FG_ID] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[following_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FG_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Following]  WITH CHECK ADD  CONSTRAINT [FK_PersonFollowing] FOREIGN KEY([user_id])
REFERENCES [dbo].[Person] ([user_id])
GO

ALTER TABLE [dbo].[Following] CHECK CONSTRAINT [FK_PersonFollowing]
GO

ALTER TABLE [dbo].[Following]  WITH CHECK ADD  CONSTRAINT [FK_PersonFollowing1] FOREIGN KEY([following_Id])
REFERENCES [dbo].[Person] ([user_id])
GO

ALTER TABLE [dbo].[Following] CHECK CONSTRAINT [FK_PersonFollowing1]
GO



------------

CREATE TABLE [dbo].[Tweet](
	[tweet_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[message] [varchar](140) NULL,
	[created] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[tweet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Tweet]  WITH CHECK ADD  CONSTRAINT [FK_PersonTweet] FOREIGN KEY([user_id])
REFERENCES [dbo].[Person] ([user_id])
GO

ALTER TABLE [dbo].[Tweet] CHECK CONSTRAINT [FK_PersonTweet]
GO





