-- 1. Retrieve the first 20 records from the "stream" table
select * 
from stream
limit 20;

-- 2. Retrieve the first 20 records from the "chat" table
select *
from chat
limit 20;

-- 3. Retrieve all distinct games streamed in the "stream" table
select distinct game
from stream;

-- 4. Retrieve all distinct channels streamed in the "stream" table
select distinct channel 
from stream;

-- 5. Count the number of distinct games, grouping by game and ordering by the count in descending order.
-- This query shows which games are streamed the most.
select count(distinct game), game
from stream
group by game
order by count(*) desc;

-- 6. Count streams of "League of Legends" per country, grouped by country, and ordered by highest count first.
-- This shows where "League of Legends" is most popular.
select country, count(country)
from stream
where game = 'League of Legends'
group by country
order by count(country) desc;

-- 7. Count the number of streams per player, grouped by player, and ordered by the number of streams in descending order.
-- This indicates which players stream the most.
select player, count(player)
from stream
group by player
order by count(player) desc;

-- 8. Classify each game by genre using a CASE statement, assigning labels like "MOBA", "FPS", "Survival", or "Other".
-- Games are grouped by name, and ordered alphabetically.
select game,
  case
    when game = "League of Legends" then "MOBA"
    when game = "Dota 2" then "MOBA"
    when game = "Heroes of the Storm" then "MOBA"
    when game = "Counter-Strike: Global Offensive" then "FPS"
    when game = "DayZ" then "Survival"
    when game = "ARK: Survival Evolved" then "Survival"
    else "Other"
  end as genre 
from stream
group by game
order by game;

-- 9. Count the number of streams in the UK (country = 'GB'), grouped by hour of the day.
-- The strftime function extracts the hour from the time column, and the count function tallies streams per hour.
select strftime('%H', time), count(strftime('%H', time))
from stream
where country = 'GB'
group by 1;

-- 10. Perform an inner join between the "stream" and "chat" tables using the device_id to combine both tables' records.
-- The join brings together matching records from both tables.
select *
from stream
join chat
  on stream.device_id = chat.device_id;
