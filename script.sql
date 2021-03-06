USE [master]
GO
/****** Object:  Database [entidades]    Script Date: 15/12/2020 17:02:37 ******/
CREATE DATABASE [entidades]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'entidades', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\entidades.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'entidades_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\entidades_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [entidades] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [entidades].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [entidades] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [entidades] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [entidades] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [entidades] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [entidades] SET ARITHABORT OFF 
GO
ALTER DATABASE [entidades] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [entidades] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [entidades] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [entidades] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [entidades] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [entidades] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [entidades] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [entidades] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [entidades] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [entidades] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [entidades] SET  ENABLE_BROKER 
GO
ALTER DATABASE [entidades] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [entidades] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [entidades] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [entidades] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [entidades] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [entidades] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [entidades] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [entidades] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [entidades] SET  MULTI_USER 
GO
ALTER DATABASE [entidades] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [entidades] SET DB_CHAINING OFF 
GO
ALTER DATABASE [entidades] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [entidades] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [entidades]
GO
/****** Object:  Table [dbo].[Dependente]    Script Date: 15/12/2020 17:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dependente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NULL,
	[IsCalculaIR] [nvarchar](1) NULL,
	[IsCalculaINSS] [nvarchar](1) NULL,
	[FuncionarioId] [int] NOT NULL,
 CONSTRAINT [PK_Dependente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Funcionario]    Script Date: 15/12/2020 17:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funcionario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NULL,
	[CPF] [nvarchar](20) NULL,
	[Salario] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Funcionario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Dependente] ON 

INSERT [dbo].[Dependente] ([id], [Nome], [IsCalculaIR], [IsCalculaINSS], [FuncionarioId]) VALUES (1, N'Rita', N'S', N'S', 1)
INSERT [dbo].[Dependente] ([id], [Nome], [IsCalculaIR], [IsCalculaINSS], [FuncionarioId]) VALUES (2, N'Maria Santos', N'S', N'S', 1)
INSERT [dbo].[Dependente] ([id], [Nome], [IsCalculaIR], [IsCalculaINSS], [FuncionarioId]) VALUES (3, N'Junia', N'S', N'S', 3)
INSERT [dbo].[Dependente] ([id], [Nome], [IsCalculaIR], [IsCalculaINSS], [FuncionarioId]) VALUES (4, N'Miranda', N'S', N'S', 4)
INSERT [dbo].[Dependente] ([id], [Nome], [IsCalculaIR], [IsCalculaINSS], [FuncionarioId]) VALUES (5, N'Vania', N'N', N'S', 2)
INSERT [dbo].[Dependente] ([id], [Nome], [IsCalculaIR], [IsCalculaINSS], [FuncionarioId]) VALUES (6, N'Amarildo', N'S', N'N', 5)
SET IDENTITY_INSERT [dbo].[Dependente] OFF
SET IDENTITY_INSERT [dbo].[Funcionario] ON 

INSERT [dbo].[Funcionario] ([id], [Nome], [CPF], [Salario]) VALUES (1, N'Judite Oliveira', N'12345678945', CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Funcionario] ([id], [Nome], [CPF], [Salario]) VALUES (2, N'Marcia Algusta', N'123fffffff', CAST(1380.46 AS Decimal(18, 2)))
INSERT [dbo].[Funcionario] ([id], [Nome], [CPF], [Salario]) VALUES (3, N'Rosangela Amarantos', N'123456789', CAST(1040.00 AS Decimal(18, 2)))
INSERT [dbo].[Funcionario] ([id], [Nome], [CPF], [Salario]) VALUES (4, N'Ronald Barbosa', N'45612317979', CAST(1650.38 AS Decimal(18, 2)))
INSERT [dbo].[Funcionario] ([id], [Nome], [CPF], [Salario]) VALUES (5, N'Iasmin Pereira Paz', N'456797464', CAST(1372.25 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Funcionario] OFF
ALTER TABLE [dbo].[Dependente]  WITH CHECK ADD  CONSTRAINT [FK_Dependente_Funcionario] FOREIGN KEY([FuncionarioId])
REFERENCES [dbo].[Funcionario] ([id])
GO
ALTER TABLE [dbo].[Dependente] CHECK CONSTRAINT [FK_Dependente_Funcionario]
GO
USE [master]
GO
ALTER DATABASE [entidades] SET  READ_WRITE 
GO
