USE [master]
GO
/****** Object:  Database [UniversityCourseManagement]    Script Date: 25-11-16 23.25.29 ******/
CREATE DATABASE [UniversityCourseManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityCourseManagement', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\UniversityCourseManagement.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityCourseManagement_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\UniversityCourseManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityCourseManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityCourseManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityCourseManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityCourseManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityCourseManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityCourseManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityCourseManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityCourseManagement] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityCourseManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityCourseManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityCourseManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityCourseManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityCourseManagement]
GO
/****** Object:  Table [dbo].[AllocateRoom]    Script Date: 25-11-16 23.25.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllocateRoom](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [int] NULL,
	[Department] [int] NULL,
	[Course] [int] NULL,
	[Day] [int] NULL,
	[FromTime] [float] NULL,
	[ToTime] [float] NULL,
	[TimeForView] [nvarchar](100) NULL,
	[Visible] [int] NULL,
 CONSTRAINT [PK_AllocateRoom] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Course]    Script Date: 25-11-16 23.25.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Credit] [float] NULL,
	[Description] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[Semester] [nvarchar](50) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseAssaign]    Script Date: 25-11-16 23.25.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssaign](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Department] [nvarchar](50) NULL,
	[Teacher] [nvarchar](50) NULL,
	[CourseID] [nvarchar](50) NULL,
	[CourseName] [nvarchar](50) NULL,
	[Credit] [float] NULL,
	[CreditToBeTaken] [float] NULL,
	[RemainingCredit] [float] NULL,
	[Visible] [int] NULL,
 CONSTRAINT [PK_CourseAssaign] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Day]    Script Date: 25-11-16 23.25.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Day](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DAY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 25-11-16 23.25.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DEPARTMENT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Designation]    Script Date: 25-11-16 23.25.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DESIGNITION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EnrollInACourse]    Script Date: 25-11-16 23.25.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollInACourse](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[CourseID] [int] NULL,
	[Date] [nvarchar](50) NULL,
 CONSTRAINT [PK_EnrollInACourse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grade]    Script Date: 25-11-16 23.25.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Result]    Script Date: 25-11-16 23.25.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[CourseID] [int] NULL,
	[GradeID] [int] NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 25-11-16 23.25.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Room_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Semester]    Script Date: 25-11-16 23.25.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 25-11-16 23.25.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[ContactNumber] [nvarchar](50) NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[RegistrationNo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 25-11-16 23.25.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[ContactNumber] [nvarchar](50) NULL,
	[Designation] [int] NULL,
	[Department] [nvarchar](50) NULL,
	[CreditToBeTaken] [float] NULL,
 CONSTRAINT [PK_TEACHER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[CourseStatics]    Script Date: 25-11-16 23.25.29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CourseStatics] AS (

  SELECT c.Code as Code,c.Name as Name,c.Department as Department,ca.Teacher as Teacher,s.Name as Semester ,ca.Visible as Visible FROM   
	Course c
  left join 
   CourseAssaign ca
  ON
   c.Code=ca.CourseID

  left join 
    Semester s
  ON
  c.Semester=s.ID
);
GO
SET IDENTITY_INSERT [dbo].[AllocateRoom] ON 

INSERT [dbo].[AllocateRoom] ([ID], [RoomNumber], [Department], [Course], [Day], [FromTime], [ToTime], [TimeForView], [Visible]) VALUES (2018, 1, 2, 3, 1, 0, 1, N'R. No : Room-101 , Sat , 12:00 AM - 01 : 00 AM', 0)
INSERT [dbo].[AllocateRoom] ([ID], [RoomNumber], [Department], [Course], [Day], [FromTime], [ToTime], [TimeForView], [Visible]) VALUES (2019, 2, 2, 3, 3, 12.3, 13.3, N'R. No : Room-102 , Mon , 12:30 PM - 01 : 30 PM', 0)
INSERT [dbo].[AllocateRoom] ([ID], [RoomNumber], [Department], [Course], [Day], [FromTime], [ToTime], [TimeForView], [Visible]) VALUES (2020, 1, 2, 5, 1, 23.3, 2, N'R. No : Room-101 , Sat , 11:30 PM - 02 : 00 AM', 0)
INSERT [dbo].[AllocateRoom] ([ID], [RoomNumber], [Department], [Course], [Day], [FromTime], [ToTime], [TimeForView], [Visible]) VALUES (2021, 3, 2, 4, 3, 0.3, 1, N'R. No : Room-103 , Mon , 12:30 AM - 01 : 00 AM', 0)
INSERT [dbo].[AllocateRoom] ([ID], [RoomNumber], [Department], [Course], [Day], [FromTime], [ToTime], [TimeForView], [Visible]) VALUES (2022, 3, 2, 5, 1, 0, 2, N'R. No : Room-103 , Sat , 12:00 AM - 02 : 00 AM', 0)
INSERT [dbo].[AllocateRoom] ([ID], [RoomNumber], [Department], [Course], [Day], [FromTime], [ToTime], [TimeForView], [Visible]) VALUES (2023, 1, 2, 3, 1, 0, 2, N'R. No : Room-101 , Sat , 12:00 AM - 02 : 00 AM', 1)
INSERT [dbo].[AllocateRoom] ([ID], [RoomNumber], [Department], [Course], [Day], [FromTime], [ToTime], [TimeForView], [Visible]) VALUES (2024, 1, 2, 3, 1, 5, 6, N'R. No : Room-101 , Sat , 05:00 AM - 06 : 00 AM', 1)
INSERT [dbo].[AllocateRoom] ([ID], [RoomNumber], [Department], [Course], [Day], [FromTime], [ToTime], [TimeForView], [Visible]) VALUES (2025, 1, 2, 3, 1, 22, 23.3, N'R. No : Room-101 , Sat , 10:00 PM - 11 : 0 PM', 1)
INSERT [dbo].[AllocateRoom] ([ID], [RoomNumber], [Department], [Course], [Day], [FromTime], [ToTime], [TimeForView], [Visible]) VALUES (2026, 1, 2, 3, 1, 7, 9, N'R. No : Room-101 , Sat , 07:00 AM - 09 : 00 AM', 1)
SET IDENTITY_INSERT [dbo].[AllocateRoom] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (1, N'EEE-001', N'Magnetic', 3, N'good', N'EEE', N'2')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (2, N'EEE-002', N'Machine', 4, N'good', N'EEE', N'5')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (3, N'ETE-001', N'Digital Electronic', 3, N'good', N'ETE', N'1')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (4, N'ETE-002', N'Programmer', 4, N'good', N'ETE', N'3')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (5, N'ETE-003', N'Math Lab', 4, N'good', N'ETE', N'6')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (1003, N'ETE-004', N'Machanics', 5, N'good', N'ETE', N'2')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (1004, N'ETE-005', N'Java', 5, N'good', N'ETE', N'5')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (1005, N'ETE-006', N'math', 5, N'good', N'ETE', N'7')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (1006, N'ETE-007', N'Power Electronic', 5, N'good', N'ETE', N'7')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (1007, N'ETE-008', N'Modern Electronic', 5, N'good', N'ETE', N'2')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (1008, N'ETE-009', N'Basic Electronic', 5, N'good', N'ETE', N'1')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (1009, N'ICE-001', N'Artificial Inteligence', 5, N'AI', N'ICE', N'8')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (2004, N'IT-001', N'Mordern Technoloy', 3, N'good', N'IT', N'1')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssaign] ON 

INSERT [dbo].[CourseAssaign] ([ID], [Department], [Teacher], [CourseID], [CourseName], [Credit], [CreditToBeTaken], [RemainingCredit], [Visible]) VALUES (2004, N'IT', N'Captain Cold', N'IT-001', N'Mordern Technoloy', 3, 5, 2, 1)
INSERT [dbo].[CourseAssaign] ([ID], [Department], [Teacher], [CourseID], [CourseName], [Credit], [CreditToBeTaken], [RemainingCredit], [Visible]) VALUES (2005, N'ETE', N'Kallol Kirsno Karmokar', N'ETE-008', N'Modern Electronic', 5, 30, 25, 1)
INSERT [dbo].[CourseAssaign] ([ID], [Department], [Teacher], [CourseID], [CourseName], [Credit], [CreditToBeTaken], [RemainingCredit], [Visible]) VALUES (2006, N'ETE', N'Kallol Kirsno Karmokar', N'ETE-001', N'Digital Electronic', 3, 30, 22, 1)
INSERT [dbo].[CourseAssaign] ([ID], [Department], [Teacher], [CourseID], [CourseName], [Credit], [CreditToBeTaken], [RemainingCredit], [Visible]) VALUES (2007, N'ETE', N'Kallol Kirsno Karmokar', N'ETE-002', N'Programmer', 4, 30, 18, 1)
SET IDENTITY_INSERT [dbo].[CourseAssaign] OFF
SET IDENTITY_INSERT [dbo].[Day] ON 

INSERT [dbo].[Day] ([ID], [Name]) VALUES (1, N'Satarday')
INSERT [dbo].[Day] ([ID], [Name]) VALUES (2, N'Sunday')
INSERT [dbo].[Day] ([ID], [Name]) VALUES (3, N'Monday')
INSERT [dbo].[Day] ([ID], [Name]) VALUES (4, N'Tuesday')
INSERT [dbo].[Day] ([ID], [Name]) VALUES (5, N'Wednesday')
INSERT [dbo].[Day] ([ID], [Name]) VALUES (6, N'Thursday')
INSERT [dbo].[Day] ([ID], [Name]) VALUES (7, N'Friday')
SET IDENTITY_INSERT [dbo].[Day] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([ID], [Code], [Name]) VALUES (1, N'EEE', N'Electrical and Electronic Engineering')
INSERT [dbo].[Department] ([ID], [Code], [Name]) VALUES (2, N'ETE', N'Electronic and Telecommunication Engineering')
INSERT [dbo].[Department] ([ID], [Code], [Name]) VALUES (3, N'CSE', N'Computer Science Engineering')
INSERT [dbo].[Department] ([ID], [Code], [Name]) VALUES (4, N'ICE', N'Information and Communication Engineering')
INSERT [dbo].[Department] ([ID], [Code], [Name]) VALUES (1005, N'IT', N'Information Technology')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([ID], [Name]) VALUES (1, N'Lecturer')
INSERT [dbo].[Designation] ([ID], [Name]) VALUES (2, N'Senior Lecturer')
INSERT [dbo].[Designation] ([ID], [Name]) VALUES (3, N'Assistant Professor')
INSERT [dbo].[Designation] ([ID], [Name]) VALUES (4, N'Associate Professor')
INSERT [dbo].[Designation] ([ID], [Name]) VALUES (5, N'Professor')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[EnrollInACourse] ON 

INSERT [dbo].[EnrollInACourse] ([ID], [StudentID], [CourseID], [Date]) VALUES (2002, 1, 3, N'11-01-16 00.00.00')
INSERT [dbo].[EnrollInACourse] ([ID], [StudentID], [CourseID], [Date]) VALUES (2003, 1, 4, N'11-02-16 00.00.00')
INSERT [dbo].[EnrollInACourse] ([ID], [StudentID], [CourseID], [Date]) VALUES (2004, 1, 1003, N'11-03-16 00.00.00')
INSERT [dbo].[EnrollInACourse] ([ID], [StudentID], [CourseID], [Date]) VALUES (2005, 2, 4, N'01-01-01 00.00.00')
INSERT [dbo].[EnrollInACourse] ([ID], [StudentID], [CourseID], [Date]) VALUES (2006, 2007, 3, N'25-11-16 00.00.00')
INSERT [dbo].[EnrollInACourse] ([ID], [StudentID], [CourseID], [Date]) VALUES (2007, 1, 1006, N'25-11-16 00.00.00')
INSERT [dbo].[EnrollInACourse] ([ID], [StudentID], [CourseID], [Date]) VALUES (2008, 1, 1008, N'25-11-16 00.00.00')
INSERT [dbo].[EnrollInACourse] ([ID], [StudentID], [CourseID], [Date]) VALUES (2009, 1002, 1006, N'25-11-16 00.00.00')
SET IDENTITY_INSERT [dbo].[EnrollInACourse] OFF
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([ID], [Name]) VALUES (1, N'A+')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (2, N'A')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (3, N'A-')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (4, N'B+')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (5, N'B')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (6, N'B-')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (7, N'C+')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (8, N'C')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (9, N'C-')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (10, N'D+')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (11, N'D')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (12, N'D-')
INSERT [dbo].[Grade] ([ID], [Name]) VALUES (13, N'F')
SET IDENTITY_INSERT [dbo].[Grade] OFF
SET IDENTITY_INSERT [dbo].[Result] ON 

INSERT [dbo].[Result] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (2003, 2, 4, 3)
INSERT [dbo].[Result] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (2004, 1, 3, 1)
INSERT [dbo].[Result] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (2005, 1, 4, 13)
INSERT [dbo].[Result] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (2006, 1, 1003, 11)
SET IDENTITY_INSERT [dbo].[Result] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([ID], [Name]) VALUES (1, N'Room-101')
INSERT [dbo].[Room] ([ID], [Name]) VALUES (2, N'Room-102')
INSERT [dbo].[Room] ([ID], [Name]) VALUES (3, N'Room-103')
INSERT [dbo].[Room] ([ID], [Name]) VALUES (4, N'Room-201')
INSERT [dbo].[Room] ([ID], [Name]) VALUES (5, N'Room-202')
INSERT [dbo].[Room] ([ID], [Name]) VALUES (6, N'Room-203')
INSERT [dbo].[Room] ([ID], [Name]) VALUES (7, N'Room-LAB1')
INSERT [dbo].[Room] ([ID], [Name]) VALUES (8, N'Room-LAB2')
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([ID], [Name]) VALUES (1, N'1st year 1st Semester')
INSERT [dbo].[Semester] ([ID], [Name]) VALUES (2, N'1st year 2nd Semester')
INSERT [dbo].[Semester] ([ID], [Name]) VALUES (3, N'2nd year 1st Semester')
INSERT [dbo].[Semester] ([ID], [Name]) VALUES (4, N'2nd year 2nd Semester')
INSERT [dbo].[Semester] ([ID], [Name]) VALUES (5, N'3rd year 1st Semester')
INSERT [dbo].[Semester] ([ID], [Name]) VALUES (6, N'3rd year 2ndSemester')
INSERT [dbo].[Semester] ([ID], [Name]) VALUES (7, N'4th year 1st Semester')
INSERT [dbo].[Semester] ([ID], [Name]) VALUES (8, N'4th year 2nd Semester')
SET IDENTITY_INSERT [dbo].[Semester] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([ID], [Name], [Email], [ContactNumber], [Date], [Address], [Department], [RegistrationNo]) VALUES (1, N'Mahmudur Rahman', N'mahmudurrahman.ete@gmail.com', N'123456789', N'20-11-16 00.00.00', N'Kustia', N'ETE', N'ETE-2016-001')
INSERT [dbo].[Student] ([ID], [Name], [Email], [ContactNumber], [Date], [Address], [Department], [RegistrationNo]) VALUES (2, N'Rajan ahmed', N'rajanahmed.ete@gmail.com', N'3423424', N'20-11-16 00.00.00', N'pabna', N'ETE', N'ETE-2016-002')
INSERT [dbo].[Student] ([ID], [Name], [Email], [ContactNumber], [Date], [Address], [Department], [RegistrationNo]) VALUES (3, N'manik kumar', N'maink.pust.ete@gmail.com', N'453535', N'20-11-16 00.00.00', N'rangpur', N'ETE', N'ETE-2016-003')
INSERT [dbo].[Student] ([ID], [Name], [Email], [ContactNumber], [Date], [Address], [Department], [RegistrationNo]) VALUES (1002, N'KOLINCE', N'kolince.pust@gmail.com', N'45435435', N'21-11-16 00.00.00', N'dgfgdg', N'ETE', N'ETE-2016-004')
INSERT [dbo].[Student] ([ID], [Name], [Email], [ContactNumber], [Date], [Address], [Department], [RegistrationNo]) VALUES (1003, N'Shahadat', N'shahadat@gmail.com', N'12345', N'23-11-16 00.00.00', N'pabna', N'ICE', N'ICE-2016-001')
INSERT [dbo].[Student] ([ID], [Name], [Email], [ContactNumber], [Date], [Address], [Department], [RegistrationNo]) VALUES (2007, N'Saif Ahmed', N'Saif@gmail.com', N'123456', N'06-07-16 00.00.00', N'pabna', N'ETE', N'ETE-2016-005')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([ID], [Name], [Address], [Email], [ContactNumber], [Designation], [Department], [CreditToBeTaken]) VALUES (1, N'Kallol Kirsno Karmokar', N'rajshahi', N'kallol@gmail.com', N'123456789', 5, N'ETE', 30)
INSERT [dbo].[Teacher] ([ID], [Name], [Address], [Email], [ContactNumber], [Designation], [Department], [CreditToBeTaken]) VALUES (2, N'Rajan Kumar', N'pabna', N'rajan@gmail.com', N'12345', 2, N'EEE', 25)
INSERT [dbo].[Teacher] ([ID], [Name], [Address], [Email], [ContactNumber], [Designation], [Department], [CreditToBeTaken]) VALUES (3, N'Imran Hossain', N'Kustia', N'imranete@gmail.com', N'55555555', 4, N'ETE', 40)
INSERT [dbo].[Teacher] ([ID], [Name], [Address], [Email], [ContactNumber], [Designation], [Department], [CreditToBeTaken]) VALUES (1002, N'Tushar', N'pabna', N'tushar@gmail.com', N'123456789', 4, N'ICE', 20)
INSERT [dbo].[Teacher] ([ID], [Name], [Address], [Email], [ContactNumber], [Designation], [Department], [CreditToBeTaken]) VALUES (2003, N'Shahadat', N'pabna', N'Shahadat@gmail.com', N'12345', 2, N'EEE', 5)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
USE [master]
GO
ALTER DATABASE [UniversityCourseManagement] SET  READ_WRITE 
GO
