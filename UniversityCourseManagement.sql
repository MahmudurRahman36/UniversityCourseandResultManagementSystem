USE [master]
GO
/****** Object:  Database [UniversityCourseManagement]    Script Date: 20-11-16 17.50.15 ******/
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
/****** Object:  Table [dbo].[AllocateRoom]    Script Date: 20-11-16 17.50.16 ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 20-11-16 17.50.16 ******/
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
/****** Object:  Table [dbo].[CourseAssaign]    Script Date: 20-11-16 17.50.16 ******/
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
/****** Object:  Table [dbo].[Day]    Script Date: 20-11-16 17.50.16 ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 20-11-16 17.50.16 ******/
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
/****** Object:  Table [dbo].[Designation]    Script Date: 20-11-16 17.50.16 ******/
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
/****** Object:  Table [dbo].[EnrollInACourse]    Script Date: 20-11-16 17.50.16 ******/
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
/****** Object:  Table [dbo].[Grade]    Script Date: 20-11-16 17.50.16 ******/
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
/****** Object:  Table [dbo].[Result]    Script Date: 20-11-16 17.50.16 ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 20-11-16 17.50.16 ******/
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
/****** Object:  Table [dbo].[Semester]    Script Date: 20-11-16 17.50.16 ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 20-11-16 17.50.16 ******/
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
/****** Object:  Table [dbo].[Teacher]    Script Date: 20-11-16 17.50.16 ******/
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
/****** Object:  View [dbo].[CourseStatics]    Script Date: 20-11-16 17.50.16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CourseStatics]
AS
SELECT        ca.Department, ca.CourseID AS Code, ca.CourseName AS Name, ca.Teacher, s.Name AS Semester, ca.Visible
FROM            dbo.CourseAssaign AS ca LEFT OUTER JOIN
                         dbo.Course AS c ON ca.CourseID = c.Code LEFT OUTER JOIN
                         dbo.Semester AS s ON c.Semester = s.ID
WHERE        (ca.CourseID = c.Code) AND (c.Semester = s.ID)

GO
SET IDENTITY_INSERT [dbo].[AllocateRoom] ON 

INSERT [dbo].[AllocateRoom] ([ID], [RoomNumber], [Department], [Course], [Day], [FromTime], [ToTime], [TimeForView], [Visible]) VALUES (1, 1, 2, 3, 1, 10, 11, N'R. No : Room-101, Sat, 10:00 AM - 11:00 AM', 1)
INSERT [dbo].[AllocateRoom] ([ID], [RoomNumber], [Department], [Course], [Day], [FromTime], [ToTime], [TimeForView], [Visible]) VALUES (2, 3, 2, 4, 2, 12, 22, N'R. No : Room-103, Sun, 12:00 PM - 10:00 PM', 1)
INSERT [dbo].[AllocateRoom] ([ID], [RoomNumber], [Department], [Course], [Day], [FromTime], [ToTime], [TimeForView], [Visible]) VALUES (3, 2, 2, 3, 3, 11, 12, N'R. No : Room-102, Mon, 11:00 AM - 12:00 PM', 1)
SET IDENTITY_INSERT [dbo].[AllocateRoom] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (1, N'EEE-001', N'Magnetic', 3, N'good', N'EEE', N'2')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (2, N'EEE-002', N'Machine', 4, N'good', N'EEE', N'5')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (3, N'ETE-001', N'Digital Electronic', 3, N'good', N'ETE', N'1')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (4, N'ETE-002', N'Programmer', 4, N'good', N'ETE', N'3')
INSERT [dbo].[Course] ([ID], [Code], [Name], [Credit], [Description], [Department], [Semester]) VALUES (5, N'ETE-003', N'Math Lab', 4, N'good', N'ETE', N'6')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssaign] ON 

INSERT [dbo].[CourseAssaign] ([ID], [Department], [Teacher], [CourseID], [CourseName], [Credit], [CreditToBeTaken], [RemainingCredit], [Visible]) VALUES (1, N'ETE', N'Kallol Kirsno Karmokar', N'ETE-002', N'Programmer', 4, 30, 26, 0)
INSERT [dbo].[CourseAssaign] ([ID], [Department], [Teacher], [CourseID], [CourseName], [Credit], [CreditToBeTaken], [RemainingCredit], [Visible]) VALUES (2, N'ETE', N'Kallol Kirsno Karmokar', N'ETE-002', N'Programmer', 4, 30, 26, 1)
INSERT [dbo].[CourseAssaign] ([ID], [Department], [Teacher], [CourseID], [CourseName], [Credit], [CreditToBeTaken], [RemainingCredit], [Visible]) VALUES (3, N'ETE', N'Imran Hossain', N'ETE-001', N'Digital Electronic', 3, 40, 37, 1)
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
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([ID], [Name]) VALUES (1, N'Lecturer')
INSERT [dbo].[Designation] ([ID], [Name]) VALUES (2, N'Senior Lecturer')
INSERT [dbo].[Designation] ([ID], [Name]) VALUES (3, N'Assistant Professor')
INSERT [dbo].[Designation] ([ID], [Name]) VALUES (4, N'Associate Professor')
INSERT [dbo].[Designation] ([ID], [Name]) VALUES (5, N'Professor')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[EnrollInACourse] ON 

INSERT [dbo].[EnrollInACourse] ([ID], [StudentID], [CourseID], [Date]) VALUES (1, 1, 4, N'20-11-16 00.00.00')
INSERT [dbo].[EnrollInACourse] ([ID], [StudentID], [CourseID], [Date]) VALUES (2, 2, 3, N'20-11-16 00.00.00')
INSERT [dbo].[EnrollInACourse] ([ID], [StudentID], [CourseID], [Date]) VALUES (3, 1, 3, N'20-11-16 00.00.00')
INSERT [dbo].[EnrollInACourse] ([ID], [StudentID], [CourseID], [Date]) VALUES (4, 1, 5, N'20-11-16 00.00.00')
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

INSERT [dbo].[Result] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (6, 1, 4, 1)
INSERT [dbo].[Result] ([ID], [StudentID], [CourseID], [GradeID]) VALUES (7, 1, 3, 1)
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
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([ID], [Name], [Address], [Email], [ContactNumber], [Designation], [Department], [CreditToBeTaken]) VALUES (1, N'Kallol Kirsno Karmokar', N'rajshahi', N'kallol@gmail.com', N'123456789', 5, N'ETE', 30)
INSERT [dbo].[Teacher] ([ID], [Name], [Address], [Email], [ContactNumber], [Designation], [Department], [CreditToBeTaken]) VALUES (2, N'Rajan Kumar', N'pabna', N'rajan@gmail.com', N'12345', 2, N'EEE', 25)
INSERT [dbo].[Teacher] ([ID], [Name], [Address], [Email], [ContactNumber], [Designation], [Department], [CreditToBeTaken]) VALUES (3, N'Imran Hossain', N'Kustia', N'imranete@gmail.com', N'55555555', 4, N'ETE', 40)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ca"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 136
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseStatics'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CourseStatics'
GO
USE [master]
GO
ALTER DATABASE [UniversityCourseManagement] SET  READ_WRITE 
GO
