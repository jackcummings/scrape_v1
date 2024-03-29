USE [master]
GO
/****** Object:  Database [Scrape]    Script Date: 12/11/2019 1:34:48 PM ******/
CREATE DATABASE [Scrape]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Scrape', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Scrape.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Scrape_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Scrape_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Scrape] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Scrape].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Scrape] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Scrape] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Scrape] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Scrape] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Scrape] SET ARITHABORT OFF 
GO
ALTER DATABASE [Scrape] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Scrape] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Scrape] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Scrape] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Scrape] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Scrape] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Scrape] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Scrape] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Scrape] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Scrape] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Scrape] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Scrape] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Scrape] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Scrape] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Scrape] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Scrape] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Scrape] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Scrape] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Scrape] SET  MULTI_USER 
GO
ALTER DATABASE [Scrape] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Scrape] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Scrape] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Scrape] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Scrape] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Scrape] SET QUERY_STORE = OFF
GO
USE [Scrape]
GO
/****** Object:  User [scrapesu]    Script Date: 12/11/2019 1:34:49 PM ******/
CREATE USER [scrapesu] FOR LOGIN [scrapesu] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [scrapesu]
GO
/****** Object:  UserDefinedTableType [dbo].[IDList]    Script Date: 12/11/2019 1:34:49 PM ******/
CREATE TYPE [dbo].[IDList] AS TABLE(
	[ID] [int] NOT NULL
)
GO
/****** Object:  Table [dbo].[dzi]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dzi](
	[dzi_id] [int] IDENTITY(1,1) NOT NULL,
	[dzi_name] [varchar](1000) NULL,
	[dzi_path] [varchar](2000) NOT NULL,
	[dzi_width] [int] NOT NULL,
	[dzi_height] [int] NOT NULL,
 CONSTRAINT [PK_dzi] PRIMARY KEY CLUSTERED 
(
	[dzi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[galleries]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[galleries](
	[gallery_id] [int] IDENTITY(1,1) NOT NULL,
	[gallery_name] [varchar](2000) NOT NULL,
	[is_public] [bit] NOT NULL,
	[gallery_description] [text] NULL,
 CONSTRAINT [PK_galleries] PRIMARY KEY CLUSTERED 
(
	[gallery_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pictures]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pictures](
	[picture_id] [int] IDENTITY(1,1) NOT NULL,
	[picture_name] [varchar](1000) NULL,
	[picture_path] [varchar](2000) NULL,
	[picture_description] [text] NULL,
	[picture_width] [int] NOT NULL,
	[picture_height] [int] NOT NULL,
 CONSTRAINT [PK_pictures] PRIMARY KEY CLUSTERED 
(
	[picture_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pictures_to_galleries]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pictures_to_galleries](
	[gallery_id] [int] NOT NULL,
	[picture_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](2000) NOT NULL,
	[last_name] [varchar](2000) NOT NULL,
	[email] [varchar](2000) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[password] [varbinary](3000) NOT NULL,
	[is_admin] [bit] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_to_dzi]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_to_dzi](
	[dzi_id] [int] NOT NULL,
	[user_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_to_galleries]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_to_galleries](
	[user_id] [int] NOT NULL,
	[gallery_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_to_pictures]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_to_pictures](
	[user_id] [int] NOT NULL,
	[picture_id] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[pictures_to_galleries]  WITH CHECK ADD  CONSTRAINT [FK_pictures_to_galleries_galleries] FOREIGN KEY([gallery_id])
REFERENCES [dbo].[galleries] ([gallery_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[pictures_to_galleries] CHECK CONSTRAINT [FK_pictures_to_galleries_galleries]
GO
ALTER TABLE [dbo].[pictures_to_galleries]  WITH CHECK ADD  CONSTRAINT [FK_pictures_to_galleries_pictures] FOREIGN KEY([picture_id])
REFERENCES [dbo].[pictures] ([picture_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[pictures_to_galleries] CHECK CONSTRAINT [FK_pictures_to_galleries_pictures]
GO
ALTER TABLE [dbo].[users_to_dzi]  WITH CHECK ADD  CONSTRAINT [FK_users_to_dzi_dzi] FOREIGN KEY([dzi_id])
REFERENCES [dbo].[dzi] ([dzi_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[users_to_dzi] CHECK CONSTRAINT [FK_users_to_dzi_dzi]
GO
ALTER TABLE [dbo].[users_to_dzi]  WITH CHECK ADD  CONSTRAINT [FK_users_to_dzi_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[users_to_dzi] CHECK CONSTRAINT [FK_users_to_dzi_users]
GO
ALTER TABLE [dbo].[users_to_galleries]  WITH CHECK ADD  CONSTRAINT [FK_users_to_galleries_galleries] FOREIGN KEY([gallery_id])
REFERENCES [dbo].[galleries] ([gallery_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[users_to_galleries] CHECK CONSTRAINT [FK_users_to_galleries_galleries]
GO
ALTER TABLE [dbo].[users_to_galleries]  WITH CHECK ADD  CONSTRAINT [FK_users_to_galleries_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[users_to_galleries] CHECK CONSTRAINT [FK_users_to_galleries_users]
GO
ALTER TABLE [dbo].[users_to_pictures]  WITH CHECK ADD  CONSTRAINT [FK_user_to_picture_picture] FOREIGN KEY([picture_id])
REFERENCES [dbo].[pictures] ([picture_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[users_to_pictures] CHECK CONSTRAINT [FK_user_to_picture_picture]
GO
ALTER TABLE [dbo].[users_to_pictures]  WITH CHECK ADD  CONSTRAINT [user_id to users.user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[users_to_pictures] CHECK CONSTRAINT [user_id to users.user_id]
GO
/****** Object:  StoredProcedure [dbo].[spDziGetById]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDziGetById] @dzi_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dzi_name, dzi_path FROM dzi WHERE dzi_id=@dzi_id
END
GO
/****** Object:  StoredProcedure [dbo].[spDziGetByUserID]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDziGetByUserID] @user_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT d.dzi_id, d.dzi_name, d.dzi_path FROM dzi AS d
		INNER JOIN users_to_dzi as ud
			ON ud.user_id=@user_id
		WHERE d.dzi_id=ud.dzi_id

END
GO
/****** Object:  StoredProcedure [dbo].[spDziInsert]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spDziInsert] @user_id int, @dzi_name varchar(1000), @dzi_path varchar(2000), @dzi_width int, @dzi_height int
AS
BEGIN
	INSERT INTO dzi (dzi_name, dzi_path, dzi_width, dzi_height) VALUES (@dzi_name, @dzi_path, @dzi_width, @dzi_height);
	INSERT INTO users_to_dzi (dzi_id, user_id) VALUES (SCOPE_IDENTITY(), @user_id);
END
GO
/****** Object:  StoredProcedure [dbo].[spGalleryAddByID]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGalleryAddByID] @gallery_id int, @picture_id_list dbo.IDList READONLY
AS
BEGIN
	INSERT INTO pictures_to_galleries (gallery_id, picture_id) SELECT @gallery_id, * FROM @picture_id_list
END
GO
/****** Object:  StoredProcedure [dbo].[spGalleryCreate]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGalleryCreate] @gallery_name varchar(2000), @is_public bit, @gallery_description text,
								 @user_id int
AS
BEGIN
	INSERT INTO galleries (gallery_name, is_public, gallery_description) VALUES
						  (@gallery_name, @is_public, @gallery_description)

	INSERT INTO users_to_galleries (user_id, gallery_id) VALUES
						  (@user_id, scope_identity())
END
GO
/****** Object:  StoredProcedure [dbo].[spGalleryGetByUserID]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGalleryGetByUserID] @user_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT g.gallery_id, g.gallery_name, g.is_public, g.gallery_description FROM galleries AS g
		INNER JOIN users_to_galleries as ug
			ON ug.user_id=@user_id
		WHERE g.gallery_id=ug.gallery_id

END
GO
/****** Object:  StoredProcedure [dbo].[spGalleryGetPicturesByID]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGalleryGetPicturesByID] @gallery_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT p.picture_id, p.picture_name, p.picture_path, p.picture_description, p.picture_width, p.picture_height FROM dbo.pictures AS p
		INNER JOIN dbo.pictures_to_galleries AS pg
			 ON pg.gallery_id=@gallery_id 
			 WHERE p.picture_id = pg.picture_id
END
GO
/****** Object:  StoredProcedure [dbo].[spPictureInsert]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spPictureInsert] @user_id int, @gallery_id int, @picture_name varchar(1000), @picture_path varchar(2000), @picture_description text, @picture_width int, @picture_height int
AS
BEGIN
	DECLARE @pic_id INT;
	
	INSERT INTO pictures (picture_name, picture_path, picture_description, picture_width, picture_height) VALUES (@picture_name, @picture_path, @picture_description, @picture_width, @picture_height);
	SELECT @pic_id = SCOPE_IDENTITY();
	INSERT INTO users_to_pictures (user_id, picture_id) VALUES (@user_id, @pic_id);
	INSERT INTO pictures_to_galleries (gallery_id, picture_id) VALUES (@gallery_id, @pic_id);
END
GO
/****** Object:  StoredProcedure [dbo].[spUserCheckLogin]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUserCheckLogin] @username varchar(100), @password varbinary(3000)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT user_id, first_name, last_name, email, username, is_admin FROM users
	WHERE username=@username AND password=@password;
END
GO
/****** Object:  StoredProcedure [dbo].[spUserCheckUsername]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUserCheckUsername] @username varchar(2000)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT user_id FROM users WHERE username=@username
END
GO
/****** Object:  StoredProcedure [dbo].[spUserInsert]    Script Date: 12/11/2019 1:34:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spUserInsert] 		
		@first_name varchar(2000), @last_name varchar(2000), @email varchar(2000), 
		@username varchar(100), @password varbinary(3000)
AS
BEGIN
	DECLARE @i INT;
	
	INSERT INTO users (first_name, last_name, email, username, password, is_admin)
	VALUES (@first_name, @last_name, @email, @username, @password, 0);

	SELECT @i = SCOPE_IDENTITY();

	INSERT INTO galleries (gallery_name, is_public, gallery_description)
	VALUES ('Uncategorized', 0, 'Uncategorized photos');

	INSERT INTO users_to_galleries (user_id, gallery_id)
	VALUES (@i, SCOPE_IDENTITY());
END
GO
USE [master]
GO
ALTER DATABASE [Scrape] SET  READ_WRITE 
GO
