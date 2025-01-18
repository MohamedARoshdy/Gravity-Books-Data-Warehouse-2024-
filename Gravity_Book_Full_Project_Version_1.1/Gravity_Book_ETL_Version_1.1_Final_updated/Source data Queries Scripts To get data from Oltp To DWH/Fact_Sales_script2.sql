SELECT ol.[line_id]
      ,ol.[order_id]
      ,ol.[book_id]
	  ,ol.[price]
	  ,sm.[cost]
	  ,oh.[history_id]
	  ,c.[customer_id]
	  ,co.[order_date]
  FROM [gravity_books].[dbo].[order_line] as ol
 left outer join
[gravity_books].[dbo].[cust_order] as co
on co.order_id=ol.order_id
left outer join
[gravity_books].[dbo].[shipping_method] as sm
on sm.method_id=co.shipping_method_id
left outer join 
[gravity_books].[dbo].[order_history] as oh
on co.order_id=oh.order_id
left outer join
[gravity_books].[dbo].[customer] as c
on c.customer_id=co.customer_id 
