SELECT co. [order_id],
       co. [order_date],
		shm.[method_id],
		shm.[method_name]
  FROM [gravity_books].[dbo].[cust_order] as co left outer join 
[gravity_books].[dbo].[shipping_method] as shm
on shm.method_id=co.shipping_method_id



