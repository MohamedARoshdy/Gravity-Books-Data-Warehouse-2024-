SELECT   b.[Book_PK_BK],
     
	    f.[LineID_PK_BK_DD],
        b.[title],
		oh.[Status_ID_PK_BK],
        oh.[status_value]
 FROM [GravityBooks_DWH].[dbo].[Dim_Book] as b left outer join 
[GravityBooks_DWH].[dbo].[Fact_Sales] as f
on b.Book_PK_BK =f.FK_Book_PK_SK 
left outer join 
[GravityBooks_DWH].[dbo].[Dim_Order_History] as oh
on oh.History_PK_SK =f.FK_History_PK_SK
where f.LineID_PK_BK_DD=17
group by oh.Status_ID_PK_BK



SELECT     b.[Book_PK_BK],
     
	    f.[LineID_PK_BK_DD],
        b.[title],
		oh.[Status_ID_PK_BK],
        oh.[status_value]
 FROM [GravityBooks_DWH].[dbo].[Dim_Book] as b left outer join 
[GravityBooks_DWH].[dbo].[Fact_Sales] as f
on b.Book_PK_BK =f.FK_Book_PK_SK 
left outer join 
[GravityBooks_DWH].[dbo].[Dim_Order_History] as oh
on oh.History_PK_SK =f.FK_History_PK_SK
where oh.Status_ID_PK_BK=4 
group by  b.[Book_PK_BK]




SELECT COUNT(b.[Book_PK_BK]) AS BookCount,
       f.[LineID_PK_BK_DD],
       b.[title],
       oh.[Status_ID_PK_BK],
       oh.[status_value]
FROM [GravityBooks_DWH].[dbo].[Dim_Book] AS b
LEFT OUTER JOIN [GravityBooks_DWH].[dbo].[Fact_Sales] AS f
    ON b.Book_PK_BK = f.FK_Book_PK_SK
LEFT OUTER JOIN [GravityBooks_DWH].[dbo].[Dim_Order_History] AS oh
    ON oh.History_PK_SK = f.FK_History_PK_SK
WHERE oh.Status_ID_PK_BK = 4 
GROUP BY f.[LineID_PK_BK_DD], b.[title], oh.[Status_ID_PK_BK], oh.[status_value]



SELECT SUM(COUNT(b.[Book_PK_BK])) AS TotalBooksSold
FROM [GravityBooks_DWH].[dbo].[Dim_Book] AS b
LEFT OUTER JOIN [GravityBooks_DWH].[dbo].[Fact_Sales] AS f
    ON b.Book_PK_BK = f.FK_Book_PK_SK
LEFT OUTER JOIN [GravityBooks_DWH].[dbo].[Dim_Order_History] AS oh
    ON oh.History_PK_SK = f.FK_History_PK_SK
WHERE oh.Status_ID_PK_BK = 4
GROUP BY f.[LineID_PK_BK_DD], b.[title], oh.[Status_ID_PK_BK], oh.[status_value]

/******************* Ture query ********************************/
SELECT SUM(BookCount) AS TotalBooksSold
FROM (
    SELECT COUNT(b.[Book_PK_BK]) AS BookCount
    FROM [GravityBooks_DWH].[dbo].[Dim_Book] AS b
    LEFT OUTER JOIN [GravityBooks_DWH].[dbo].[Fact_Sales] AS f
        ON b.Book_PK_BK = f.FK_Book_PK_SK
    LEFT OUTER JOIN [GravityBooks_DWH].[dbo].[Dim_Order_History] AS oh
        ON oh.History_PK_SK = f.FK_History_PK_SK
    WHERE oh.Status_ID_PK_BK = 4
    GROUP BY f.[LineID_PK_BK_DD], b.[title], oh.[Status_ID_PK_BK], oh.[status_value]
) AS SubQuery
