USE [master]
GO
/****** Object:  Database [Tourism]    Script Date: 04/07/2014 20:01:09 ******/

CREATE DATABASE [Tourism] 
GO
USE [Tourism]
GO
/****** Object:  ForeignKey [FK_Member_Address]    Script Date: 04/07/2014 20:01:10 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Member_Address]') AND parent_object_id = OBJECT_ID(N'[dbo].[Member]'))
ALTER TABLE [dbo].[Member] DROP CONSTRAINT [FK_Member_Address]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMemberById]    Script Date: 04/07/2014 20:01:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetMemberById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetMemberById]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMemberListByType]    Script Date: 04/07/2014 20:01:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetMemberListByType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetMemberListByType]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertMember]    Script Date: 04/07/2014 20:01:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InsertMember]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InsertMember]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteMemberById]    Script Date: 04/07/2014 20:01:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteMemberById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DeleteMemberById]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateMember]    Script Date: 04/07/2014 20:01:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InsertUpdateMember]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InsertUpdateMember]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetLocationById]    Script Date: 04/07/2014 20:01:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetLocationById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetLocationById]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateAddress]    Script Date: 04/07/2014 20:01:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InsertUpdateAddress]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InsertUpdateAddress]
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateLocation]    Script Date: 04/07/2014 20:01:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InsertUpdateLocation]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InsertUpdateLocation]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 04/07/2014 20:01:10 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Member_Address]') AND parent_object_id = OBJECT_ID(N'[dbo].[Member]'))
ALTER TABLE [dbo].[Member] DROP CONSTRAINT [FK_Member_Address]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Member]') AND type in (N'U'))
DROP TABLE [dbo].[Member]
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteLocationById]    Script Date: 04/07/2014 20:01:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteLocationById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_DeleteLocationById]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 04/07/2014 20:01:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address]') AND type in (N'U'))
DROP TABLE [dbo].[Address]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 04/07/2014 20:01:09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND type in (N'U'))
DROP TABLE [dbo].[Location]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 04/07/2014 20:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Location](
	[LocationId] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [varchar](100) NULL,
	[LocationUrl] [varchar](200) NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Address]    Script Date: 04/07/2014 20:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Address]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Address](
	[AddressId] [int] NOT NULL,
	[Address1] [varchar](100) NULL,
	[Address2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](50) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteLocationById]    Script Date: 04/07/2014 20:01:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteLocationById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_DeleteLocationById]
	
	(
	@LocationId int
	)
	
AS
	DELETE FROM Location WHERE LocationId = @LocationId
	RETURN
' 
END
GO
/****** Object:  Table [dbo].[Member]    Script Date: 04/07/2014 20:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Member]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Member](
	[MemberId] [int] NOT NULL,
	[AddressId] [int] NULL,
	[LastName] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[PhoneNo] [varchar](15) NULL,
	[MobileNo] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[MemberType] [varchar](50) NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateLocation]    Script Date: 04/07/2014 20:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InsertUpdateLocation]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_InsertUpdateLocation]
	
	(
	@LocationId		int output,
	@LocationName	varchar(100),
	@LocationUrl	varchar(200),
	@Description	varchar(max),
	@Action			varchar(10)
	)
	
AS
IF(@Action = ''INSERT'')
BEGIN
INSERT INTO Location(LocationName,LocationUrl,Description)
VALUES(@LocationName,@LocationUrl,@Description)
SET @LocationId = scope_identity ()
END
ELSE IF(@Action = ''UPDATE'')
BEGIN
UPDATE Location SET 
	LocationName	=	@LocationName,
	LocationUrl		=	@LocationUrl,
	Description		=	@Description
	WHERE LocationId	= @LocationId		
END
	
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateAddress]    Script Date: 04/07/2014 20:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InsertUpdateAddress]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_InsertUpdateAddress]
	(
	
	
	@Zip			varchar(50),
	@Action			varchar(10),
	@Address1		varchar(100),
	@Address2		varchar(100),
	@State			varchar(50),
	@City			varchar(50),
	@AddressId		int output
	)
AS
	IF(@Action = ''Insert'')
	BEGIN
	
	SELECT @AddressId = isnull(max(AddressId),0) FROM Address
	SET @AddressId = @AddressId + 1
	INSERT INTO Address(AddressId,Address1, Address2, State, City, Zip)
			VALUES(@AddressId,@Address1,@Address2, @State,@City, @Zip)
			
	END
	ELSE
	BEGIN
		UPDATE Address SET  Zip			=	@Zip,
							Address1	=	@Address1,
							Address2	=	@Address2,
							State		=	@State,
							City		=	@City
							WHERE AddressId = @AddressId
	END 
		
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetLocationById]    Script Date: 04/07/2014 20:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetLocationById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_GetLocationById] 
	
	(
	@LocationId int
	)
	
AS
	SELECT * FROM Location WHERE LocationId = @LocationId
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertUpdateMember]    Script Date: 04/07/2014 20:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InsertUpdateMember]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_InsertUpdateMember]
	(
	@MemberId		int,
	@Addressid		int,
	@LastName		varchar(50),
	@FirstName		varchar(50),
	@MiddleName		varchar(50),
	@PhoneNo		varchar(15),
	@MobileNo		varchar(15),
	@Email			varchar(100),
	@MemberType		varchar(10),
	@Action			varchar(10)
	)
	
AS
	IF(@Action	= ''Insert'')
	BEGIN
	
		SELECT @MemberId = isnull(max(Memberid),0) FROM Member
		SET @MemberId = @MemberId + 1
		
		INSERT INTO Member(MemberId,Addressid ,LastName, FirstName, MiddleName,PhoneNo, MobileNo,Email,MemberType)
				VALUES(@MemberId,@Addressid ,@LastName, @FirstName, @MiddleName,@PhoneNo, @MobileNo,@Email,@MemberType)
			
	END
	ELSE
	BEGIN
		UPDATE Member SET  
		Addressid		=	@Addressid,	
		LastName		=	@LastName,
		FirstName		=	@FirstName,
		MiddleName		=	@MiddleName	,
		PhoneNo			=	@PhoneNo,
		MobileNo		=	@MobileNo,
		Email			=	@Email,
		MemberType		=	@MemberType
		
		WHERE MemberId =		@MemberId		
		
	END
	RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteMemberById]    Script Date: 04/07/2014 20:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_DeleteMemberById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_DeleteMemberById] 
	
	(
	@Memberid int
	)
	
AS
	DECLARE @AddressId int
	SELECT @AddressId = AddressId FROM Member WHERE MemberId = @Memberid
	
	DELETE FROM Member WHERE MemberId = @Memberid
	
	DELETE FROM Address WHERE AddressId = @AddressId 
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_InsertMember]    Script Date: 04/07/2014 20:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InsertMember]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_InsertMember]
	(
	@MemberId		int,
	@Addressid		int,
	@LastName		varchar(50),
	@FirstName		varchar(50),
	@MiddleName		varchar(50),
	@PhoneNo		varchar(15),
	@MobileNo		varchar(15),
	@Email			varchar(100),
	@MemberType		varchar(10),
	@Action			varchar(10)
	)
	
AS
	IF(@Action	= ''Insert'')
	BEGIN
	
		SELECT @MemberId = isnull(max(Memberid),0) FROM Member
		SET @MemberId = @MemberId + 1
		
		INSERT INTO Member(MemberId,Addressid ,LastName, FirstName, MiddleName,PhoneNo, MobileNo,Email,MemberType)
				VALUES(@MemberId,@Addressid ,@LastName, @FirstName, @MiddleName,@PhoneNo, @MobileNo,@Email,@MemberType)
			
	END
	RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMemberListByType]    Script Date: 04/07/2014 20:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetMemberListByType]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_GetMemberListByType]
	
	(
	@Type varchar(10)
	)
	
AS
SELECT     MemberId, AddressId, LastName, FirstName, MiddleName, PhoneNo, MobileNo, Email, MemberType
FROM         Member WHERE MemberType = @Type
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMemberById]    Script Date: 04/07/2014 20:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetMemberById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_GetMemberById]
	
	(
	@Memberid		int 
	)
	
AS
	SELECT * FROM Member WHERE MemberId = @Memberid
	DECLARE  @AddressId int
	SELECT @AddressId = AddressId FROM Member WHERE MemberId = @Memberid
	SELECT * FROM Address WHERE  @AddressId = AddressId 
	RETURN
' 
END
GO
/****** Object:  ForeignKey [FK_Member_Address]    Script Date: 04/07/2014 20:01:10 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Member_Address]') AND parent_object_id = OBJECT_ID(N'[dbo].[Member]'))
ALTER TABLE [dbo].[Member]  WITH CHECK ADD  CONSTRAINT [FK_Member_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Member_Address]') AND parent_object_id = OBJECT_ID(N'[dbo].[Member]'))
ALTER TABLE [dbo].[Member] CHECK CONSTRAINT [FK_Member_Address]
GO
