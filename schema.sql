-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 11 Haz 2025, 20:39:16
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `uyg magaza` 
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gelistirici`
--

CREATE TABLE `gelistirici` (
  `gelistirici_id` int(11) NOT NULL,
  `ad` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gelistiriciprofili`
--

CREATE TABLE `gelistiriciprofili` (
  `profil_id` int(11) NOT NULL,
  `gelistirici_id` int(11) NOT NULL,
  `biyografi` text DEFAULT NULL,
  `websitesi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `indirme`
--

CREATE TABLE `indirme` (
  `indirme_id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `uygulama_id` int(11) NOT NULL,
  `indirildigi_tarih` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `ad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

CREATE TABLE `kullanici` (
  `kullanici_id` int(11) NOT NULL,
  `kullanici_adi` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uygulama`
--

CREATE TABLE `uygulama` (
  `uygulama_id` int(11) NOT NULL,
  `gelistirici_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `ad` varchar(150) NOT NULL,
  `aciklama` text DEFAULT NULL,
  `olusturulma_tarihi` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uygulamadetayi`
--

CREATE TABLE `uygulamadetayi` (
  `detay_id` int(11) NOT NULL,
  `uygulama_id` int(11) NOT NULL,
  `surum_sayisi` int(11) DEFAULT 0,
  `indirme_sayisi` int(11) DEFAULT 0,
  `ortalama_puan` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `versiyon`
--

CREATE TABLE `versiyon` (
  `surum_id` int(11) NOT NULL,
  `uygulama_id` int(11) NOT NULL,
  `surum_numarasi` varchar(20) NOT NULL,
  `yayin_tarihi` date DEFAULT NULL,
  `degisiklik_listesi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorum`
--

CREATE TABLE `yorum` (
  `yorum_id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `uygulama_id` int(11) NOT NULL,
  `yorum_metni` text DEFAULT NULL,
  `puan` tinyint(4) DEFAULT NULL,
  `yorumlanma_tarihi` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `gelistirici`
--
ALTER TABLE `gelistirici`
  ADD PRIMARY KEY (`gelistirici_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `gelistiriciprofili`
--
ALTER TABLE `gelistiriciprofili`
  ADD PRIMARY KEY (`profil_id`),
  ADD UNIQUE KEY `gelistirici_id` (`gelistirici_id`);

--
-- Tablo için indeksler `indirme`
--
ALTER TABLE `indirme`
  ADD PRIMARY KEY (`indirme_id`),
  ADD KEY `kullanici_id` (`kullanici_id`),
  ADD KEY `uygulama_id` (`uygulama_id`);

--
-- Tablo için indeksler `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `kullanici`
--
ALTER TABLE `kullanici`
  ADD PRIMARY KEY (`kullanici_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `uygulama`
--
ALTER TABLE `uygulama`
  ADD PRIMARY KEY (`uygulama_id`),
  ADD KEY `gelistirici_id` (`gelistirici_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Tablo için indeksler `uygulamadetayi`
--
ALTER TABLE `uygulamadetayi`
  ADD PRIMARY KEY (`detay_id`),
  ADD UNIQUE KEY `uygulama_id` (`uygulama_id`);

--
-- Tablo için indeksler `versiyon`
--
ALTER TABLE `versiyon`
  ADD PRIMARY KEY (`surum_id`),
  ADD KEY `uygulama_id` (`uygulama_id`);

--
-- Tablo için indeksler `yorum`
--
ALTER TABLE `yorum`
  ADD PRIMARY KEY (`yorum_id`),
  ADD KEY `kullanici_id` (`kullanici_id`),
  ADD KEY `uygulama_id` (`uygulama_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `gelistirici`
--
ALTER TABLE `gelistirici`
  MODIFY `gelistirici_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `gelistiriciprofili`
--
ALTER TABLE `gelistiriciprofili`
  MODIFY `profil_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `indirme`
--
ALTER TABLE `indirme`
  MODIFY `indirme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kullanici`
--
ALTER TABLE `kullanici`
  MODIFY `kullanici_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `uygulama`
--
ALTER TABLE `uygulama`
  MODIFY `uygulama_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `uygulamadetayi`
--
ALTER TABLE `uygulamadetayi`
  MODIFY `detay_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `versiyon`
--
ALTER TABLE `versiyon`
  MODIFY `surum_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `yorum`
--
ALTER TABLE `yorum`
  MODIFY `yorum_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `gelistiriciprofili`
--
ALTER TABLE `gelistiriciprofili`
  ADD CONSTRAINT `gelistiriciprofili_ibfk_1` FOREIGN KEY (`gelistirici_id`) REFERENCES `gelistirici` (`gelistirici_id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `indirme`
--
ALTER TABLE `indirme`
  ADD CONSTRAINT `indirme_ibfk_1` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanici` (`kullanici_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `indirme_ibfk_2` FOREIGN KEY (`uygulama_id`) REFERENCES `uygulama` (`uygulama_id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `uygulama`
--
ALTER TABLE `uygulama`
  ADD CONSTRAINT `uygulama_ibfk_1` FOREIGN KEY (`gelistirici_id`) REFERENCES `gelistirici` (`gelistirici_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `uygulama_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`);

--
-- Tablo kısıtlamaları `uygulamadetayi`
--
ALTER TABLE `uygulamadetayi`
  ADD CONSTRAINT `uygulamadetayi_ibfk_1` FOREIGN KEY (`uygulama_id`) REFERENCES `uygulama` (`uygulama_id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `versiyon`
--
ALTER TABLE `versiyon`
  ADD CONSTRAINT `versiyon_ibfk_1` FOREIGN KEY (`uygulama_id`) REFERENCES `uygulama` (`uygulama_id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `yorum`
--
ALTER TABLE `yorum`
  ADD CONSTRAINT `yorum_ibfk_1` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanici` (`kullanici_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `yorum_ibfk_2` FOREIGN KEY (`uygulama_id`) REFERENCES `uygulama` (`uygulama_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
