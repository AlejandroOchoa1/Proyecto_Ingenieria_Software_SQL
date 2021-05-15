CREATE DATABASE PROYECTO

CREATE TABLE Rol(
IdRol int IDENTITY (1,1) NOT NULL PRIMARY KEY,
Descripcion varchar(50) NOT NULL,
)

CREATE TABLE Sexo(
IdSexo int IDENTITY (1,1) NOT NULL PRIMARY KEY,
Descripcion varchar(50) NOT NULL,
)

CREATE TABLE Empleado(
IdEmpleado int IDENTITY (1,1) NOT NULL PRIMARY KEY,
Nombre varchar(50) not null,
Apellido varchar(50) not null,
Fecha_Nacimiento date not null,
Direccion varchar(200) not null,
Dpi Varchar(20) not null,
Sexo int FOREIGN KEY REFERENCES Sexo (IdSexo),
)


CREATE TABLE Usuario(
IdUsuario varchar(50) not null PRIMARY KEY,
Contraseña varchar(50) not null,
IdRol INT NOT NULL,
IdEmpleado int not null,
CONSTRAINT Fk_rol FOREIGN KEY (IdRol) REFERENCES rol (IdRol),
CONSTRAINT FK_empleado FOREIGN KEY (IdEmpleado) REFERENCES empleado (IdEmpleado),
)

CREATE TABLE Tipo_de_Gestion(
IdGestion int IDENTITY (1,1) not null PRIMARY KEY,
Descripcion varchar(50) not null,
)

CREATE TABLE Estado_De_Gestion(
IdEstadoDeGestion int IDENTITY (1,1) NOT NULL PRIMARY KEY,
Descripcion varchar(50) NOT NULL
)

CREATE TABLE Tecnico(
IdTecnico INT NOT NULL PRIMARY KEY,
IdEmpleado INT NOT NULL,
CONSTRAINT FK_EMPLEADO_tec FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado),
)

CREATE TABLE Encabezado_Gestion(
IdEncabezadoGestion INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Fecha_HoraInicio DATE NOT NULL,
Fecha_HoraFin DATE NOT NULL,
IdGestion INT NOT NULL,
IdTecnico INT NOT NULL,
IdEmpleado INT NOT NULL,
IdEstadoDeGestion INT NOT NULL,
CONSTRAINT FK_GESTION FOREIGN KEY (IdGestion) REFERENCES Tipo_De_Gestion (IdGestion),
CONSTRAINT FK_TECNICO FOREIGN KEY (IdTecnico) REFERENCES Tecnico(IdTecnico),
CONSTRAINT FK_EMPLEADO_ENCABEZADO FOREIGN KEY (IdEmpleado) REFERENCES Empleado(IdEmpleado),
CONSTRAINT FK_ESTADO_DE_GESTION FOREIGN KEY (IdEstadoDeGestion) REFERENCES Estado_De_Gestion(IdEstadoDeGestion),
)

CREATE TABLE Actividad(
IdActividad INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Descripcion VARCHAR(100) NOT NULL,
Costo DECIMAL(18,2) NOT NULL,

)

CREATE TABLE Detalle_Gestion(
IdDetalleGestion INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
IdEncabezadoGestion INT NOT NULL,
IdActividad INT NOT NULL,
IdEstadoDeGestion INT NOT NULL,
CONSTRAINT FK_ENCABEZADO_GENTION_DETALLE FOREIGN KEY (IdEncabezadoGestion) REFERENCES  Encabezado_Gestion (IdEncabezadoGestion),
CONSTRAINT FK_ACTIVIDAD_DETALLE FOREIGN KEY (IdActividad) REFERENCES Actividad(IdActividad),
CONSTRAINT FK_ESTADO_DE_GESTION_DETALLE FOREIGN KEY (IDEstadoDeGestion) REFERENCES  Estado_De_Gestion (IdEstadoDeGestion)
)