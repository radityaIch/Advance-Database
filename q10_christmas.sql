WITH p AS (
  SELECT Product.Id, Product.ProductName AS name
  FROM Product
    INNER JOIN OrderDetail on Product.id = OrderDetail.ProductId
    INNER JOIN 'Order' on 'Order'.Id = OrderDetail.OrderId
    INNER JOIN Customer on CustomerId = Customer.Id
  WHERE DATE(OrderDate) = '2014-12-25' AND CompanyName = 'Queen Cozinha'
  GROUP BY Product.id
),
c AS (
  SELECT ROW_NUMBER() OVER (ORDER BY p.id ASC) AS seqnum, p.name AS name
  FROM p
),
flattened as (
  SELECT seqnum, name as name
  FROM c
  WHERE seqnum = 1
  UNION all
  SELECT c.seqnum, f.name || ', ' || c.name
  FROM c JOIN
    flattened f
    ON c.seqnum = f.seqnum + 1
)
SELECT name FROM flattened
ORDER BY seqnum DESC LIMIT 1;