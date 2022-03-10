SELECT DISTINCT ShipName, substr(ShipName, 0, instr(ShipName, '-')) as PreHyphen
FROM 'Order'
WHERE ShipName LIKE '%-%'
ORDER BY ShipName ASC;
