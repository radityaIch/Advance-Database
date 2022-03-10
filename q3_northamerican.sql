SELECT Id, ShipCountry, 
   CASE 
      WHEN ShipCountry IN ('USA', 'Mexico','Canada')
      THEN 'North America'
      ELSE 'Other Place'
   END
FROM 'Order'
WHERE Id >= 15445
ORDER BY Id ASC
LIMIT 20;