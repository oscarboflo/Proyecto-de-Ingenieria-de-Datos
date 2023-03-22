use [Proyecto Ingeniería de Datos];

select * from dbo.ESI;

-- Creando las tablas de nuesta base de datos -- 
create table tipo_movimiento(
id_tipomov int primary key,
tipo_mov varchar(50)
)
insert into tipo_movimiento(id_tipomov,tipo_mov) 
values(1, 'Entrada'),
(2, 'Salida')
select * from tipo_movimiento
--drop table tipo_movimiento

create table tipo_nacionalidad(
id_tiponaci int primary key,
tipo_naci varchar(50)
)
insert into tipo_nacionalidad(id_tiponaci,tipo_naci) 
values(1, 'Ecuatoriano'),
(2, 'Extranjero')
--drop table tipo_nacionalidad

create table sexo(
id_sexo int primary key,
tipo_sexo varchar(50)
)
insert into sexo(id_sexo,tipo_sexo) 
values(1, 'Hombre'),
(2, 'Mujer'),
(3, 'Indefinido')

--drop table sexo

create table medio_transporte(
id_medio_transporte int primary key,
tipo_mediotransporte varchar(50)
)
insert into medio_transporte(id_medio_transporte, tipo_mediotransporte)
values(1, 'Vía Aérea"'),
(2,'Vía terrestre'),
(3,'Vía Maritimo'),
(4,'Vía fluvial')

--drop table medio_transporte

create table motivo_viaje(
id_motivo int primary key,
motivo varchar(200)
)
insert into motivo_viaje(id_motivo, motivo)
values(1, 'Turismo'),
(2,'Negocios'),
(3,'Eventos'),
(4,'Estudios'),
(5,'Residencia'),
(6,'Otros')
--drop table motivo_viaje

create table ocupacion(
id_ocupacion int primary key,
ocupacion varchar(200)
)
--drop table ocupacion
create table jef_migracion(
id_jefatura int primary key,
jefatura varchar(200)
)
insert into jef_migracion(id_jefatura,jefatura)
values(1, 'Centro Binacional de Atención Fronteriza Huaquillas'),
(2, 'Unidad de Control Migratorio Puerto Marítimo Guayaquil'),
(3, 'Unidad de Control Migratorio Puerto Marítimo Manta'),
(4, 'Unidad de Control Migratorio Puerto Marítimo La Libertad'),
(5, 'Centro Nacional de Atención Fronteriza Rumichaca'),
(6, 'Aeropuerto Internacional Mariscal Sucre'),
(7, 'Aeropuerto Internacional José Joaquín de Olmedo'),
(8, 'Aeropuerto Internacional Eloy Alfaro'),
(9, 'Unidad de Control Migratorio Puerto Marítimo Esmeraldas'),
(10, 'Unidad de Control Migratorio Puerto Marítimo Posorja'),
(11, 'Aeropuerto Internacional Cotopaxi'),
(12, 'Unidad de Control Migratorio Puerto Fluvial San Lorenzo'),
(13, 'Unidad de Control Migratorio Puerto Marítimo Ayora'),
(14, 'Unidad de Control Migratorio Puerto Marítimo Bolívar'),
(15, 'Unidad de Control Migratorio Puerto Marítimo Baquerizo Moreno'),
(16, 'Aeropuerto Mariscal Lamar'),
(17, 'Centro Binacional de Atención Fronteriza San Miguel'),
(18, 'Unidad de Control Migratorio Puerto Marítimo Isabela'),
(19, 'Unidad de Control Migratorio Puerto Marítimo Seymour'),
(20, 'Aeropuerto Seymour de Baltra'),
(21, 'Unidad de Control Migratorio Frontera Terrestre Macara'),
(22, 'Aeropuerto Transfronterizo Coronel Carlos Concha Torres'),
(23, 'Aeropuerto General Ulpiano Paez')
select * from jef_migracion
--drop table prov_migracion


-- Sumarizando --
select b.tipo_sexo, count(a.id_sexo) as recuento
from dw_house as a
inner join dbo.sexo as b
on a.id_sexo = b.id_sexo
group by b.tipo_sexo;

--select distinct(a.id_sexo)
--from dw_house as a;

--select * from [dbo].[dw_house];

select b.tipo_sexo, count(a.id_sexo) as Cantidad, max(a.edad) as Edad_Maxima, min(a.edad) as Edad_Minima, avg(a.edad) as Edad_Promedio
from dw_house as a 
inner join dbo.sexo as b
on a.id_sexo = b.id_sexo
group by b.tipo_sexo;

create view info_sexo as
select b.tipo_sexo, count(a.id_sexo) as Recuento, max(a.edad) as Maximo_Edad, min(a.edad) as Edad_Minima
from dw_house as a 
inner join dbo.sexo as b
on a.id_sexo = b.id_sexo
group by b.tipo_sexo;

select * from info_sexo

create view info_del_sexo as
select b.tipo_sexo, max(a.edad) as E_Maxima, min(a.edad) as E_Minima, avg(a.edad) as E_Promedio, STDEV(a.edad) as D_E
from dw_house as a 
inner join dbo.sexo as b
on a.id_sexo = b.id_sexo
group by b.tipo_sexo;

select * from info_del_sexo

create view info_del_sexo_sincantidad as
select b.tipo_sexo, max(a.edad) as Edad_Maxima, min(a.edad) as Edad_Minima, avg(a.edad) as Edad_Promedio
from dw_house as a 
inner join dbo.sexo as b
on a.id_sexo = b.id_sexo
group by b.tipo_sexo;

select * from info_del_sexo_sincantidad

create view info_del_sexo_concantidad as
select b.tipo_sexo, count(b.tipo_sexo) as Cuenta, max(a.edad) as Edad_Maxima, min(a.edad) as Edad_Minima, avg(a.edad) as Edad_Promedio
from dw_house as a 
inner join dbo.sexo as b
on a.id_sexo = b.id_sexo
group by b.tipo_sexo;

select * from info_del_sexo_concantidad
--select * from dbo.dw_house

--alter table dbo.dw_house alter column edad int

--alter table dbo.dw_house add edad_int int

--update dbo.dw_house set edad_int = cast(edad as int) 

--alter table dbo.dw_house alter column id_persona int not null

--alter table dbo.dw_house add primary key (id_persona)

select * from clase_migracion
select * from dw_house
select * from ESI
select * from jef_migracion
select * from medio_transporte
select * from motivo_viaje
select * from nacio_migracion
select * from provincia_jefatura
select * from sexo
select * from tipo_movimiento
select * from tipo_nacionalidad

-------------
select b.tipo_sexo, a.id_tiponaci, a.id_tipomov
from dw_house as a
inner join dbo.sexo as b
on a.id_sexo = b.id_sexo
group by b.tipo_sexo, a.id_tiponaci, a.id_tipomov



select b.tipo_sexo, a.id_tiponaci, a.id_tipomov
from dw_house as a
inner join dbo.sexo as b, dbo.tipo_nacionalidad as tn, dbo.tipo_movimiento as tm
on a.id_sexo = b.id_sexo, a.id_tiponaci = tn.tipo_nacionalidad, a.id_tipomov = tm.tipo_movimiento
group by b.tipo_sexo, a.id_tiponaci, a.id_tipomov

create view consulta_modelo as
select b.tipo_sexo, tn.tipo_naci, tm.tipo_mov, mt.tipo_mediotransporte, a.edad
from dw_house as a
inner join dbo.sexo as b
on a.id_sexo = b.id_sexo
inner join dbo.tipo_nacionalidad as tn
on a.id_tiponaci = tn.id_tiponaci
inner join dbo.tipo_movimiento as tm
on a.id_tipomov = tm.id_tipomov
inner join dbo.medio_transporte as mt
on a.id_medio_transporte = mt.id_medio_transporte


select * from consulta_modelo

----
create view modelo_final as
select b.tipo_sexo, tn.tipo_naci, tm.tipo_mov, mt.tipo_mediotransporte, a.edad, mv.motivo
from dw_houseconidmotivo as a
inner join dbo.sexo as b
on a.id_sexo = b.id_sexo
inner join dbo.tipo_nacionalidad as tn
on a.id_tiponaci = tn.id_tiponaci
inner join dbo.tipo_movimiento as tm
on a.id_tipomov = tm.id_tipomov
inner join dbo.medio_transporte as mt
on a.id_medio_transporte = mt.id_medio_transporte
inner join dbo.motivo_viaje as mv
on a.id_motivo = mv.id_motivo

select * from modelo_final

select * from dbo.ESI

--Segundo Modelo
