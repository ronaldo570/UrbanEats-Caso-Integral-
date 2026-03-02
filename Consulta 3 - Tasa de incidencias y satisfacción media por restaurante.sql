SELECT 
    r.name AS restaurante,
    r.cuisine_type,
    (SUM(CAST(f.has_incident AS INT)) * 100.0 / COUNT(f.order_id)) AS tasa_incidencias_pct,
    AVG(f.rating) AS satisfaccion_media
FROM fact_orders f
JOIN dim_restaurant r ON f.restaurant_id = r.restaurant_id
GROUP BY 1, 2
HAVING COUNT(f.order_id) > 50 -- Filtramos restaurantes con poco volumen para no sesgar
ORDER BY tasa_incidencias_pct DESC;
