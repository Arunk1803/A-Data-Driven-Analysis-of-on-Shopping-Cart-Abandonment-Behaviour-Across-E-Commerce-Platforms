create database cart_abandonment_project;
use cart_abandonment_project;
Create table cart_abandonment(
    respondent_id int auto_increment primary key,
    age_group varchar(20),
    shopping_frequency varchar(30),
    platform varchar(30),
    cart_abandoned enum ('Yes','No'),
    abandonment_frequency varchar(20),
    primary_abandonment_reason varchar (50),
    extra_charges_impact enum('Yes','No'),
    payment_issue enum('Yes','No'),
    discount_influence enum('Yes','No','Maybe'),
    preferred_discount_range varchar(20),
    checkout_improvement_impact enum('Yes','No'),
    satisfaction_score int
);
SHOW TABLES;
USE cart_abandonment;
select * from cart_abandonment;
Select COUNT(*) AS total_rows FROM cart_abandonment;
drop database cart_abandonment_project;

-------- TOTAL RESPONDENTS --------
select count(*) as total_respondents
from cart_abandonment;

-------- ABANDONED CARTS --------
Select cart_abandoned, count(*) as users
from cart_abandonment
group by cart_abandoned;

-------- MOST COMMON ABANDONMENT REASON -------
select primary_abandonment_reason, count(*) as total_users
from cart_abandonment
where cart_abandoned = 'yes'
group by primary_abandonment_reason
order by total_users desc;

-------- Platform-wise Cart Abandonment -----------
Select platform, COUNT(*) as abandoned_carts
from cart_abandonment
where cart_abandoned = 'Yes'
group by platform
order by  abandoned_carts DESC;

-------- Impact of Extra Charges -------
select extra_charges_impact, count(*) as users
from cart_abandonment
where cart_abandoned = 'yes'
group by extra_charges_impact;

-------- Payment Issues Analysis ---------
select payment_issue, count(*) as users
from cart_abandonment
where cart_abandoned = 'yes'
group by payment_issue;

-------- Discount Influence on Purchase --------
Select discount_influence, COUNT(*) AS users
from cart_abandonment
group by discount_influence;

-------- Average Satisfaction Score ---------
Select Avg(satisfaction_score) as avg_satisfaction
from cart_abandonment;

-------- Age Vs cart abandonment --------
Select age_group, COUNT(*) AS total_users
from cart_abandonment
where cart_abandoned = 'Yes'
group by age_group;


