-- Запрос 1: Поиск зависимостей от семейного статуса
SELECT
    Marital_Status,
    AVG(Response) as response_rate
FROM
    customers
GROUP BY
    Marital_Status
ORDER BY
    response_rate DESC;

-- Запрос 2: Поиск зависимостей от возрастной группы
SELECT
    CASE
        WHEN 2026 - Year_Birth < 30 THEN 'Младше 30 лет'
        WHEN 2026 - Year_Birth BETWEEN 30 AND 45 THEN '30 - 45 лет'
        WHEN 2026 - Year_Birth BETWEEN 46 AND 60 THEN '46 - 60 лет'
        ELSE 'Старше 60 лет'
    END as age_group,
    AVG(Response) as response_rate
FROM
    customers
GROUP BY
    age_group
ORDER BY
    response_rate DESC;

-- Запрос 3: Поиск зависимостей от достатка (квантили взяты из расчетов в ноутбуке)
SELECT 
    CASE
        WHEN Income < 35196 THEN 'низкий (ниже 35196)'
        WHEN Income BETWEEN 35196 AND 51371 THEN 'средний (между 35196 и 51371)'
        WHEN Income BETWEEN 51371 AND 68487 THEN 'выше среднего (между 51371 и 68487)'
        ELSE 'высокий (больше 68487)'
    END as income_group,
    AVG(Response) as response_rate
FROM
    customers
GROUP BY
    income_group
ORDER BY
    response_rate DESC;