USE [master]
GO
/****** Object:  Database [testDB]    Script Date: 05/21/2019 10:44:36 ******/
CREATE DATABASE [testDB] ON  PRIMARY 
( NAME = N'testDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\testDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'testDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\testDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [testDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [testDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [testDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [testDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [testDB] SET ARITHABORT OFF
GO
ALTER DATABASE [testDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [testDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [testDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [testDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [testDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [testDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [testDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [testDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [testDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [testDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [testDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [testDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [testDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [testDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [testDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [testDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [testDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [testDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [testDB] SET  READ_WRITE
GO
ALTER DATABASE [testDB] SET RECOVERY FULL
GO
ALTER DATABASE [testDB] SET  MULTI_USER
GO
ALTER DATABASE [testDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [testDB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'testDB', N'ON'
GO
USE [testDB]
GO
/****** Object:  Table [dbo].[t_patient]    Script Date: 05/21/2019 10:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_patient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PasNumber] [nchar](10) NULL,
	[Forenames] [nchar](20) NULL,
	[Surname] [nchar](20) NULL,
	[DateOfBirth] [datetime] NULL,
	[SexCode] [nchar](10) NULL,
	[HomeTelephoneNumber] [nchar](20) NULL,
	[Transaction_id] [nchar](10) NULL,
	[Transaction_time] [smalldatetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[t_patient] ON
INSERT [dbo].[t_patient] ([id], [PasNumber], [Forenames], [Surname], [DateOfBirth], [SexCode], [HomeTelephoneNumber], [Transaction_id], [Transaction_time]) VALUES (1, N'19083207  ', N'Johnny              ', N'Smith               ', CAST(0x0000842900000000 AS DateTime), N'M         ', N'07708111957         ', N'31582931  ', CAST(0xA5FB0351 AS SmallDateTime))
INSERT [dbo].[t_patient] ([id], [PasNumber], [Forenames], [Surname], [DateOfBirth], [SexCode], [HomeTelephoneNumber], [Transaction_id], [Transaction_time]) VALUES (2, N'19283208  ', N'Tom                 ', N'Cruise              ', CAST(0x00006BE700000000 AS DateTime), N'M         ', N'07708111777         ', N'31582932  ', CAST(0xA5FC0351 AS SmallDateTime))
INSERT [dbo].[t_patient] ([id], [PasNumber], [Forenames], [Surname], [DateOfBirth], [SexCode], [HomeTelephoneNumber], [Transaction_id], [Transaction_time]) VALUES (9, N'123       ', N'aa                  ', N'a                   ', CAST(0x0000AA5400000000 AS DateTime), N'F         ', N'123123              ', N'123       ', CAST(0xAA540000 AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[t_patient] OFF
/****** Object:  Table [dbo].[t_NextOfKin]    Script Date: 05/21/2019 10:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_NextOfKin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [nchar](10) NULL,
	[NokName] [nchar](20) NULL,
	[NokRelationshipCode] [nchar](20) NULL,
	[NokAddressLine1] [nchar](20) NULL,
	[NokAddressLine2] [nchar](20) NULL,
	[NokAddressLine3] [nchar](20) NULL,
	[NokAddressLine4] [nchar](20) NULL,
	[NokPostcode] [nchar](10) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[t_NextOfKin] ON
INSERT [dbo].[t_NextOfKin] ([id], [patient_id], [NokName], [NokRelationshipCode], [NokAddressLine1], [NokAddressLine2], [NokAddressLine3], [NokAddressLine4], [NokPostcode]) VALUES (1, N'1         ', N'MICHELLE Smith      ', N'Sister              ', N'52 Old RD           ', N'SOUTHBOURNE         ', N'SOUTHBOURNE         ', N'SOUTHBOURNE         ', N'PO20 9JX  ')
INSERT [dbo].[t_NextOfKin] ([id], [patient_id], [NokName], [NokRelationshipCode], [NokAddressLine1], [NokAddressLine2], [NokAddressLine3], [NokAddressLine4], [NokPostcode]) VALUES (2, N'2         ', N'Gemma Cruise        ', N'Wife                ', N'24 Claremont Road   ', N'Portsmouth          ', N'Boston              ', N'HANTS               ', N'PO15BN    ')
INSERT [dbo].[t_NextOfKin] ([id], [patient_id], [NokName], [NokRelationshipCode], [NokAddressLine1], [NokAddressLine2], [NokAddressLine3], [NokAddressLine4], [NokPostcode]) VALUES (9, N'9         ', N'aa                  ', N'a                   ', N'a1                  ', N'a1                  ', N'a1                  ', N'a1                  ', N'a1a1      ')
SET IDENTITY_INSERT [dbo].[t_NextOfKin] OFF
/****** Object:  Table [dbo].[t_GpDetails]    Script Date: 05/21/2019 10:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[t_GpDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [nchar](10) NULL,
	[GpCode] [nchar](10) NULL,
	[GpSurname] [nchar](10) NULL,
	[GpInitials] [nchar](10) NULL,
	[GpPhone] [nchar](10) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[t_GpDetails] ON
INSERT [dbo].[t_GpDetails] ([id], [patient_id], [GpCode], [GpSurname], [GpInitials], [GpPhone]) VALUES (2, N'1         ', N'871334    ', N'CHADWICK  ', N'SA        ', N'01243 38  ')
INSERT [dbo].[t_GpDetails] ([id], [patient_id], [GpCode], [GpSurname], [GpInitials], [GpPhone]) VALUES (3, N'2         ', N'871335    ', N'CHADWICK  ', N'KC        ', N'43576262  ')
INSERT [dbo].[t_GpDetails] ([id], [patient_id], [GpCode], [GpSurname], [GpInitials], [GpPhone]) VALUES (10, N'9         ', N'123       ', N'aa        ', N'a         ', N'123123    ')
SET IDENTITY_INSERT [dbo].[t_GpDetails] OFF
/****** Object:  StoredProcedure [dbo].[sp_update]    Script Date: 05/21/2019 10:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_update] 
( 
	@id NVARCHAR(32),
    @firstname NVARCHAR(32),
    @surname NVARCHAR(32),
    @dob NVARCHAR(32),
    @gender NVARCHAR(32),
    @homephoneno NVARCHAR(32), 
    @transid NVARCHAR(32),
    @transtime smalldatetime,
    @passno NVARCHAR(32),
    @nokname NVARCHAR(32),
    @relation NVARCHAR(32),
    @address1 NVARCHAR(32),
    @address2 NVARCHAR(32),
    @address3 NVARCHAR(32),
    @address4 NVARCHAR(32),
    @postal NVARCHAR(32),
    @gpcode NVARCHAR(32),
    @gpsurname NVARCHAR(32),
    @gpinitial NVARCHAR(32),
    @gpmobile NVARCHAR(32)
    
)
AS
BEGIN
UPDATE  [testDB].[dbo].[t_patient] SET
           [PasNumber] =  @passno,
           [Forenames] = @firstname
           ,[Surname] = @surname
           ,[DateOfBirth] =  @dob
           ,[SexCode] = @gender
           ,[HomeTelephoneNumber] = @homephoneno
           ,[Transaction_id] = @transid
           ,[Transaction_time] =  @transtime where [t_patient].id = @id ;   
            
           
           
           UPDATE [testDB].[dbo].[t_NextOfKin] SET
           
           [NokName] = @nokname,
           [NokRelationshipCode] = @relation ,
           [NokAddressLine1] = @address1,
           [NokAddressLine2] = @address2 ,
           [NokAddressLine3] = @address2 ,
           [NokAddressLine4] = @address2 ,
           [NokPostcode] =  @postal where [t_NextOfKin].patient_id = @id ;   
   
		    
		     UPDATE [testDB].[dbo].[t_GpDetails] SET
           
           [GpCode] = @gpcode,
           [GpSurname] = @gpsurname,
           [GpInitials] = @gpinitial,
           [GpPhone] = @gpmobile where [t_GpDetails].patient_id = @id ;   
    
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetData]    Script Date: 05/21/2019 10:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetData]
AS
SELECT *
FROM  t_patient
JOIN t_NextOfKin ON (t_NextOfKin.patient_id = t_patient.id)
JOIN t_GpDetails ON (t_GpDetails.patient_id = t_patient.id)
GO
/****** Object:  StoredProcedure [dbo].[sp_delete]    Script Date: 05/21/2019 10:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_delete] 
( 
	@id NVARCHAR(32)
    
)
AS
BEGIN
DELETE FROM  [testDB].[dbo].[t_patient]  where [t_patient].id = @id ;   
DELETE FROM  [testDB].[dbo].[t_NextOfKin]  where [t_NextOfKin].patient_id = @id ;  
DELETE FROM  [testDB].[dbo].[t_GpDetails]  where [t_GpDetails].patient_id = @id ;          
 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_create]    Script Date: 05/21/2019 10:44:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_create] 
( 
    @firstname NVARCHAR(32),
    @surname NVARCHAR(32),
    @dob NVARCHAR(32),
    @gender NVARCHAR(32),
    @homephoneno NVARCHAR(32), 
    @transid NVARCHAR(32),
    @transtime smalldatetime,
    @passno NVARCHAR(32),
    @nokname NVARCHAR(32),
    @relation NVARCHAR(32),
    @address1 NVARCHAR(32),
    @address2 NVARCHAR(32),
    @address3 NVARCHAR(32),
    @address4 NVARCHAR(32),
    @postal NVARCHAR(32),
    @gpcode NVARCHAR(32),
    @gpsurname NVARCHAR(32),
    @gpinitial NVARCHAR(32),
    @gpmobile NVARCHAR(32)
    
)
AS
BEGIN
INSERT INTO [testDB].[dbo].[t_patient]
           ([PasNumber]
           ,[Forenames]
           ,[Surname]
           ,[DateOfBirth]
           ,[SexCode]
           ,[HomeTelephoneNumber]
           ,[Transaction_id]
           ,[Transaction_time])
     VALUES(
           @passno,
           @firstname,
           @surname,
            @dob,
           @gender ,
           @homephoneno , 
           @transid ,
           @transtime )
           declare @myVal int;
        set @myVal = (SELECT MAX(ID) FROM [testDB].[dbo].[t_patient]);      
           
           
           INSERT INTO [testDB].[dbo].[t_NextOfKin]
           ([patient_id]
           ,[NokName]
           ,[NokRelationshipCode]
           ,[NokAddressLine1]
           ,[NokAddressLine2]
           ,[NokAddressLine3]
           ,[NokAddressLine4]
           ,[NokPostcode])
     VALUES
     (
           @myVal,
            @nokname,
			@relation ,
			@address1,
			@address2 ,
		    @address3 ,
		    @address4 ,
		    @postal )
		    
		    INSERT INTO [testDB].[dbo].[t_GpDetails]
           ([patient_id]
           ,[GpCode]
           ,[GpSurname]
           ,[GpInitials]
           ,[GpPhone])
     VALUES
     (
            @myVal,
		    @gpcode,
			@gpsurname,
			@gpinitial,
			@gpmobile)
END
GO
