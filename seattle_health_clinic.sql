USE [seattle_health_clinic]
GO
/****** Object:  Table [dbo].[certifications]    Script Date: 8/11/2016 9:02:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[certifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NULL,
	[license_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[conditions]    Script Date: 8/11/2016 9:02:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[conditions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[critical_patients]    Script Date: 8/11/2016 9:02:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[critical_patients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NULL,
	[frequency] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[diagnosis]    Script Date: 8/11/2016 9:02:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diagnosis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NULL,
	[doctor_id] [int] NULL,
	[symptom_id] [int] NULL,
	[diagnosis_date] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[employees]    Script Date: 8/11/2016 9:02:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_name_first] [varchar](255) NULL,
	[employee_name_last] [varchar](255) NULL,
	[employee_ssn] [varchar](255) NULL,
	[employee_type] [varchar](255) NULL,
	[employee_date_hire] [date] NULL,
	[employee_salary_type] [varchar](255) NULL,
	[employee_email] [varchar](255) NULL,
	[employee_password] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[licenses]    Script Date: 8/11/2016 9:02:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[licenses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[license_type] [varchar](255) NULL,
	[license_number] [varchar](255) NULL,
	[license_issue] [date] NULL,
	[license_expiration] [date] NULL,
	[license_issue_state] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[patients]    Script Date: 8/11/2016 9:02:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[patients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[address] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[patients_conditions]    Script Date: 8/11/2016 9:02:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patients_conditions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NULL,
	[condition_id] [int] NULL,
	[doctor_id] [int] NULL,
	[status_date] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[patients_scheduling]    Script Date: 8/11/2016 9:02:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patients_scheduling](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NULL,
	[doctor_id] [int] NULL,
	[note] [text] NULL,
	[appointment_date] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[payrolls]    Script Date: 8/11/2016 9:02:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[payrolls](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pay_period] [varchar](255) NULL,
	[salary_type] [varchar](255) NULL,
	[salary_amount] [varchar](255) NULL,
	[employee_id] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[physicians]    Script Date: 8/11/2016 9:02:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[physicians](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_name_first] [varchar](255) NULL,
	[employee_name_last] [varchar](255) NULL,
	[employee_ssn] [varchar](255) NULL,
	[employee_type] [varchar](255) NULL,
	[employee_date_hire] [date] NULL,
	[employee_salary_type] [varchar](255) NULL,
	[employee_email] [varchar](255) NULL,
	[employee_password] [varchar](255) NULL,
	[board_certifications] [varchar](255) NULL,
	[licensed_states] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[symptoms]    Script Date: 8/11/2016 9:02:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[symptoms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[classification] [varchar](255) NULL,
	[contagious] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[conditions] ON 

INSERT [dbo].[conditions] ([id], [status]) VALUES (1, N'Stable')
INSERT [dbo].[conditions] ([id], [status]) VALUES (2, N'Urgent')
INSERT [dbo].[conditions] ([id], [status]) VALUES (3, N'Critical')
SET IDENTITY_INSERT [dbo].[conditions] OFF
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([id], [employee_name_first], [employee_name_last], [employee_ssn], [employee_type], [employee_date_hire], [employee_salary_type], [employee_email], [employee_password]) VALUES (1, N'John', N'Smith', N'1234567890', N'0976543', CAST(N'2015-01-01' AS Date), N'10', N'example@example.com', N'password')
SET IDENTITY_INSERT [dbo].[employees] OFF
SET IDENTITY_INSERT [dbo].[patients] ON 

INSERT [dbo].[patients] ([id], [name], [address]) VALUES (3, N'Juliane Keena', N'Seattle')
INSERT [dbo].[patients] ([id], [name], [address]) VALUES (2, N'Jake Acuna', N'Seattle')
INSERT [dbo].[patients] ([id], [name], [address]) VALUES (4, N'Korey Gurrola', N'Los Angeles')
INSERT [dbo].[patients] ([id], [name], [address]) VALUES (5, N'Kirk Debord', N'New York')
INSERT [dbo].[patients] ([id], [name], [address]) VALUES (6, N'Mona Taff', N'Columbus, OH')
INSERT [dbo].[patients] ([id], [name], [address]) VALUES (7, N'Nell Fuselier', N'Tokyo')
INSERT [dbo].[patients] ([id], [name], [address]) VALUES (8, N'Ulrike Kroh', N'Brussels')
INSERT [dbo].[patients] ([id], [name], [address]) VALUES (9, N'Dortha Tewell', N'Shanghai')
INSERT [dbo].[patients] ([id], [name], [address]) VALUES (10, N'Emmaline Mcmakin', N'Lima')
INSERT [dbo].[patients] ([id], [name], [address]) VALUES (11, N'Leisa Vallarta', N'New York')
INSERT [dbo].[patients] ([id], [name], [address]) VALUES (12, N'Twila Lairsey', N'Seattle')
INSERT [dbo].[patients] ([id], [name], [address]) VALUES (13, N'Lawerence Royall', N'Seattle')
INSERT [dbo].[patients] ([id], [name], [address]) VALUES (14, N'Adriene Holmquist', N'Seattle')
INSERT [dbo].[patients] ([id], [name], [address]) VALUES (15, N'Laureen Weglarz', N'Seattle')
SET IDENTITY_INSERT [dbo].[patients] OFF
SET IDENTITY_INSERT [dbo].[patients_conditions] ON 

INSERT [dbo].[patients_conditions] ([id], [patient_id], [condition_id], [doctor_id], [status_date]) VALUES (3, 3, 1, 2, CAST(N'2016-08-24T00:00:00.000' AS DateTime))
INSERT [dbo].[patients_conditions] ([id], [patient_id], [condition_id], [doctor_id], [status_date]) VALUES (4, 3, 1, 1, CAST(N'2016-08-24T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[patients_conditions] OFF
SET IDENTITY_INSERT [dbo].[patients_scheduling] ON 

INSERT [dbo].[patients_scheduling] ([id], [patient_id], [doctor_id], [note], [appointment_date]) VALUES (3, 2, 1, N'Hypertension, diagnosed “years ago,” well-controlled with Metoprolol
Depression, poorly controlled; started Prozac 6 months ago but still feels depressed', CAST(N'2016-08-19T00:00:00.000' AS DateTime))
INSERT [dbo].[patients_scheduling] ([id], [patient_id], [doctor_id], [note], [appointment_date]) VALUES (4, 11, 1, N'Abdomen soft and non-distended with no scars or striations
No pulsatile masses, no abdominal bruits ascultated
Spleen not palpable, liver not palpable
Tender to palpation in epigastric region and left upper quadrant; No reflex tenderness; No guarding; Murphy’s sign negative', CAST(N'2016-08-14T00:00:00.000' AS DateTime))
INSERT [dbo].[patients_scheduling] ([id], [patient_id], [doctor_id], [note], [appointment_date]) VALUES (5, 15, 1, N'Lipitor, for high cholesterol
Multivitamin
Baby aspirin every day ', CAST(N'2016-08-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[patients_scheduling] OFF
