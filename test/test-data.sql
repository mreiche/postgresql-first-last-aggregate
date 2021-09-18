create table products (
    product varchar,
    offering int,
    price real
);

-- Just run this mutiple times
insert into products values
     ('Katze', round(random() * 2) + 1, random()*100),
     ('Affe', round(random() * 2) + 1, random()*100),
     ('Kuh', round(random() * 2) + 1, random()*100)
;

select
    product,
    first(price) price_open,
    last(price) price_close,
    avg(price) price_avg,
    min(price) price_min,
    max(price) price_max
from products
    group by product
