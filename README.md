# Uygulama Mağazası Veritabanı Projesi

Bu proje, Bursa Teknik Üniversitesi Bilgisayar Mühendisliği Bölümü BLM0224 Veritabanı Yönetim Sistemleri dersi final projesi kapsamında hazırlanmıştır. Proje, bir uygulama mağazası veritabanı (`uyg magaza`) tasarlamayı ve bu veritabanı üzerinde SQL sorguları çalıştırmayı amaçlar.

## Proje Tanımı

Proje, bir uygulama mağazasının temel işlevlerini destekleyen bir MySQL veritabanı içerir. Veritabanı, geliştiriciler, kullanıcılar, uygulamalar, kategoriler, indirmeler, yorumlar, uygulama detayları, sürümler ve geliştirici profilleri gibi varlıkları yönetir. Veritabanı şeması, en az 3 tablo ve 2 foreign key kısıtlaması şartını karşılar (toplam 9 tablo ve birden fazla foreign key içerir). Ayrıca, tablo birleştirme (JOIN) içeren ve farklı sütunlar üzerinden birleştirme yapan iki SQL sorgusu hazırlanmıştır.

## Dosya Yapısı

- **`schema.sql`**: Veritabanı şemasını oluşturan `CREATE TABLE` komutlarını içerir. 9 tablo ve ilişkili foreign key kısıtlamalarını tanımlar.
- **`queries.sql`**: Veritabanından veri çeken iki SQL sorgusunu içerir. Her sorgu, tablo birleştirme yapar ve farklı sütunlar üzerinden birleştirme gerçekleştirir. Sorgular, açıklayıcı yorum satırlarıyla desteklenmiştir.
- **`README.md`**: Bu dosya, projenin açıklamasını, kurulum adımlarını ve kullanım talimatlarını içerir.

## Veritabanı Şeması

Veritabanı (`uyg magaza`), aşağıdaki tabloları içerir:

- `gelistirici`: Geliştirici bilgilerini saklar (ID, ad, email).
- `gelistiriciprofili`: Geliştiricilerin biyografi ve web sitesi bilgilerini saklar.
- `kullanici`: Kullanıcı bilgilerini saklar (ID, kullanıcı adı, email).
- `kategori`: Uygulama kategorilerini saklar (ID, ad).
- `uygulama`: Uygulama bilgilerini saklar (ID, geliştirici ID, kategori ID, ad, açıklama, oluşturulma tarihi).
- `uygulamadetayi`: Uygulamaların sürüm sayısı, indirme sayısı ve ortalama puanını saklar.
- `versiyon`: Uygulama sürümlerini saklar (ID, uygulama ID, sürüm numarası, yayın tarihi, değişiklik listesi).
- `indirme`: Kullanıcıların indirdiği uygulamaları ve indirme tarihlerini saklar.
- `yorum`: Kullanıcıların uygulamalara yaptığı yorumları ve puanları saklar.

Tablolar, foreign key kısıtlamalarıyla birbiriyle ilişkilendirilmiştir (örneğin, `uygulama` tablosu `gelistirici` ve `kategori` tablolarına bağlıdır).

## Kurulum

1. **MySQL Kurulumu**:
   - MySQL sunucusu (örneğin, MariaDB 10.4 veya üstü) kurulu olmalıdır.
   - phpMyAdmin, MySQL Workbench veya başka bir MySQL istemcisi kullanılabilir.

2. **Veritabanı Oluşturma**:
   - MySQL istemcisinde yeni bir veritabanı oluşturun:
     ```sql
     CREATE DATABASE uyg_magaza;
     USE uyg_magaza;
     ```
   - `schema.sql` dosyasını çalıştırarak tabloları ve ilişkileri oluşturun:
     ```bash
     mysql -u <kullanici_adi> -p uyg_magaza < schema.sql
     ```

3. **Veri Ekleme**:
   - Proje yönergelerine göre veri ekleme (`INSERT INTO`) gönderime dahil edilmez, ancak test için kendi verilerinizi ekleyebilirsiniz. Örnek:
     ```sql
     INSERT INTO kategori (ad) VALUES ('Oyun'), ('Eğitim');
     INSERT INTO gelistirici (ad, email) VALUES ('Ahmet Yılmaz', 'ahmet@example.com');
     ```
   - Verileri phpMyAdmin veya MySQL Workbench üzerinden manuel olarak da girebilirsiniz.

4. **Sorguları Çalıştırma**:
   - `queries.sql` dosyasındaki sorguları çalıştırmak için:
     ```bash
     mysql -u <kullanici_adi> -p uyg_magaza < queries.sql
     ```
   - Alternatif olarak, sorguları MySQL istemcisinde kopyalayıp çalıştırabilirsiniz.

## Sorgular

`queries.sql` dosyası, aşağıdaki iki sorguyu içerir:

1. **Uygulama, Kategori ve Geliştirici Bilgileri**:
   - Uygulamaların adlarını, kategorilerini ve geliştiricilerinin adlarını listeler.
   - Birleştirme: `uygulama` tablosu, `kategori` ve `gelistirici` tablolarıyla `kategori_id` ve `gelistirici_id` üzerinden birleştirilir.

2. **Kullanıcıların İndirdiği Uygulamalar**:
   - Kullanıcıların indirdiği uygulamaların adlarını ve indirme tarihlerini listeler.
   - Birleştirme: `indirme` tablosu, `kullanici` ve `uygulama` tablolarıyla `kullanici_id` ve `uygulama_id` üzerinden birleştirilir.

Her sorgu, farklı sütunlar üzerinden birleştirme yapar ve açıklayıcı yorum satırları içerir.

## Kullanım

- **Veritabanı Testi**: `schema.sql` ile veritabanını oluşturun, test verileri ekleyin ve `queries.sql` ile sorguları çalıştırın.
- **Proje Gönderimi**: Proje yönergelerine göre, sadece `schema.sql` ve `queries.sql` dosyalarını Ekampüs üzerinden gönderin. Veri ekleme komutları (`INSERT INTO`) gönderime dahil edilmemelidir.

## Gereksinimler

- MySQL 5.7 veya üstü (MariaDB 10.4 test edilmiştir).
- PHP 8.2 ve phpMyAdmin 5.2 (isteğe bağlı, yönetim için).
- SQL istemcisi (MySQL Workbench, phpMyAdmin veya komut satırı).

## Notlar

- Proje, bireysel olarak hazırlanmıştır ve önceki vize projesinden bağımsızdır.
- Veritabanı şemasında değişiklik yapılabilir (yeni sütun ekleme, var olanları kaldırma), ancak en az 3 tablo ve 2 foreign key korunmalıdır.
- Sorgular, tablo birleştirme (JOIN) içerir ve farklı sütunlar üzerinden birleştirme yapar, proje yönergelerine uygundur.

## Lisans

Bu proje, akademik bir çalışma olarak hazırlanmıştır ve ticari kullanım için uygun değildir.
