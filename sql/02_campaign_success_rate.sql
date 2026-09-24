-- Процент успеха каждой компании
SELECT
    AVG(AcceptedCmp1) as "Campaign 1 Success rate",
    AVG(AcceptedCmp2) as "Campaign 2 Success rate",
    AVG(AcceptedCmp3) as "Campaign 3 Success rate",
    AVG(AcceptedCmp4) as "Campaign 4 Success rate",
    AVG(AcceptedCmp5) as "Campaign 5 Success rate"
FROM 
    customers;