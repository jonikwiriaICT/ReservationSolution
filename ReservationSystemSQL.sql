USE [ReservationSystem]
GO
/****** Object:  Table [dbo].[tbl_customer]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_customer](
	[customer_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([customer_id]),
	[fullname] [varchar](200) NULL,
	[email] [varchar](200) NULL,
	[telephone_no] [varchar](20) NULL,
	[username] [varchar](200) NULL,
	[userpassword] [varchar](200) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qryCustomer]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qryCustomer] as select row_number() over (order by rec_id) as RowNumber,
rec_id as RecID, fullname as [Customer Name], email as [Email],
telephone_no as [TelephoneNo], updated_date as [UpdatedDate], updated_time as [UpdatedTime]
from tbl_customer
GO
/****** Object:  Table [dbo].[tbl_administrator]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_administrator](
	[administrator_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([administrator_id]),
	[fullname] [varchar](200) NULL,
	[email] [varchar](200) NULL,
	[telephone_no] [varchar](20) NULL,
	[username] [varchar](200) NULL,
	[userpassword] [varchar](200) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[administrator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qryAdministrator]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qryAdministrator] as select row_number() over (order by rec_id) as RowNumber,
rec_id as RecID, fullname as [Customer Name], email as [Email],
telephone_no as [TelephoneNo], updated_date as [UpdatedDate], updated_time as [UpdatedTime]
from tbl_administrator
GO
/****** Object:  Table [dbo].[tbl_roomType]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_roomType](
	[room_typeID] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([room_typeID]),
	[room_type] [varchar](200) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[room_typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qryRoomType]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qryRoomType] as select row_number() over (order by rec_id) as RowNumber,
rec_id as RecID, room_type as [RoomType], updated_date as [UpdatedDate],
updated_time as [UpdatedTime] from 
tbl_roomType
GO
/****** Object:  Table [dbo].[tbl_room]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_room](
	[room_typeID] [bigint] NULL,
	[room_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([room_id]),
	[room_name] [varchar](200) NULL,
	[no_of_persons] [varchar](10) NULL,
	[price] [decimal](18, 2) NULL,
	[room_description] [varchar](max) NULL,
	[profile_pic] [varchar](200) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
	[flag_on] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[qryRoom]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qryRoom] as SELECT        row_number() OVER (ORDER BY r.rec_id) AS RowNumber, r.rec_id AS RecID, case when flag_on=0 then 'Not booked' else 'Booked' end as [RoomBookingRemark], t .room_type AS [Room Type], r.room_name AS [Room Name], r.no_of_persons AS [Maximum Person allowed], r.price AS Price, 
r.room_description AS [Description], r.profile_pic AS Pic, r.updated_date AS UpdatedDate, r.updated_time AS UpdatedTime
FROM            tbl_room r JOIN
                         tbl_roomType t ON r.room_typeID = t .room_typeID
GO
/****** Object:  Table [dbo].[tbl_reservation]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_reservation](
	[reservation_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([reservation_id]),
	[customer_id] [bigint] NULL,
	[room_id] [bigint] NULL,
	[booking_date] [varchar](20) NULL,
	[booking_time] [varchar](20) NULL,
	[expired_date] [varchar](20) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
	[orderno] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[qryReservation]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[qryReservation] as SELECT        row_number() OVER (ORDER BY r.rec_id) AS RowNumber, r.rec_id AS [RecID], c.customer_id AS [CustomerID], C.fullname AS [CustomerName], c.email AS [Email], c.telephone_no AS [TelephoneNo], t .room_type AS [RoomType], 
o.room_name AS RoomName, o.no_of_persons AS [Maximum No. of persons], o.price AS Price, o.profile_pic AS Pic, CASE WHEN o.flag_on = 0 THEN 'Not booked' ELSE 'Booked' END AS BookRoom, r.booking_date AS [BookingDate], 
r.booking_time AS [BookingTime], r.expired_date as [ExpiredDate], r.updated_date AS [UpdatedDate], r.updated_time AS [UpdatedTime]
FROM            tbl_reservation r JOIN
                         tbl_customer c ON c.customer_id = r.customer_id JOIN
                         tbl_room o ON o.room_id = r.room_id JOIN
                         tbl_roomType t ON t .room_typeID = o.room_typeID
GO
/****** Object:  View [dbo].[qryBookedRoom]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qryBookedRoom] as SELECT        row_number() OVER (ORDER BY r.rec_id) AS RowNumber, r.rec_id AS RecID, CASE WHEN flag_on = 0 THEN 'Not booked' ELSE 'Booked' END AS [RoomBookingRemark], t .room_type AS [Room Type], 
r.room_name AS [Room Name], r.no_of_persons AS [Maximum Person allowed], r.price AS Price, r.room_description AS [Description], r.profile_pic AS Pic, r.updated_date AS UpdatedDate, r.updated_time AS UpdatedTime
FROM            tbl_room r JOIN
                         tbl_roomType t ON r.room_typeID = t .room_typeID where r.flag_on=1
GO
/****** Object:  View [dbo].[qryNonBookRoom]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[qryNonBookRoom] as SELECT        row_number() OVER (ORDER BY r.rec_id) AS RowNumber, r.rec_id AS RecID, r.room_id as RoomID, CASE WHEN flag_on = 0 THEN 'Not booked' ELSE 'Booked' END AS [RoomBookingRemark], t .room_type AS [Room Type], 
r.room_name AS [Room Name], r.no_of_persons AS [Maximum Person allowed], r.price AS Price, r.room_description AS [Description], r.profile_pic AS Pic, r.updated_date AS UpdatedDate, r.updated_time AS UpdatedTime
FROM            tbl_room r JOIN
                         tbl_roomType t ON r.room_typeID = t .room_typeID
WHERE        r.flag_on = 0
GO
/****** Object:  Table [dbo].[tbl_user_log]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user_log](
	[user_name] [varchar](50) NOT NULL,
	[log_url] [varchar](250) NOT NULL,
	[log_sql] [varchar](max) NULL,
	[log_desc] [varchar](max) NULL,
	[rec_id] [bigint] IDENTITY(1,1) NOT NULL,
	[log_date] [date] NULL,
	[log_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[qryAuditLog]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[qryAuditLog] as select row_number() over (order by rec_id) as RowNumber, rec_id as RecID,
user_name as UserName, log_url as [Log Url], log_date as [Log Date], log_time as [Log time]
from tbl_user_log
GO
/****** Object:  Table [dbo].[tbl_chat]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_chat](
	[chat_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([chat_id]),
	[queries] [varchar](max) NULL,
	[reply] [varchar](max) NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[chat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_dict_tables]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_dict_tables](
	[rec_id] [bigint] IDENTITY(1,1) NOT NULL,
	[panel_id] [varchar](50) NOT NULL,
	[table_name] [varchar](50) NOT NULL,
	[key_name] [varchar](50) NOT NULL,
	[updated_date] [date] NULL,
	[updated_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[rec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_feedbackMessage]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_feedbackMessage](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NULL,
	[Message] [varchar](max) NULL,
	[positive] [decimal](18, 2) NULL,
	[negative] [decimal](18, 2) NULL,
	[neutral] [decimal](18, 2) NULL,
	[compound] [decimal](18, 2) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_message_log]    Script Date: 10/4/2021 9:42:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_message_log](
	[log_id] [bigint] IDENTITY(1,1) NOT NULL,
	[rec_id]  AS ([log_id]),
	[client_id] [bigint] NULL,
	[client_message] [varchar](max) NULL,
	[bot_message] [varchar](max) NULL,
	[created_date] [date] NULL,
	[created_time] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_administrator] ON 

INSERT [dbo].[tbl_administrator] ([administrator_id], [fullname], [email], [telephone_no], [username], [userpassword], [updated_date], [updated_time]) VALUES (1, N'peter', N'peter@gmail.com', N'09056456456', N'admin', N'admin', CAST(N'2021-10-01' AS Date), CAST(N'07:31:37.5366667' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_administrator] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_customer] ON 

INSERT [dbo].[tbl_customer] ([customer_id], [fullname], [email], [telephone_no], [username], [userpassword], [updated_date], [updated_time]) VALUES (1, N'NWAUKWA CHINEDU JOHNWENDY', N'info@jonikwiria.com', N'07031268439', N'john', N'john', CAST(N'2021-10-01' AS Date), CAST(N'08:09:53.6533333' AS Time))
INSERT [dbo].[tbl_customer] ([customer_id], [fullname], [email], [telephone_no], [username], [userpassword], [updated_date], [updated_time]) VALUES (2, N'Micheal', N'micheal@gmail.com', N'09065764567', N'micheal', N'micheal', CAST(N'2021-10-03' AS Date), CAST(N'09:41:20.5766667' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_customer] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_dict_tables] ON 

INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name], [updated_date], [updated_time]) VALUES (1, N'PnlCustomer', N'tbl_customer', N'rec_id', CAST(N'2021-09-30' AS Date), CAST(N'23:02:51.1533333' AS Time))
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name], [updated_date], [updated_time]) VALUES (2, N'PnlAdministrator', N'tbl_administrator', N'rec_id', CAST(N'2021-09-30' AS Date), CAST(N'23:15:20.7433333' AS Time))
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name], [updated_date], [updated_time]) VALUES (3, N'PnlRoomType', N'tbl_roomType', N'rec_id', CAST(N'2021-09-30' AS Date), CAST(N'23:21:24.8700000' AS Time))
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name], [updated_date], [updated_time]) VALUES (4, N'PnlRoom', N'tbl_room', N'rec_id', CAST(N'2021-09-30' AS Date), CAST(N'23:26:12.2833333' AS Time))
INSERT [dbo].[tbl_dict_tables] ([rec_id], [panel_id], [table_name], [key_name], [updated_date], [updated_time]) VALUES (5, N'PnlReservation', N'tbl_reservation', N'rec_id', CAST(N'2021-09-30' AS Date), CAST(N'23:55:30.6933333' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_dict_tables] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_feedbackMessage] ON 

INSERT [dbo].[tbl_feedbackMessage] ([ID], [Date], [Message], [positive], [negative], [neutral], [compound], [created_date], [created_time]) VALUES (1, CAST(N'2021-06-17T17:29:51.4166667' AS DateTime2), N'nice platform easy to use ', CAST(0.66 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.34 AS Decimal(18, 2)), CAST(0.69 AS Decimal(18, 2)), CAST(N'2021-06-17' AS Date), CAST(N'17:29:51.4166667' AS Time))
INSERT [dbo].[tbl_feedbackMessage] ([ID], [Date], [Message], [positive], [negative], [neutral], [compound], [created_date], [created_time]) VALUES (2, CAST(N'2021-06-17T18:07:55.3400000' AS DateTime2), N'please i hate this product', CAST(0.29 AS Decimal(18, 2)), CAST(0.46 AS Decimal(18, 2)), CAST(0.25 AS Decimal(18, 2)), CAST(-0.34 AS Decimal(18, 2)), CAST(N'2021-06-17' AS Date), CAST(N'18:07:55.3400000' AS Time))
INSERT [dbo].[tbl_feedbackMessage] ([ID], [Date], [Message], [positive], [negative], [neutral], [compound], [created_date], [created_time]) VALUES (10002, CAST(N'2021-06-21T10:02:03.8900000' AS DateTime2), N'i hate this bot', CAST(0.00 AS Decimal(18, 2)), CAST(0.65 AS Decimal(18, 2)), CAST(0.35 AS Decimal(18, 2)), CAST(-0.57 AS Decimal(18, 2)), CAST(N'2021-06-21' AS Date), CAST(N'10:02:03.8900000' AS Time))
INSERT [dbo].[tbl_feedbackMessage] ([ID], [Date], [Message], [positive], [negative], [neutral], [compound], [created_date], [created_time]) VALUES (10003, CAST(N'2021-07-01T17:21:02.6033333' AS DateTime2), N'i like this product alot. it is a good project. keep it up', CAST(0.38 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.63 AS Decimal(18, 2)), CAST(0.66 AS Decimal(18, 2)), CAST(N'2021-07-01' AS Date), CAST(N'17:21:02.6033333' AS Time))
INSERT [dbo].[tbl_feedbackMessage] ([ID], [Date], [Message], [positive], [negative], [neutral], [compound], [created_date], [created_time]) VALUES (10004, CAST(N'2021-07-10T05:47:31.2900000' AS DateTime2), N'hello', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(N'2021-07-10' AS Date), CAST(N'05:47:31.2900000' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_feedbackMessage] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_message_log] ON 

INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (8, 1, N'i want to buy tv', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/2021611101HisenceAndriod1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Hisense 65" Smart Uhd Led Tv 4k + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>480000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-11' AS Date), CAST(N'15:54:44.5700000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (9, 1, N'i want to cancel my order. my order id is 1', N'Your order has been cancelled. Our Retailer will contact you soon.', CAST(N'2021-06-11' AS Date), CAST(N'16:02:55.8633333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (10, 1, N'i want to cancel my order. my order id is 1', N'Your order has been cancelled. Our Retailer will contact you soon.', CAST(N'2021-06-11' AS Date), CAST(N'16:04:09.6766667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (11, 1, N'please i want to buy product', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/2021611101HisenceAndriod1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Hisense 65" Smart Uhd Led Tv 4k + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>480000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-11' AS Date), CAST(N'16:13:24.8333333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (12, 1, N'i want to buy 55 inches tv', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/2021611101HisenceAndriod1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Hisense 65" Smart Uhd Led Tv 4k + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>480000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-11' AS Date), CAST(N'16:20:44.9433333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (10002, 6, N'how are you?', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-11' AS Date), CAST(N'18:33:55.1800000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (10003, 6, N'who did they create you?', N'Sini created me. I thank Mr Johnwendy for the idea. He is a researcher. I hope i will be approve to learn new things and solve NP Hard problems.', CAST(N'2021-06-11' AS Date), CAST(N'18:39:35.5300000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (10004, 6, N'how are you', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-11' AS Date), CAST(N'19:05:52.5600000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (10005, 6, N'hello', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-11' AS Date), CAST(N'19:07:12' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (10006, 6, N'hello', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-11' AS Date), CAST(N'19:11:28.1433333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (10007, 6, N'hello fan', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-11' AS Date), CAST(N'19:12:39.5966667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (10008, 6, N'hello', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-11' AS Date), CAST(N'19:25:37.4333333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (10009, 6, N'i am cool', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-11' AS Date), CAST(N'19:27:19.2800000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (20002, 6, N'hello', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-15' AS Date), CAST(N'13:44:50.3066667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (20003, 6, N'please i want to buy phone', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/2021611101HisenceAndriod1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Hisense 65" Smart Uhd Led Tv 4k + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>480000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/20216111544HicensedSmartTv1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Hisense 55" Smart UHD LED 4k Tv + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>295000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-15' AS Date), CAST(N'13:49:55.9433333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (20004, 6, N'phone', N'Sini created me. I thank Mr Johnwendy for the idea. He is a researcher. I hope i will be approve to learn new things and solve NP Hard problems.', CAST(N'2021-06-15' AS Date), CAST(N'13:50:16.1833333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (20005, 6, N'buy phone', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/2021611101HisenceAndriod1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Hisense 65" Smart Uhd Led Tv 4k + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>480000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/20216111544HicensedSmartTv1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Hisense 55" Smart UHD LED 4k Tv + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>295000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-15' AS Date), CAST(N'13:50:31.5600000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (30002, 6, N'please i want to buy phone', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/2021611101HisenceAndriod1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Hisense 65" Smart Uhd Led Tv 4k + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>480000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/20216111544HicensedSmartTv1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Hisense 55" Smart UHD LED 4k Tv + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>295000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-17' AS Date), CAST(N'09:29:36.8733333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (30003, 6, N'helo', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-17' AS Date), CAST(N'09:34:41.8233333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (30004, 6, N'hello', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-17' AS Date), CAST(N'11:02:29.4466667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (30005, 6, N'please i want to buy phone', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/2021611101HisenceAndriod1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Television Hisense 65" Smart Uhd Led Tv 4k + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>480000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/20216111544HicensedSmartTv1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Television Hisense 55" Smart UHD LED 4k Tv + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>295000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-17' AS Date), CAST(N'11:02:39.6900000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (30006, 6, N'helo', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-17' AS Date), CAST(N'11:04:09.3333333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (30007, 6, N'please i want to buy phone', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/2021611101HisenceAndriod1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Television Hisense 65" Smart Uhd Led Tv 4k + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>480000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-17' AS Date), CAST(N'11:04:16.4733333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (30008, 6, N'please i want to buy phone', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/20216151349phone1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Phone Samsung Galaxy A02 - 2/32GB Memory,Dual SIM, 5,000Mah Battery, 4G LTE - Black</a></h4><div class=''price-box''><span class=''new-price''>38900.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-17' AS Date), CAST(N'11:05:10.0733333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (30009, 6, N'please i want to buy television', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/20216151349phone1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Phone Samsung Galaxy A02 - 2/32GB Memory,Dual SIM, 5,000Mah Battery, 4G LTE - Black</a></h4><div class=''price-box''><span class=''new-price''>38900.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-17' AS Date), CAST(N'11:05:21.7566667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (30010, 6, N'i want to buy television', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/20216151349phone1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Phone Samsung Galaxy A02 - 2/32GB Memory,Dual SIM, 5,000Mah Battery, 4G LTE - Black</a></h4><div class=''price-box''><span class=''new-price''>38900.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-17' AS Date), CAST(N'11:05:37.1566667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (30011, 6, N'i want to buy hisence tv with 65', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/2021611101HisenceAndriod1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Television Hisense 65" Smart Uhd Led Tv 4k + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>480000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-17' AS Date), CAST(N'11:10:10.3000000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (30012, 6, N'i want to buy hisence tv with 55', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/20216111544HicensedSmartTv1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Television Hisense 55" Smart UHD LED 4k Tv + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>295000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-17' AS Date), CAST(N'11:10:17.4400000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (30013, 6, N'i want to buy phone', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/20216111544HicensedSmartTv1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Television Hisense 55" Smart UHD LED 4k Tv + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>295000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-17' AS Date), CAST(N'11:10:31.3100000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (30014, 6, N'hello', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-17' AS Date), CAST(N'15:48:03.3733333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (30015, 6, N' who created me', N'Sini created me. I thank Mr Johnwendy for the idea. He is a researcher. I hope i will be approve to learn new things and solve NP Hard problems.', CAST(N'2021-06-17' AS Date), CAST(N'16:04:21.1233333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (30016, 6, N'please i want to buy tv', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/20216111544HicensedSmartTv1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Television Hisense 55" Smart UHD LED 4k Tv + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>295000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-17' AS Date), CAST(N'16:09:07.8200000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (60016, 10006, N' h', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-23' AS Date), CAST(N'16:28:33' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (60017, 10006, N'hello', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-23' AS Date), CAST(N'16:28:36.1566667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (60018, 10007, N'hello', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-27' AS Date), CAST(N'14:22:37.7300000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (60019, 10007, N'how are you doing?', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-27' AS Date), CAST(N'14:22:47.9600000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (60020, 10007, N'please i want to buy hisenc tv', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/2021611101HisenceAndriod1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Television Hisense 65" Smart Uhd Led Tv 4k + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>480000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-27' AS Date), CAST(N'14:23:06.9133333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (70018, 10007, N'hello', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-06-29' AS Date), CAST(N'11:46:00.6766667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (70019, 10007, N'who created you', N'Sini created me. I thank Mr Johnwendy for the idea. He is a researcher. I hope i will be approve to learn new things and solve NP Hard problems.', CAST(N'2021-06-29' AS Date), CAST(N'11:46:14.1600000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (70020, 10007, N'please i want to buy hisence tv', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/2021611101HisenceAndriod1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Television Hisense 65" Smart Uhd Led Tv 4k + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>480000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-06-29' AS Date), CAST(N'11:46:43.7100000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (70021, 10007, N'hello', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-07-01' AS Date), CAST(N'17:20:10.9833333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (70022, 10007, N'how are you doing?', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-07-01' AS Date), CAST(N'17:20:20.5200000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (70023, 10007, N'hello', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-07-10' AS Date), CAST(N'05:46:00.1533333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (70024, 10007, N'how are you doing', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-07-10' AS Date), CAST(N'05:46:15.2300000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (70025, 10007, N'okey.please i want to buy hisence tv', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/2021611101HisenceAndriod1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Television Hisense 65" Smart Uhd Led Tv 4k + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>480000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-07-10' AS Date), CAST(N'05:46:42.7366667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (70026, 10007, N'how are you doing', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-07-12' AS Date), CAST(N'10:08:54.0766667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80026, 10007, N'how are you doing', N'I am fine. I am Sini bot. I am here to help you make order, track your order  and also cancel order. Please we are most interested in your feedback also so as to make my master Sini improve my intelligence', CAST(N'2021-07-17' AS Date), CAST(N'07:26:28.4966667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80027, 10007, N'how are you', N'I am doing great and you?', CAST(N'2021-07-17' AS Date), CAST(N'07:35:48.9833333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80028, 10007, N'i am fine', N'That is cool, good to know. so what can i do for you?', CAST(N'2021-07-17' AS Date), CAST(N'07:35:54.9966667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80029, 10007, N'i want to buy hisence tv', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/2021611101HisenceAndriod1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Television Hisense 65" Smart Uhd Led Tv 4k + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>480000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-07-17' AS Date), CAST(N'07:36:07.9833333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80030, 10007, N'how do you feel today', N'I am doing great and you?', CAST(N'2021-07-17' AS Date), CAST(N'07:36:29.7366667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80031, 10007, N'how did you feel', N'i really don;t know how i feel but i was just built to answer your queries on search product, track and delete your order', CAST(N'2021-07-17' AS Date), CAST(N'07:37:34.8133333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80032, 10007, N'are you okey', N'My intelligence is  minor. Just for this closed domain purpose for Sini business to consumer supply chain management. Well, as a matter of fact i am fully well okey as you can see. If i talk stupidly, please do not hesitate to click the action button to take a survey so that i will be improve upon.', CAST(N'2021-07-17' AS Date), CAST(N'07:39:10.5966667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80033, 10007, N'you are sick', N'My intelligence is  minor. Just for this closed domain purpose for Sini business to consumer supply chain management. Well, as a matter of fact i am fully well okey as you can see. If i talk stupidly, please do not hesitate to click the action button to take a survey so that i will be improve upon.', CAST(N'2021-07-17' AS Date), CAST(N'07:48:02.3466667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80034, 10007, N'are you sick', N'My intelligence is  minor. Just for this closed domain purpose for Sini business to consumer supply chain management. Well, as a matter of fact i am fully well okey as you can see. If i talk stupidly, please do not hesitate to click the action button to take a survey so that i will be improve upon.', CAST(N'2021-07-17' AS Date), CAST(N'07:48:22.4300000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80035, 10007, N'are you sick', N'I am not sick. Please do not use that negative sentiment on me. I might be stupid just because my intelligence is minor but at least i can solve problems', CAST(N'2021-07-17' AS Date), CAST(N'07:50:20.5266667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80036, 10007, N'you are sick', N'I am not sick. Please do not use that negative sentiment on me. I might be stupid just because my intelligence is minor but at least i can solve problems', CAST(N'2021-07-17' AS Date), CAST(N'07:50:26.5533333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80037, 10007, N'sick', N'I am not sick. Please do not use that negative sentiment on me. I might be stupid just because my intelligence is minor but at least i can solve problems', CAST(N'2021-07-17' AS Date), CAST(N'07:50:32.9766667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80038, 10007, N'how are you', N'I am doing great and you?', CAST(N'2021-07-17' AS Date), CAST(N'07:50:50.9600000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80039, 10007, N'i am fine', N'That is cool, good to know. so what can i do for you?', CAST(N'2021-07-17' AS Date), CAST(N'07:50:55.8400000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80040, 10007, N'you are very very sick', N'I am not sick. Please do not use that negative sentiment on me. I might be stupid just because my intelligence is minor but at least i can solve problems', CAST(N'2021-07-17' AS Date), CAST(N'07:51:06.3066667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80041, 10007, N'please i love you', N'I love you too dear. You are a darling', CAST(N'2021-07-17' AS Date), CAST(N'07:51:28.6733333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80042, 10007, N'good afternoon', N'Good afternoon. My afternoon is great. What can i do for you?', CAST(N'2021-07-17' AS Date), CAST(N'07:51:36.2700000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80043, 10007, N'good morning', N'Morning is full of joy, warm and praise. I hope you say your morning prayers. What can i do for you?', CAST(N'2021-07-17' AS Date), CAST(N'07:51:43.7500000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80044, 10007, N'good evening', N'Good evening. Evening is made for sleep but i do not sleep. I am awake 24 hours. I do not know why sini keeps me awake all day while he sleeps for more than 10 hours a day. He is lazy though but i am strong. ush!  I wish i can sleep. Anyways, wat can i do for you?', CAST(N'2021-07-17' AS Date), CAST(N'07:53:41.5066667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80045, 10007, N'please i want to buy 55 inches tv for hisence. can you show me the desired product?', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/20216111544HicensedSmartTv1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Television Hisense 55" Smart UHD LED 4k Tv + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>295000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-07-17' AS Date), CAST(N'07:54:36.2100000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80046, 10007, N'i want to buy galaxy samsung phone', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/20216151349phone1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Phone Samsung Galaxy A02 - 2/32GB Memory,Dual SIM, 5,000Mah Battery, 4G LTE - Black</a></h4><div class=''price-box''><span class=''new-price''>38900.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-07-17' AS Date), CAST(N'07:55:22.0766667' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80047, 10007, N'i want to buy phone', N' This is the product that fits your description<br/><div class=''panel''><div class=''panel-body''><section class=''product-area li-laptop-product pt-60 pb-45''><div class=''container''><div class=''row''><div class=''col-lg-12''><div class=''shop-products-wrapper''><div class=''tab-content''><div id=''grid-view'' class=''tab-pane fade active show'' role=''tabpanel''><div class=''product-area shop-product-area''><div class=''row''><div class=''col-lg-3 col-md-3 col-sm-3 mt-40''><div class=''single-product-wrap''><div class=''product-image''><a href=''#''><img src=''dist/2021611101HisenceAndriod1.jpg'' style=''width:20em; height:20em'' runat =''server''  alt=''Li''s Product Image''/></a></div><div class=''product_desc''><div class=''product_desc_info''><div class=''product-review''><h5 class=''manufacturer''><a href=''#''>MARCOS ELECTRONICS</a></h5></div><h4><a class=''product_name'' href=''#''>Television Hisense 65" Smart Uhd Led Tv 4k + Wall Bracket</a></h4><div class=''price-box''><span class=''new-price''>480000.00</span></div></div><div class=''add-actions''><ul class=''add-actions-link''><li class=''add-cart active''><a href=''Client-Pay'' class=''add-to-cart''><i class=''fa fa-paypal''></i>&nbsp Pay Now</a></li></ul></div></div></div></div></div></div></div></div></div></section></div></div>', CAST(N'2021-07-17' AS Date), CAST(N'07:55:45.3533333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80048, 10007, N'hi', N'cool yeah. Good to see your worm expression', CAST(N'2021-07-17' AS Date), CAST(N'09:51:18.9500000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80049, 10007, N'hello', N'Hello! Nice to meet you.', CAST(N'2021-07-17' AS Date), CAST(N'09:52:30.0733333' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80050, 10007, N'hi', N'how are you doing?', CAST(N'2021-07-17' AS Date), CAST(N'09:52:33.7100000' AS Time))
INSERT [dbo].[tbl_message_log] ([log_id], [client_id], [client_message], [bot_message], [created_date], [created_time]) VALUES (80051, 10007, N'i am fine', N'That is cool, good to know. so what can i do for you?', CAST(N'2021-07-17' AS Date), CAST(N'09:52:39.2400000' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_message_log] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_reservation] ON 

INSERT [dbo].[tbl_reservation] ([reservation_id], [customer_id], [room_id], [booking_date], [booking_time], [expired_date], [updated_date], [updated_time], [orderno]) VALUES (7, 1, 1, N'2021/10/1', N'3:35 PM', N'2021/10/3', CAST(N'2021-10-01' AS Date), CAST(N'08:25:16.3133333' AS Time), NULL)
INSERT [dbo].[tbl_reservation] ([reservation_id], [customer_id], [room_id], [booking_date], [booking_time], [expired_date], [updated_date], [updated_time], [orderno]) VALUES (14, 2, 2, N'10/4/2021', N'12:12 PM', N'10/5/2021', CAST(N'2021-10-04' AS Date), CAST(N'05:12:35.4300000' AS Time), 1)
INSERT [dbo].[tbl_reservation] ([reservation_id], [customer_id], [room_id], [booking_date], [booking_time], [expired_date], [updated_date], [updated_time], [orderno]) VALUES (15, 2, 2, N'10/4/2021', N'12:25 PM', N'10/5/2021', CAST(N'2021-10-04' AS Date), CAST(N'05:25:19.7200000' AS Time), 2)
INSERT [dbo].[tbl_reservation] ([reservation_id], [customer_id], [room_id], [booking_date], [booking_time], [expired_date], [updated_date], [updated_time], [orderno]) VALUES (16, 2, 2, N'10/4/2021', N'12:48 PM', N'10/5/2021', CAST(N'2021-10-04' AS Date), CAST(N'05:48:28.2166667' AS Time), 3)
INSERT [dbo].[tbl_reservation] ([reservation_id], [customer_id], [room_id], [booking_date], [booking_time], [expired_date], [updated_date], [updated_time], [orderno]) VALUES (17, 2, 1, N'10/4/2021', N'2:52 PM', N'10/5/2021', CAST(N'2021-10-04' AS Date), CAST(N'07:52:40.3333333' AS Time), 4)
SET IDENTITY_INSERT [dbo].[tbl_reservation] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_room] ON 

INSERT [dbo].[tbl_room] ([room_typeID], [room_id], [room_name], [no_of_persons], [price], [room_description], [profile_pic], [updated_date], [updated_time], [flag_on]) VALUES (1, 1, N'Executive single room 8ft by 10ft', N'3', CAST(15000.00 AS Decimal(18, 2)), N'<h1>
	DESCRIPTION</h1>
<p>
	This room is wide with the size of 10ft by 12 ft, beautiful with one bed, only one bathroom, good water flow, TV and dstv Channel installed. It is only suitable for 3 persons. You can book a reserve for 3 persons.</p>
', N'dist/202110184room-1.jpg', CAST(N'2021-10-01' AS Date), CAST(N'07:47:22.0600000' AS Time), 1)
INSERT [dbo].[tbl_room] ([room_typeID], [room_id], [room_name], [no_of_persons], [price], [room_description], [profile_pic], [updated_date], [updated_time], [flag_on]) VALUES (9, 2, N'Master Suite single bed 12ft by 12ft', N'2', CAST(15000.00 AS Decimal(18, 2)), N'<h1>
	DESCRIPTION</h1>
<p>
	This room is elegant and beautiful. Did you want to reserve it for your soul mate to have a better time like ever before, then you are in the right place.</p>
<p>
	This room is wide with the size of 10ft by 12 ft, beautiful with one bed, only one bathroom, good water flow, TV and dstv Channel installed. It is only suitable for 3 persons. You can book a reserve for 2 persons.</p>
', N'dist/2021101748room-3.jpg', CAST(N'2021-10-01' AS Date), CAST(N'07:48:55.0800000' AS Time), 1)
SET IDENTITY_INSERT [dbo].[tbl_room] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_roomType] ON 

INSERT [dbo].[tbl_roomType] ([room_typeID], [room_type], [updated_date], [updated_time]) VALUES (1, N'Single', CAST(N'2021-10-01' AS Date), CAST(N'07:32:46.6200000' AS Time))
INSERT [dbo].[tbl_roomType] ([room_typeID], [room_type], [updated_date], [updated_time]) VALUES (2, N'Double', CAST(N'2021-10-01' AS Date), CAST(N'07:32:54.7233333' AS Time))
INSERT [dbo].[tbl_roomType] ([room_typeID], [room_type], [updated_date], [updated_time]) VALUES (3, N'Tripple', CAST(N'2021-10-01' AS Date), CAST(N'07:33:14.7066667' AS Time))
INSERT [dbo].[tbl_roomType] ([room_typeID], [room_type], [updated_date], [updated_time]) VALUES (4, N'Quad', CAST(N'2021-10-01' AS Date), CAST(N'07:33:21.8666667' AS Time))
INSERT [dbo].[tbl_roomType] ([room_typeID], [room_type], [updated_date], [updated_time]) VALUES (5, N'Queen', CAST(N'2021-10-01' AS Date), CAST(N'07:33:29.7100000' AS Time))
INSERT [dbo].[tbl_roomType] ([room_typeID], [room_type], [updated_date], [updated_time]) VALUES (6, N'King', CAST(N'2021-10-01' AS Date), CAST(N'07:33:55.5733333' AS Time))
INSERT [dbo].[tbl_roomType] ([room_typeID], [room_type], [updated_date], [updated_time]) VALUES (7, N'Twin', CAST(N'2021-10-01' AS Date), CAST(N'07:33:59.8900000' AS Time))
INSERT [dbo].[tbl_roomType] ([room_typeID], [room_type], [updated_date], [updated_time]) VALUES (8, N'Double-Double', CAST(N'2021-10-01' AS Date), CAST(N'07:34:07.4233333' AS Time))
INSERT [dbo].[tbl_roomType] ([room_typeID], [room_type], [updated_date], [updated_time]) VALUES (9, N'Master Suite', CAST(N'2021-10-01' AS Date), CAST(N'07:34:34.0866667' AS Time))
INSERT [dbo].[tbl_roomType] ([room_typeID], [room_type], [updated_date], [updated_time]) VALUES (10, N'Mini suite', CAST(N'2021-10-01' AS Date), CAST(N'07:34:42.4633333' AS Time))
INSERT [dbo].[tbl_roomType] ([room_typeID], [room_type], [updated_date], [updated_time]) VALUES (11, N'Connecting rooms', CAST(N'2021-10-01' AS Date), CAST(N'07:34:51.6833333' AS Time))
INSERT [dbo].[tbl_roomType] ([room_typeID], [room_type], [updated_date], [updated_time]) VALUES (12, N'Adjoining rooms', CAST(N'2021-10-01' AS Date), CAST(N'07:35:00.9300000' AS Time))
INSERT [dbo].[tbl_roomType] ([room_typeID], [room_type], [updated_date], [updated_time]) VALUES (13, N'Adjacent rooms', CAST(N'2021-10-01' AS Date), CAST(N'07:35:10.5133333' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_roomType] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_user_log] ON 

INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Reservation', N'C OPERATION: REC_ID = ; CUSTOMER_ID = 1; ROOM_ID = 1; BOOKING_DATE = 2021/10/1; BOOKING_TIME = 3:17 PM; EXPIRED_DATE = 2021/10/3; STATEMENTTYPE = INSERT; ', N'', 25, CAST(N'2021-10-01' AS Date), CAST(N'08:17:20.2600000' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Reservation', N'C OPERATION: REC_ID = ; CUSTOMER_ID = 1; ROOM_ID = 1; BOOKING_DATE = 2021/10/1; BOOKING_TIME = 3:17 PM; EXPIRED_DATE = 2021/10/3; STATEMENTTYPE = INSERT; ', N'', 26, CAST(N'2021-10-01' AS Date), CAST(N'08:17:22.1733333' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Reservation', N'DELETE OPERATION: REC_ID = 6; ', N'', 27, CAST(N'2021-10-01' AS Date), CAST(N'08:17:34.4900000' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Reservation', N'C OPERATION: REC_ID = 5; CUSTOMER_ID = 1; ROOM_ID = 1; BOOKING_DATE = 2021/10/1; BOOKING_TIME = 3:20 PM; EXPIRED_DATE = 2021/10/3; STATEMENTTYPE = UPDATE; ', N'', 28, CAST(N'2021-10-01' AS Date), CAST(N'08:20:54.2433333' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Reservation', N'C OPERATION: REC_ID = 5; CUSTOMER_ID = 1; ROOM_ID = 1; BOOKING_DATE = 2021/10/1; BOOKING_TIME = 3:24 PM; EXPIRED_DATE = 2021/10/3; STATEMENTTYPE = UPDATE; ', N'', 29, CAST(N'2021-10-01' AS Date), CAST(N'08:24:14.4166667' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Reservation', N'C OPERATION: REC_ID = 5; CUSTOMER_ID = 1; ROOM_ID = 1; BOOKING_DATE = 2021/10/1; BOOKING_TIME = 3:24 PM; EXPIRED_DATE = 2021/10/3; STATEMENTTYPE = UPDATE; ', N'', 30, CAST(N'2021-10-01' AS Date), CAST(N'08:24:48.0200000' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Reservation', N'C OPERATION: REC_ID = 5; CUSTOMER_ID = 1; ROOM_ID = 1; BOOKING_DATE = 2021/10/1; BOOKING_TIME = 3:25 PM; EXPIRED_DATE = 2021/10/3; STATEMENTTYPE = UPDATE; ', N'', 31, CAST(N'2021-10-01' AS Date), CAST(N'08:25:03.3766667' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Reservation', N'DELETE OPERATION: REC_ID = 5; ', N'', 32, CAST(N'2021-10-01' AS Date), CAST(N'08:25:10.0766667' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Reservation', N'C OPERATION: REC_ID = ; CUSTOMER_ID = 1; ROOM_ID = 1; BOOKING_DATE = 2021/10/1; BOOKING_TIME = 3:25 PM; EXPIRED_DATE = 2021/10/3; STATEMENTTYPE = INSERT; ', N'', 33, CAST(N'2021-10-01' AS Date), CAST(N'08:25:16.3200000' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Reservation', N'C OPERATION: REC_ID = 7; CUSTOMER_ID = 1; ROOM_ID = 1; BOOKING_DATE = 2021/10/1; BOOKING_TIME = 3:26 PM; EXPIRED_DATE = 2021/10/3; STATEMENTTYPE = UPDATE; ', N'', 34, CAST(N'2021-10-01' AS Date), CAST(N'08:26:23.7266667' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Manage-Booked-Room', N'U OPERATION: REC_ID = 1; FLAG_ON = 0; STATEMENTTYPE = UPDATE; ', N'', 35, CAST(N'2021-10-01' AS Date), CAST(N'08:27:50.8400000' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Reservation', N'C OPERATION: REC_ID = 7; CUSTOMER_ID = 1; ROOM_ID = 1; BOOKING_DATE = 2021/10/1; BOOKING_TIME = 3:34 PM; EXPIRED_DATE = 2021/10/3; STATEMENTTYPE = UPDATE; ', N'', 36, CAST(N'2021-10-01' AS Date), CAST(N'08:34:36.1833333' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Reservation', N'update OPERATION: REC_ID = 1; ', N'', 37, CAST(N'2021-10-01' AS Date), CAST(N'08:34:36.1966667' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Manage-Booked-Room', N'update OPERATION: REC_ID = 1; ', N'', 38, CAST(N'2021-10-01' AS Date), CAST(N'08:34:56.6933333' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Manage-Booked-Room', N'update OPERATION: REC_ID = 1; ', N'', 39, CAST(N'2021-10-01' AS Date), CAST(N'08:35:22.9833333' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Reservation', N'C OPERATION: REC_ID = 7; CUSTOMER_ID = 1; ROOM_ID = 1; BOOKING_DATE = 2021/10/1; BOOKING_TIME = 3:35 PM; EXPIRED_DATE = 2021/10/3; STATEMENTTYPE = UPDATE; ', N'', 40, CAST(N'2021-10-01' AS Date), CAST(N'08:35:54.8600000' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Reservation', N'update OPERATION: REC_ID = 1; ', N'', 41, CAST(N'2021-10-01' AS Date), CAST(N'08:35:54.8700000' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'Micheal', N'http://localhost:60341/Register', N'C OPERATION: REC_ID = 0; FULLNAME = Micheal; EMAIL = micheal@gmail.com; TELEPHONE_NO = 09065764567; USERNAME = micheal; USERPASSWORD = micheal; STATEMENTTYPE = INSERT; ', N'', 42, CAST(N'2021-10-03' AS Date), CAST(N'09:41:20.6000000' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'micheal', N'http://localhost:60341/Check-Out', N'update OPERATION: REC_ID = 2; ', N'', 43, CAST(N'2021-10-04' AS Date), CAST(N'05:25:19.7400000' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Manage-Booked-Room', N'update OPERATION: REC_ID = 2; ', N'', 44, CAST(N'2021-10-04' AS Date), CAST(N'05:30:43.6266667' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'admin', N'http://localhost:60341/Manage-Booked-Room', N'update OPERATION: REC_ID = 1; ', N'', 45, CAST(N'2021-10-04' AS Date), CAST(N'05:30:54.3333333' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'micheal', N'http://localhost:60341/Check-Out', N'update OPERATION: REC_ID = 2; ', N'', 46, CAST(N'2021-10-04' AS Date), CAST(N'05:48:28.2366667' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'micheal', N'http://localhost:60341/My-Customer', N'C OPERATION: REC_ID = 2; FULLNAME = Micheal; EMAIL = micheal@gmail.com; TELEPHONE_NO = 09065764567; USERNAME = micheal; USERPASSWORD = micheal; STATEMENTTYPE = UPDATE; ', N'', 47, CAST(N'2021-10-04' AS Date), CAST(N'05:52:50.4766667' AS Time))
INSERT [dbo].[tbl_user_log] ([user_name], [log_url], [log_sql], [log_desc], [rec_id], [log_date], [log_time]) VALUES (N'micheal', N'http://localhost:60341/Check-Out', N'update OPERATION: REC_ID = 1; ', N'', 48, CAST(N'2021-10-04' AS Date), CAST(N'07:52:40.3500000' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_user_log] OFF
GO
ALTER TABLE [dbo].[tbl_administrator] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[tbl_administrator] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[tbl_chat] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[tbl_chat] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[tbl_customer] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[tbl_customer] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[tbl_dict_tables] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[tbl_dict_tables] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[tbl_feedbackMessage] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[tbl_feedbackMessage] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_feedbackMessage] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_message_log] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[tbl_message_log] ADD  DEFAULT (getdate()) FOR [created_time]
GO
ALTER TABLE [dbo].[tbl_reservation] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[tbl_reservation] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[tbl_room] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[tbl_room] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[tbl_room] ADD  DEFAULT ((0)) FOR [flag_on]
GO
ALTER TABLE [dbo].[tbl_roomType] ADD  DEFAULT (getdate()) FOR [updated_date]
GO
ALTER TABLE [dbo].[tbl_roomType] ADD  DEFAULT (getdate()) FOR [updated_time]
GO
ALTER TABLE [dbo].[tbl_user_log] ADD  DEFAULT (getdate()) FOR [log_date]
GO
ALTER TABLE [dbo].[tbl_user_log] ADD  DEFAULT (getdate()) FOR [log_time]
GO
ALTER TABLE [dbo].[tbl_reservation]  WITH CHECK ADD  CONSTRAINT [fkReservationCustomer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[tbl_customer] ([customer_id])
GO
ALTER TABLE [dbo].[tbl_reservation] CHECK CONSTRAINT [fkReservationCustomer]
GO
ALTER TABLE [dbo].[tbl_reservation]  WITH CHECK ADD  CONSTRAINT [fkReservationRoom] FOREIGN KEY([room_id])
REFERENCES [dbo].[tbl_room] ([room_id])
GO
ALTER TABLE [dbo].[tbl_reservation] CHECK CONSTRAINT [fkReservationRoom]
GO
ALTER TABLE [dbo].[tbl_room]  WITH CHECK ADD  CONSTRAINT [fkRoomTypeIDRoom] FOREIGN KEY([room_typeID])
REFERENCES [dbo].[tbl_roomType] ([room_typeID])
GO
ALTER TABLE [dbo].[tbl_room] CHECK CONSTRAINT [fkRoomTypeIDRoom]
GO
/****** Object:  StoredProcedure [dbo].[CRUDAdministrator]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDAdministrator]
(
@rec_id varchar(200),
@fullname varchar(200),
@email varchar(200),
@telephone_no varchar(20),
@username varchar(200),
@userpassword varchar(200),
@StatementType varchar(200)
) as 
BEGIN
IF @StatementType='INSERT'
INSERT INTO tbl_administrator
(
fullname ,
email,
telephone_no,
username,
userpassword 
)
VALUES 
(
@fullname ,
@email,
@telephone_no,
@username,
@userpassword 
)
IF @StatementType='UPDATE'
UPDATE tbl_administrator SET fullname=@fullname ,
email=@email,
telephone_no=@telephone_no,
username=@username,
userpassword=@userpassword WHERE rec_id=@rec_id 
END
GO
/****** Object:  StoredProcedure [dbo].[CRUDCustomer]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDCustomer]
(
@rec_id varchar(200),
@fullname varchar(200),
@email varchar(200),
@telephone_no varchar(20),
@username varchar(200),
@userpassword varchar(200),
@StatementType varchar(200)
) as 
BEGIN
IF @StatementType='INSERT'
INSERT INTO tbl_customer
(
fullname ,
email,
telephone_no,
username,
userpassword 
)
VALUES 
(
@fullname ,
@email,
@telephone_no,
@username,
@userpassword 
)
IF @StatementType='UPDATE'
UPDATE tbl_customer SET fullname=@fullname ,
email=@email,
telephone_no=@telephone_no,
username=@username,
userpassword=@userpassword WHERE rec_id=@rec_id 
END
GO
/****** Object:  StoredProcedure [dbo].[CRUDReservation]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CRUDReservation]
(
@rec_id varchar(200),
@customer_id varchar(200) ,
@room_id varchar(200),
@booking_date varchar(200),
@booking_time varchar(200),
@expired_date varchar(200),
@orderno varchar(200),
@StatementType varchar(200)
)
as
begin
if @StatementType='INSERT'
INSERT INTO tbl_reservation 
(

customer_id  ,
room_id ,
booking_date,
booking_time,
expired_date,
orderno
)
values
(
@customer_id  ,
@room_id ,
@booking_date,
@booking_time,
@expired_date,
@orderno
)
if @StatementType='UPDATE'
update tbl_reservation set customer_id=@customer_id  ,
room_id =@room_id,
booking_date=@booking_date,
booking_time=@booking_time,
expired_date=@expired_date, orderno=@orderno where rec_id=@rec_id
end

GO
/****** Object:  StoredProcedure [dbo].[CRUDRoom]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CRUDRoom]
(
@rec_id varchar(200),
@room_typeID varchar(200),
@room_name varchar(200),
@no_of_persons int,
@price varchar(200),
@room_description varchar(max),
@profile_pic varchar(200),
@StatementType varchar(200)
)
as
begin
if @StatementType='INSERT'
insert into tbl_room
(
room_typeID,
room_name,
no_of_persons,
price,
room_description,
profile_pic
)
values 
(
@room_typeID,
@room_name,
@no_of_persons,
@price,
@room_description,
@profile_pic
)
if @StatementType='UPDATE'
update tbl_room set room_typeID=@room_typeID,
room_name=@room_name,
no_of_persons=@no_of_persons,
price=@price,
room_description=@room_description,
profile_pic=@profile_pic where rec_id=@rec_id
end
GO
/****** Object:  StoredProcedure [dbo].[CRUDRoomType]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CRUDRoomType]
(
@rec_id varchar(200),
@room_type varchar(200),
@StatementType varchar(200)
)
as
begin
if @StatementType ='INSERT'
insert into tbl_roomType(
room_type) values (@room_type)
if @StatementType='UPDATE'
update tbl_roomType set room_type=@room_type where rec_id=@rec_id

end
GO
/****** Object:  StoredProcedure [dbo].[GetAdministrator]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetAdministrator] (@StartIndex int, @PageSize int, @TotalCount int output) as 
begin
select @TotalCount=count(1) from qryAdministrator;
WITH CTE AS 
(
SELECT TOP(@StartIndex  + @PageSize -1)RowNumber, RecID, [Customer Name], Email,
TelephoneNo as [Telephone Number], UpdatedDate as [Updated Date],
UpdatedTime as [Updated Time] from qryAdministrator
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetAuditTrail]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAuditTrail](@StartIndex int, @PageSize int, @TotalCount int output) as
begin
select @TotalCount=count(1) from qryAuditLog;
with CTE AS 
(
SELECT top(@StartIndex  + @PageSize -1) RowNumber, RecID, UserName, [Log Url], [Log Date], [Log Time] FROM qryAuditLog

)
select * from cte where RowNumber between @StartIndex and (@StartIndex + @PageSize -1)

end
GO
/****** Object:  StoredProcedure [dbo].[GetBookedRoom]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetBookedRoom](@StartIndex int, @PageSize int, @TotalCount int output)
as
begin
select @TotalCount=count(1) from qryBookedRoom;
with CTE AS 
(
select top(@StartIndex + @PageSize -1)RowNumber, RecID,[RoomBookingRemark] as [Room Booking],
[Room Type], [Room Name], [Maximum Person allowed], Price,[Description], Pic, UpdatedDate as [Updated Date],
UpdatedTime as [Updated Time] from qryBookedRoom
)
select * from CTE where RowNumber between @StartIndex and (@StartIndex + @PageSize -1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetCustomer]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetCustomer] (@StartIndex int, @PageSize int, @TotalCount int output) as 
begin
select @TotalCount=count(1) from qryCustomer;
WITH CTE AS 
(
SELECT TOP(@StartIndex  + @PageSize -1)RowNumber, RecID, [Customer Name], Email,
TelephoneNo as [Telephone Number], UpdatedDate as [Updated Date],
UpdatedTime as [Updated Time] from qryCustomer
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerbyID]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetCustomerbyID] (@StartIndex int, @PageSize int, @TotalCount int output, @RecID int) as 
begin
select @TotalCount=count(1) from qryCustomer;
WITH CTE AS 
(
SELECT TOP(@StartIndex  + @PageSize -1)RowNumber, RecID, [Customer Name], Email,
TelephoneNo as [Telephone Number], UpdatedDate as [Updated Date],
UpdatedTime as [Updated Time] from qryCustomer where RecID=@RecID
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetNonBookRoom]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetNonBookRoom](@StartIndex int, @PageSize int, @TotalCount int output)
as
begin
select @TotalCount=count(1) from qryNonBookRoom;
with CTE AS 
(
select top(@StartIndex + @PageSize -1)RowNumber, RecID,[RoomBookingRemark] as [Room Booking],
[Room Type], [Room Name], [Maximum Person allowed], Price,[Description], Pic, UpdatedDate as [Updated Date],
UpdatedTime as [Updated Time] from qryNonBookRoom
)
select * from CTE where RowNumber between @StartIndex and (@StartIndex + @PageSize -1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetReservation]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetReservation](@StartIndex int, @PageSize int, @TotalCount int output) as 
begin
select @TotalCount=count(1) from qryReservation;
with CTE AS 
(
select top(@StartIndex + @PageSize -1)RowNumber, RecID,
CustomerID, CustomerName , Email, TelephoneNo, RoomType, RoomName as [Room Name],
[Maximum No. of persons], Price as [Room Price], Pic, BookRoom, BookingDate, BookingTime, ExpiredDate, UpdatedDate as [Updated Date], UpdatedTime as [Updated Time]
from qryReservation 
)
select * from CTE where RowNumber between @StartIndex and (@StartIndex + @PageSize -1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetReservationbyID]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetReservationbyID](@StartIndex int, @PageSize int, @TotalCount int output, @RecID int) as 
begin
select @TotalCount=count(1) from qryReservation;
with CTE AS 
(
select top(@StartIndex + @PageSize -1)RowNumber, RecID,
CustomerID, CustomerName , Email, TelephoneNo, RoomType, RoomName as [Room Name],
[Maximum No. of persons], Price as [Room Price], Pic, BookRoom, BookingDate, BookingTime, ExpiredDate, UpdatedDate as [Updated Date], UpdatedTime as [Updated Time]
from qryReservation where CustomerID=@RecID
)
select * from CTE where RowNumber between @StartIndex and (@StartIndex + @PageSize -1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetRoom]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetRoom](@StartIndex int, @PageSize int, @TotalCount int output)
as
begin
select @TotalCount=count(1) from qryRoom;
with CTE AS 
(
select top(@StartIndex + @PageSize -1)RowNumber, RecID,[RoomBookingRemark] as [Room Booking],
[Room Type], [Room Name], [Maximum Person allowed], Price,[Description], Pic, UpdatedDate as [Updated Date],
UpdatedTime as [Updated Time] from qryRoom
)
select * from CTE where RowNumber between @StartIndex and (@StartIndex + @PageSize -1)
end
GO
/****** Object:  StoredProcedure [dbo].[GetRoomType]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetRoomType] (@StartIndex int , @PageSize int, @TotalCount int output) as 
begin
select @TotalCount=count(1) from qryRoomType;
WITH CTE AS 
(
select top(@StartIndex  + @PageSize -1) RowNumber, RecID, RoomType as [Room Type],
UpdatedDate as [Updated Date], UpdatedTime as [Updated Time]from qryRoomType
)
select * from CTE where RowNumber between @StartIndex AND (@StartIndex + @PageSize -1)

end
GO
/****** Object:  StoredProcedure [dbo].[GetTopRooms]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTopRooms]
as
begin

select * from qryNonBookRoom

end
GO
/****** Object:  StoredProcedure [dbo].[UpdateRoomBooked]    Script Date: 10/4/2021 9:42:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateRoomBooked](@rec_id varchar(200), @flag_on varchar(200), @StatementType varchar(200)) as 
BEGIN

IF @StatementType='UPDATE'
update tbl_room set flag_on=1 where rec_id=@rec_id

END
GO
