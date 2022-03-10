SELECT CompanyName, round(delayCnt * 100.0 / cnt, 2) AS Percentage
FROM (
  SELECT ShipVia, COUNT(*) AS cnt 
  FROM 'Order'
  GROUP BY ShipVia
) AS Total
INNER JOIN (
	SELECT ShipVia, COUNT(*) AS delaycnt 
	FROM 'Order'
	WHERE ShippedDate > RequiredDate 
	GROUP BY ShipVia
) AS DelayTotal
ON Total.ShipVia = DelayTotal.ShipVia
INNER JOIN Shipper on Total.ShipVia = Shipper.Id
ORDER BY Percentage DESC;
