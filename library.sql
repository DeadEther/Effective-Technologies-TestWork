-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 01 2021 г., 16:07
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `library`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `ID` int(3) NOT NULL,
  `Name` varchar(150) NOT NULL,
  `BookCount` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`ID`, `Name`, `BookCount`) VALUES
(1, 'Самоваров Никита Алексеевич', 2),
(2, 'Стивен Кинг', 7),
(3, 'Шимичева Неля Алексеевна', 1),
(4, 'Ястребова Ольга Антоновна', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `AuthorID` int(3) NOT NULL,
  `AuthorsName` varchar(150) NOT NULL,
  `BookName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`AuthorID`, `AuthorsName`, `BookName`) VALUES
(3, 'Шимичева Неля Алексеевна', 'Безнадега'),
(2, 'Стивен Кинг', 'Безнадега'),
(1, 'Самоваров Никита Алексеевич', 'Ловец снов'),
(2, 'Стивен Кинг', 'Ловец снов'),
(1, 'Самоваров Никита Алексеевич', 'Кладбище домашних животных'),
(2, 'Стивен Кинг', 'Кладбище домашних животных'),
(4, 'Ястребова Ольга Антоновна', 'Мешок с костями'),
(2, 'Стивен Кинг', 'Мешок с костями'),
(2, 'Стивен Кинг', 'Зеленая миля'),
(2, 'Стивен Кинг', 'Сияние'),
(2, 'Стивен Кинг', 'Доктор сон');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Name` (`Name`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `AuthorsName` (`AuthorsName`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`AuthorID`) REFERENCES `authors` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`AuthorsName`) REFERENCES `authors` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
