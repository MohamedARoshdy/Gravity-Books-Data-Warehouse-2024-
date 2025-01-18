SELECT ad.[address_id]
      ,ad.[street_number]
      ,ad.[street_name]
      ,ad.[city]
      ,ad.[country_id]
	  ,c.[country_name]
	  ,ads.[status_id]
      ,ads.[address_status]
  FROM [gravity_books].[dbo].[address] as ad left outer join
  [gravity_books].[dbo].[country] as C
  on ad.country_id=c.country_id
  left outer join
 [gravity_books].[dbo].[customer_address]as ca
 on ad.address_id=ca.address_id
 left outer join
 [gravity_books].[dbo].[address_status] as ads
on ads.status_id=ca.status_id