-- 1. Lista el apellido de todos los empleados. 
	SELECT apellido FROM sistema.empleados;
    
-- 2. Lista el apellido de los empleados eliminando los apellidos que estén repetidos.
	SELECT distinct apellido FROM empleados;

-- 3. Lista todas las columnas de la tabla empleados.
	SELECT * from empleados;

-- 4. Lista el nombre y apellido de todos los empleados.
	SELECT nombre,apellido from empleados;

-- 5. Lista el cuit/cuil de los departamentos de los empleados que aparecen en la tabla empleados.
	SELECT cuil_cuit from empleados;

-- 6. Lista el nombre y apellido de los empleados en una única columna.
	SELECT concat_ws(' ', nombre, apellido) as nombre_completo from empleados;

-- 7. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
	SELECT upper(concat_ws(' ', nombre, apellido)) as nombre_completo from empleados;

-- 8. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en minúscula 
	SELECT lower(concat_ws(' ', nombre, apellido)) as nombre_completo from empleados;

-- 9. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
	SELECT nombre,presupuesto from departamentos order by presupuesto ASC;

-- 10. Lista el nombre de todos los departamentos ordenados de forma ascendente.
	SELECT nombre from departamentos order by nombre ASC;

-- 11. Lista el nombre de todos los departamentos ordenados de forma descendente
	SELECT nombre from departamentos order by nombre DESC;

-- 12. Lista el apellido y el nombre de todos los empleados, ordenados de forma alfabética 
-- tendiendo en cuenta en primer lugar su apellido y luego su nombre
	SELECT concat_ws(' ',apellido,nombre) as apellido_nombre from empleados order by apellido;
    
-- 13. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
	SELECT nombre,presupuesto from departamentos order by presupuesto desc limit 3;
    
-- 14. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
	SELECT nombre,presupuesto from departamentos order by presupuesto asc limit 3;
    
-- 15. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a $150000.
	SELECT nombre,presupuesto from departamentos where presupuesto >= 150000;
    
-- 16. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
	SELECT nombre,presupuesto from departamentos where presupuesto >= 100000  and presupuesto <=200000;
    
-- 17. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
	SELECT nombre,presupuesto from departamentos where presupuesto  < 100000 or presupuesto > 200000;
        
-- 18. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
	SELECT nombre,presupuesto from departamentos where presupuesto between 100000 and 200000;
        
-- 19. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
	SELECT nombre,presupuesto from departamentos where presupuesto NOT between 100000 and 200000;
    
-- 20. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
	SELECT * from empleados INNER JOIN departamentos ON id_departamento = iddepartamento;
    
    
-- 21. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, 
-- en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por apellido y el nombre de los empleados.

	SELECT * from empleados INNER JOIN departamentos ON id_departamento = iddepartamento order by departamentos.nombre asc,empleados.apellido  asc;

-- 22. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
	
    SELECT distinct id_departamento,departamentos.nombre from departamentos inner join empleados on id_departamento =iddepartamento ;
	
-- 23. Devuelve el nombre del departamento donde trabaja el empleado que tiene el cuit 27-38382980-3.

		select empleados.nombre,empleados.cuil_cuit, departamentos.nombre from empleados inner join departamentos 
        on id_departamento=iddepartamento where cuil_cuit = '27-38382980-3';
    
-- 24. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz.
		
        
       select * from departamentos inner join empleados 
       on id_departamento= iddepartamento and empleados.nombre= 'Pepe' and empleados.apellido = 'Ruiz';
	
-- 25. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
	
		select * from departamentos inner join empleados 
       on id_departamento= iddepartamento and departamentos.nombre= 'I+D' order by empleados.nombre asc;

-- 26. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
	select * from departamentos inner join empleados 
       on id_departamento=iddepartamento where  departamentos.nombre= 'I+D' or departamentos.nombre= 'Contabilidad'
       or departamentos.nombre= 'Sistemas' order by empleados.nombre asc;

-- 27. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre $100000 y $200000.
		
        select empleados.nombre, departamentos.nombre from empleados inner join departamentos on id_departamento= iddepartamento 
        where presupuesto NOT between 100000 AND 200000;
		

-- -----------------------------------------------------------------------------------------------------------------------------------------------------


