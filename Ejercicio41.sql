--A
SELECT * FROM peliculas WHERE calificacion IS NULL;
--B
SELECT * FROM peliculas LEFT JOIN salas ON peliculas,CODIGO = salas.peliculas
--C
