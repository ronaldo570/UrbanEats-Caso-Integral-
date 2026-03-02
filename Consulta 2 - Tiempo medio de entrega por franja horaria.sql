SELECT 
    t.time_band,
    AVG(f.delivery_time_mins) AS tiempo_medio_entrega_minutos
FROM fact_orders f
JOIN dim_time t ON f.time_id = t.time_id
GROUP BY 1
ORDER BY tiempo_medio_entrega_minutos DESC;
