SELECT  `Customer ID` ,Gender,  Age,

CASE  
	WHEN AGE > 35 THEN 'OLD'
    WHEN AGE <25 THEN 'YOUNG'
	ELSE 'TEEN'
END AS age_category

FROM sales.retail_sales_dataset
ORDER BY AGE
;

