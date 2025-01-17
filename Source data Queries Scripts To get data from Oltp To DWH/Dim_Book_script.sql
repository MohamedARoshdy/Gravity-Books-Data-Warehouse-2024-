SELECT b.[book_id]
      ,b.[title]
      ,b.[isbn13]
      ,b.[language_id]
      ,b.[num_pages]
      ,b.[publication_date]
      ,b.[publisher_id]
	  ,p.[publisher_name]
	  ,bl.[language_code]
      ,bl.[language_name]
  FROM [gravity_books].[dbo].[book] as B
  left outer join 
 [gravity_books].[dbo].[publisher] as p
 on p.publisher_id= b.publisher_id

 left outer join 
 [gravity_books].[dbo].[book_language] as bl
 on bl.language_id=b.language_id