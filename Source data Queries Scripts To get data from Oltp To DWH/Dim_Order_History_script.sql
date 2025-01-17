SELECT oh.[history_id]
      ,oh.[status_id]
      ,oh.[status_date]
	  ,os.[status_value]
  FROM [gravity_books].[dbo].[order_history] as oh 
  left outer join [gravity_books].[dbo].[order_status] as os
  on os.status_id=oh.status_id
