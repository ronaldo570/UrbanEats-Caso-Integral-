SELECT 
    l.city_name,
    l.zone,
    SUM(f.total_price) AS ingresos_totales,
    SUM(f.commission_amount) AS comisiones_totales
FROM fact_orders f
JOIN dim_location l ON f.city_id = l.city_id
JOIN dim_date d ON f.date_id = d.date_id
WHERE d.month = EXTRACT(MONTH FROM CURRENT_DATE) 
  AND d.year = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY 1, 2
ORDER BY ingresos_totales DESC;










