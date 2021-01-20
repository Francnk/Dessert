-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2020 a las 22:36:24
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_asignatura` (IN `id` INT(11), IN `a` VARCHAR(50))  BEGIN
	update asignatura set asignatura.asignatura =a where asignatura.id_asignatura = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_asig_uten` (IN `a` INT(11), IN `b` INT(11), IN `c` INT(11))  BEGIN
	update asig_uten set id_utensilio = c where  id_asignatura=a and id_utensilio = b;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_asi_fa` (IN `a` INT(11), IN `e` INT(11))  BEGIN
	update asi_fa set asi_fa.numero_empleado =e where asi_fa.id_asignatura = a;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_cuatri` (IN `periodo` INT(11), IN `programa` INT(11), IN `cuatrimestre` INT(11), IN `c` INT(11))  BEGIN
	update peri_pro_cua_gru_asig set id_cuatrimestre = cuatrimestre where  id_periodo=periodo and id_programa = programa and id_cuatrimestre =c;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_cuatri_grupo` (IN `a` INT(11), IN `b` INT(11), IN `c` INT(11))  BEGIN
	update cuatri_grupo set id_grupo = c where  id_cuatrimestre=a and id_grupo = b;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_cuatri_grupo_peri_pro_cuatri` (IN `periodo` INT(11), IN `programa` INT(11), IN `cuatrimestre` INT(11), IN `grupo` INT(11), IN `c` INT(11))  BEGIN
	update peri_pro_cua_gru_asig set id_grupo = c where  id_periodo=periodo and id_programa = programa and id_cuatrimestre=cuatrimestre and id_grupo = grupo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_peri_pro` (IN `a` INT(11), IN `b` INT(11))  BEGIN
	update peri_pro set id_periodo=a where id_programa = b ;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_pro_cuatri` (IN `p` INT(11), IN `c` INT(11))  BEGIN
	update pro_cuatri set id_programa=p where 	id_cuatrimestre = c;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_administrador` (IN `_numero_empleado` INT(11), IN `_nom_completo` VARCHAR(50), IN `_contrasena` VARCHAR(130))  BEGIN
   INSERT INTO administrador(numero_empleado,nom_completo,contrasena) VALUES (_numero_empleado ,_nom_completo,_contrasena );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_alumno` (IN `_matricula` INT(11), IN `_nombre` VARCHAR(50), IN `_contrasena` INT(130), IN `_id_grupo` INT(11))  BEGIN
   INSERT INTO alumno(matricula,nombre,contrasena,id_grupo) VALUES (_matricula ,_nombre ,_contrasena ,_id_grupo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_alum_brig` (IN `_matricula` INT(11), IN `_id_brigada` INT(11))  BEGIN
   INSERT INTO alum_brig(matricula,id_brigada) VALUES (_matricula,_id_brigada);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_asignatura` (IN `_id_asignatura` INT(11), IN `_asignatura` VARCHAR(50), IN `_id_programa` INT(11))  BEGIN
   INSERT INTO asignatura(id_asignatura,asignatura,id_programa) VALUES (_id_asignatura ,_asignatura, _id_programa);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_asig_uten` (IN `_id_asignatura` INT(11), IN `_id_utensilio` INT(11))  BEGIN
   INSERT INTO asig_uten(id_asignatura , id_utensilio) VALUES (_id_asignatura,_id_utensilio);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_asi_fa` (IN `_id_asignatura` INT(11), IN `_numero_empleado` INT(11))  BEGIN
   INSERT INTO asi_fa(id_asignatura , numero_empleado) VALUES (_id_asignatura,_numero_empleado   );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_brigada` (IN `_id_brigada` INT(11), IN `_numero_brigada` INT(11))  BEGIN
   INSERT INTO brigada(id_brigada ,numero_brigada) VALUES (_id_brigada ,_numero_brigada);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_categoria` (IN `_categoria` VARCHAR(50))  BEGIN
   INSERT INTO categoria(categoria ) VALUES (_categoria );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_cate_uten` (IN `_id_categoria` INT(11), IN `_id_utensilios` INT(11))  BEGIN
   INSERT INTO cate_uten(id_categoria , id_utensilios) VALUES (_id_categoria ,_id_utensilios);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_cuatrimestre` (IN `_id_cuatrimestre` INT(11), IN `_cuatrimestre` INT(11))  BEGIN
   INSERT INTO cuatrimestre(id_cuatrimestre,cuatrimestre) VALUES (_id_cuatrimestre,_cuatrimestre );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_cuatri_grupo` (IN `_id_cuatrimestre` INT(11), IN `_id_grupo` INT(11))  BEGIN
   INSERT INTO cuatri_grupo(id_cuatrimestre,id_grupo) VALUES (_id_cuatrimestre ,_id_grupo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_deudor` (IN `_fecha` DATE, IN `_status_deudor` VARCHAR(30), IN `_id_requisicion` INT(11), IN `_mat_estudiante_responsable` INT(11), IN `_id_d` INT(11))  BEGIN
   INSERT INTO deudor(fecha, status_deudor,id_requisicion,mat_estudiante_responsable,id_d) VALUES (_fecha  ,_status_deudor ,_id_requisicion,_mat_estudiante_responsable,_id_d);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_facilitador` (IN `_numero_empleado` INT(11), IN `_nombre` VARCHAR(50))  BEGIN
   INSERT INTO facilitador(numero_empleado, nombre) VALUES (_numero_empleado ,_nombre  );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_grupo` (IN `_id_grupo` INT(11), IN `_grupo` VARCHAR(30))  BEGIN
   INSERT INTO grupo (id_grupo,grupo) VALUES (_id_grupo,_grupo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_periodo` (IN `_periodo` VARCHAR(40), IN `_year` INT(11))  BEGIN
   INSERT INTO periodo(periodo,year) VALUES (_periodo  ,_year );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_peri_pro` (IN `_id_periodo` INT(11), IN `_id_programa` INT(11))  BEGIN
   INSERT INTO peri_pro(id_periodo,id_programa) VALUES (_id_periodo  ,_id_programa );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_peri_pro_cuatri` (IN `_id_periodo` INT(11), IN `_id_programa` INT(11), IN `_id_cuatrimestre` INT(11), IN `_id_grupo` INT(11))  BEGIN
IF NOT EXISTS( SELECT peri_pro_cua_gru_asig.id_periodo,peri_pro_cua_gru_asig.id_programa ,peri_pro_cua_gru_asig.id_cuatrimestre FROM peri_pro_cua_gru_asig where id_periodo = _id_periodo and id_programa= _id_programa and id_cuatrimestre=_id_cuatrimestre and id_grupo = _id_grupo) 
THEN
     INSERT INTO peri_pro_cua_gru_asig (id_periodo,id_programa,id_cuatrimestre,id_grupo) VALUES (_id_periodo ,_id_programa , _id_cuatrimestre ,_id_grupo   );
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_programa_educativo` (IN `_id_programa` INT(11), IN `_programa_educativo` VARCHAR(50))  BEGIN
   INSERT INTO programa_educativo (id_programa,programa_educativo) VALUES (_id_programa,_programa_educativo);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_pro_cuatri` (IN `_id_programa` INT(11), IN `_id_cuatrimestre` INT(11))  BEGIN
   INSERT INTO pro_cuatri(id_programa,id_cuatrimestre) VALUES (_id_programa, _id_cuatrimestre );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_requisicion` (IN `_id_requisicion` INT(11), IN `_fecha_hora_requisicion` DATETIME, IN `_fecha_practica` DATE, IN `_hora_practica` TIME, IN `_cantidad_inicial` INT(11), IN `_cantidad_final` INT(11), IN `_descripcion_devolucion` VARCHAR(100), IN `_observacion` VARCHAR(100), IN `_id_utensilio` VARCHAR(30), IN `_id_brigada` VARCHAR(30), IN `_mat_estudiante_responsable` INT(11), IN `_nom_practica` VARCHAR(50), IN `_cantidad_pedida` INT(11))  BEGIN
   INSERT INTO requisicion(id_requisicion ,fecha_hora_requisicion,fecha_practica,hora_practica,cantidad_inicial,cantidad_final,descripcion_devolucion,observacion,id_utensilio,id_brigada,mat_estudiante_responsable,nom_practica,cantidad_pedida) VALUES (_id_requisicion ,_id_requisicion,_fecha_hora_requisicion,_fecha_practica,_hora_practica,_cantidad_inicial,_cantidad_final,_descripcion_devolucion,_observacion,_id_utensilio,_id_brigada,_mat_estudiante_responsable,_nom_practica,_cantidad_pedida);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_requisicion_alumno` (IN `_id_requisicion` INT(11), IN `_fecha_hora_requisicion` VARCHAR(50), IN `_fecha_practica` VARCHAR(50), IN `_hora_practica` VARCHAR(50), IN `_id_brigada` INT(11), IN `_mat_estudiante_responsable` INT(11), IN `_no_requisicion` INT(11), IN `_id_estatus` INT(11))  BEGIN
INSERT INTO requisicion(
id_requisicion,
fecha_hora_requsicion,
fecha_practica,
hora_practica,
id_brigada,
mat_estudiante_responsable,
no_requisicion,
id_status) 

VALUES (
_id_requisicion,
_fecha_hora_requisicion,
_fecha_practica,
_hora_practica,
_id_brigada,
_mat_estudiante_responsable,
_no_requisicion,
_id_estatus);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_requisicion_utensilios` (IN `_id_requisicion` INT(11), IN `_id_utensilios` INT(11), IN `_cant_solicitado` INT(11), IN `_id` INT(11))  BEGIN
INSERT INTO requi_utensilios ( 
id_requisicion, 
id_utensilios, 
cant_solicitado, 
id) 
VALUES ( _id_requisicion, _id_utensilios, _cant_solicitado, _id );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_utensilios` (IN `_id_utensilio` INT(11), IN `_descripcion` VARCHAR(40), IN `_cant_asignada` INT(11), IN `_cant_exit` INT(11))  BEGIN
   INSERT INTO utensilios(id_utensilio , descripcion,cant_asignada,cant_exit) VALUES (_id_utensilio ,_descripcion  ,_cant_asignada,_cant_exit );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Add_varios` (IN `_id_periodo` INT(11), IN `_id_programa` INT(50), IN `_id_cuatrimestre` INT(130), IN `_id_asigantura` INT(11), IN `_id_grupo` INT(11), IN `_id_facilitador` INT(11))  BEGIN
  
INSERT INTO peri_pro_cua_gru_asig(id_periodo, id_programa, id_cuatrimestre, id_asigantura,id_grupo,id_facilitador) VALUES (_id_periodo,_id_programa,_id_cuatrimestre,_id_asigantura,_id_grupo,_id_facilitador);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_asig_uten` (IN `a` INT(11), IN `b` INT(11))  BEGIN
	DELETE FROM `asig_uten` WHERE id_asignatura=a and id_utensilio = b;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_cuatri_grupo` (IN `a` INT(11), IN `b` INT(11))  BEGIN
	DELETE FROM `cuatri_grupo` WHERE id_cuatrimestre=a and id_grupo = b;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_cuatri_grupo_peri_pro` (IN `periodo` INT(11), IN `programa` INT(11), IN `cuatrimestre` INT(11))  BEGIN
	DELETE FROM peri_pro_cua_gru_asig where id_periodo = periodo and id_programa = programa and id_cuatrimestre = cuatrimestre;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `borrar_cuatri_grupo_peri_pro_cuatri_asig` (IN `periodo` INT(11), IN `programa` INT(11), IN `cuatrimestre` INT(11), IN `grupo` INT(11))  BEGIN
	DELETE FROM peri_pro_cua_gru_asig where id_periodo = periodo and id_programa = programa and id_cuatrimestre = cuatrimestre and id_grupo = grupo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Consultar_alumnos` (IN `_id_periodo` INT(11), IN `_id_programa` INT(11), IN `_id_cuatrimestre` INT(11), IN `_id_grupo` INT(11))  BEGIN
   SELECT DISTINCT  matricula,
         useremail,
         username,
         grupo
FROM     alumno 
INNER JOIN grupo  ON alumno.id_grupo = grupo.id_grupo 
INNER JOIN cuatrimestre  ON alumno.id_cuatrimestre = cuatrimestre.id_cuatrimestre
INNER JOIN periodo  ON alumno.id_periodo = periodo.id_periodo
INNER JOIN programa_educativo  ON alumno.id_programa = programa_educativo.id_programa
WHERE    ( grupo.id_grupo = _id_grupo ) AND ( cuatrimestre.id_cuatrimestre = _id_cuatrimestre ) AND ( programa_educativo.id_programa = _id_programa ) AND ( periodo.id_periodo = _id_periodo ) ; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Consultar_Status_requisicion` (IN `id_status` INT(11))  BEGIN
SELECT   requisicion.id_requisicion,
         requisicion.fecha_practica,
         requisicion.hora_practica,
         requisicion.no_requisicion,
         requisicion.id_status,
         brigada.numero_brigada,
         alumno.matricula,
         alumno.username,
         grupo.grupo,
         cuatrimestre.cuatrimestre,
         asignatura.asignatura
FROM     requisicion 
INNER JOIN alumno ON requisicion.mat_estudiante_responsable = alumno.matricula 
INNER JOIN brigada  ON requisicion.id_brigada = brigada.id_brigada 
INNER JOIN grupo  ON alumno.id_grupo = grupo.id_grupo 
INNER JOIN cuatrimestre  ON alumno.id_cuatrimestre = cuatrimestre.id_cuatrimestre
INNER JOIN briga_asigna  ON briga_asigna.id_brigada = brigada.id_brigada
INNER JOIN peri_pro_cua_gru_asig  ON briga_asigna.id_peri_pro_cua_gru_asig = peri_pro_cua_gru_asig.id
INNER JOIN asignatura  ON peri_pro_cua_gru_asig.id_asigantura= asignatura.id_asignatura 
WHERE    ( requisicion.id_status = 1 );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_administrador` (IN `id` INT(11))  BEGIN
  DELETE FROM administrador WHERE numero_empleado= id;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_alumno` (IN `id` INT(11))  BEGIN
  DELETE FROM alumno WHERE matricula= id;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_asignatura` (IN `id` INT(11))  BEGIN
  DELETE FROM asignatura WHERE id_asignatura= id;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_asignatura_peri_pro` (IN `periodo` INT(11), IN `programa` INT(11), IN `cuatrimestre` INT(11), IN `grupo` INT(11), IN `facilitador` INT(11))  BEGIN
UPDATE peri_pro_cua_gru_asig SET
	  id_asigantura = 0
WHERE
	     id_periodo = periodo AND
	    id_programa = programa AND
	id_cuatrimestre = cuatrimestre AND
	       id_grupo = grupo AND
	 id_facilitador = facilitador ;
	 
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_brigada` (IN `id` INT(11))  BEGIN
 DELETE FROM brigada WHERE id_brigada= id;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_cuatrimestre` (IN `id` INT(11))  BEGIN
  DELETE FROM cuatrimestre WHERE id_cuatrimestre= id;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_deudor` (IN `id` INT(11))  BEGIN
  DELETE FROM deudor WHERE id_d= id;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_facilitador` (IN `id` INT(11))  BEGIN
  DELETE FROM facilitador WHERE numero_empleado= id;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_grupo` (IN `id` INT(11))  BEGIN
  DELETE FROM grupo WHERE id_grupo= id;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_periodo` (IN `id` INT(11))  BEGIN
  DELETE FROM periodo WHERE id_periodo= id;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_programa_educativo` (IN `id` INT(11))  BEGIN
  DELETE FROM programa_educativo WHERE id_programa = id;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_programa_periodo` (IN `periodo` INT(11), IN `programa` INT(11))  BEGIN
	DELETE FROM peri_pro where id_periodo = periodo and id_programa = programa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_requisicion` (IN `id` INT(11))  BEGIN
 DELETE FROM requisicion WHERE id_requisicion= id;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Delete_utensilios` (IN `id` INT(11))  BEGIN
  DELETE FROM utensilios WHERE id_utensilio= id;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `maximo_asignatura` ()  SELECT 	MAX(id_asignatura) as id FROM asignatura$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `maximo_cuatrimestre` ()  SELECT 	MAX(id_cuatrimestre) as id FROM cuatrimestre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `maximo_grupo` ()  SELECT 	MAX(id_grupo) as id FROM grupo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `maximo_proeducativo` ()  SELECT 	MAX(id_programa) as id FROM programa_educativo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `maximo_programaeducativo` ()  SELECT 	MAX(id_programa) as id FROM programa_educativo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `maximo_requisicion` ()  SELECT 	MAX(id_requisicion) as id FROM requisicion$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `maximo_requi_utensilios` ()  SELECT 	MAX(id) as id FROM requi_utensilios$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `maximo_utensilios` ()  SELECT 	MAX(id_utensilio) as id FROM utensilios$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Mostrar_administrador` ()  BEGIN
    SELECT numero_empleado,username,useremail, u_status
    FROM administrador where u_status=0 ; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_asignaturas` ()  SELECT   programa_educativo.programa_educativo,
         peri_pro_cua_gru_asig.id_cuatrimestre,
         facilitador.nombre,
         asignatura.asignatura,
         asignatura.id_asignatura,
         utensilios.descripcion
FROM     asi_fa 
INNER JOIN asignatura  ON asi_fa.id_asignatura=asignatura.id_asignatura 
INNER JOIN facilitador  ON asi_fa.numero_empleado= facilitador.numero_empleado 
INNER JOIN peri_pro_cua_gru_asig  ON peri_pro_cua_gru_asig.id_asigantura=asignatura.id_asignatura 
INNER JOIN programa_educativo  ON programa_educativo.id_programa = peri_pro_cua_gru_asig.id_programa 
INNER JOIN asig_uten  ON asig_uten.id_asignatura=asignatura.id_asignatura 
INNER JOIN cuatrimestre  ON cuatrimestre.id_cuatrimestre = peri_pro_cua_gru_asig.id_cuatrimestre 
INNER JOIN periodo  ON periodo.id_periodo= peri_pro_cua_gru_asig.id_periodo 
INNER JOIN utensilios  ON asig_uten.id_utensilio = utensilios.id_utensilio
GROUP BY asignatura.id_asignatura$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_asignaturas2` ()  SELECT   periodo.year,
         periodo.id_periodo,
         programa_educativo.id_programa,
         programa_educativo.programa_educativo,
         cuatrimestre.id_cuatrimestre,
         cuatrimestre.cuatrimestre,
         asignatura.id_asignatura,
         asignatura.asignatura,
         grupo.id_grupo,
         grupo.grupo,
         facilitador.numero_empleado,
         facilitador.nombre,
         periodo.periodo
FROM     periodo 
INNER JOIN peri_pro_cua_gru_asig  ON periodo.id_periodo = peri_pro_cua_gru_asig.id_periodo 
INNER JOIN programa_educativo  ON programa_educativo.id_programa = peri_pro_cua_gru_asig.id_programa 
INNER JOIN grupo  ON peri_pro_cua_gru_asig.id_grupo = grupo.id_grupo 
INNER JOIN facilitador  ON peri_pro_cua_gru_asig.id_facilitador = facilitador.numero_empleado 
INNER JOIN cuatrimestre  ON cuatrimestre.id_cuatrimestre = peri_pro_cua_gru_asig.id_cuatrimestre 
INNER JOIN asignatura  ON asignatura.id_asignatura = peri_pro_cua_gru_asig.id_asigantura$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_brigrada_asignatura` (IN `_id_asignarura` INT(11))  BEGIN
SELECT  DISTINCT brigada.numero_brigada,
         brigada.id_brigada
FROM     alum_brig 
INNER JOIN alumno  ON alum_brig.matricula = alumno.matricula 
INNER JOIN brigada  ON alum_brig.id_brigada = brigada.id_brigada
INNER JOIN peri_pro_cua_gru_asig  ON alumno.id_cuatrimestre = peri_pro_cua_gru_asig.id_cuatrimestre
INNER JOIN briga_asigna  ON briga_asigna.id_brigada = brigada.id_brigada 
WHERE    ( peri_pro_cua_gru_asig.id_asigantura = _id_asignarura  );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_cuatrimestre_programa` ()  SELECT  DISTINCT periodo.id_periodo,
         periodo.periodo,
         periodo.year,
         programa_educativo.id_programa,
         programa_educativo.programa_educativo,
         cuatrimestre.id_cuatrimestre,
         cuatrimestre.cuatrimestre
FROM     peri_pro_cua_gru_asig
INNER JOIN periodo  ON peri_pro_cua_gru_asig.id_periodo = periodo.id_periodo
INNER JOIN programa_educativo  ON peri_pro_cua_gru_asig.id_programa = programa_educativo.id_programa 
INNER JOIN cuatrimestre  ON cuatrimestre.id_cuatrimestre= peri_pro_cua_gru_asig.id_cuatrimestre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_gruposs` (IN `_id_cuatrimestre` INT(11))  BEGIN
SELECT id_grupo FROM cuatri_grupo where (id_cuatrimestre=_id_cuatrimestre);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_id_cuatrimestre_grupo` (IN `pe` INT(11), IN `pr` INT(11), IN `cu` INT(11))  SELECT   grupo.id_grupo,
         grupo.grupo,
         peri_pro_cua_gru_asig.id_periodo,
         peri_pro_cua_gru_asig.id_programa,
         peri_pro_cua_gru_asig.id_cuatrimestre,
         peri_pro_cua_gru_asig.id_grupo
FROM     grupo
INNER JOIN peri_pro_cua_gru_asig  ON grupo.id_grupo = peri_pro_cua_gru_asig.id_grupo 
WHERE    ( peri_pro_cua_gru_asig.id_periodo = pe and peri_pro_cua_gru_asig.id_programa = pr and peri_pro_cua_gru_asig.id_cuatrimestre = cu )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_id_utensilio` (IN `a` INT(11))  SELECT utensilios.id_utensilio,utensilios.descripcion,utensilios.cant_asignada,utensilios.cant_exit
 FROM asignatura 
 INNER JOIN asig_uten on asignatura.id_asignatura=asig_uten.id_asignatura
 INNER JOIN utensilios on asig_uten.id_utensilio=utensilios.id_utensilio
 WHERE asignatura.id_asignatura=a$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_programa` ()  SELECT programa_educativo.programa_educativo,programa_educativo.id_programa,periodo,year,periodo.id_periodo
 FROM programa_educativo 
INNER JOIN peri_pro ON programa_educativo.id_programa = peri_pro.id_programa
INNER JOIN periodo ON peri_pro.id_periodo = periodo.id_periodo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_utensilios_asignatura` (IN `categoria` INT(11))  SELECT  `utensilios`.`id_utensilio`,
         `utensilios`.`descripcion`,
         `utensilios`.`cant_asignada`,
         `utensilios`.`cant_exit`
FROM     `categoria` 
INNER JOIN `cate_uten`  ON `categoria`.`id_categoria` = `cate_uten`.`id_categoria` 
INNER JOIN `utensilios`  ON `cate_uten`.`id_utensilios` = `utensilios`.`id_utensilio` 
WHERE    ( `categoria`.`id_categoria` = categoria )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevo_grupo` (IN `a` INT(11), IN `b` INT(11))  BEGIN
IF NOT EXISTS( SELECT id_cuatrimestre FROM cuatri_grupo where id_cuatrimestre=a and id_grupo = b) 
THEN
INSERT INTO cuatri_grupo(id_cuatrimestre,id_grupo) VALUES (a, b);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevo_grupo_PERI_PRO_CUA_ASIG` (IN `periodo` INT(11), IN `programa` INT(11), IN `cuatrimestre` INT(11), IN `b` INT(11))  BEGIN
IF NOT EXISTS( SELECT peri_pro_cua_gru_asig.id_periodo,peri_pro_cua_gru_asig.id_programa ,peri_pro_cua_gru_asig.id_cuatrimestre FROM peri_pro_cua_gru_asig where id_periodo = periodo and id_programa= programa and id_cuatrimestre=cuatrimestre and id_grupo = b) 
THEN
INSERT INTO peri_pro_cua_gru_asig (id_periodo,id_programa,id_cuatrimestre,id_grupo) VALUES (periodo,programa,cuatrimestre,b);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevo_utensilio` (IN `a` INT(11), IN `b` INT(11))  BEGIN
IF NOT EXISTS( SELECT 	id_asignatura FROM asig_uten where id_asignatura=a and 	id_utensilio = b) 
THEN
INSERT INTO asig_uten(id_asignatura,id_utensilio) VALUES (a, b);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_administrador` (IN `_numero_empleado` INT(11))  BEGIN
    SELECT numero_empleado,nom_completo,contrasena
    FROM administrador
    WHERE numero_empleado= _numero_empleado;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_alumno` (IN `_matricula` INT(11))  BEGIN
    SELECT matricula,nombre,contrasena,id_grupo
    FROM alumno
    WHERE matricula= _matricula;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_alum_brig` (IN `_id_brigada` INT(11))  BEGIN
    SELECT matricula,id_brigada
    FROM alum_brig
    WHERE id_brigada= _id_brigada;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_asignatura` (IN `_id_asignatura` INT(11))  BEGIN
    SELECT id_asignatura,asignatura,id_cuatrimestre
    FROM asignatura
    WHERE id_asignatura= _id_asignatura;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_asig_uten` (IN `_id_asignatura` INT(11))  BEGIN
    SELECT id_asignatura,id_utensilio
    FROM asig_uten
    WHERE id_asignatura= _id_asignatura;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_brigada` (IN `_id_brigada` INT(11))  BEGIN
    SELECT id_brigada,numero_brigada
   FROM brigada
    WHERE id_brigada= _id_brigada;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_cuatrimestre` (IN `_id_cuatrimestre` INT(11))  BEGIN
    SELECT id_cuatrimestre, cuatrimestre
    FROM cuatrimestre
    WHERE id_cuatrimestre= _id_cuatrimestre;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_cuatri_grupo` (IN `_id_cuatrimestre` INT(11))  BEGIN
    SELECT id_cuatrimestre,id_grupo
    FROM cuatri_grupo
    WHERE id_cuatrimestre= _id_cuatrimestre;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_deudor` (IN `_id_d` INT(11))  BEGIN
    SELECT fecha,status_deudor,id_requisicion,mat_estudiante_responsable
    FROM deudor
    WHERE id_d= _id_d;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_facilitador` (IN `_numero_empleado` INT(11))  BEGIN
    SELECT numero_empleado,nombre
    FROM facilitador
    WHERE numero_empleado=_numero_empleado;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_grupo` (IN `_id_grupo` INT(11))  BEGIN
    SELECT id_grupo, grupo
    FROM grupo
    WHERE id_grupo= _id_grupo;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_periodo` (IN `_id_periodo` INT(11))  BEGIN
    SELECT id_periodo,periodo, year
    FROM periodo
    WHERE id_periodo= _id_periodo;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_peri_pro` (IN `_id_programa` INT(11))  BEGIN
    SELECT id_periodo, id_programa
    FROM peri_pro
    WHERE id_programa= _id_programa;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_programa_educativo` (IN `_id_programa` INT(11))  BEGIN
    SELECT id_programa, programa_educativo 
    FROM programa_educativo
    WHERE id_programa= _id_programa;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_pro_cuatri` (IN `_id_programa` INT(11))  BEGIN
    SELECT id_programa,id_cuatrimestre
    FROM pro_cuatri
    WHERE id_programa= _id_programa;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_requisicion` (IN `_id_requisicion` INT(11))  BEGIN
    SELECT id_requisicion,fecha_hora_requisicion,fecha_practica,hora_practica,cantidd_inicial, cantidad_final, descripcion_devolucion, observacion,id_utensilio, id_brigada, mat_estudiante_responsable,nom_practica,cantidad_pedida
    FROM requisicion
    WHERE id_requisicion= _id_requisicion;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Obtener1_utensilios` (IN `_id_utensilio` INT(11))  BEGIN
    SELECT id_utensilio,descripcion, cant_asignada, cant_exit
    FROM utensilios
    WHERE id_utensilio= _id_utensilio;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_administrador` ()  BEGIN
    SELECT numero_empleado,nom_completo,contrasena
    FROM administrador; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_alumno` ()  BEGIN
    SELECT matricula,id_grupo,useremail,username,userpassword,termcondition,userstatus,token,dt,id,id_cuatrimestre,id_periodo,id_programa
    FROM alumno;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_asignatura` ()  BEGIN
    SELECT id_asignatura,asignatura
    FROM asignatura;  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_asignatura_alumno` (IN `_matricula` INT(11))  BEGIN
SELECT  DISTINCT asignatura.id_asignatura,
         asignatura.asignatura
FROM     alumno 
INNER JOIN peri_pro_cua_gru_asig  ON alumno.id_periodo = peri_pro_cua_gru_asig.id_periodo and alumno.id_programa = peri_pro_cua_gru_asig.id_programa and alumno.id_cuatrimestre = peri_pro_cua_gru_asig.id_cuatrimestre 
INNER JOIN asignatura  ON peri_pro_cua_gru_asig.id_asigantura = asignatura.id_asignatura
WHERE    ( alumno.matricula = _matricula );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_asignatura_alumno_requi` (IN `periodo` INT(11), IN `programa` INT(11), IN `cuatrimestre` INT(11), IN `grupo` INT(11))  SELECT  asignatura.id_asignatura,
 asignatura.asignatura
FROM     asignatura 
INNER JOIN peri_pro_cua_gru_asig  ON asignatura.id_asignatura = peri_pro_cua_gru_asig.id_asigantura 
INNER JOIN alumno  ON alumno.id_periodo = peri_pro_cua_gru_asig.id_periodo and alumno.id_programa = peri_pro_cua_gru_asig.id_programa and alumno.id_cuatrimestre = peri_pro_cua_gru_asig.id_cuatrimestre and alumno.id_grupo = peri_pro_cua_gru_asig.id_grupo
WHERE    ( alumno.id_periodo = periodo ) AND ( alumno.id_programa = programa ) AND ( alumno.id_cuatrimestre = cuatrimestre ) AND ( alumno.id_grupo = grupo )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_asignauturas_programa` (IN `programa` INT(11))  SELECT   asignatura.asignatura,
         asignatura.id_asignatura
FROM     asignatura
WHERE    (asignatura.id_programa = programa )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_brigada` ()  BEGIN
    SELECT id_brigada,numero_brigada
    FROM brigada;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_brigadas_alumnos_brigada_requisicion` (IN `asignatura` INT(11))  SELECT   peri_pro_cua_gru_asig.id_asigantura,
         alumno.username,
         alumno.matricula
FROM     alum_brig
INNER JOIN alumno  ON alum_brig.matricula = alumno.matricula 
INNER JOIN brigada  ON alum_brig.id_brigada = brigada.id_brigada 
INNER JOIN briga_asigna  ON briga_asigna.id_brigada = brigada.id_brigada 
INNER JOIN peri_pro_cua_gru_asig  ON briga_asigna.id_peri_pro_cua_gru_asig = peri_pro_cua_gru_asig.id
WHERE    ( peri_pro_cua_gru_asig.id_asigantura = asignatura )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_brigadas_requisicion` (IN `periodo` INT(11), IN `programa` INT(11), IN `cuatrimestre` INT(11), IN `grupo` INT(11), IN `asignatura` INT(11))  SELECT   brigada.numero_brigada,
         brigada.id_brigada
FROM     briga_asigna 
INNER JOIN peri_pro_cua_gru_asig  ON briga_asigna.id_peri_pro_cua_gru_asig = peri_pro_cua_gru_asig.id 
INNER JOIN brigada  ON briga_asigna.id_brigada = brigada.id_brigada 
WHERE   ( peri_pro_cua_gru_asig.id_periodo = periodo ) AND ( peri_pro_cua_gru_asig.id_programa = programa) AND ( peri_pro_cua_gru_asig.id_cuatrimestre = cuatrimestre ) AND ( peri_pro_cua_gru_asig.id_grupo = grupo )AND ( peri_pro_cua_gru_asig.id_asigantura = asignatura )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_categoria` ()  SELECT   categoria.categoria,
         categoria.id_categoria
FROM     categoria$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_cuatrimestre` ()  BEGIN
    SELECT id_cuatrimestre, cuatrimestre
    FROM cuatrimestre;
     
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_cuatrimestre_asignatura` (IN `programa` INT(11), IN `periodo` INT(11))  SELECT  DISTINCT  cuatrimestre.id_cuatrimestre,
         cuatrimestre.cuatrimestre
FROM     peri_pro_cua_gru_asig 
INNER JOIN cuatrimestre  ON peri_pro_cua_gru_asig.id_cuatrimestre = cuatrimestre.id_cuatrimestre
WHERE    ( peri_pro_cua_gru_asig.id_programa=programa) AND ( peri_pro_cua_gru_asig.id_periodo=periodo)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_deudor` ()  BEGIN
    SELECT id_d,fecha,status_deudor,id_requisicion,mat_estudiante_responsable
    FROM deudor;  
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_facilitador` ()  BEGIN
    SELECT numero_empleado,nombre
    FROM facilitador;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_grupo` ()  BEGIN
    SELECT id_grupo, grupo
    FROM grupo;
     
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_gruposs` (IN `periodo` INT(11), IN `programa` INT(11), IN `cuatrimestre` INT(11))  SELECT   grupo.id_grupo,
         grupo.grupo
FROM     peri_pro_cua_gru_asig 
INNER JOIN grupo  ON peri_pro_cua_gru_asig.id_grupo = grupo.id_grupo 
WHERE    ( peri_pro_cua_gru_asig.id_periodo = periodo ) AND ( peri_pro_cua_gru_asig.id_programa =programa   ) AND ( peri_pro_cua_gru_asig.id_cuatrimestre = cuatrimestre  )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_periodo` ()  BEGIN
    SELECT id_periodo,periodo, year
    FROM periodo;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_programa_asignautura` (IN `periodo` INT(11))  SELECT DISTINCT  programa_educativo.programa_educativo,
         programa_educativo.id_programa
FROM     programa_educativo 
INNER JOIN peri_pro_cua_gru_asig  ON programa_educativo.id_programa=peri_pro_cua_gru_asig.id_programa
WHERE    (peri_pro_cua_gru_asig.id_periodo= periodo)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_programa_educativo` ()  BEGIN
    SELECT DISTINCT id_programa, programa_educativo 
    FROM programa_educativo; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_requisicion` ()  BEGIN
    SELECT id_requisicion,fecha_hora_requisicion,fecha_practica,hora_practica,cantidd_inicial, cantidad_final, descripcion_devolucion, observacion,id_utensilio, id_brigada, mat_estudiante_responsable,nom_practica,cantidad_pedida
    FROM requisicion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_Status_requisicion` ()  BEGIN
    SELECT id_status,descripcion
    FROM status_requisicion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_utensilios` ()  BEGIN
    SELECT id_utensilio,descripcion, cant_asignada, cant_exit
    FROM utensilios; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_utensilios2` ()  BEGIN
    SELECT   categoria.id_categoria,
         categoria.categoria,
         utensilios.id_utensilio,
         utensilios.descripcion,
         utensilios.cant_asignada,
         utensilios.cant_exit
FROM     cate_uten
INNER JOIN categoria  ON cate_uten.id_categoria = categoria.id_categoria 
INNER JOIN utensilios  ON utensilios.id_utensilio = cate_uten.id_utensilios;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Select_utensilios_alumno` (IN `_id_requi` INT(11), IN `_matricula` INT(11))  BEGIN
SELECT   
requisicion.mat_estudiante_responsable	,
requi_utensilios.id_requisicion,
requi_utensilios.id_utensilios,
utensilios.descripcion,
utensilios.cant_asignada,
requi_utensilios.cant_solicitado
FROM     requi_utensilios
INNER JOIN utensilios ON utensilios.id_utensilio  = requi_utensilios.id_utensilios
INNER JOIN requisicion ON requi_utensilios.id_requisicion=requisicion.id_requisicion
WHERE   ( requi_utensilios.id_requisicion = _id_requi ) AND  (requisicion.mat_estudiante_responsable=_matricula  );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_administrador` (`id` INT(11), `nom_compl` VARCHAR(50), `cont` VARCHAR(130), `newid` INT(11))  BEGIN
  UPDATE administrador
  SET
  numero_empleado = newid,
  nom_completo = nom_compl,
  contrasena=cont
  WHERE numero_empleado = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_alumno` (`id` INT(11), `nom` VARCHAR(255), `correo` VARCHAR(255), `cuatri` INT(11), `id_grupo` INT(11))  BEGIN
  UPDATE alumno
  SET
  username= nom,
  useremail=correo,
  id_cuatrimestre= cuatri,
  id_grupo=id_grupo
  WHERE matricula = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_asignatura` (`id` INT(11), `asig` VARCHAR(50), `id_cuat` VARCHAR(30))  BEGIN
  UPDATE asignatura
  SET
  asignatura= asig,
  id_cuatrimestre=id_cuat
  WHERE id_asignatura = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_brigada` (`id` VARCHAR(30), `num_brig` INT(11))  BEGIN
  UPDATE brigada
  SET
  numero_brigada=num_brig
  WHERE id_brigada = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_cuatrimestre` (`id` INT(11), `cuatri` INT(11))  BEGIN
  UPDATE cuatrimestre
  SET
  
  cuatrimestre = cuatri

  WHERE id_cuatrimestre= id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_deudor` (`fec` INT, `status_d` VARCHAR(30), `id_req` INT(11), `mat_estu` INT(11), `id_dd` INT(11))  BEGIN
  UPDATE deudor
  SET
  fecha = fec,
  status_deudor= status_d,
  id_requisicion = id_req,
  mat_estudiante_responsable=mat_estu
  WHERE id_d = id_dd;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_facilitador` (`id` INT(11), `nom` VARCHAR(50), `newid` INT(11))  BEGIN
  UPDATE facilitador
  SET
  numero_empleado =newid,
  nombre = nom
  WHERE numero_empleado= id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_facilitador_peri_pro` (IN `periodo` INT(11), IN `programa` INT(11), IN `cuatrimestre` INT(11), IN `grupo` INT(11), IN `asignatura` INT(11), IN `facilitador` INT(11))  BEGIN	 
	 UPDATE peri_pro_cua_gru_asig SET
	 id_facilitador = facilitador
WHERE
	     id_periodo = periodo AND
	    id_programa = programa AND
	id_cuatrimestre = cuatrimestre AND
	  id_asigantura = asignatura AND
	       id_grupo = grupo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_grupo` (`id` INT(11), `grup` VARCHAR(30))  BEGIN
  UPDATE grupo
  SET
  grupo =grup
  WHERE id_grupo= id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_periodo` (`id` INT(11), `peri` VARCHAR(40), `yea` INT(11))  BEGIN
  UPDATE periodo
  SET
  periodo= peri,
  year = yea
 
  WHERE id_periodo = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_programa_educativo` (`id` INT(11), `programa` VARCHAR(50))  BEGIN
  UPDATE programa_educativo
  SET
  programa_educativo = programa  WHERE id_programa = id;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_requisicion` (`id` INT(11), `fech_prac` DATE, `hora_prac` TIME, `cant_in` INT(11), `cant_fin` INT(11), `descripcion` VARCHAR(100), `obser` VARCHAR(100), `id_uten` VARCHAR(30), `id_brig` VARCHAR(30), `mat_estud` INT(11), `nom_prac` VARCHAR(50), `cant_ped` INT(11))  BEGIN
  UPDATE requisicion
  SET
 fecha_practica=fech_prac,
 hora_practica=hora_prac,
  cantidad_inicial=cant_in,
    cantidad_final=cant_fin,
     descripcion_devolucion=descripcion,
     observacion=obser,
    id_requisicion=id_uten,
       id_brigada=id_brig,
       mat_estudiante_responsable=mat_estud,
        nom_practica=nom_prac,
   cantidad_pedida=cant_ped
 
  WHERE id_requisicion = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Update_utensilios` (`id` INT(11), `des` VARCHAR(40), `can_asig` INT(11), `can_ex` INT(11))  BEGIN
  UPDATE utensilios
  SET
  descripcion= des,
  cant_asignada = can_asig,
  cant_exit=can_ex
  WHERE id_utensilio= id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `numero_empleado` int(11) NOT NULL,
  `useremail` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userpassword` varchar(255) NOT NULL,
  `termcondition` tinyint(255) NOT NULL,
  `userstatus` tinyint(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `dt` datetime NOT NULL,
  `id` int(255) NOT NULL,
  `u_status` tinyint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`numero_empleado`, `useremail`, `username`, `userpassword`, `termcondition`, `userstatus`, `token`, `dt`, `id`, `u_status`) VALUES
(1, 'admin@utvm.edu.mx', 'administrador', '$2y$12$fa9AhNIHDQz4FDajQqo6a.tvMs7ErapinTr9mBhfPnzyeyO/jXN86', 1, 1, '161208725117ce6bb4c99cf8d23c747d', '2020-08-02 18:52:34', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `matricula` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `useremail` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userpassword` varchar(255) NOT NULL,
  `termcondition` tinyint(255) NOT NULL,
  `userstatus` tinyint(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `dt` datetime NOT NULL,
  `id` int(255) NOT NULL,
  `id_cuatrimestre` int(11) NOT NULL,
  `id_programa` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`matricula`, `id_grupo`, `useremail`, `username`, `userpassword`, `termcondition`, `userstatus`, `token`, `dt`, `id`, `id_cuatrimestre`, `id_programa`, `id_periodo`) VALUES
(123456, 1, 'ilse@gmail.com', 'Ilse cornejo delgado', '$2y$12$7HuWeCTXWRsldYyTKrnstux6hMaFi20QKO01jN60HaSPHRL4QQUKq', 1, 1, '10228056e6c31e2d8726dcacde9157be', '2020-11-07 22:11:36', 123456, 1, 1, 21),
(1730859, 1, 'jazz21399@gmail.com', 'Jazmin Hernández Serrano', '$2y$12$ELGkOmGIz5KI.PPQMHlHvu24EcXRerbYS9HjcMiTdXx88iYQvoYM2', 1, 1, '21fa0efbdd97e123edbbe61f317358a6', '2020-10-10 07:14:17', 1730859, 1, 1, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alum_brig`
--

CREATE TABLE `alum_brig` (
  `matricula` int(11) NOT NULL,
  `id_brigada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alum_brig`
--

INSERT INTO `alum_brig` (`matricula`, `id_brigada`) VALUES
(1730859, 1),
(1730859, 2),
(123456, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id_asignatura` int(11) NOT NULL,
  `asignatura` varchar(50) NOT NULL,
  `id_programa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id_asignatura`, `asignatura`, `id_programa`) VALUES
(1, 'Bases Culinarias', 1),
(2, 'Seguridad e Higiene en alimentos', 1),
(3, 'Fundamentos de nutricion ', 1),
(4, 'Panaderia II', 1),
(5, 'Operacion de un bar', 1),
(6, 'Pasteleria', 1),
(7, 'Bebidas', 1),
(8, 'Cocina Oriental', 4),
(9, 'Cocina Europea', 4),
(10, 'Mixología', 4),
(11, 'Cocina Mexicana', 4),
(12, 'Ingeniería del menú', 4),
(13, 'Alta cocina Mexicana', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asig_uten`
--

CREATE TABLE `asig_uten` (
  `id_asignatura` int(11) NOT NULL,
  `id_utensilio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asig_uten`
--

INSERT INTO `asig_uten` (`id_asignatura`, `id_utensilio`) VALUES
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(8, 11),
(8, 12),
(8, 13),
(8, 14),
(8, 15),
(8, 17),
(9, 1),
(9, 2),
(9, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asi_fa`
--

CREATE TABLE `asi_fa` (
  `id_asignatura` int(11) NOT NULL,
  `numero_empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asi_fa`
--

INSERT INTO `asi_fa` (`id_asignatura`, `numero_empleado`) VALUES
(8, 674),
(9, 564),
(7, 464),
(5, 231),
(4, 124),
(6, 453);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brigada`
--

CREATE TABLE `brigada` (
  `id_brigada` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `numero_brigada` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `brigada`
--

INSERT INTO `brigada` (`id_brigada`, `id_grupo`, `numero_brigada`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `briga_asigna`
--

CREATE TABLE `briga_asigna` (
  `id_brigada` int(11) NOT NULL,
  `id_peri_pro_cua_gru_asig` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `briga_asigna`
--

INSERT INTO `briga_asigna` (`id_brigada`, `id_peri_pro_cua_gru_asig`) VALUES
(1, 150),
(2, 150),
(1, 151),
(2, 151);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categoria`) VALUES
(1, 'Cocina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cate_uten`
--

CREATE TABLE `cate_uten` (
  `id_categoria` int(11) NOT NULL,
  `id_utensilios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cate_uten`
--

INSERT INTO `cate_uten` (`id_categoria`, `id_utensilios`) VALUES
(1, 20),
(1, 1),
(1, 2),
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuatrimestre`
--

CREATE TABLE `cuatrimestre` (
  `id_cuatrimestre` int(11) NOT NULL,
  `cuatrimestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuatrimestre`
--

INSERT INTO `cuatrimestre` (`id_cuatrimestre`, `cuatrimestre`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuatri_grupo`
--

CREATE TABLE `cuatri_grupo` (
  `id_cuatrimestre` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cuatri_grupo`
--

INSERT INTO `cuatri_grupo` (`id_cuatrimestre`, `id_grupo`) VALUES
(1, 1),
(1, 2),
(4, 1),
(4, 2),
(7, 1),
(10, 1),
(2, 1),
(2, 2),
(5, 1),
(5, 2),
(8, 1),
(11, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deudor`
--

CREATE TABLE `deudor` (
  `status_deudor` varchar(30) NOT NULL,
  `id_requisicion` int(11) NOT NULL,
  `mat_estudiante_responsable` int(11) NOT NULL,
  `id_d` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facilitador`
--

CREATE TABLE `facilitador` (
  `numero_empleado` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facilitador`
--

INSERT INTO `facilitador` (`numero_empleado`, `nombre`) VALUES
(43, 'LIC. ELIBETH FIDELINA CORONA HERNANDEZ'),
(50, 'LIC. DARIO EDUARDO ORTIZ QUIJANO'),
(54, 'LIC. DARIO EDUARDO ORTIZ QUIJANO'),
(123, 'ING. EMMANUEL CASTILLO SEGOVIA'),
(124, 'LDTS. EIRA MORENO MARTiNEZ'),
(129, 'LIC. MIRIAM SANCHEZ ARTEAGA'),
(231, 'LIC. RUBÃ‰N HERNÃNDEZ LUGO'),
(432, 'LIC. BLANCA ESTELA ZARAGOZA SANCHEZ'),
(453, 'LIC. ALDO GREGORIO HERNÃNDEZ PÃ‰REZ'),
(464, 'LIC. JOSE MANUEL HERNANDEZ RUIZ'),
(564, 'LIC. MARICELA HERNÃNDEZ MORENO'),
(674, 'LIC. LUIS ALBERTO LÃ“PEZ CERVANTES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id_grupo` int(11) NOT NULL,
  `grupo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id_grupo`, `grupo`) VALUES
(1, 'M'),
(2, 'N'),
(3, 'A'),
(4, 'B'),
(5, 'C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE `periodo` (
  `id_periodo` int(11) NOT NULL,
  `periodo` varchar(40) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`id_periodo`, `periodo`, `year`) VALUES
(13, 'ENERO-ABRIL', 2020),
(14, 'MAYO-AGOSTO', 2020),
(15, 'SEPTIEMBRE-DICIEMBRE', 2020),
(16, 'ENERO-ABRIL', 2021),
(17, 'MAYO-AGOSTO', 2021),
(18, 'SEPTIEMBRE-DICIEMBRE', 2021),
(19, 'ENERO-ABRIL', 2019),
(20, 'MAYO-AGOSTO', 2019),
(21, 'SEPTIEMBRE-DICIEMBRE', 2019);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peri_pro`
--

CREATE TABLE `peri_pro` (
  `id_periodo` int(11) NOT NULL,
  `id_programa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `peri_pro`
--

INSERT INTO `peri_pro` (`id_periodo`, `id_programa`) VALUES
(21, 1),
(21, 2),
(21, 3),
(21, 4),
(21, 5),
(21, 6),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(13, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peri_pro_cua_gru_asig`
--

CREATE TABLE `peri_pro_cua_gru_asig` (
  `id_periodo` int(11) NOT NULL,
  `id_programa` int(11) NOT NULL,
  `id_cuatrimestre` int(11) NOT NULL,
  `id_asigantura` int(11) DEFAULT NULL,
  `id_grupo` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `id_facilitador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `peri_pro_cua_gru_asig`
--

INSERT INTO `peri_pro_cua_gru_asig` (`id_periodo`, `id_programa`, `id_cuatrimestre`, `id_asigantura`, `id_grupo`, `id`, `id_facilitador`) VALUES
(21, 1, 1, NULL, 1, 135, 0),
(21, 1, 1, NULL, 2, 136, 0),
(21, 1, 4, NULL, 1, 137, 0),
(21, 1, 4, NULL, 2, 138, 0),
(21, 4, 7, 0, 0, 139, 50),
(21, 4, 10, 0, 0, 140, 0),
(13, 1, 2, NULL, 1, 141, 0),
(13, 1, 2, NULL, 2, 142, 0),
(13, 1, 5, NULL, 1, 143, 0),
(13, 1, 5, NULL, 2, 144, 0),
(13, 4, 8, NULL, 1, 145, 0),
(13, 4, 11, NULL, 1, 146, 0),
(21, 4, 7, 8, NULL, 147, 0),
(21, 4, 10, 9, NULL, 148, 0),
(21, 1, 1, 4, 1, 150, 124),
(21, 1, 4, 6, 2, 151, 453);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa_educativo`
--

CREATE TABLE `programa_educativo` (
  `id_programa` int(11) NOT NULL,
  `programa_educativo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `programa_educativo`
--

INSERT INTO `programa_educativo` (`id_programa`, `programa_educativo`) VALUES
(1, 'TSU en Gastronomia'),
(2, 'TSU en Turismo'),
(3, 'TSU en TI'),
(4, 'Licenciatura en Gastronomía'),
(5, 'Licenciatura en turismo'),
(6, 'Ingeniería en TIC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pro_cuatri`
--

CREATE TABLE `pro_cuatri` (
  `id_programa` int(11) NOT NULL,
  `id_cuatrimestre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pro_cuatri`
--

INSERT INTO `pro_cuatri` (`id_programa`, `id_cuatrimestre`) VALUES
(1, 1),
(1, 4),
(4, 7),
(4, 10),
(1, 2),
(1, 5),
(4, 8),
(4, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requisicion`
--

CREATE TABLE `requisicion` (
  `id_requisicion` int(11) NOT NULL,
  `fecha_hora_requsicion` datetime NOT NULL,
  `fecha_practica` date NOT NULL,
  `hora_practica` time NOT NULL,
  `descripcion_devolucion` varchar(100) DEFAULT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `id_brigada` int(11) NOT NULL,
  `mat_estudiante_responsable` int(11) NOT NULL,
  `no_requisicion` int(11) NOT NULL,
  `id_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `requisicion`
--

INSERT INTO `requisicion` (`id_requisicion`, `fecha_hora_requsicion`, `fecha_practica`, `hora_practica`, `descripcion_devolucion`, `observacion`, `id_brigada`, `mat_estudiante_responsable`, `no_requisicion`, `id_status`) VALUES
(1, '2020-10-28 22:13:31', '2020-10-28', '10:13:00', NULL, NULL, 1, 1730859, 1, 1),
(2, '2020-10-28 22:13:56', '2020-10-28', '22:13:00', NULL, NULL, 2, 1730859, 2, 1),
(3, '2020-10-28 22:18:26', '2020-10-28', '10:18:00', NULL, NULL, 1, 1730859, 3, 1),
(4, '2020-10-28 22:22:19', '2020-10-28', '10:22:00', NULL, NULL, 2, 1730859, 4, 1),
(5, '2020-10-28 22:23:05', '2020-10-24', '10:22:00', NULL, NULL, 1, 1730859, 5, 1),
(6, '2020-10-28 22:25:39', '2020-10-28', '22:30:00', NULL, NULL, 1, 1730859, 6, 1),
(7, '2020-10-28 22:27:27', '2020-10-23', '10:27:00', NULL, NULL, 1, 1730859, 7, 1),
(8, '2020-10-28 22:29:08', '2020-10-15', '22:32:00', NULL, NULL, 1, 1730859, 8, 1),
(9, '2020-10-28 22:31:04', '2020-10-29', '22:34:00', NULL, NULL, 1, 1730859, 9, 1),
(10, '2020-10-28 22:40:27', '2020-10-22', '22:44:00', NULL, NULL, 1, 1730859, 10, 1),
(11, '2020-10-28 22:41:42', '2020-10-22', '10:45:00', NULL, NULL, 1, 1730859, 11, 1),
(12, '2020-10-28 22:48:19', '2020-10-28', '22:53:00', NULL, NULL, 1, 1730859, 12, 1),
(13, '2020-10-28 22:49:51', '2020-10-28', '22:53:00', NULL, NULL, 1, 1730859, 13, 1),
(14, '2020-10-28 22:52:11', '2020-10-02', '22:55:00', NULL, NULL, 1, 1730859, 14, 1),
(15, '2020-10-28 22:57:03', '2020-10-22', '22:58:00', NULL, NULL, 1, 1730859, 15, 1),
(16, '2020-10-28 23:03:58', '2020-10-28', '23:07:00', NULL, NULL, 1, 1730859, 16, 1),
(17, '2020-10-28 23:05:02', '2020-10-21', '23:07:00', NULL, NULL, 1, 1730859, 17, 1),
(18, '2020-10-28 23:10:08', '2020-10-22', '23:13:00', NULL, NULL, 1, 1730859, 18, 1),
(19, '2020-10-28 23:15:16', '2020-10-22', '16:15:00', NULL, NULL, 1, 1730859, 19, 1),
(20, '2020-10-28 23:17:44', '2020-09-30', '23:20:00', NULL, NULL, 2, 1730859, 20, 1),
(21, '2020-10-29 19:09:56', '2020-10-29', '19:15:00', NULL, NULL, 1, 1730859, 21, 1),
(22, '2020-11-07 22:01:26', '2020-11-07', '22:06:00', NULL, NULL, 1, 1730859, 22, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requi_utensilios`
--

CREATE TABLE `requi_utensilios` (
  `id_requisicion` int(11) NOT NULL,
  `id_utensilios` int(11) NOT NULL,
  `cant_solicitado` int(11) NOT NULL,
  `can_entregado` int(11) NOT NULL,
  `cant_regresado` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `requi_utensilios`
--

INSERT INTO `requi_utensilios` (`id_requisicion`, `id_utensilios`, `cant_solicitado`, `can_entregado`, `cant_regresado`, `id`) VALUES
(1, 0, 0, 0, 0, 1),
(2, 0, 0, 0, 0, 2),
(3, 1, 3, 0, 0, 3),
(4, 0, 0, 0, 0, 4),
(5, 0, 0, 0, 0, 5),
(6, 0, 0, 0, 0, 6),
(8, 0, 0, 0, 0, 7),
(9, 9, 5, 0, 0, 8),
(10, 0, 5, 0, 0, 9),
(11, 0, 5, 0, 0, 10),
(12, 0, 5, 0, 0, 11),
(13, 0, 5, 0, 0, 12),
(14, 0, 5, 0, 0, 13),
(15, 0, 5, 0, 0, 14),
(16, 0, 5, 0, 0, 15),
(17, 0, 5, 0, 0, 16),
(18, 0, 5, 0, 0, 17),
(19, 0, 5, 0, 0, 18),
(20, 0, 5, 0, 0, 19),
(21, 0, 0, 0, 0, 20),
(22, 0, 0, 0, 0, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_requisicion`
--

CREATE TABLE `status_requisicion` (
  `id_status` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `status_requisicion`
--

INSERT INTO `status_requisicion` (`id_status`, `descripcion`) VALUES
(1, 'Requisicion Solicitado'),
(2, 'Utensilios entregados al alumno'),
(3, 'Utensilios recibidos del alumno'),
(4, 'Utensilios recibidos incompletos'),
(5, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `utensilios`
--

CREATE TABLE `utensilios` (
  `id_utensilio` int(11) NOT NULL,
  `descripcion` varchar(40) NOT NULL,
  `cant_asignada` int(11) NOT NULL,
  `cant_exit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `utensilios`
--

INSERT INTO `utensilios` (`id_utensilio`, `descripcion`, `cant_asignada`, `cant_exit`) VALUES
(1, 'Plato Base', 4, 29),
(2, 'Plato Trinche', 4, 30),
(3, 'Plato Hondo', 2, 35),
(4, 'Tazón', 3, 25),
(5, 'Vaso Juguero', 4, 30),
(6, 'Juego de Cubiertos', 4, 30),
(7, 'Sartén', 3, 35),
(8, 'Coludo', 2, 30),
(9, 'Bowl', 4, 10),
(10, 'Tabla de Picar', 3, 15),
(11, 'Licuadora', 1, 40),
(12, 'Charola', 1, 20),
(14, 'Olla', 2, 20),
(15, 'Cuchara de Servicio ', 3, 20),
(16, 'Cernidor', 1, 8),
(17, 'Pinzas', 1, 8),
(18, 'Batidor Globo', 1, 8),
(19, 'Plato Postre', 3, 25),
(20, 'Budinera', 1, 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`numero_empleado`);

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`matricula`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id_asignatura`);

--
-- Indices de la tabla `brigada`
--
ALTER TABLE `brigada`
  ADD PRIMARY KEY (`id_brigada`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `cuatrimestre`
--
ALTER TABLE `cuatrimestre`
  ADD PRIMARY KEY (`id_cuatrimestre`);

--
-- Indices de la tabla `deudor`
--
ALTER TABLE `deudor`
  ADD PRIMARY KEY (`id_d`);

--
-- Indices de la tabla `facilitador`
--
ALTER TABLE `facilitador`
  ADD PRIMARY KEY (`numero_empleado`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id_grupo`);

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`id_periodo`);

--
-- Indices de la tabla `peri_pro_cua_gru_asig`
--
ALTER TABLE `peri_pro_cua_gru_asig`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `programa_educativo`
--
ALTER TABLE `programa_educativo`
  ADD PRIMARY KEY (`id_programa`);

--
-- Indices de la tabla `requisicion`
--
ALTER TABLE `requisicion`
  ADD PRIMARY KEY (`id_requisicion`),
  ADD KEY `index_id_brigada` (`id_brigada`),
  ADD KEY `index_id_status` (`id_status`),
  ADD KEY `index_mat_estudiante_responsable` (`mat_estudiante_responsable`);

--
-- Indices de la tabla `requi_utensilios`
--
ALTER TABLE `requi_utensilios`
  ADD UNIQUE KEY `unique_id` (`id`);

--
-- Indices de la tabla `status_requisicion`
--
ALTER TABLE `status_requisicion`
  ADD PRIMARY KEY (`id_status`);

--
-- Indices de la tabla `utensilios`
--
ALTER TABLE `utensilios`
  ADD PRIMARY KEY (`id_utensilio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `deudor`
--
ALTER TABLE `deudor`
  MODIFY `id_d` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `peri_pro_cua_gru_asig`
--
ALTER TABLE `peri_pro_cua_gru_asig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
