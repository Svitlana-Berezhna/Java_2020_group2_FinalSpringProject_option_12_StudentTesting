CREATE DATABASE  IF NOT EXISTS `testing_system_spring` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testing_system_spring`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: testing_system_spring
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `theme_id` int NOT NULL,
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(200) DEFAULT NULL,
  `option1` varchar(200) DEFAULT NULL,
  `option2` varchar(200) DEFAULT NULL,
  `option3` varchar(200) DEFAULT NULL,
  `option4` varchar(200) DEFAULT NULL,
  `correct_answer` varchar(200) DEFAULT NULL,
  `question_en` varchar(200) DEFAULT NULL,
  `option1_en` varchar(200) DEFAULT NULL,
  `option2_en` varchar(200) DEFAULT NULL,
  `option3_en` varchar(200) DEFAULT NULL,
  `option4_en` varchar(200) DEFAULT NULL,
  `correct_answer_en` varchar(200) DEFAULT NULL,
  `explanation` varchar(300) DEFAULT NULL,
  `explanation_en` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  UNIQUE KEY `UK_eqibuctm8pce29k5gpuv3y5tu` (`theme_id`,`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'Що з наступного є правильним щодо введення залежності?','Це допомагає роз’єднувати об’єкти додатків один від одного.','Це допомагає у вирішенні залежностей об’єктів.','Він зберігає стани об’єктів у базі даних.','Він зберігає стани об’єктів у файловій системі.','Це допомагає роз’єднувати об’єкти додатків один від одного.','Which of the following is correct about dependency injection?','It helps in decoupling application objects from each other.','It helps in deciding the dependencies of objects.','It stores objects states in database.','It stores object states in file system.','It helps in decoupling application objects from each other.','Ін’єкційна залежність допомагає в роз’єднанні предметів застосування один від одного.','Dependency injection helps in decoupling application objects from each other.'),(1,2,'Який спосіб надати метадані конфігурації spring?','Файл конфігурації на основі XML.','Конфігурація на основі анотацій.','Конфігурація на базі Java.','Все вищеперераховане.','Все вищеперераховане.','Which is the way to provide configuration metadata to spring?','XML Based configuration file.','Annotation based configuration.','Java based configuration.','All of the above.','All of the above.','Всі перераховані вище твердження є правильними.','All of the above statements are correct.'),(1,3,'Що таке область запиту?','Це охоплює визначення bean до HTTP-запиту.','Це визначає визначення bean для контейнера Spring IoC.','Це присвоює визначення bean HTTP-сесії.','Цей обсяг визначає HTTP Application / Global session.','Це охоплює визначення bean до HTTP-запиту.','What is request scope?','This scopes a bean definition to an HTTP request.','This scopes the bean definition to Spring IoC container.','This scopes the bean definition to HTTP Session.','This scopes the bean definition HTTP Application/ Global session.','This scopes a bean definition to an HTTP request.','Область запиту вказує контейнеру Spring IoC створити екземпляр на запит HTTP.','Request scope instructs Spring IoC container to create a instance per HTTP request.'),(1,4,'Що таке режим autowiring byName?','Установка за замовчуванням, що означає відсутність autowiring, і ви повинні використовувати чіткі посилання на wiring.','Autowiring за властивості назви. Spring намагається співставити свої властивості з bean-ми, визначеними тими ж назвами у файлі конфігурації.','Spring спочатку намагається з’єднати autowire конструктором, якщо це не працює, Spring намагається виконати autowire byType.','Схожий на byType, але тип застосовується до аргументів конструктора.','Autowiring за властивості назви. Spring намагається співставити свої властивості з bean-ми, визначеними тими ж назвами у файлі конфігурації.','What is byName mode of autowiring?','Default setting which means no autowiring and you should use explicit bean reference for wiring.','Autowiring by property name. Spring tries to match and wire its properties with the beans defined by the same names in the configuration file.','Spring first tries to wire using autowire by constructor, if it does not work, Spring tries to autowire by byType.','Similar to byType, but type applies to constructor arguments.','Autowiring by property name. Spring tries to match and wire its properties with the beans defined by the same names in the configuration file.','Режим autowiring byName - це autowiring за назвою властивості. Spring намагається співставити свої властивості з bean-ми, визначеними тими ж назвами у файлі конфігурації.','byName mode of autowiring is autowiring by property name. Spring tries to match and wire its properties with the beans defined by the same names in the configuration file.'),(1,5,'Що таке точка з’єднання?','Це являє собою точку у вашій програмі, яка об’єднує два об’єкти.','Це являє собою точку у вашому об’єкті, де ви приєднуєте значення.','Це являє собою точку у вашому об’єкті, де ви приєднуєте введені значення.','Це означає, що у вашій програмі ви можете підключити аспект AOP.','Це означає, що у вашій програмі ви можете підключити аспект AOP.','What is Join point?','This represents a point in your application which joins two objects.','This represents a point in your object where you join values.','This represents a point in your object where you join injected values.','This represents a point in your application where you can plug-in AOP aspect.','This represents a point in your application where you can plug-in AOP aspect.','Точка приєднання - це точка у вашій програмі, де ви можете підключити аспект AOP.','Join point represents a point in your application where you can plug-in AOP aspect.'),(1,6,'Що таке переплетення?','Переплетення - це процес введення значень в об’єкти для створення об’єкта, що рекомендується.','Переплетення - це процес зв’язку аспектів з іншими типами додатків або об’єктами для створення об’єкта, що рекомендується.','Це використовується для введення значень в об’єкти.','Переплетення використовується для перевірки залежності об’єктів.','Переплетення - це процес зв’язку аспектів з іншими типами додатків або об’єктами для створення об’єкта, що рекомендується.','What is Weaving?','Weaving is the process of injecting values in objects to create an advised object.','Weaving is the process of linking aspects with other application types or objects to create an advised object.','This is used to inject values in objects.','Weaving is used to check object dependencies.','Weaving is the process of linking aspects with other application types or objects to create an advised object.','Переплетення - це процес зв’язку аспектів з іншими типами додатків або об’єктами для створення об’єкта, що рекомендується.','Weaving is the process of linking aspects with other application types or objects to create an advised object.'),(1,7,'Як використовувати ключове слово ref у beans.xml?','Використовуючи лише метод сеттера.','Використовуючи лише аргумент конструктора.','Використовуючи метод сеттера та аргумент конструктора і те, і інше.','Жоден з перерахованих вище.','Використовуючи метод сеттера та аргумент конструктора і те, і інше.','How to use ref keyword in beans.xml?','Using setter method only.','Using constructor argument only.','Using setter method and constructor argument both.','None of the above.','Using setter method and constructor argument both.','ref використовується для посилання на вже визначений bean, і його можна використовувати, як метод сеттера, так і аргумент конструктора.','ref is used to reference already defined bean and it can be used using both setter method and constructor argument.'),(1,8,'Якщо bean створена один раз на контейнер Ioc, область є','singleton','глобальна сесія','прототип','запит','singleton','If a bean is created once per Ioc Container, scope is','singleton','global-session','prototype','request','singleton','Якщо bean створений один раз на контейнер Ioc, сфера дії є singleton.','If a bean is created once per Ioc Container, scope is singleton.'),(1,9,'Як поводитися із закриттям контейнера IoC?','Використовуючи shutdownHook()','Використовуючи shutdownHandler()','Використовуючи registerHook()','Використовуючи registerShutdownHook()','Використовуючи registerShutdownHook()','How to handle shut down of IoC container?','Using shutdownHook()','Using shutdownHandler()','Using registerHook()','Using registerShutdownHook()','Using registerShutdownHook()','Використовуючи метод registerShutdownHook(), можна відключити контейнер IoC. Інших методів не існує.','Using registerShutdownHook() method, shut down of IoC container can be handled. Other methods do not exists.'),(2,10,'Що ми маємо на увазі, згадуючи java.util.Collections?','Інтерфейс, з якого розширюються списки, черги та набори','Фреймворк колекцій','Утілітний клас для використання з колекціями','Ми ніколи цього не згадуємо','Утілітний клас для використання з колекціями','What are we referring to when we mention java.util.Collections?','The interface from which lists, queues and sets extend','The Collections framework','A utilility class for use with collections','We never mention this','A utilility class for use with collections','',''),(2,11,'Який тип колекції ми б використовували, якби не хотіли копій?','Список','Мапа','Черга','Сет','Сет','What type of collection would we use if we wanted no duplicates?','List','Map','Queue','Set','Set','',''),(2,12,'Який тип колекції не розширює інтерфейс Collection <E>?','Список','Мапа','Черга','Сет','Мапа','What type of collection does not extend the Collection<E> interface?','List','Map','Queue','Set','Map',NULL,NULL),(2,13,'Який тип Мапи використовується із синхронізованим доступом?','HashMap','LinkedHashMap','Hashtable','Сет','Hashtable','What type of Map is used with synchronized access?','HashMap','LinkedHashMap','Hashtable','Set','Hashtable',NULL,NULL),(2,14,'Що таке наведений нижче фрагмент коду - приклад <T extends Number>?','Обмежений тип','Generic тип','Обмежений тип підстановки','Необмежений тип підстановки','Обмежений тип','What is the following code snippet an example of <T extends Number>?','Bounded type','Generic type','Bounded wildcard type','Unbounded wildcard type','Bounded type',NULL,NULL),(2,15,'Як реалізовані дженерики?','Асиметрія','Стирання','Реіфікація','Рефлексія','Стирання','How are generics implemented?','Asymmetry','Erasure','Reification','Reflection','Erasure',NULL,NULL),(2,16,'Який тип винятку виникає, коли ми запускаємо програму з об’єктами, які не є взаємно порівняними у відсортованому наборі?','Ніякий','ClassCastException','RuntimeException','OutOfBoundsException','ClassCastException','What type of exception is raised when we run a program with objects that are not mutually comparable in a sorted set?','None','ClassCastException','RuntimeException','OutOfBoundsException','ClassCastException',NULL,NULL),(2,17,'Який тип мапи Ви б використовували, якби Вам потрібна була б мапа швидкого доступу, але Ви б не турбувалися про сортування?','HashMap','Hashtable','LinkedHashMap','TreeMap','LinkedHashMap','What type of map would you use if you wanted a fast access ordered map but didn’t care about sorting?','HashMap','Hashtable','LinkedHashMap','TreeMap','LinkedHashMap',NULL,NULL),(2,18,'Який тип мапи Ви б використовували, якби хотіли її сортувати?','HashMap','Hashtable','LinkedHashMap','TreeMap','TreeMap','What type of map would you use if you wanted it sorted?','HashMap','Hashtable','LinkedHashMap','TreeMap','TreeMap',NULL,NULL),(2,19,'Який статичний вкладений клас Map<K,V> дозволяє отримати посилання на відображення за допомогою ітератора?','Map.Entry','Map.Iterator','Map.Pointer','Map.Root','Map.Entry','Which static nested class of Map<K,V> allows us to get a reference to a mapping via an iterator?','Map.Entry','Map.Iterator','Map.Pointer','Map.Root','Map.Entry',NULL,NULL);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `theme_id` int DEFAULT NULL,
  `correct_answers` int DEFAULT NULL,
  `total_answers` int DEFAULT NULL,
  `grade` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,1,1,3,9,33.33),(2,1,2,4,10,40),(3,2,2,8,10,80),(4,3,1,7,9,78),(5,3,2,9,10,90);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `theme_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `answer` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnwcvmw0x2oeas7q5hkhjopycp` (`theme_id`,`question_id`),
  CONSTRAINT `FKnwcvmw0x2oeas7q5hkhjopycp` FOREIGN KEY (`theme_id`, `question_id`) REFERENCES `questions` (`theme_id`, `question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2822 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `themes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `theme` varchar(60) NOT NULL,
  `theme_en` varchar(60) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `description_en` varchar(200) DEFAULT NULL,
  `time` int DEFAULT NULL,
  `passing_grade` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,'Spring фреймворк','Spring framework','Tест по Spring фреймворк','Spring framework test',5,60),(2,'Колекції/Generics','Collections/Generics','Тест по колекціям/Generics','Collections/Generics test',0,80);
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(60) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `first_name_en` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `last_name_en` varchar(100) DEFAULT NULL,
  `activation_code` varchar(20) DEFAULT NULL,
  `grade` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ivan.Ivanov11@ukr.net','$2a$10$JFJDVf5w17EOENXRtcdcIOCq6.wtkTP6I/Lhlm1OzLPxShBJRfRlu','Іван','Ivan','Іванов','Ivanov',NULL,37),(2,'Petro.Petrov@gmail.com','$2a$10$JFJDVf5w17EOENXRtcdcIOCq6.wtkTP6I/Lhlm1OzLPxShBJRfRlu','Петро','Petro','Петров','Petrov',NULL,80),(3,'Alina.Adminenko@ukr.net','$2a$10$JFJDVf5w17EOENXRtcdcIOCq6.wtkTP6I/Lhlm1OzLPxShBJRfRlu','Аліна','Alina','Адміненко','Adminenko',NULL,84);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` int NOT NULL,
  `roles_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`roles_id`),
  KEY `FKa62j07k5mhgifpp955h37ponj` (`roles_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,2),(2,2),(3,1);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'testing_system_spring'
--

--
-- Dumping routines for database 'testing_system_spring'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-05 18:29:36
