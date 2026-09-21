USE sekai_friend;

-- 修复观看日期：
-- 之前的脚本把 watch_date 错写成了各番剧的首播/上映日期，导致"时间线"
-- 变成了"番剧自己的时间线"。这里把 watch_date 恢复为记录时间（入库/截图
-- 补录日期，取自 create_time），并且只对 watch_date 仍等于当年被写入的
-- 开播日期的行生效，避免覆盖用户后来手动改过的观看日期。
UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND (a.title LIKE '%Suzume%' OR a.title LIKE '%铃芽%' OR a.title LIKE '%鈴芽%' OR a.title LIKE '%すずめ%')
  AND a.watch_date = '2022-11-11';

UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND (a.title LIKE '%Horimiya%' OR a.title LIKE '%堀与宫村%' OR a.title LIKE '%堀與宮村%' OR a.title LIKE '%ホリミヤ%')
  AND a.watch_date = '2021-01-10';

UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND (a.title LIKE '%Horimiya: Piece%' OR a.title LIKE '%Missing Pieces%' OR a.title LIKE '%-piece-%' OR a.title LIKE '%ホリミヤ -piece-%')
  AND a.watch_date = '2023-07-01';

UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND (a.title LIKE '%Lycoris Recoil%' OR a.title LIKE '%LycoReco%' OR a.title LIKE '%莉可丽丝%' OR a.title LIKE '%莉可麗絲%' OR a.title LIKE '%リコリス%')
  AND a.watch_date = '2022-07-02';

UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND a.title LIKE '%Summer Pockets%'
  AND a.watch_date = '2025-04-07';

UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND (a.title LIKE '%Koe no Katachi%' OR a.title LIKE '%A Silent Voice%' OR a.title LIKE '%声之形%' OR a.title LIKE '%聲の形%')
  AND a.watch_date = '2016-09-17';

UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND (a.title LIKE '%Hametsu no Oukoku%' OR a.title LIKE '%Kingdoms of Ruin%' OR a.title LIKE '%破灭之国%' OR a.title LIKE '%破滅之國%' OR a.title LIKE '%はめつのおうこく%')
  AND a.watch_date = '2023-10-07';

UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND (a.title LIKE '%Tamako Love Story%' OR a.title LIKE '%玉子爱情故事%' OR a.title LIKE '%玉子愛情故事%' OR a.title LIKE '%たまこラブストーリー%')
  AND a.watch_date = '2014-04-26';

UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND (a.title LIKE '%BanG Dream! It''s MyGO%' OR a.title LIKE '%BanG Dream It''s MyGO%' OR a.title LIKE '%MyGO%')
  AND a.watch_date = '2023-06-29';

UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND (a.title LIKE '%No Game No Life%Zero%' OR a.title LIKE '%No Game, No Life%Zero%' OR a.title LIKE '%游戏人生%零%' OR a.title LIKE '%遊戲人生%零%' OR a.title LIKE '%ノーゲーム%ゼロ%')
  AND a.watch_date = '2017-07-15';

UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND (a.title LIKE '%Shikimori%' OR a.title LIKE '%式守%' OR a.title LIKE '%可愛いだけじゃない式守さん%')
  AND a.watch_date = '2022-04-10';

UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND (a.title LIKE '%Natsu e no Tunnel%' OR a.title LIKE '%Tunnel to Summer%' OR a.title LIKE '%夏へのトンネル%' OR a.title LIKE '%通往夏天的隧道%')
  AND a.watch_date = '2022-09-09';

UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND (a.title LIKE '%Project Sekai%' OR a.title LIKE '%Project SEKAI%' OR a.title LIKE '%Kowareta Sekai%' OR a.title LIKE '%世界计划%' OR a.title LIKE '%世界計畫%')
  AND a.watch_date = '2025-01-17';

UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND (a.title LIKE '%Yahari Ore no Seishun Love Comedy wa Machigatteiru%' OR a.title LIKE '%My Teen Romantic Comedy SNAFU%' OR a.title LIKE '%Oregairu%' OR a.title LIKE '%俺ガイル%' OR a.title LIKE '%青春恋爱喜剧%')
  AND a.watch_date = '2013-04-05';

UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND (a.title LIKE '%Yahari Ore no Seishun Love Comedy wa Machigatteiru%Zoku%' OR a.title LIKE '%My Teen Romantic Comedy SNAFU%TOO%' OR a.title LIKE '%Oregairu%Zoku%' OR a.title LIKE '%俺ガイル%続%' OR a.title LIKE '%青春恋爱喜剧%续%')
  AND a.watch_date = '2015-04-03';

-- 兜底修复：早期种子/旧逻辑还留下了一批 watch_date 与上映日期完全相同的行，
-- 同样会把时间线变成"番剧自己的时间线"。这里统一恢复为记录时间。
-- 如需保留个别"上映当天就看"的真实观看日期，可先手动改掉，再执行本脚本。
UPDATE sekai_memory_book_anime a
JOIN sekai_memory_book_user u ON u.id = a.user_id
SET a.watch_date = DATE(a.create_time)
WHERE u.nickname = 'sekai'
  AND a.watch_date IS NOT NULL
  AND a.release_date IS NOT NULL
  AND a.watch_date = a.release_date;
