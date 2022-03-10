SELECT pname, CompanyName, ContactName
FROM (
  SELECT pname, min(OrderDate), CompanyName, ContactName
  FROM (
    SELECT Id AS pid, ProductName AS pname 
    FROM Product 
    WHERE Discontinued != 0
  ) AS discontinued
  INNER JOIN OrderDetail on ProductId = pid
  INNER JOIN 'Order' ON 'Order'.Id = OrderDetail.OrderId
  INNER JOIN Customer ON CustomerId = Customer.Id
  GROUP BY pid
) ORDER BY pname ASC;