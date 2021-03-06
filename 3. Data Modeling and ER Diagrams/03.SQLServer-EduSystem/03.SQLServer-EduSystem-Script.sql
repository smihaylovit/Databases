USE [master]
GO
/****** Object:  Database [EducationSystem]    Script Date: 11.7.2013 г. 14:19:18 ******/
CREATE DATABASE [EducationSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EducationSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EducationSystem.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EducationSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EducationSystem_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EducationSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EducationSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EducationSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EducationSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EducationSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EducationSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EducationSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [EducationSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EducationSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EducationSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EducationSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EducationSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EducationSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EducationSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EducationSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EducationSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EducationSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EducationSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EducationSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EducationSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EducationSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EducationSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EducationSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EducationSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EducationSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EducationSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [EducationSystem] SET  MULTI_USER 
GO
ALTER DATABASE [EducationSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EducationSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EducationSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EducationSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EducationSystem', N'ON'
GO
USE [EducationSystem]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 11.7.2013 г. 14:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[ProfessorId] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 11.7.2013 г. 14:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FacultyId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 11.7.2013 г. 14:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UniversityId] [int] NOT NULL,
 CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professor]    Script Date: 11.7.2013 г. 14:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Professor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProfessorsAndCourses]    Script Date: 11.7.2013 г. 14:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessorsAndCourses](
	[ProfessorId] [int] NOT NULL,
	[CourseId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProfessorsTitle]    Script Date: 11.7.2013 г. 14:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessorsTitle](
	[ProfessorId] [int] NOT NULL,
	[TitleName] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProfessorTitles]    Script Date: 11.7.2013 г. 14:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessorTitles](
	[Id] [nvarchar](50) NOT NULL,
	[TitleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProfessorTitles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 11.7.2013 г. 14:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Universities]    Script Date: 11.7.2013 г. 14:19:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Universities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Universities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Departments]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Professor] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professor] ([Id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Professor]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Faculties] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([Id])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Faculties]
GO
ALTER TABLE [dbo].[Faculties]  WITH CHECK ADD  CONSTRAINT [FK_Faculties_Universities] FOREIGN KEY([UniversityId])
REFERENCES [dbo].[Universities] ([Id])
GO
ALTER TABLE [dbo].[Faculties] CHECK CONSTRAINT [FK_Faculties_Universities]
GO
ALTER TABLE [dbo].[Professor]  WITH CHECK ADD  CONSTRAINT [FK_Professor_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Professor] CHECK CONSTRAINT [FK_Professor_Departments]
GO
ALTER TABLE [dbo].[ProfessorsAndCourses]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorsAndCourses_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[ProfessorsAndCourses] CHECK CONSTRAINT [FK_ProfessorsAndCourses_Courses]
GO
ALTER TABLE [dbo].[ProfessorsAndCourses]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorsAndCourses_Professor] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professor] ([Id])
GO
ALTER TABLE [dbo].[ProfessorsAndCourses] CHECK CONSTRAINT [FK_ProfessorsAndCourses_Professor]
GO
ALTER TABLE [dbo].[ProfessorsTitle]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorsAndProfessorTitles_ProfessorTitles] FOREIGN KEY([TitleName])
REFERENCES [dbo].[ProfessorTitles] ([Id])
GO
ALTER TABLE [dbo].[ProfessorsTitle] CHECK CONSTRAINT [FK_ProfessorsAndProfessorTitles_ProfessorTitles]
GO
ALTER TABLE [dbo].[ProfessorsTitle]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorsTitle_Professor] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professor] ([Id])
GO
ALTER TABLE [dbo].[ProfessorsTitle] CHECK CONSTRAINT [FK_ProfessorsTitle_Professor]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Courses]
GO
USE [master]
GO
ALTER DATABASE [EducationSystem] SET  READ_WRITE 
GO
