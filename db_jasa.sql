/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.1.30-MariaDB : Database - db_jasa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_jasa` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_jasa`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  KEY `id` (`id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id`) REFERENCES `data_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`id_admin`,`nama`,`no_hp`,`id`) values 
(1,'Adi Rattana','021123456',NULL),
(2,'Tawat Asta','021111345',NULL),
(3,'Adi Putra','021123333',NULL),
(4,'Asta Dwi Nugraha','08912345672',NULL),
(5,'Dwi Kuncoro','082134567821',NULL),
(6,'Angga','08977711121',1);

/*Table structure for table `biaya_transport` */

DROP TABLE IF EXISTS `biaya_transport`;

CREATE TABLE `biaya_transport` (
  `id_biayatransport` varchar(5) NOT NULL,
  `jarak` varchar(10) NOT NULL,
  `biaya` int(10) NOT NULL,
  PRIMARY KEY (`id_biayatransport`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `biaya_transport` */

insert  into `biaya_transport`(`id_biayatransport`,`jarak`,`biaya`) values 
('B1','0-1km',2000),
('B2','1-2km',4000),
('B3','2-4km',9000),
('B4','4-6km',12000),
('B5','7-9km',14000),
('B6','9-11km',16000),
('B7','11-15km',20000);

/*Table structure for table `data_login` */

DROP TABLE IF EXISTS `data_login`;

CREATE TABLE `data_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `psw` varchar(45) DEFAULT NULL,
  `active` set('Y','N') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `data_login` */

insert  into `data_login`(`id`,`email`,`psw`,`active`) values 
(1,'angga.permana@gmail.com','1fd5cd9766249f170035b7251e2c6b61','Y');

/*Table structure for table `detailtrans` */

DROP TABLE IF EXISTS `detailtrans`;

CREATE TABLE `detailtrans` (
  `id_detail` varchar(5) NOT NULL,
  `id_trans` varchar(5) NOT NULL,
  `id_penyedia` int(11) DEFAULT NULL,
  `id_pengguna` varchar(5) NOT NULL,
  `harga` int(10) NOT NULL,
  `no_ulasan` varchar(5) NOT NULL,
  PRIMARY KEY (`id_detail`,`id_trans`),
  KEY `id_pengguna` (`id_pengguna`),
  KEY `id_trans` (`id_trans`),
  KEY `no_ulasan` (`no_ulasan`),
  KEY `id_penyedia` (`id_penyedia`),
  CONSTRAINT `detailtrans_ibfk_2` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detailtrans_ibfk_3` FOREIGN KEY (`id_trans`) REFERENCES `transaksi` (`id_trans`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detailtrans_ibfk_4` FOREIGN KEY (`no_ulasan`) REFERENCES `ulasan` (`no_ulasan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detailtrans_ibfk_5` FOREIGN KEY (`id_penyedia`) REFERENCES `penyediajasa` (`id_penyedia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detailtrans` */

insert  into `detailtrans`(`id_detail`,`id_trans`,`id_penyedia`,`id_pengguna`,`harga`,`no_ulasan`) values 
('DTS01','TS001',NULL,'US002',46000,'U0001');

/*Table structure for table `jasa` */

DROP TABLE IF EXISTS `jasa`;

CREATE TABLE `jasa` (
  `id_jasa` int(11) NOT NULL,
  `nama_jasa` varchar(40) NOT NULL,
  `id_jenis` varchar(5) DEFAULT NULL,
  `biaya` int(10) NOT NULL,
  `ket` text,
  PRIMARY KEY (`id_jasa`),
  KEY `id_jenis` (`id_jenis`),
  CONSTRAINT `jasa_ibfk_1` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_jasa` (`id_jenis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jasa` */

insert  into `jasa`(`id_jasa`,`nama_jasa`,`id_jenis`,`biaya`,`ket`) values 
(1,'Cuci Pakaian','JS001',3000,'per pakaian'),
(2,'Cuci Piring','JS001',1000,'per piring'),
(3,'Pembersihan Lingkungan','JS001',50000,'per jam'),
(4,'Pengiriman Barang','JS003',7000,'per kilometer'),
(5,'Pindah Alat/ Beban','JS002',5000,'per barang');

/*Table structure for table `jenis_jasa` */

DROP TABLE IF EXISTS `jenis_jasa`;

CREATE TABLE `jenis_jasa` (
  `id_jenis` varchar(5) NOT NULL,
  `nama_jenis` varchar(15) NOT NULL,
  PRIMARY KEY (`id_jenis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jenis_jasa` */

insert  into `jenis_jasa`(`id_jenis`,`nama_jenis`) values 
('JS001','Pekerjaan RT'),
('JS002','Pekerjaan Keras'),
('JS003','Pengiriman');

/*Table structure for table `kota` */

DROP TABLE IF EXISTS `kota`;

CREATE TABLE `kota` (
  `id_kota` varchar(5) NOT NULL,
  `nama_kota` varchar(15) NOT NULL,
  PRIMARY KEY (`id_kota`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kota` */

insert  into `kota`(`id_kota`,`nama_kota`) values 
('BDG','Badung'),
('BGL','Bangli'),
('DPS','Denpasar'),
('GYR','Gianyar'),
('JBR','Jembrana'),
('KLK','Klungkung'),
('KRG','Karangasem'),
('SGR','Singaraja'),
('TBN','Tabanan');

/*Table structure for table `pengguna` */

DROP TABLE IF EXISTS `pengguna`;

CREATE TABLE `pengguna` (
  `id_pengguna` varchar(10) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `id_kota` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_pengguna`),
  KEY `id_kota` (`id_kota`),
  CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`id_kota`) REFERENCES `kota` (`id_kota`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pengguna` */

insert  into `pengguna`(`id_pengguna`,`nama`,`no_hp`,`alamat`,`id_kota`) values 
('US001','Ngurah Agung Dewa','08971102322','Jl Antasura','DPS'),
('US002','Li Weng Qi','021332224','Jl Udayana','SGR'),
('US003','Bastian Adi Putra','083114212222','Jl WR Supratman','KRG'),
('US004','Gusti Agung Ngurah Agung','082114234212','Jl Ahmad Yani','BDG'),
('US005','Ida Ayu Puspa Dewi','081234556111','Jl Raya Penatih','GYR'),
('US006','Yudi Pongpisal','083233456126','Jl Raya Denpasar Gilimanuk','TBN'),
('US007','Dwi Agus Satria','082113456889','Jl Raya Sadi','JBR'),
('US008','Adi Buda','089777543678','Jl Dwi Pura','BGL'),
('US009','Sudianingsih','083111289654','Desa Dalam','KLK');

/*Table structure for table `penyediajasa` */

DROP TABLE IF EXISTS `penyediajasa`;

CREATE TABLE `penyediajasa` (
  `id_penyedia` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `id_jasa` int(11) DEFAULT NULL,
  `id_kota` varchar(5) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_penyedia`),
  KEY `id_kota` (`id_kota`),
  KEY `id_admin` (`id_admin`),
  KEY `id_jasa` (`id_jasa`),
  CONSTRAINT `penyediajasa_ibfk_1` FOREIGN KEY (`id_kota`) REFERENCES `kota` (`id_kota`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penyediajasa_ibfk_3` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  CONSTRAINT `penyediajasa_ibfk_4` FOREIGN KEY (`id_jasa`) REFERENCES `jasa` (`id_jasa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `penyediajasa` */

insert  into `penyediajasa`(`id_penyedia`,`nama`,`no_hp`,`alamat`,`id_jasa`,`id_kota`,`id_admin`) values 
(2,'Soo Dia Park','083556121223','Jl Pahlawan',1,'SGR',1),
(9,'Angga Jo','0897771121','Jl Udayana',2,NULL,1);

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `id_trans` varchar(5) NOT NULL,
  `tgl_trans` date NOT NULL,
  `id_biayatransport` varchar(5) DEFAULT NULL,
  `ket` text,
  PRIMARY KEY (`id_trans`),
  KEY `id_biayatransport` (`id_biayatransport`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_biayatransport`) REFERENCES `biaya_transport` (`id_biayatransport`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transaksi` */

insert  into `transaksi`(`id_trans`,`tgl_trans`,`id_biayatransport`,`ket`) values 
('TS001','2021-12-12','B2',NULL);

/*Table structure for table `ulasan` */

DROP TABLE IF EXISTS `ulasan`;

CREATE TABLE `ulasan` (
  `no_ulasan` varchar(5) NOT NULL,
  `ulasan` text,
  PRIMARY KEY (`no_ulasan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ulasan` */

insert  into `ulasan`(`no_ulasan`,`ulasan`) values 
('U0001','Mba nya cepet banget cuman ada beberapa baju ternyata tidak bersih.');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
