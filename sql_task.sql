use ig_clone;

select * from users 
order by created_at
limit 5;

SELECT *
FROM users
where id not in (select distinct user_id from photos )
order by id;

select user_id,max(photo_id)as max_likes from likes
group by user_id
order by max_likes desc
limit 0;

select tag_id ,count(*) as counts from photo_tags
group by tag_id
order by counts desc
limit 5;

select dayname(created_at) as days,count(*) as counts from users
group by days
order by counts desc
limit 1;

-- Calculate the average number of posts per user
SELECT COUNT(*) / COUNT(DISTINCT user_id) AS average_posts_per_user
FROM photos;

-- Calculate the total number of photos on Instagram divided by the total number of users
SELECT COUNT(*) AS total_photos, COUNT(DISTINCT user_id) AS total_users,
       COUNT(*) / COUNT(DISTINCT user_id) AS photos_per_user_average
FROM photos;

SELECT user_id
FROM (
    SELECT l.user_id, COUNT(*) AS total_likes
    FROM likes l
    JOIN photos p ON l.photo_id = p.id
    GROUP BY l.user_id
) AS user_likes
WHERE total_likes = (SELECT COUNT(*) FROM photos);



