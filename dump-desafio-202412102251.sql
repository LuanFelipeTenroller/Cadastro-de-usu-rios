-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: desafio
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `nivel_permissao`
--

DROP TABLE IF EXISTS `nivel_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel_permissao` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `permissao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel_permissao`
--

LOCK TABLES `nivel_permissao` WRITE;
/*!40000 ALTER TABLE `nivel_permissao` DISABLE KEYS */;
INSERT INTO `nivel_permissao` VALUES (1,'Usuário','Usuario'),(2,'Admin','Admin');
/*!40000 ALTER TABLE `nivel_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `nivelpermissao_id` bigint DEFAULT NULL,
  `foto_perfil` longblob,
  PRIMARY KEY (`id`),
  KEY `FKma0pgiwnw1xxny95p8d20v1dp` (`nivelpermissao_id`),
  CONSTRAINT `FKma0pgiwnw1xxny95p8d20v1dp` FOREIGN KEY (`nivelpermissao_id`) REFERENCES `nivel_permissao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (31,'teste2@gmail.com','Luan Felipe Tenroller','teste',0,'89028922','Luan Felipe',2,_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0		\n\r\Z\Z $.\' \",#(7),01444\'9=82<.342�\�\0C			\r\r2!!22222222222222222222222222222222222222222222222222��\0��\"\0�\�\0\0\0\0\0\0\0\0\0\0\0	\n�\�\0�\0\0\0}\0!1AQa\"q2���#B��R\�\�$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz�����������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����\�\0\0\0\0\0\0\0\0	\n�\�\0�\0\0w\0!1AQaq\"2�B����	#3R\�br\�\n$4\�%\�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz������������������������������������\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����\�\0\0\0?\0쩍ޖ��Ӹ�-5i\�M�Z(���(��(�\0��:�~\�\0*өh��\�Z\0n\�JsSj@]\�\�@ȴ�MZ\0\�\�m]b�C\��V?�\�g��I:-u�^����K�jgmP�\�f��\�\�i��AQ�5:u�\�E\�2!S\nf)\�E\�é�\�(�	�\Z�������z�zҭ��o\�վZsRܵ Q�?�v\�\�Q\\%-�\�\�\�,���\�Y�Z��\�&�q\'�� F�\"Ӕ�nZ���R\�vR2�\�K\�SHZ�,9IT&\�Z\"\�f��\�h\�{m\�VN!i�\�m�uh��P�m#w�^ԕ,�9i�NZ�\0\�(��\0QE\�ES)��Mj\0)\�֢\�\�O\�RӲ)���h]�\�H��	)�\�Ӷ�ldH\�sR�e�\�\��O\�\�\�\�\��jU\r7�`xu\�_\��ɪm�,�iҠVZ�x�\�7T3�]\��ai�Uk6\�T�	R6��#��P4*8�\�.*)�\�\�|��e�v\�c@\�U{w}�5O@��R--H�)��-\0;\"��m@E2U9[oʵ~f�j���\�C\�m�Q|�K\�Zvڠ\����OQ���hjZF��\�jk[\�j����\0r\�\Z!fj`׭\�\�չ\�\�Yz}��\�ԁrI�\�B\�\r�5X��m��tS�h\r\�J~6�Zr\�V��X���� ��F4�7Q���\�\0&\�zcT�ږtn\��\�N\�L\�	�\Z�=(�\�7�Z{T{h\�vV\�\�E�\�xwV�Ň�W\�oZjHY-\��°<>꺋�\�թkw\�w\rfi��ur�Ԁ\�mҵQ�S�s\riϰ\Z˺]ѻP5է\�o�\�Vե��Z\�ҷ4\�[�v�H\�z� ?´\���j\0b\r��Rm��i\��\"\�\�I�ni\�J»��\�R(I�\�R�:�j&J\�\�*ԫQG\�jQ\�j�B\�Nٺ�Dp)fj\0]\�Uh�㕎֩\�\0�\��*)e\�\�u\06\�µWFP\�=P\�\��\��KZV�=��K�\�\0�tۥeE��O�����Nf�\�\n\�U`\�\�\���Ou%G�PhM\�\�je*\�\�Q���S@\�\�LP\�)�\"�.���\�\�\�7SY��`.\�u6�w� �j����XPT\�_����\�T\"\�->;q0+%9\0Zx_�m\0d���䍫?O��\0�wn��\�?2U�rd6�iR4��u\��\�[�A.\�-��_\�\n�}\"\�۲\�v+i1m�zՕv�PТ\�4�r\�_\�m�S\�S�̵M]�U���\�P\0�\�]�i\�DT����+\�+���RT6\�۪B\��j(��\�@[椤\�)�\�-BHs#m\�S��Z\�\�/���֤�Ty�-f\�$�\�Uj\�7\�\�B�\�@�f�-���\�Ny]~\\R���|���T\�\�f�Z\�\�t\�]>i1@\�ĐI��̽k�\Z��1\"y��-p\Z.�y{���+)��\�EtVEm���b߹�tu\"ڹ\���B�V�\��\�Wm(\�E\nKMZu\09h�-����\�\�6\� �R�:�2Ѷ��*@E�\�B\�\�\���d\�\�\Z�=Դ\�\�»hi\�\�-1iwm�!\�Uj\�\�!\�D��Wn֪Z\��ZH锋\Zsy\�\'�5�	h꿅\�wFcjӹPZ��t\�\�,\�uF�\�u9\�\�\�j/�\�&\�\�\\��H�\0�*U�?�\�JO\�\�\�cZcx�\r�uh���a\��STc\�\�.=j\�I��Z��i|ϕ��+���\�k}\�.Qb&ڴ�H�\�i\�W7��2��Z�]Z��\n[�Q��X�j\�遛Ϻ�\�\�uP�\�U\�hD0�\�Ld\�\�FՕu�$%���m[P6�\��\�Tt-5/fk�h\�j\�\�|\�\�T\�\��e5�ql�\�\�ڴ�숻|�R[�?�����\�c/\�W\�\'�\����2}�m4҂�p���\�~\� e\�\�4\�o�\�j�̒�\�\�%\�\�\�\�h�ݴ�\�ha%O\�R�\�\�>[U�ݖ�,mj9�\�}\�<ʐE&\�*\�P��Zc*�\0z���0\�)-Q\�<�ܵDꬲ- 6�ڏ\��\�W���\�#�\0_\�\��9W�����L�HE}�N�ܡZH�\�\�C)]M���N\�\�\�K�J���Du^{���\�?���P\�\�@\�n�wW\�wZ\�b�|�+E$��l\r��D���V5\�\�\�\�\�\�\�0�\0z�e��6��\�B\"�\�\�\�޴%ؓ\�t\�Ŗ�-\�F\�v\�W�,+;Vn\�Z�ދ��\�\�k\�\�y\�N;\�U���\�.Z�\�j\�B\�y��\�z a\'JIYU>m\�\\�����\�ջi�\�\�\�\�*�J\�\\�P���Bݙ\�o���C*��*\��ƿ0�LMm�/\�J)6\�&M�m7\��$(\�3>i\�\�+�xj\�uh\�\�Z�AaZ\�o\��ۺ,WJ-�\�\0�\�6����/\�+rF\r6\�\�<�Q$�#n�U�S΀q��kFy\�\0>���Ğr>��y��hY�d�mbxsE�ռ\�m۫�/�m11�~jc\�4\�\�\�k/\�@��E�;j\�\�j:m*\�m\�L\r�\�_\�j\�Hd,6�S>)��K�L\�Fh۩۶\�>\�?˪2)�Wm?\�Niv�Rg�\�(�sV|�����\�U\�\�3U\��m%\0W\�5�\�=�Is��I+�E�\�Jڦ.$�\�\�\�\�#�)�\�k3Q�\�.\�ѺՅ�mf�oSԞ\�\�j���:��G\�\�I}4\�+TR\�\�\�mm۫66F�.\�G���C\�n�\�\�z��Eo,�5#A%[%\�渃\�\�Z��Q�.\�\�N\�P�\�-F\�0Ҹ�C?\�5FZ�ӣuj7ҸX6m��\�M-1\�p\�.D)~\�O\�H�ms�jH\�MR��?Q�ͻ\n\�u�2�\�d�FZRdjhV=jJ����\�\\��\�laKWA���r\�ě=R�}�\�W%pN\�\�㺮\�X��\�\�ui�m5��\\��mj\�.\��\�Rl�SO�Y\�~\�T�\�z\��E���hC�(\�EG*�ۨ\�\�H�\�B\�h�}1�өZ`e\�\�;�W%�\�cmQ�O\�-Mµ\0YV\�1:R\�\�ӅK\0�*\�\�k\��Z�P���IGDXu�V�+\�4�\0yj�,�L��hC��U!̪@[�5X\�go�\�R}\�\�˻u �\�\�\�Ҫ��\�Ǘ\r #�]�Q@\��\�T|\�J��Tx4�\�$ΐ�JțZLV��k1���s\�at\�\�RU�7z\�\�\�7�5Y\�\�V\�\�|\�Ri\"�J̸\�-�ʹ��Ѫ\��\�v�W�К6\�\�V+�\�5�$�+\�ȿ.\�U\�vm\�\�∫�F\�U#\�\��Z\�\�-AD�t\�\�G�+Vز�Ĳm��̊�((\�Ky�n*\�Y��gh��*�ܑE&\�\�,.g}�֦�v\�\�\�\���!�\�\�Z\�r�\�@\�l�=�z�=�޴\�s1\�L�aւ\�\�\�ri\�*\�sꨒ|\�T��B\�y\�WԼ7#30�V\�.��U\�\�;�dQ��\���C�\�?��h~\�f,ձ��\�nx���\�]�]ۭGx�w\�X^�\�;�W@��\��j�;�\�\�mn����.#V��\�\�[\�Y\�Ո\��\�}�T�l�0��`��\�\�\\����6�զ4~\�*e\�SPE:�\�D��\�\�WP\�me�\�0�{�\�\�.nJ\�\�f���j�*�%v�\ZwJ\0�m:�\�R2\�\r\�\�\Z\�\�\�Ƶ,��V��!�榀�K�{i-\�ܬ\�^\"H\�j!�\�\�\0��v+5=��\���R\�V\�N�M����-.ZE4˘��\�\�m�ڭV\�#�v\�h\n\�v\���jMNOܝ��\0\rN\�W�i?5>j#\�5	�L�b\�\�$,�\rv~/\�\�k4B��k{�0��f�e!\�y$��\�Um\��܍\�n\�\�\�\"�\0���i,\��\�]\�y�w\�61�H\�Z�X�#��\�SZ[\�\�\�\�Kq\0�<K\�(�\�\���$+�mrv\�4��\�ٛ��s\��sV�!\�\�k�\�ׂ�\n�\�J\�\Z\\\'�2/1~lԟg]�\�֙UEث\�Т?�E�FF�\"\�\�ޯ.�\�\�ond\�Y�\�5�}d\�Wg\�W\�s躋�#4y�\�ʱꗐ\\��Wҽ\�Z\�](M\�+ϯ����\�\�\�^�{\�E�\�V�\��j\�j\�r��*-��$�\�\�Z\�ցJL\�\�a�\�2ݷS6�\0\�*\�P\�ݣ\�\�@�qZ\�,\�Z4�=\"\�\�\�\�s^��<\�7V���\�N\�U�#6\�OMԣ\�\�\n��o�h[|F�i_\�\��\�Cq�X�\�_\�*ž��m\�֫�դ9%\������*\�\ZēYB����m\�&\�Ej���\�qo�ɪHW1|;��ٷ�\�5j5\�\�\�m�+T�\�\��B\�cX�U�\�\�\�].\��\ZcGmg2H�\�۪�ɺ�\r7Y�ݼ��+��d�0ۨ.ẑ�\�\��\�j\�n\�M�*3T\"?\�5V�\�\�R\�\�\�+Sq�n\�^YO\�\�Әm\�0f��.ڴ1Q\0�\�Z\0q]\�\�\�Sq����\�n?�k6$ijh	\�R�\�S\�|\��\�u\'\�Z\0r%,,�@M6P[u +BZ=\�n+�ѵTl}ڲ�X~V�0 �i�Hf�XmZ�\�4\�f\�C\�\�a�\�\�S�\�\�J\�f���͵%&f\�x;I��\�\\�\�\�8\�\�\�\�@�û;\Z�O8c�X5O(�1-�����j�K��\�µK\'\��\�\�\�\�)���\�<%\��\0�\�4\�&\�\�\�5�\�\�?\�T\�|���\\�\�\�E��1�+���\�S3\�W3?\�+xf�\�oh�\�\Z\�\�i�1g�����X\��J/\�kJLn4\�JC&\�\�\Z\�\'�/�i\�/\�\��{�H�e\�t�u�.f<V�\�%أS�ě��(����i\�Q����JKRX\�\\�n\�]� >jl���F�\�<��Jv�Ư\�\�ѯ\�8\�Y\�\�d,\�\�k�ֵY4�\�HfN�I\�F�pf\��\��\0�ܵ��jP\�\��s��\�V\�\'��w|�I\r!\�\�\'̴ّ\Z��뵨X��X�;q5\�k\�%\�޶�\Z�\�O\�]��T���5CH\�f\�\\΍\�\�C���0�\�Մ\�\�R\�\�6�M���^�	����3�%&\�7\nf*R�d�\0k|\�*\��\0�\�5>P4|\�=\�7|�\�ϵ�\�i�q�\�N�]\�P2�G��nۨ·ު\�\�ͺ�?*\�@�\����\�m%�\���\�\0YJ�n\�j�3���h�\�O\�RĒ2Ւ��\�DUi\�\�m\�\"Ǝ��\Z��\�m�\�S�df\�D�0\�C,\�̪\�\�@\"3�7\�d\�ڳ|C\�/H�ˁ\�W\��+$��U��\�7W�\Z��d�\�Ž�F{_�u\�\�l\�\rm�_\�יx3R�ӣE/^�omw\�~\�42�LL\�+W�����]^�b5\�;QWqj�w���A����1�\�\�\�_5\�p\�]\���8\�X\�\�\�\����U�R�������_w-\�R}\��\0\��\�ɺ��\�Q`�mm\�Ԏ�T+0\�55��\��ڮ\�G��\�G,��\�m\\W�kIQ���V1Y�M�(�\�y���� ]\�5Gyq�ͮ[S�F\�\�j�+�u?�F\��&\�U�Qg���\�\����\�nZiv\��\�~sڽ�\�-\�oZ��g1ܣ�\�{�\�\�%4�����R��iwm�}\�\�\��,�̖�	~\�S7-C@J�5FR�pi�\Z\0�>V�\�Q\�*Ԋ.�jq\�j8��i��>\��\�ZVX���k\r\n\�\�yV�\��p��j�\�\�W\�<�Kq\0b\�\r�¼mOh�djͲ\�op���[\�K�Z�\�[\�j�1�j~d_��\\����-f�\�ڱ�\0-+&+���\�Z\����\�ԫNM��\�{PQ���F\0>�埻����A�7�LC�\�\�\�\�^=\�\�\�\�j���y��\�7�<�{kis^J��c�emҵ0A\�a+�>\�L\��cjd\�y�M(HC=\�M�}oi~)�\�n\�Z�\������\�\�\����Q���&\�9k�m�h$\�+�\�|Qwm�qRƏQ�\��K3��\�I<?b��\n´\�\�*��wV�>/�u�\Z���0E�\�j�D�ެ\�\�흾YUiSQ�o�n��/��Zg��\�T}N\�o\�9���X��\�X\rF�4}+��\�6\��\�\rc\���y\�բ\�mIb_���{\�e�r�\�y\�	�\�\�e\�,�\�f�az��,�v�V����?�3\�&�+E�\�pĂj\�Lj��\0z_0�Ӱ\\�\�e����!}.\�)=O\�\�(U�&��(o���\�\�\Z^��d$\��\��\��_�Ŗ\�5\�\��;�2��ŤW�1�\�R+҆�\�����L\�P�\�@J\�i\�\�Z\nn��E\0=�_\�\�\��[�\�D\Z�\�\�Ј\���\�:L&D�^ݴ͛#�j�%���Z�����\Z՘�\�\�\�a\�r����Ѥ\�O�Vf${�=�QL�\��b�B��z��Jyf�\�C&f�����R\�ݦ��q+��-C�\Z�nI[\�a��jX��=%��yl�O\�\��\�\�!i�$\�\�\�\�I~\�d��\�n�\�ٶ��\�o�����\�\�w\�\�y�{\��\�\�u-NyFa�\�U�³T�v\�\�^��MI ��8\�KQ��`\�n�/JE_������`�\�\�K����2�޶������\Z.\� Y7|\�۩�k\�n\�\�?������Y[\�\�-\�\�y���\0\��\0-Z�\�<:�\�\�Y�>\Z���U d\rFc�mL�\�\�\�Z�J���JKY�\�R�$\�ݩ7�\�jn\�Q��\�\�F������EAni\�)�f\0�b�)*���b�z(lT�fj\�jU�\�2|�i1��\�\�e��O$׫m��ir��\�\��F�\�s\�\��\�\�5.\�\�k�\�\�W\"��\�nӶ��\�\�\�L\0XSv�#����\�\�A\�GAc�Z��\�u\"D�\�BԹ-A�\�~h髚\Z�!۶�%�zb\�\�vߖ�y�m�B\r\�\rԷQ/�*Pm?{y�O{��u_� \��\�%T\�\�wU&u\�ڧg\�\��ե�}\�hu\�\�H��m�Ĝ.\�$���fU�h\�!�G\�$��^�jR\�W\�L͍ƺ���K\�BH�E�\�\�Dju4\"6�\�O�B�դʷ\�S�U\0\�\�\�O.��i\�A\\\��Oae\��\\��Y�쪵\�xWKa�j�ѱ�xq- m��\�\�!���@m���(\�R-���ڋ�j�\���\�\�CP�\�T\�G\�[��T���Dt��M�C\�k�hCU{���SLN\�ö�o�k\�C\�jWe4%��^ī\���y\�͋�\�媇5\�\�\�߻\\��*�%�sA\�\\Si\�\0Ҟ��SWc?5N�~\�WZ�l\�ޤé�\�\�|�v?��{쟾\�\���Z�\�\�\n\�\�ػ���\��P2\�m�Hh\�U�â]+4�\�\�W��\�#\nӳ�\n�j�4e٤�e^�!�jXc�~V��[��!��2D1�˺��v�cEuڙ|\�\�IA;�R\�sR��?\�\�\�\�Up U�.vՔ�jr�\�ֈD\�\�n�\�\�h����\nm\'�W\�(��8�;�\�Bj\�V��XԁZ\�-��xO�\�9㒩ͨ<wV����4\�4q�\0��3r[�՝5�F>iH\ZrL�\�mT\�5ϕ��ҩ\�ŋ6\�Z�ŗ`xp��P3rw\�M&\�\�\�/ e�!td��\�#��\�G�v��v�i�\0QҖ��O2\�V�\�t�9\�p̵\�\Z<lEd\�V�vWI=*ѡ\n�\�Ƭ�lmQV1P٤H\�\�Rb�mȢQ�T�R�ڭBD�R\�6\�]\�&O�^8Y\�\�ެmo\�\Z}�e�Uf�K${}��wYWP+3W3�x\�\�}�JÓ\�\�\�hH\�o핔\�3�[\�f\�P>�u\'\�\"�\�\�HXIT\"��ڌ�O�Q#d\n�\��B��*\�jH	\�\�GNN�@u\�\r\�7�\�oJ\�\�F\�\���fG�$�J\�{�Ve�\0v�SPz��\�\�~\�ި:�h�.��HZ\�\��-eK��j8��\�\�\�@�\�Z9j\�\�<�[u2Ȭr6\�Z\�ːԁ�\��#�Ui�4�I2V��Y�\�����<\�M\�Z&!\�KL���\�e\�W�sE%\0���T��4ۚ�\�5򫺀\"p!��T\�0Y�\�\�\�n�ŏ\�\���\0Clu䍗\�c\�V\�Y\�\ZU\�V�U\�Q\�\�\\[�\�\"\�<A�\�ngm�\�	m\�r˷\�\�GZ�2�\��\�\�U:I�!�\�4��\�\�Ԗ\�b\�EWZQ���\�\�\�ht5\�\�\�k\�|;\�΋^�j|\��P�\�E\�jU� ګR�\�R-\r\�1�v�ڢ\�u.\���\�}�\��Y�`��\0W�-m\�m�Bg7\��6h�z\����i|\�)�\�+\�[���ͷ\�j�$�ZHOSX�7Jyb\�z�\�5ZB��	<\nq;x�L�C>\�S��2�r\�?h03N\nwm<Rƥ\�\� �v�\�NkX\�!ƥs1�稄\���\�Z\Z&�q�݄Tm���b\�:��\�b]X\�GN3^\�6|�\\߆�5�\�hR\�ч\�u!�\�\�P:+T�)JŔ\����}�_ʴ\�[u;�iUD\�j\�=B\�h��v4\��\r1i\�,3S�\�,x�\"�BѺ�]�\0|Ԕ*Ӷ\�v\�N�����\�O\�IR*�:K�\�\�\�$���R0\�/���\�Ju@y��/$ֵ\��\�ݬ\�F����i4ټ\�i$5B!�\�\�\�6e_\�@C\"\��j�Q��m\�e\�a\�|�_4\�6�;.\�\�jHF~\�ܴ\�\�W5M&KD��\�<Vt{\�L-8cuG�Ѵ\�-[H\�JZ�C\�Z�܀�\�\���\��7{�1YLH\�ʹ姄\�K���ha\�L-R=@\��F\�\�¸O���k]�\�\�e�\�f4�@qV\���\�SZZ��\�\�-ռ�S@$�\�m��ޫD�k�Kv�\�\�^��\�\�ݻ\�T�t\�n\"\�i*��̖�ĭW6sz��5�\n\�,�\�՘��9l\Z\� (4����LVP���}�Zѡ&aE\�\�\�\�~f��}>\�6�\�\�\�nY��C\�\�+p\�-u:q\��\�o�����6�3j\�\�{�\�XV\'�N\�wW�໻G�\'cWm\�\�\�\�\�\�F����+l�F}յ,�\�H>o�ikW\�\�\�b�C�g\���\��[��\�&\��\�\09[�e\�x\�\�u?f\��\�니\�j�\�C)^Ȱ�.ߚ��\���ok\�\�=^h\�_�i�f6\�\�D_+VǕ|�j?�F\� �\�en>\�XkH\�? \�24B\�W@�\���ӥP�\�zдPE&\�(h\�IM�SZ�K��\Z~\�\�\�k���c5Μ\�A\�V�,7\�\�T��\��N�&�!@7I)\�(��ќ�֒\�m\�\�\�x\�\�K\�\r+Z-���\�T#Li���E\Z�SI���\�\�\�\�\�U{˝bf�M�\�w{_\"k����Pr\�V.�(�/a61)�\�.h\�F%՞�\�l\�n\�\�Vd\�#�V�Ο�\�v\��\�q\Z��#��,M�쐆u\�M0+,�u9Z��wSSm;�\�]W�U��\\\�\�\���\0!:��_\n\�m�+p)Ma\"�\"|m�W�>*�\�Sb\�\�\�Z\��v\�b�\�\�-\\��a\�cj��q�Y�\�ޕn\�.զ\�14��\�t�T�hԲ��5VVf���_\�\��\�ǹ\�\��B|ժ%ľ���\Z/�wm��\0\� \�\�fU��j�fMJUYbm�\�i\��N�(��]\�DX\�K\�\�\��\0D�jvr�K\�\�ۚ�~/YF��!Z\�>\��-&\�xv�\�K\\��6\�g�|)h\�ie$W�[i:o\�8�e��\�H�4����5z\�\�\�ڬ�35XKtU��T��\�m\�F\�oҋ��U�S�vڵH\�r�\�\0H�*\�\�\�\��(�mI�K\�P\"O+���A�\�\�K\���\��\Z&d�uA\��\�\���g��R=�NQJ�O��6��\�\�\0\�)\�`Ph�jJ�Oi���	\�\�7\�{\�*6o���\�]\�\�\�\�^_qe~�+(\�Tװ\�\���w+lZ��\�:pܦm\�}sڅ�\�|��~\�zf���\�F�\�_\�\�B͹>Z\0α��\�ZFUZϚV�\�\�V\�\�S+�m@�ɸ\�S`*�k\�\��X�\�h+7\�\�?:}��sw6շoΆg\�YY��\�#���(��:�Ԡ���\rx{)Č�vԽ�u*Ł���+lQvж�\0\�\�,�gʧuC,,\�Z\�l�jX\�E$3��\�I\Z��\�\�ܯ\�}�V�\�E�@x\�\�c.\�+n�etma3\Z\�3W\�on\�Y���l�[\�_έ\�\0kmf8|�����\�Y�RK�ۛһ\�t\�i?\��]�\��5Z�YOH\�\�lW\�Z�#}�\�iE4K#\�\�*��NjcR���~`�\�RSYhF\�Zz�\�)��v�SX\�\�Y�\�(eu��5C\��\�@�f�Zyi�\�S\�\�\Z�\��\�4��Y�{\�\�H\�@�q!Z��X��UI��k\�\�\��S�\0jm+R�\06��қ@�����MZ~(\�\0D\�ڛmFȵ@B˺��e۶�ai�02��(]\�R\�G��V]�[�\Z+R-�+R�?-呙�\��/��|+\�m��mZ\�BxGL��[�I���\�V��\��\�:(\��n\�V�e��Z]�H\�Y��\�NT�T44&ģE.\�,n=�<��S�;� #��t�]�v5m�\�\�L\�L�Uai6\�@�57o�>�\��M�-KLj6�6Ӷ\�3>\�\�\�u%�?-m4e�)t�\'�\�h��\�\�f\��\�(\�\�thb��i!�\�\0]\0Q��\���P\�-\��i�j�nX\r�\0\�Wʷj���j�_��a�޹�Ⱦ\�2\�ց�ESQE\0\�)\�֤E%?m+\0\�i\�Am�I���ZJ7SZ��\��)�\�Zs*\�Z��Q@Z]����-?e.ݴ�]\�Rm�o�\�J�-ݾ\�\�i6\��t�Xcӭ)��\�&\�(\�F\�!�E#5-&vӨ�n\�)�O\��t�i̴�}�J`\"�:�*F&\�H�\�\�PO\�M\�R+SZ�J\�)Z��\0]���0�\�W\�\�R?�@m2]��\�bI�ww�]\�\�\���W�\�\�a��c@�\0E6�TES\0��:�ԀJ~\�zT�\�vӛ\�RR�&\�Z)�ʹ\�P(\�O�E\0F�����j\�Pm���\0AE;mi�V�P:QH���iOZ((���\�@\�)��\�@���]\�\0�*54f�$��b�}\0:��u&i0E3}��\�4�ƤZ\0��(\�HQ@6�o�\�K@���\�y�զ{ש*	mc\�:?�vϷ�\�n�u34f�\�u2�\0}\rH:R�\02��ʹ\���ޣn\�$�\�+P\�m�\�\0ݴm�Q@\r\�F\�Sқ@\n�\�i���Q�o>\���\�\0\�)3E��4֠�u-3i��Sӥ�P\0�N�-\�\�ډ��@�V��ݶ�zS\Z�}7?5\0;u3u#\ZEj\0}-5Z�@Դ���\0U��t�\�(�jLP�4S�i��\n\�b�d�|�?-#.֣ɩU�7nZ���-6��\0墍�.\�\00�S��\0Sd�*7���\�֝@IKL�\�IK��@-2�� -&\�6\�v\�\0�\�14Q@\r\�Rv�\�\�\0אGB\�\Z��	�%>\�˭\0\\uDZ����\�2\�\�@/���\\\�Z�\�\�DN+�\�<N��\��N;ϴ>խX�\�\���R\�K]ͼ\�\�p��-\0?w̴�N#\�I$\�\�U\�$�(�\0xheb\�K�\�-�\�\�\�)�RH\�x��^�\�P\�wS�\Z\0|rԂ��T�h^\�\�Ҁ�\�h̴�Q@\�\�n�n\� 1�5��Q���\r�Դ���o*4�Y�\�ުv\�\�K���!�Zx\�M\���\�L\�\���U�SJ}\0�\�=(�\�\�}h��q�4Q@4�%#PK���T\�{\�\�R�j��SV�Tm��i�N\�\�\\7\�RZ[�U3��\ZC5C�\�\�F�(.\�٧V\�\�W+��ZI�\�\�]\�\�P]�\0\�\'\�\�\�\�\n3y���mGP\��_�j\�y5�A\�/���4oO\�\�xo\�Z�^\�j���\�p�d�\�\rt\�Ѯޔ3	�\�v\�[^��V�\�3V*\�+�\�\�P��\r\�;����n�\�ڧZ��\�R%?h\�@Zu-\n(6\�*T�� G\�\�\�\�\�\�t\�6�\�Z�&�SKQS\�J��\�');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'desafio'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-10 22:51:30
