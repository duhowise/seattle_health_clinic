USE [seattle_health_clinic]
GO
/****** Object:  Table [dbo].[conditions]    Script Date: 8/8/2016 5:30:27 PM ******/
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
/****** Object:  Table [dbo].[critical_patients]    Script Date: 8/8/2016 5:30:27 PM ******/
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
/****** Object:  Table [dbo].[diagnosis]    Script Date: 8/8/2016 5:30:27 PM ******/
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
/****** Object:  Table [dbo].[employees]    Script Date: 8/8/2016 5:30:27 PM ******/
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
	[employee_data_access_level] [int] NULL,
	[employee_specialty] [varchar](255) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employees_medical]    Script Date: 8/8/2016 5:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[employees_medical](
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
/****** Object:  Table [dbo].[patients]    Script Date: 8/8/2016 5:30:27 PM ******/
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
/****** Object:  Table [dbo].[patients_conditions]    Script Date: 8/8/2016 5:30:27 PM ******/
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
/****** Object:  Table [dbo].[symptoms]    Script Date: 8/8/2016 5:30:27 PM ******/
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

INSERT [dbo].[conditions] ([id], [status]) VALUES (1, N'stable')
INSERT [dbo].[conditions] ([id], [status]) VALUES (2, N'urgent')
INSERT [dbo].[conditions] ([id], [status]) VALUES (3, N'critical')
INSERT [dbo].[conditions] ([id], [status]) VALUES (4, N'unknown')
INSERT [dbo].[conditions] ([id], [status]) VALUES (5, N'deceased')
SET IDENTITY_INSERT [dbo].[conditions] OFF
SET IDENTITY_INSERT [dbo].[diagnosis] ON 

INSERT [dbo].[diagnosis] ([id], [patient_id], [doctor_id], [symptom_id], [diagnosis_date]) VALUES (1, 1, 1, 1, CAST(N'2016-08-16T00:00:00.000' AS DateTime))
INSERT [dbo].[diagnosis] ([id], [patient_id], [doctor_id], [symptom_id], [diagnosis_date]) VALUES (2, 1, 1, 4, CAST(N'2016-08-22T00:00:00.000' AS DateTime))
INSERT [dbo].[diagnosis] ([id], [patient_id], [doctor_id], [symptom_id], [diagnosis_date]) VALUES (3, 1, 1, 4, CAST(N'2016-08-22T00:00:00.000' AS DateTime))
INSERT [dbo].[diagnosis] ([id], [patient_id], [doctor_id], [symptom_id], [diagnosis_date]) VALUES (4, 1, 1, 3, CAST(N'2016-08-23T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[diagnosis] OFF
SET IDENTITY_INSERT [dbo].[patients] ON 

INSERT [dbo].[patients] ([id], [name], [address]) VALUES (1, N'Text1', N'Seattle')
SET IDENTITY_INSERT [dbo].[patients] OFF
SET IDENTITY_INSERT [dbo].[symptoms] ON 

INSERT [dbo].[symptoms] ([id], [name], [classification], [contagious]) VALUES (1, N'Coughing', N'Respiratory', 1)
INSERT [dbo].[symptoms] ([id], [name], [classification], [contagious]) VALUES (2, N'Runny Nose', N'Respiratory', 1)
INSERT [dbo].[symptoms] ([id], [name], [classification], [contagious]) VALUES (3, N'Rash', N'Dermal', 1)
INSERT [dbo].[symptoms] ([id], [name], [classification], [contagious]) VALUES (4, N'Vomiting', N'Gastrointestinal', 1)
SET IDENTITY_INSERT [dbo].[symptoms] OFF
