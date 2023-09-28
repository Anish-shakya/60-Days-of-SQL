
## 1. The ten best-selling video games
![Alt text](/Assets2/video_game.jpg)

<p>Let's begin by looking at some of the top selling video games of all time!</p>


```sql
%%sql
postgresql:///games

SELECT * FROM game_sales
ORDER BY games_sold DESC
LIMIT 10

```


## 2. Missing review scores
<p>Wow, the best-selling video games were released between 1985 to 2017! That's quite a range; we'll have to use data from the <code>reviews</code> table to gain more insight on the best years for video games. </p>
<p>First, it's important to explore the limitations of our database. One big shortcoming is that there is not any <code>reviews</code> data for some of the games on the <code>game_sales</code> table. </p>


```sql
%%sql 

SELECT COUNt(*) 
FROM game_sales AS g
LEFT JOIN reviews AS r
ON g.game = r.game
WHERE r.user_score IS NULL AND r.critic_score IS NULL
```

## 3. Years that video game critics loved
<p>It looks like a little less than ten percent of the games on the <code>game_sales</code> table don't have any reviews data. That's a small enough percentage that we can continue our exploration, but the missing reviews data is a good thing to keep in mind as we move on to evaluating results from more sophisticated queries. </p>
<p>There are lots of ways to measure the best years for video games! Let's start with what the critics think. </p>


```sql
%%sql

SELECT g.year,ROUND(AVG(r.critic_score),2) AS avg_critic_score
FROM game_sales AS g
JOIN reviews AS r
ON g.game = r.game
GROUP BY g.year 
ORDER BY 2 DESC
LIMIT 10
```

## 4. Was 1982 really that great?
<p>The range of great years according to critic reviews goes from 1982 until 2020: we are no closer to finding the golden age of video games! </p>
<p>Hang on, though. Some of those <code>avg_critic_score</code> values look like suspiciously round numbers for averages. The value for 1982 looks especially fishy. Maybe there weren't a lot of video games in our dataset that were released in certain years. </p>
<p>Let's update our query and find out whether 1982 really was such a great year for video games.</p>


```sql
%%sql 
SELECT g.year,ROUND(AVG(r.critic_score),2) AS avg_critic_score ,COUNT(*) AS num_games
FROM game_sales AS g
JOIN reviews AS r
ON g.game = r.game
GROUP BY 1
HAVING COUNT(*)> 4
ORDER BY 2 DESC
LIMIT 10


```
## 5. Years that dropped off the critics' favorites list
<p>That looks better! The <code>num_games</code> column convinces us that our new list of the critics' top games reflects years that had quite a few well-reviewed games rather than just one or two hits. But which years dropped off the list due to having four or fewer reviewed games? Let's identify them so that someday we can track down more game reviews for those years and determine whether they might rightfully be considered as excellent years for video game releases!</p>
<p>It's time to brush off your set theory skills. To get started, we've created tables with the results of our previous two queries:</p>
<h3 id="top_critic_years"><code>top_critic_years</code></h3>
<table>
<thead>
<tr>
<th style="text-align:left;">column</th>
<th>type</th>
<th>meaning</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;"><code>year</code></td>
<td>int</td>
<td>Year of video game release</td>
</tr>
<tr>
<td style="text-align:left;"><code>avg_critic_score</code></td>
<td>float</td>
<td>Average of all critic scores for games released in that year</td>
</tr>
</tbody>
</table>
<h3 id="top_critic_years_more_than_four_games"><code>top_critic_years_more_than_four_games</code></h3>
<table>
<thead>
<tr>
<th style="text-align:left;">column</th>
<th>type</th>
<th>meaning</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;"><code>year</code></td>
<td>int</td>
<td>Year of video game release</td>
</tr>
<tr>
<td style="text-align:left;"><code>num_games</code></td>
<td>int</td>
<td>Count of the number of video games released in that year</td>
</tr>
<tr>
<td style="text-align:left;"><code>avg_critic_score</code></td>
<td>float</td>
<td>Average of all critic scores for games released in that year</td>
</tr>
</tbody>
</table>


```sql
%%sql 
SELECT * 
FROM top_critic_years
WHERE year NOT IN (SELECT year FROM top_critic_years_more_than_four_games)
ORDER BY avg_critic_score DESC
```


## 6. Years video game players loved
<p>Based on our work in the task above, it looks like the early 1990s might merit consideration as the golden age of video games based on <code>critic_score</code> alone, but we'd need to gather more games and reviews data to do further analysis. </p>
<p>Let's move on to looking at the opinions of another important group of people: players! To begin, let's create a query very similar to the one we used in Task Four, except this one will look at <code>user_score</code> averages by year rather than <code>critic_score</code> averages.</p>


```sql
%%sql 
SELECT g.year,ROUND(AVG(r.user_score),2) AS avg_user_score,COUNT(*) AS num_games 
FROM game_sales AS g
JOIN reviews AS r
ON g.game = r.game
GROUP BY g.year
HAVING COUNT(*) >4
ORDER BY 2 DESC
LIMIT 10
```

## 7. Years that both players and critics loved
<p>Alright, we've got a list of the top ten years according to both critic reviews and user reviews. Are there any years that showed up on both tables? If so, those years would certainly be excellent ones!</p>
<p>Recall that we have access to the <code>top_critic_years_more_than_four_games</code> table, which stores the results of our top critic years query from Task 4:</p>
<h3 id="top_critic_years_more_than_four_games"><code>top_critic_years_more_than_four_games</code></h3>
<table>
<thead>
<tr>
<th style="text-align:left;">column</th>
<th>type</th>
<th>meaning</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;"><code>year</code></td>
<td>int</td>
<td>Year of video game release</td>
</tr>
<tr>
<td style="text-align:left;"><code>num_games</code></td>
<td>int</td>
<td>Count of the number of video games released in that year</td>
</tr>
<tr>
<td style="text-align:left;"><code>avg_critic_score</code></td>
<td>float</td>
<td>Average of all critic scores for games released in that year</td>
</tr>
</tbody>
</table>
<p>We've also saved the results of our top user years query from the previous task into a table:</p>
<h3 id="top_user_years_more_than_four_games"><code>top_user_years_more_than_four_games</code></h3>
<table>
<thead>
<tr>
<th style="text-align:left;">column</th>
<th>type</th>
<th>meaning</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;"><code>year</code></td>
<td>int</td>
<td>Year of video game release</td>
</tr>
<tr>
<td style="text-align:left;"><code>num_games</code></td>
<td>int</td>
<td>Count of the number of video games released in that year</td>
</tr>
<tr>
<td style="text-align:left;"><code>avg_user_score</code></td>
<td>float</td>
<td>Average of all user scores for games released in that year</td>
</tr>
</tbody>
</table>


```sql
%%sql 

SELECT year 
FROM top_critic_years_more_than_four_games AS c
WHERE year IN (SELECT year FROM top_user_years_more_than_four_games AS u
            WHERE c.year = u.year) 
```

## 8. Sales in the best video game years
<p>Looks like we've got three years that both users and critics agreed were in the top ten! There are many other ways of measuring what the best years for video games are, but let's stick with these years for now. We know that critics and players liked these years, but what about video game makers? Were sales good? Let's find out.</p>
<p>This time, we haven't saved the results from the previous task in a table for you. Instead, we'll use the query from the previous task as a subquery in this one! This is a great skill to have, as we don't always have write permissions on the database we are querying.</p>


```sql
%%sql 
SELECT year,SUM(games_sold) AS total_games_sold
FROM game_sales
WHERE year IN(
        SELECT year 
        FROM top_critic_years_more_than_four_games AS c
        WHERE year IN (SELECT year FROM top_user_years_more_than_four_games AS u
            WHERE c.year = u.year) )
GROUP BY year
ORDER BY 2 DESC
```

