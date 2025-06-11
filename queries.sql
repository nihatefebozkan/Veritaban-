-- Sorgu 1: Her bir uygulamanın adını, kategorisini ve geliştiricisinin adını listele
-- Bu sorgu, uygulama tablosunu kategori ve geliştirici tablolarıyla birleştirerek
-- uygulamanın adını, kategori adını ve geliştiricinin adını getirir.
SELECT u.ad AS uygulama_adi, k.ad AS kategori_adi, g.ad AS gelistirici_adi
FROM uygulama u
INNER JOIN kategori k ON u.kategori_id = k.kategori_id
INNER JOIN gelistirici g ON u.gelistirici_id = g.gelistirici_id
ORDER BY u.ad;

-- Sorgu 2: Kullanıcıların indirdiği uygulamaların adlarını ve indirme tarihlerini listele
-- Bu sorgu, indirme tablosunu uygulama ve kullanici tablolarıyla birleştirerek
-- hangi kullanıcının hangi uygulamayı ne zaman indirdiğini gösterir.
SELECT k.kullanici_adi, u.ad AS uygulama_adi, i.indirildigi_tarih
FROM indirme i
INNER JOIN kullanici k ON i.kullanici_id = k.kullanici_id
INNER JOIN uygulama u ON i.uygulama_id = u.uygulama_id
ORDER BY i.indirildigi_tarih DESC;