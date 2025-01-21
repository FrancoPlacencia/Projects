select * from users u;

select * from permissions p WHERE p.user_id = 4;


SELECT ch.* FROM churches ch WHERE ch.church_id NOT IN (SELECT p.church_id FROM permissions p WHERE p.user_id = 4)

INNER JOIN permissions p 
ON ch.church_id != p.church_id

WHERE p.user_id = 4


insert into permissions (user_id, church_id) values(4,1)


SELECT ch.* 
FROM churches ch

INNER JOIN permissions p 
ON ch.church_id != p.church_id

WHERE p.user_id = 4




select * from churches c;

select * from categories c;

select * from funds f;

delete from churches where church_id = 4;

delete from categories where category_id != 0;

delete from church_categories where category_id != 0;

UPDATE categories SET church_id = 3 WHERE category_id = 1

SELECT ch.*, ct.*
FROM churches ch 
LEFT JOIN categories ct
ON ct.church_id = ch.church_id

SELECT * FROM categories WHERE church_id = :churchId