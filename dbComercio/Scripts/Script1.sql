USE [DB_pruebas]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 24/06/2021 22:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[DNI] [char](10) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Apellido] [varchar](30) NOT NULL,
 CONSTRAINT [PK_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONTROL_PERSONA]    Script Date: 24/06/2021 22:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTROL_PERSONA](
	[IdRegistro] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[IdUbicacion] [nvarchar](50) NOT NULL,
	[IdTipoEnfermedad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CONTROL_PERSONA] PRIMARY KEY CLUSTERED 
(
	[IdRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COTIZACION]    Script Date: 24/06/2021 22:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COTIZACION](
	[IdRegistro] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[IdUbicacion] [nvarchar](50) NOT NULL,
	[IdTipoEnfermedad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.COTIZACION] PRIMARY KEY CLUSTERED 
(
	[IdRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inventarios]    Script Date: 24/06/2021 22:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventarios](
	[NroProducto] [numeric](4, 0) NOT NULL,
	[Descripcion] [nvarchar](100) NOT NULL,
	[Cantidad] [numeric](8, 0) NOT NULL,
 CONSTRAINT [PK_Inventarios] PRIMARY KEY CLUSTERED 
(
	[NroProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 24/06/2021 22:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pedidos](
	[npedido] [numeric](4, 0) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[NroProducto] [numeric](4, 0) NOT NULL,
	[cantidad] [numeric](8, 0) NOT NULL,
	[monto] [money] NOT NULL,
	[Cliente_dni] [char](10) NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[npedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 24/06/2021 22:45:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[NroProducto] [numeric](4, 0) NOT NULL,
	[NombreProducto] [varchar](50) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[CantidadStock] [numeric](8, 0) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[NroProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CLIENTE] ([DNI], [Nombre], [Apellido]) VALUES (N'12345-45  ', N'MARTHA', N'GOMEZ')
GO
INSERT [dbo].[CLIENTE] ([DNI], [Nombre], [Apellido]) VALUES (N'12345-46  ', N'CARLA', N'DIAS')
GO
INSERT [dbo].[CLIENTE] ([DNI], [Nombre], [Apellido]) VALUES (N'12388-25  ', N'MIRIAM', N'CORTEZ')
GO
SET IDENTITY_INSERT [dbo].[COTIZACION] ON 

GO
INSERT [dbo].[COTIZACION] ([IdRegistro], [Nombre], [FechaNacimiento], [IdUbicacion], [IdTipoEnfermedad]) VALUES (1, N'MArio Antonio', CAST(N'1973-06-05 00:00:00.000' AS DateTime), N'Colombia', N'Ninguna')
GO
SET IDENTITY_INSERT [dbo].[COTIZACION] OFF
GO
INSERT [dbo].[Inventarios] ([NroProducto], [Descripcion], [Cantidad]) VALUES (CAST(1 AS Numeric(4, 0)), N'DESCRIPCION 1', CAST(490 AS Numeric(8, 0)))
GO
INSERT [dbo].[Inventarios] ([NroProducto], [Descripcion], [Cantidad]) VALUES (CAST(2 AS Numeric(4, 0)), N'DESCRIPCION 2', CAST(500 AS Numeric(8, 0)))
GO
INSERT [dbo].[Inventarios] ([NroProducto], [Descripcion], [Cantidad]) VALUES (CAST(3 AS Numeric(4, 0)), N'DESCRIPCION 3', CAST(500 AS Numeric(8, 0)))
GO
INSERT [dbo].[Pedidos] ([npedido], [fecha], [NroProducto], [cantidad], [monto], [Cliente_dni]) VALUES (CAST(1 AS Numeric(4, 0)), CAST(N'2021-06-24 00:00:00.000' AS DateTime), CAST(1 AS Numeric(4, 0)), CAST(10 AS Numeric(8, 0)), 25.0000, N'12345-45  ')
GO
INSERT [dbo].[Pedidos] ([npedido], [fecha], [NroProducto], [cantidad], [monto], [Cliente_dni]) VALUES (CAST(2 AS Numeric(4, 0)), CAST(N'2021-06-24 00:00:00.000' AS DateTime), CAST(2 AS Numeric(4, 0)), CAST(15 AS Numeric(8, 0)), 50.0000, N'12345-45  ')
GO
INSERT [dbo].[Pedidos] ([npedido], [fecha], [NroProducto], [cantidad], [monto], [Cliente_dni]) VALUES (CAST(3 AS Numeric(4, 0)), CAST(N'2021-06-24 00:00:00.000' AS DateTime), CAST(3 AS Numeric(4, 0)), CAST(100 AS Numeric(8, 0)), 200.0000, N'12345-45  ')
GO
INSERT [dbo].[Pedidos] ([npedido], [fecha], [NroProducto], [cantidad], [monto], [Cliente_dni]) VALUES (CAST(4 AS Numeric(4, 0)), CAST(N'2021-06-24 00:00:00.000' AS DateTime), CAST(1 AS Numeric(4, 0)), CAST(10 AS Numeric(8, 0)), 25.0000, N'12345-46  ')
GO
INSERT [dbo].[Pedidos] ([npedido], [fecha], [NroProducto], [cantidad], [monto], [Cliente_dni]) VALUES (CAST(5 AS Numeric(4, 0)), CAST(N'2021-06-24 00:00:00.000' AS DateTime), CAST(2 AS Numeric(4, 0)), CAST(15 AS Numeric(8, 0)), 50.0000, N'12345-46  ')
GO
INSERT [dbo].[Pedidos] ([npedido], [fecha], [NroProducto], [cantidad], [monto], [Cliente_dni]) VALUES (CAST(6 AS Numeric(4, 0)), CAST(N'2021-06-24 00:00:00.000' AS DateTime), CAST(3 AS Numeric(4, 0)), CAST(100 AS Numeric(8, 0)), 200.0000, N'12388-25  ')
GO
INSERT [dbo].[Pedidos] ([npedido], [fecha], [NroProducto], [cantidad], [monto], [Cliente_dni]) VALUES (CAST(7 AS Numeric(4, 0)), CAST(N'2021-06-24 00:00:00.000' AS DateTime), CAST(1 AS Numeric(4, 0)), CAST(5 AS Numeric(8, 0)), 12.5000, N'12388-25  ')
GO
INSERT [dbo].[Pedidos] ([npedido], [fecha], [NroProducto], [cantidad], [monto], [Cliente_dni]) VALUES (CAST(8 AS Numeric(4, 0)), CAST(N'2021-06-24 00:00:00.000' AS DateTime), CAST(1 AS Numeric(4, 0)), CAST(5 AS Numeric(8, 0)), 12.5000, N'12345-45  ')
GO
INSERT [dbo].[Producto] ([NroProducto], [NombreProducto], [Descripcion], [CantidadStock]) VALUES (CAST(1 AS Numeric(4, 0)), N'PRODUCTO 1', N'DESCRIPCION 1', CAST(490 AS Numeric(8, 0)))
GO
INSERT [dbo].[Producto] ([NroProducto], [NombreProducto], [Descripcion], [CantidadStock]) VALUES (CAST(2 AS Numeric(4, 0)), N'PRODUCTO 2', N'DESCRIPCION 2', CAST(500 AS Numeric(8, 0)))
GO
INSERT [dbo].[Producto] ([NroProducto], [NombreProducto], [Descripcion], [CantidadStock]) VALUES (CAST(3 AS Numeric(4, 0)), N'PRODUCTO 3', N'DESCRIPCION 3', CAST(500 AS Numeric(8, 0)))
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_CLIENTE] FOREIGN KEY([Cliente_dni])
REFERENCES [dbo].[CLIENTE] ([DNI])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_CLIENTE]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Producto] FOREIGN KEY([NroProducto])
REFERENCES [dbo].[Producto] ([NroProducto])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Producto]
GO
