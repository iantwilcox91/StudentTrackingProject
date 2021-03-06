USE [epicodus]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 10/4/2016 2:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[sdate] [date] NOT NULL,
	[active] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[projects]    Script Date: 10/4/2016 2:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[projects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[scg]    Script Date: 10/4/2016 2:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[scg](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[students_courses_id] [int] NULL,
	[projects_id] [int] NULL,
	[grade] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[students]    Script Date: 10/4/2016 2:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](255) NULL,
	[lname] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[picture] [varchar](255) NULL,
	[sdate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[students_courses]    Script Date: 10/4/2016 2:02:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students_courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NULL,
	[class_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[courses] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[courses] ADD  DEFAULT (NULL) FOR [active]
GO
ALTER TABLE [dbo].[projects] ADD  DEFAULT (NULL) FOR [name]
GO
ALTER TABLE [dbo].[scg] ADD  DEFAULT (NULL) FOR [students_courses_id]
GO
ALTER TABLE [dbo].[scg] ADD  DEFAULT (NULL) FOR [projects_id]
GO
ALTER TABLE [dbo].[scg] ADD  DEFAULT (NULL) FOR [grade]
GO
ALTER TABLE [dbo].[students] ADD  DEFAULT (NULL) FOR [fname]
GO
ALTER TABLE [dbo].[students] ADD  DEFAULT (NULL) FOR [lname]
GO
ALTER TABLE [dbo].[students] ADD  DEFAULT (NULL) FOR [email]
GO
ALTER TABLE [dbo].[students] ADD  DEFAULT (NULL) FOR [picture]
GO
ALTER TABLE [dbo].[students_courses] ADD  DEFAULT (NULL) FOR [student_id]
GO
ALTER TABLE [dbo].[students_courses] ADD  DEFAULT (NULL) FOR [class_id]
GO
ALTER TABLE [dbo].[scg]  WITH CHECK ADD FOREIGN KEY([projects_id])
REFERENCES [dbo].[projects] ([id])
GO
ALTER TABLE [dbo].[scg]  WITH CHECK ADD FOREIGN KEY([projects_id])
REFERENCES [dbo].[projects] ([id])
GO
ALTER TABLE [dbo].[scg]  WITH CHECK ADD FOREIGN KEY([projects_id])
REFERENCES [dbo].[projects] ([id])
GO
ALTER TABLE [dbo].[scg]  WITH CHECK ADD FOREIGN KEY([students_courses_id])
REFERENCES [dbo].[students_courses] ([id])
GO
ALTER TABLE [dbo].[scg]  WITH CHECK ADD FOREIGN KEY([students_courses_id])
REFERENCES [dbo].[students_courses] ([id])
GO
ALTER TABLE [dbo].[scg]  WITH CHECK ADD FOREIGN KEY([students_courses_id])
REFERENCES [dbo].[students_courses] ([id])
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([id])
GO
ALTER TABLE [dbo].[students_courses]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[students] ([id])
GO
