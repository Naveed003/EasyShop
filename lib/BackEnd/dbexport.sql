-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: EASY_SHOP
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `4xjtd2xag2nhssh7l6k28srn0ab2`
--

DROP TABLE IF EXISTS `4xjtd2xag2nhssh7l6k28srn0ab2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `4xjtd2xag2nhssh7l6k28srn0ab2` (
  `asin` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `initial_price` float NOT NULL,
  `update_price` float DEFAULT NULL,
  `current_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `4xjtd2xag2nhssh7l6k28srn0ab2`
--

LOCK TABLES `4xjtd2xag2nhssh7l6k28srn0ab2` WRITE;
/*!40000 ALTER TABLE `4xjtd2xag2nhssh7l6k28srn0ab2` DISABLE KEYS */;
INSERT INTO `4xjtd2xag2nhssh7l6k28srn0ab2` VALUES ('B0831JHZN4',1099,1099,1099),('B085M5R82K',4499,4499,4499);
/*!40000 ALTER TABLE `4xjtd2xag2nhssh7l6k28srn0ab2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dsfh3oesktbuasseq8equifhiu13`
--

DROP TABLE IF EXISTS `dsfh3oesktbuasseq8equifhiu13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dsfh3oesktbuasseq8equifhiu13` (
  `asin` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `initial_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `update_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `current_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dsfh3oesktbuasseq8equifhiu13`
--

LOCK TABLES `dsfh3oesktbuasseq8equifhiu13` WRITE;
/*!40000 ALTER TABLE `dsfh3oesktbuasseq8equifhiu13` DISABLE KEYS */;
INSERT INTO `dsfh3oesktbuasseq8equifhiu13` VALUES ('B0845BT7HN','14490.0','14490.0','14490.0'),('B01LX8Z8TP','279.99','279.99','279.99'),('B00DGEGJ02','55.15','55.15','55.15'),('B086VZ86F3','399.0','399.0','399.0'),('B07DPG774K','18.7','18.7','18.7'),('B06Y2KCXCM','N/A','N/A','N/A'),('B07DT7LZ25','139.9','139.9','139.9'),('B086MZ9HQT','149.0','149.0','149.0'),('B003LNLPQ6','12.32','12.32','12.32'),('B07ZH8SF84','N/A','N/A','N/A'),('B00V6JA95A','42.88','42.88','42.88'),('B07S63259K','8.24','8.24','8.24'),('B08PCGQ24Z','25.59','25.59','25.59'),('B0823PTQZB','89.99','89.99','89.99');
/*!40000 ALTER TABLE `dsfh3oesktbuasseq8equifhiu13` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `asin` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `current_price` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `img_URL` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `STORE` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('B0845BT7HN','Faber 60 cm 1200 m┬│/hr Curved Glass, Autoclean Chimney (HOOD EVEREST SC TC HC BK 60, Filterless technology, Touch Control, Black)','14490.0','https://www.amazon.in/dp/B0845BT7HN/ref=s9_acsd_al_bw_c2_x_1_i?pf_rd_m=A1K21FY43GMZF8&pf_rd_s=merchandised-search-9&pf_rd_r=38B2P4ZJQ7JDZVBQJJZM&pf_rd_t=101&pf_rd_p=1fae4382-5fb6-433a-b63d-951f41685f0f&pf_rd_i=22430932031','https://images-na.ssl-images-amazon.com/images/I/61RKjBPjs1L._SX679_.jpg','INDIA'),('B01LX8Z8TP','TP-Link AC 1350 Archer C60 Roteador Wireless Dual Band','279.99','https://www.amazon.com.br/TP-Link-Roteador-Wireless-Antenas-Preto/dp/B01LX8Z8TP/?_encoding=UTF8&pd_rd_w=Wc62P&pf_rd_p=1754c4a7-2ac1-4ecc-858b-1ce8f1eed753&pf_rd_r=BNS3T1MBMPQJ4H91BDPX&pd_rd_r=0a6de4d0-8783-46d6-8047-e22637cc1cf3&pd_rd_wg=SaY2u&ref_=pd_gw_ci_mcx_mr_hp_d','https://images-na.ssl-images-amazon.com/images/I/71Mp2tGdfkL._AC_SX569_.jpg','BRAZIL'),('B00DGEGJ02','WeMo Light Switch, Wi-Fi Enabled, Compatible with Amazon Echo (Works with Amazon Alexa)','55.15','https://www.amazon.ca/Light-Switch-Enabled-Compatible-Amazon/dp/B00DGEGJ02/ref=lp_19309434011_1_4?s=specialty-aps','https://images-na.ssl-images-amazon.com/images/I/510yp4Dw5pL._AC_SX385_.jpg','CANADA'),('B086VZ86F3','3 pcs Bandas de Resistencia,Salandens Bandas de Ejercicio Cadera con Resistencia de Bot├¡n, Bandas de C├¡rculo Ejercicio Para Piernas Y Gl├║teos Gruesos, Bandas De Resistencia En L├ítex Natural para Deporte Ejercicios Rehabilitaci├│n Yoga (Rosa+P├║rpura+Verde)','399.0','https://www.amazon.com.mx/Resistencia-Salandens-Ejercicio-Ejercicios-Rehabilitaci%C3%B3n/dp/B086VZ86F3/?_encoding=UTF8&pd_rd_w=XHQDe&pf_rd_p=32e7642a-3bfb-43c3-8180-bd079aed1adb&pf_rd_r=ESDF1QNSZ09DRTJ0JTVZ&pd_rd_r=cf9f0a9c-8c93-4b70-98f6-602e2b8a323e&pd_rd_wg=chccY&ref_=pd_gw_crs_zg_bs_9482660011','https://images-na.ssl-images-amazon.com/images/I/81ZHf1qNSlL._AC_SY450_.jpg','MEXICO'),('B07DPG774K','RUNMUS Gaming Headset for PS4, Xbox One, PC Headset w/Surround Sound, Noise Canceling Over Ear Headphones with Mic & LED Light, Compatible with PS5, PS4, Xbox One, Switch, PC, PS3, Mac, Laptop','18.7','https://www.amazon.com/RUNMUS-Nintendo-Headphones-Canceling-Microphone/dp/B07DPG774K/?_encoding=UTF8&pd_rd_w=iBiKJ&pf_rd_p=1f552c7a-1af2-4608-bc6f-ba06ca3c43ac&pf_rd_r=R7VFBXYM0PBZPF6R14ZY&pd_rd_r=b3b25ffb-a164-41e7-aef5-eb6d5fa2e369&pd_rd_wg=inVBs&ref_=pd_gw_unk','https://images-na.ssl-images-amazon.com/images/I/81PtEw326aL._AC_SY355_.jpg','UNITED STATES'),('B06Y2KCXCM','Toshiba N300 6TB NAS 3.5-Inch Internal Hard Drive- SATA 6 Gb/s 7200 RPM 128MB (HDWN160XZSTA)','N/A','https://www.amazon.sg/Toshiba-3-5-Inch-Internal-Drive-HDWN160XZSTA/dp/B06Y2KCXCM/?_encoding=UTF8&pd_rd_w=gRqxx&pf_rd_p=6872e9d6-3732-454a-842e-cb4e69706e23&pf_rd_r=PQQHENSBDHMKTV3657CB&pd_rd_r=fc664ed2-9647-4dc9-9bad-d9beb6feec8f&pd_rd_wg=LR5ff&ref_=pd_gw_unk','https://images-na.ssl-images-amazon.com/images/I/71uCpRZekML._AC_SY679_.jpg','SINGAPORE'),('B07DT7LZ25','Spigen Essential F308W H─▒zl─▒ Kablosuz ┼₧arj Cihaz─▒ iOS 7.5W / Android 10W (QI Sertifikal─▒ T├╝m Cihazlar ile Uyumlu) - 000CH23122','139.9','https://www.amazon.com.tr/Spigen-Essential-F308W-Kablosuz-Teknolojisi/dp/B07DT7LZ25/?_encoding=UTF8&pd_rd_w=U6uK2&pf_rd_p=dd855b7d-71d9-4b52-8f77-efa59f4ccd24&pf_rd_r=CRNVSMXSQXS4GNZFH53Z&pd_rd_r=eb4fb49d-d492-485a-a1f3-da6d5ca1b883&pd_rd_wg=EHRjH&ref_=pd_gw_unk','https://images-na.ssl-images-amazon.com/images/I/616aI9JrndL._AC_SX425_.jpg','TURKEY'),('B086MZ9HQT','Anker Soundcore Life Dot 2 True Wireless Earbuds, 100 Hour Playtime, 8mm Drivers, Superior Sound, Secure Fit with AirWings, Bluetooth 5, Comfortable Design Earphones for Commute, Sports, Jogging','149.0','https://www.amazon.ae/Soundcore-Wireless-Bluetooth-Comfortable-Earphones/dp/B086MZ9HQT/ref=sr_1_1?_encoding=UTF8&dchild=1&keywords=B08GG2WYWN%7CB086MZ9HQT%7CB086QNTKX9%7CB08GFKFQ96%7CB016XTADG2%7CB07ZNT7PRL%7CB0899S421T%7CB0833PCJY3&pf_rd_i=desktop&pf_rd_m=A2KKU8J8O8784X&pf_rd_p=56d3ea80-9342-4be1-874a-bcf8d5c38c72&pf_rd_r=4560XSSE6MFN9HJPDPTD&pf_rd_t=36701&qid=1611921499&smid=A2CEYXUGZ2IKQW&sr=8-1','https://images-na.ssl-images-amazon.com/images/I/61tgDG0RiDL._AC_SX425_.jpg','UNITED ARAB EMIRATES'),('B003LNLPQ6','HP 301 Cartouche d\'Encre Noire Authentique (CH561EE)','12.32','https://www.amazon.fr/HP-Cartouche-dEncre-Authentique-CH561EE/dp/B003LNLPQ6/?_encoding=UTF8&pd_rd_w=1k6KF&pf_rd_p=e15634ec-e3d2-40f1-879b-3bd625b0f323&pf_rd_r=P5YQW3X6B5WC1W9AKG9C&pd_rd_r=a107becc-3214-4016-a3f6-6331cb82e709&pd_rd_wg=05wAq&ref_=pd_gw_crs_zg_bs_340858031','https://images-na.ssl-images-amazon.com/images/I/71aagG1ieOL._AC_SX425_.jpg','FRANCE'),('B07ZH8SF84','IKOHS BARISMATIC20B koffiezetapparaat Express','N/A','https://www.amazon.nl/IKOHS-BARISMATIC20B-koffiezetapparaat-Express/dp/B07ZH8SF84?ref_=Oct_DLandingS_D_26a29db9_60&smid=A27JF8KIP4ODDD','https://images-na.ssl-images-amazon.com/images/I/61XrkZbFrCL._AC_SY450_.jpg','NETHERLANDS'),('B00V6JA95A','Converse Chuck Taylor All Star Core Ox, Zapatillas Unisex','42.88','https://www.amazon.es/Converse-Taylor-Zapatillas-Unisex-Optical/dp/B00V6JA95A/?_encoding=UTF8&pd_rd_w=7TvNi&pf_rd_p=94f8948b-b432-4bad-bd59-11ae0644db75&pf_rd_r=NXTBJ4V4M8YWKEFHXFMW&pd_rd_r=93afa6c1-765e-4cec-ae3d-3fe0907797d8&pd_rd_wg=ihTDU&ref_=pd_gw_unk&th=1&psc=1','https://images-na.ssl-images-amazon.com/images/I/71vPGuQusaL._AC_UX625_.jpg','SPAIN'),('B07S63259K','JYDMIX 6ft/1.8m 3 Pack USB A to USB C Nylon Braided Charging Cable USB Type C Sync Cable Compatible with Samsung Galaxy S10/ S9/ S8/ Plus Note 9 etc.(6FT, Silver)','8.24','https://www.amazon.co.uk/JYDMIX-Charging-Compatible-MacBook-Samsung/dp/B07S63259K/?_encoding=UTF8&pd_rd_w=lAXf6&pf_rd_p=ce5fc0a2-6e32-43b4-b047-ac310c94d64c&pf_rd_r=THDRW9Y284YDS6FB0N7C&pd_rd_r=d47823d5-7108-4c7d-be11-aeef3726ceff&pd_rd_wg=cefGC&ref_=pd_gw_unk','https://images-na.ssl-images-amazon.com/images/I/81uEh%2BwlbzL._AC_SX466_.jpg','UNITED KINGDOM'),('B08PCGQ24Z','XL&JUN Stainless Steel Colander 5 Size Expandable Fryer Cooker Basket Kitchen Colander Magic Filter Mesh Cooking Mesh Filter Colander Sieve Sieve Portable, Practical, Small Storage','25.59','https://www.amazon.com.au/XL-JUN-Stainless-Expandable-Practical/dp/B08PCGQ24Z?ref_=Oct_s9_apbd_onr_hd_bw_b5TVLKF&pf_rd_r=PEHMN6CDK9JSYV5DPXJV&pf_rd_p=dc0bcd12-0eb7-5629-afd5-179bb36ccd8b&pf_rd_s=merchandised-search-10&pf_rd_t=BROWSE&pf_rd_i=5016648051','https://images-na.ssl-images-amazon.com/images/I/61Q9xSIzZrL._AC_SX466_.jpg','AUSTRALIA'),('B0823PTQZB','Hautton Magic Water Doodle Mat, Large Drawing Coloring Mat Painting Writing Board with 15 Accessories Educational Learning Toy Gift for Age 3+ Kids Boys Girls -Animal','89.99','https://www.amazon.ae/Hautton-Coloring-Painting-Accessories-Educational/dp/B0823PTQZB/ref=lp_22807510031_1_2','https://images-na.ssl-images-amazon.com/images/I/71axmRiF2oL._AC_SY355_.jpg','UNITED ARAB EMIRATES'),('B0831JHZN4','Seven Analogue Women\'s & Girl\'s Watch (White Dial Silver Colored Strap)','1099.0','https://www.amazon.in/dp/B0831JHZN4/ref=cm_sw_r_cp_apa_fabc_dlT1_PD05C8BSZTY3YY87E670','https://images-na.ssl-images-amazon.com/images/I/514w7fra9OL._UX679_.jpg','INDIA'),('B085M5R82K','All-new Echo Dot (4th Gen) with clock | Next generation smart speaker with improved bass, LED display and Alexa (Blue)','4499.0','https://www.amazon.in/dp/B085M5R82K/ref=cm_sw_r_cp_apa_fabc_dlT1_MTD6ENN30B9VAY9ASAQP','https://images-na.ssl-images-amazon.com/images/I/61VMT8H7RvL._SX425_.jpg','INDIA');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `USER_ID` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `USER_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `USER_EMAIL` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('4xjtd2xag2nhssh7l6k28srn0ab2','mohamed armaan','armaan.21191@gmail.com'),('dsfh3oesktbuasseq8equifhiu13','MOHAMED NAVEED','imnaveed2003@gmail.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-25 17:07:21
