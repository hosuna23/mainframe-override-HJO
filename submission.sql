SELECT DISTINCT p.author
FROM forum_posts p
WHERE p.date >= '2048-04-01'
  AND p.date <  '2048-05-01'
  AND p.content ILIKE '%emptystack%'
  AND p.content ILIKE '%dad%';

author     
----------------
 smart-money-44s


SELECT a.username, a.first_name, a.last_name
FROM forum_posts p
JOIN forum_accounts a
  ON a.username = p.author
WHERE p.date >= '2048-04-01'
  AND p.date <  '2048-05-01'
  AND p.content ILIKE '%emptystack%'
  AND p.content ILIKE '%dad%';

username    | first_name | last_name 
----------------+------------+-----------
 smart-money-44 | Brad       | Steele



SELECT *
FROM forum_accounts
WHERE last_name = 'Steele';

mainframe_override-# WHERE last_name = 'Steele';
    username     | first_name | last_name 
-----------------+------------+-----------
 sharp-engine-57 | Andrew     | Steele
 stinky-tofu-98  | Kevin      | Steele
 smart-money-44  | Brad       | Steele
(3 rows)


id   |     title     |                                                                                              content                                                                                               |        date         |     author     
-------+---------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------+----------------
 nbZY_ | Get rich fast | You should all invest in EmptyStack Solutions soon or you'll regret it. My dad works there and he's got some serious inside intel. Their self-driving taxis are the future and the future is here. | 2048-04-08 00:00:00 | smart-money-44
(1 row)

SELECT
  m.id,
  m.message,
  m.sent_at,
  ea.username AS sender_username
FROM emptystack_messages m
JOIN emptystack_accounts ea
ON ea.id = m.sender_id
WHERE m.message ILIKE '%self-driving taxi%'
OR m.message ILIKE '%self driving taxi%'
OR m.message ILIKE '%autonomous taxi%';

SELECT author
FROM forum_posts
WHERE date >= '2048-04-01' AND date < '2048-05-01'
  AND (title ILIKE '%EmptyStack%' OR content ILIKE '%EmptyStack%');

SELECT fa.*
FROM forum_accounts fa
JOIN forum_posts fp ON fp.author = fa.username
WHERE fp.date >= '2048-04-01' AND fp.date < '2048-05-01'
AND (fp.title ILIKE '%EmptyStack%' OR fp.content ILIKE '%EmptyStack%');

SELECT ea.username, ea.password, ea.first_name, ea.last_name
FROM emptystack_accounts ea
WHERE ea.last_name IN (
  SELECT fa.last_name
  FROM forum_accounts fa
  JOIN forum_posts fp ON fp.author = fa.username
  WHERE fp.date >= '2048-04-01' AND fp.date < '2048-05-01'
    AND (fp.title ILIKE '%EmptyStack%' OR fp.content ILIKE '%EmptyStack%')
);