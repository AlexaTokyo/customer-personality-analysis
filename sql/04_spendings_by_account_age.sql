-- Зависимость трат клиентов от времени регистрации
SELECT
    CASE
        WHEN (julianday((SELECT MAX(Dt_Customer) FROM customers)) - julianday(Dt_Customer)) < 30 THEN '<30'
        WHEN (julianday((SELECT MAX(Dt_Customer) FROM customers)) - julianday(Dt_Customer)) BETWEEN 31 AND 180 THEN '30-180'
        WHEN (julianday((SELECT MAX(Dt_Customer) FROM customers)) - julianday(Dt_Customer)) BETWEEN 181 AND 360 THEN '181-360'
        ELSE '360+'
    END as days_registered_group,
    COUNT(*) as number_of_clients,
    AVG(MntWines + MntFruits + MntMeatProducts + MntFishProducts + MntSweetProducts + MntGoldProds) as average_spendings
FROM
    customers
GROUP BY
    days_registered_group
ORDER BY
        CASE days_registered_group
        WHEN '<30' THEN 1
        WHEN '30-180' THEN 2
        WHEN '181-360' THEN 3
        WHEN '360+' THEN 4
    END;