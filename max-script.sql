/****** Object:  Database [WaterQMDB]    Script Date: 2/28/2025 9:47:55 AM ******/
CREATE DATABASE [WaterQMDB]   WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF;
GO
ALTER DATABASE [WaterQMDB] SET COMPATIBILITY_LEVEL = 160
GO
ALTER DATABASE [WaterQMDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WaterQMDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WaterQMDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WaterQMDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WaterQMDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WaterQMDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WaterQMDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WaterQMDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WaterQMDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WaterQMDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WaterQMDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WaterQMDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WaterQMDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WaterQMDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WaterQMDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WaterQMDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [WaterQMDB] SET  MULTI_USER 
GO
ALTER DATABASE [WaterQMDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [WaterQMDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/28/2025 9:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alerts]    Script Date: 2/28/2025 9:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alerts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sensor_id] [int] NOT NULL,
	[user_id] [nvarchar](450) NOT NULL,
	[alert_message] [nvarchar](255) NOT NULL,
	[alert_time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 2/28/2025 9:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[location_name] [nvarchar](100) NOT NULL,
	[latitude] [decimal](9, 6) NOT NULL,
	[longitude] [decimal](9, 6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 2/28/2025 9:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alert_id] [int] NOT NULL,
	[user_id] [nvarchar](450) NOT NULL,
	[notification_time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleClaims]    Script Date: 2/28/2025 9:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2/28/2025 9:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SensorReadings]    Script Date: 2/28/2025 9:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SensorReadings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sensor_id] [int] NOT NULL,
	[parameter_id] [int] NOT NULL,
	[reading_value] [float] NOT NULL,
	[reading_time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sensors]    Script Date: 2/28/2025 9:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sensors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sensor_name] [nvarchar](100) NOT NULL,
	[sensor_type] [nvarchar](50) NOT NULL,
	[location_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Thresholds]    Script Date: 2/28/2025 9:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thresholds](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parameter_id] [int] NOT NULL,
	[min_value] [float] NOT NULL,
	[max_value] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 2/28/2025 9:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogins]    Script Date: 2/28/2025 9:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 2/28/2025 9:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/28/2025 9:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[NormalizedUserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[NormalizedEmail] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTokens]    Script Date: 2/28/2025 9:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WaterParameters]    Script Date: 2/28/2025 9:47:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WaterParameters](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parameter_name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250217090533_Identity', N'8.0.11')
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([id], [location_name], [latitude], [longitude]) VALUES (1, N'Harare Water Treatment Plant', CAST(-17.829200 AS Decimal(9, 6)), CAST(31.052200 AS Decimal(9, 6)))
INSERT [dbo].[Locations] ([id], [location_name], [latitude], [longitude]) VALUES (2, N'Bulawayo Water Reservoir', CAST(-20.157400 AS Decimal(9, 6)), CAST(28.582800 AS Decimal(9, 6)))
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[SensorReadings] ON 

INSERT [dbo].[SensorReadings] ([id], [sensor_id], [parameter_id], [reading_value], [reading_time]) VALUES (1, 1, 1, 7.2, CAST(N'2025-02-17T11:30:11.787' AS DateTime))
INSERT [dbo].[SensorReadings] ([id], [sensor_id], [parameter_id], [reading_value], [reading_time]) VALUES (2, 2, 2, 8.3, CAST(N'2025-02-17T11:30:11.787' AS DateTime))
INSERT [dbo].[SensorReadings] ([id], [sensor_id], [parameter_id], [reading_value], [reading_time]) VALUES (3, 3, 3, 4.5, CAST(N'2025-02-17T11:30:11.787' AS DateTime))
SET IDENTITY_INSERT [dbo].[SensorReadings] OFF
GO
SET IDENTITY_INSERT [dbo].[Sensors] ON 

INSERT [dbo].[Sensors] ([id], [sensor_name], [sensor_type], [location_id]) VALUES (1, N'pH Sensor 01', N'pH', 1)
INSERT [dbo].[Sensors] ([id], [sensor_name], [sensor_type], [location_id]) VALUES (2, N'Turbidity Sensor 02', N'Turbidity', 1)
INSERT [dbo].[Sensors] ([id], [sensor_name], [sensor_type], [location_id]) VALUES (3, N'Oxygen Sensor 03', N'Dissolved Oxygen', 2)
SET IDENTITY_INSERT [dbo].[Sensors] OFF
GO
SET IDENTITY_INSERT [dbo].[Thresholds] ON 

INSERT [dbo].[Thresholds] ([id], [parameter_id], [min_value], [max_value]) VALUES (1, 1, 6.5, 8.5)
INSERT [dbo].[Thresholds] ([id], [parameter_id], [min_value], [max_value]) VALUES (2, 2, 0, 5)
INSERT [dbo].[Thresholds] ([id], [parameter_id], [min_value], [max_value]) VALUES (3, 3, 5, 14)
SET IDENTITY_INSERT [dbo].[Thresholds] OFF
GO
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'47671c8c-3d6f-448e-a2e8-4a155727686a', N'markmubaiwa@gmail.com', N'MARKMUBAIWA@GMAIL.COM', N'markmubaiwa@gmail.com', N'MARKMUBAIWA@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHRNJEQdMm1vRZSxIbEkhi7+Ug48dN2P6d5WKDtM4E8h5RFpBOB7Z5mCs9UaIOeMGQ==', N'GVUZ4JXNSHLVX3I2R7ANUDP63V6G5F5N', N'0cccb09c-8b59-40bb-b90c-1819b949eb9c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[Users] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9c3ae329-2018-4407-9fd3-bebd9764d32e', N'admin@pindah.org', N'ADMIN@PINDAH.ORG', N'admin@pindah.org', N'ADMIN@PINDAH.ORG', 0, N'AQAAAAIAAYagAAAAENiHKrwhYaJ3sMb5Ldzm9ZyZFw74WSa+filDRfkvOwIS9S8B2S92DcFhCr5RnCDdNQ==', N'X7GH7OKK4DSRBZISFKYWCEOVPSI6REII', N'f8f43356-6b17-45ca-b312-8ef9db3706b4', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[WaterParameters] ON 

INSERT [dbo].[WaterParameters] ([id], [parameter_name]) VALUES (3, N'Dissolved Oxygen')
INSERT [dbo].[WaterParameters] ([id], [parameter_name]) VALUES (1, N'pH')
INSERT [dbo].[WaterParameters] ([id], [parameter_name]) VALUES (2, N'Turbidity')
SET IDENTITY_INSERT [dbo].[WaterParameters] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Location__F809DCA0300A6811]    Script Date: 2/28/2025 9:47:56 AM ******/
ALTER TABLE [dbo].[Locations] ADD UNIQUE NONCLUSTERED 
(
	[location_name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleClaims_RoleId]    Script Date: 2/28/2025 9:47:56 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleClaims_RoleId] ON [dbo].[RoleClaims]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 2/28/2025 9:47:56 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[Roles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Sensors__96382DC19B45A9A6]    Script Date: 2/28/2025 9:47:56 AM ******/
ALTER TABLE [dbo].[Sensors] ADD UNIQUE NONCLUSTERED 
(
	[sensor_name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserClaims_UserId]    Script Date: 2/28/2025 9:47:56 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserClaims_UserId] ON [dbo].[UserClaims]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserLogins_UserId]    Script Date: 2/28/2025 9:47:56 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserLogins_UserId] ON [dbo].[UserLogins]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserRoles_RoleId]    Script Date: 2/28/2025 9:47:56 AM ******/
CREATE NONCLUSTERED INDEX [IX_UserRoles_RoleId] ON [dbo].[UserRoles]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__WaterPar__33CADFA1B07FB313]    Script Date: 2/28/2025 9:47:56 AM ******/
ALTER TABLE [dbo].[WaterParameters] ADD UNIQUE NONCLUSTERED 
(
	[parameter_name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alerts] ADD  DEFAULT (getdate()) FOR [alert_time]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [notification_time]
GO
ALTER TABLE [dbo].[SensorReadings] ADD  DEFAULT (getdate()) FOR [reading_time]
GO
ALTER TABLE [dbo].[Alerts]  WITH CHECK ADD  CONSTRAINT [FK_Alerts_Sensors] FOREIGN KEY([sensor_id])
REFERENCES [dbo].[Sensors] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Alerts] CHECK CONSTRAINT [FK_Alerts_Sensors]
GO
ALTER TABLE [dbo].[Alerts]  WITH CHECK ADD  CONSTRAINT [FK_Alerts_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Alerts] CHECK CONSTRAINT [FK_Alerts_Users]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Alerts] FOREIGN KEY([alert_id])
REFERENCES [dbo].[Alerts] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Alerts]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Users]
GO
ALTER TABLE [dbo].[RoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_RoleClaims_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleClaims] CHECK CONSTRAINT [FK_RoleClaims_Roles_RoleId]
GO
ALTER TABLE [dbo].[SensorReadings]  WITH CHECK ADD  CONSTRAINT [FK_SensorReadings_Sensors] FOREIGN KEY([sensor_id])
REFERENCES [dbo].[Sensors] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SensorReadings] CHECK CONSTRAINT [FK_SensorReadings_Sensors]
GO
ALTER TABLE [dbo].[SensorReadings]  WITH CHECK ADD  CONSTRAINT [FK_SensorReadings_WaterParameters] FOREIGN KEY([parameter_id])
REFERENCES [dbo].[WaterParameters] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SensorReadings] CHECK CONSTRAINT [FK_SensorReadings_WaterParameters]
GO
ALTER TABLE [dbo].[Sensors]  WITH CHECK ADD  CONSTRAINT [FK_Sensors_Locations] FOREIGN KEY([location_id])
REFERENCES [dbo].[Locations] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sensors] CHECK CONSTRAINT [FK_Sensors_Locations]
GO
ALTER TABLE [dbo].[Thresholds]  WITH CHECK ADD  CONSTRAINT [FK_Thresholds_WaterParameters] FOREIGN KEY([parameter_id])
REFERENCES [dbo].[WaterParameters] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Thresholds] CHECK CONSTRAINT [FK_Thresholds_WaterParameters]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_UserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_UserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_AspNetUsers_UserId]
GO
ALTER DATABASE [WaterQMDB] SET  READ_WRITE 
GO
