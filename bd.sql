CREATE DATABASE VIVERO;

-- Creacion de tablas
CREATE TABLE tipos_plantas(
    id_tipo int NOT NULL,
    nombre varchar(250),
    descripcion varchar(250),
    categoria varchar(250),
    PRIMARY KEY(id_tipo)
);

CREATE TABLE sucursales(
    id_sucursal int NOT NULL,
    nombre varchar(250),
    telefono varchar(15),
    direccion varchar(200),
    PRIMARY KEY(id_sucursal)
);
CREATE TABLE puestos(
    id_puesto int NOT NULL,
    nombre_puesto varchar(100),
    descripcion varchar(100),
    sueldo float,
    PRIMARY KEY(id_puesto)
);
CREATE TABLE datos_personales(
    id_persona int NOT NULL,
    nombre varchar(100),
    paterno varchar(100),
    materno varchar(100),
    direccion varchar(200),
    fecha_nacimiento varchar(100),
    numero_telefono varchar(20),
    PRIMARY KEY(id_persona)
);
CREATE TABLE empleados(
    id_empleado int NOT NULL,
    id_persona int,
    id_puesto_trabajo int,
    id_sucursal int,
    fecha_inicio_trabajo varchar(100),
    tiempo_contrato varchar(100),
    estado_trabajador varchar(100),
    PRIMARY KEY(id_empleado),
    FOREIGN KEY (id_persona) REFERENCES datos_personales (id_persona),
    FOREIGN KEY (id_puesto_trabajo) REFERENCES puestos (id_puesto),
    FOREIGN KEY (id_sucursal) REFERENCES sucursales (id_sucursal)
);

CREATE TABLE clientes(
    id_cliente int NOT NULL,
    id_persona int,
    tipo varchar(100),
    PRIMARY KEY(id_cliente),
    FOREIGN KEY (id_persona) REFERENCES datos_personales (id_persona)
);

CREATE TABLE provedores(
    id_provedor int NOT NULL,
    id_persona int,
    nombre_empresa_provedora varchar(250),
    telefono_empresa_provedora varchar(15),
    direccion_empresa_provedora varchar(200),
    PRIMARY KEY(id_provedor),
    FOREIGN KEY (id_persona) REFERENCES datos_personales (id_persona)
);



CREATE TABLE plantas(
    id_planta int NOT NULL,
    id_tipo int,
    nombre varchar(250),
    numero_existencia int,
    precio float,
    PRIMARY KEY(id_planta),
    FOREIGN KEY (id_tipo) REFERENCES tipos_plantas (id_tipo)
);



CREATE TABLE materiales(
    id_material int NOT NULL,
    id_sucursal int,
    nombre varchar(250),
    cantidad int,
    descripcion varchar(250),
    PRIMARY KEY(id_material),
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

CREATE TABLE transportes (
    id_transporte int NOT NULL,
    id_empleado int,
    tipo_transporte varchar(200),
    esta_en_uso boolean,
    placas varchar(20),
    PRIMARY KEY(id_transporte),
    FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado)
);

CREATE TABLE compras(
    id_compra int NOT NULL,
    id_cliente int,
    id_transporte int,
    descripcion varchar(250),
    fecha_hora datetime,
    costo_total int,
    metodo_pago varchar(250),
    PRIMARY KEY(id_compra),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
    FOREIGN KEY (id_transporte) REFERENCES transportes (id_transporte)
);

CREATE TABLE plantas_vendidas(
    id_planta_vendida int NOT NULL,
    id_compra int,
    id_planta int,
    cantidad int,
    descripcion varchar(250),
    PRIMARY KEY(id_planta_vendida),
    FOREIGN KEY (id_compra) REFERENCES compras (id_compra),
    FOREIGN KEY (id_planta) REFERENCES plantas (id_planta)
);

INSERT INTO tipos_plantas () VALUES
(1, "sin flor","planta sin flores", "Criptogamas"),
(2, "con flor","planta con flores", "Fanerogamas");

insert into sucursales values 
(1,"Plantaflor",5652445, "Avionetas"),
(2,"Plantaflor2",7352145, "Centro Cuautla");


INSERT INTO puestos VALUES
(1,"Gerente de produccion","Encargado de la produccion ",3500),
(2,"Supervisor de area B1","Supervision general del area B1",2550),
(3,"Supervisor de area B2","Supervision general del area B2",2550),
(4,"Supervisor de area D1","Supervision general del area D1",2550),
(5,"Supervisor de area G2","Supervision general del area G2",2550);

INSERT INTO datos_personales VALUES
( 1,"Samuel","Apellido_1","Apellido_2","direccion","1/03/2000","7351597834" ),
( 2,"Fabian","Apellido_1","Apellido_2","direccion","1/03/2000","7351597834" ),
( 3,"Enoc","Apellido_1","Apellido_2","direccion","1/03/2000","7351597834" ),
( 4,"Karla","Apellido_1","Apellido_2","direccion","1/03/2000","7351597834" ),
( 5,"Yamilet","Apellido_1","Apellido_2","direccion","1/03/2000","7351597834" );

INSERT INTO empleados VALUES
(1,1,3,1,"15/04/2019","12 meses","despedido" ),
(2,2,2,2,"15/04/2019","12 meses","despedido" ),
(3,1,1,1,"15/04/2019","12 meses","despedido" ),
(4,2,4,2,"15/04/2019","12 meses","despedido" ),
(5,2,1,1,"15/04/2019","12 meses","despedido" );

insert into clientes values (1, 1, "Cliente habitual"),
(2, 2, "Cliente nuevo"),
(3, 3, "Cliente habitual"),
(4, 4, "Cliente habitual"),
(5, 5, "Cliente nuevo");

insert into provedores values 
(1, 2, "Conaflor",123456, "Avionetas"),
(2, 1, "Luz",453456, "Zapata"),
(3, 3, "Vivero Yautepec",857123, "Yautepec"),
(4, 1, "Canseco",573456, "Tetela del monte"),
(5, 2, "Las palmas", 547892, "Carretera Cuernava-Cuautla");

INSERT INTO plantas VALUES 
(1, 1, "helecho nido de ave", 35, 28.50),
(2, 1, "helecho hembra", 60, 33.75),
(3, 1, "helecho falcata", 78, 45.50),
(4, 2, "bugambilia", 100, 98.60),
(5, 2, "Dalia", 25, 56.50);

INSERT INTO materiales VALUES
(1,1,"pala",6,"Pala para tierra"),
(2,1,"Macetas",200,"Macetas distintos tamaños"),
(3,2,"Abono",100,"Abono para plantas"),
(4,2,"Tijeras",4,"Tijeras para apodar"),
(5,1,"Bolsas",300,"Bolsas para plantas Distintos tamaños"),
(6,2,"Carretilla",3,"Carretilla de carga");

INSERT INTO transportes VALUES
(1,1,"Camioneta",1,"SIN-732-A"),
(2,2,"Trailer",0,"PKG-923-B"),
(3,3,"Camioneta",0,"FSC-062-0"),
(4,2,"Moto",1,"66-BJF9"),
(5,1,"Camioneta",1,"EDE-121-7");

INSERT INTO compras VALUES
(1,2,2,"Ficus","2020-01-01 10:10:10",3500,"Efectivo"),
(2,5,1,"Adelfa","2020-12-15 16:31:36",2689,"Transferencia"),
(3,4,2,"Variedad de plantas","2021-02-14 18:02:55",35680,"Transferencia"),
(4,1,2,"Rosa Coster","2021-03-21 10:45:02",800,"Efectivo"),
(5,3,1,"Palma","2021-04-10 12:21:29",1300,"Cheque");

INSERT INTO plantas_vendidas VALUES(1,1, 1, 10, "10 helechos tipo ave"),
(2,2, 3, 35, "35 helechos tipo falcata"),
(3,3, 5, 15, "15 dalias variadas"),
(4,4, 4, 55, "55 bugambilias variadas"),
(5,5, 2, 34, "34 helechos tipo hembra");


