-- Траты в зависимости от кол-ва детей
SELECT
    Kidhome + Teenhome as amount_of_kids,
    AVG(MntWines + MntFruits + MntMeatProducts + MntFishProducts + MntSweetProducts + MntGoldProds) as average_spendings
FROM
    customers
GROUP BY
    amount_of_kids;