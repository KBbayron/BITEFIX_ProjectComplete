<center><h1>Proyecto Desarrollo con <br> plataformas abiertas</h1></center>

# Descripcion del proyecto
<p>
    API de plataforma de ventas del curso desarrollo con plataformas abiertas. Este proyecto esta elaborado con un backend en Laravel que trabaja inicialmente con un CRUD en cada tabla en la base de datos y un frontend elaborado con javascript.
</p>

## Integrantes del proyecto
Bayron Leiva Rojas <br>
Jonathan Rivera

<h2>Diagrama de base de datos</h2>
<center><img src="./backend-laravel/img/TiendaDeRopa.jpg" alt="Ejemplo" width="400"/></center>

Puedes ver con más detalle en el siguiente link:
<h4> https://drive.google.com/file/d/1oXBcdNCqPskvvS8atKvRwHA2U7n4fxAy/view?usp=drive_link</h4>


# Endpoints de la API
Headers para consulta en Postman en cada endpoint:<br>
| Key               | Value       |
|-----------------|-----------------|
| Accept | application/json |
| Content-Type | application/json |


url base: http://127.0.0.1:8000/api/ <br> <br>
Ejemplo: <br> 
get => http://127.0.0.1:8000/api/clientes/5 <br>
delete => http://127.0.0.1:8000/api/invetario

## **Clientes**
- GET /clientes - Obtener todos los clientes
---
- GET /clientes/3- Obtener un cliente específico con id=3
---
- DELETE /api/clientes/1 - Eliminar un cliente con id=1
---
- POST /clientes - Crear un nuevo cliente

body ejemplo:

    body ejemplo:
    {
        "nombre": "Jonh", 
        "apellido1":"Doe",
        "apellido2":"",
        "telefono":"112233445566",
        "email":"john@example.com"
    }
---
- PUT /api/clientes/8 - Actualizar un cliente con id=8

body ejemplo:

    {
        "nombre": "", 
        "apellido1":"",
        "apellido2":"",
        "telefono":"778899445566", //solo modifica el telefono
        "email":""
    }
---


## **Inventario**
- GET /inventario - Obtener todos los artículos
---
- GET /inventario/8 - Obtener un artículo específico con id=8
---
- DELETE /inventario/10 - Eliminar un artículo con id=10
---
- POST /inventario - Crear un nuevo artículo

body ejemplo:

    {
        "nombre": "Gorra Nike", 
        "descripcion":"Descripcion de Gorra Nike",
        "MARCA":"Nike",
        "MODELO":"version 1",
        "precio":1.500,
        "in_stock": 5
    }
---
- PUT /api/inventario/9 - Actualizar un artículo con id=9

body ejemplo:

    {
        "nombre": "", 
        "descripcion":"",
        "MARCA":"",
        "MODELO":"version 5", // solo modifica modelo y precio
        "precio":1.800,
        "in_stock": 
    }

## **Ventas**

- GET /api/ventas - Obtener todas las ventas
---
- GET /api/ventas/5 - Obtener una venta específica con id=5
---
- DELETE /api/ventas/7 - Eliminar una venta con id=5
---
- POST /api/ventas - Crear una nueva venta

body ejemplo:

    {
        "id_cliente":1,
        "id_articulo":6,
        "Unidades": 1,
        "total": 2
    }
---
- PUT /api/ventas/5 - Actualizar una venta con id=5

body ejemplo:

    {
        "id_cliente":1,
        "id_articulo":6, //modifica todos los valores
        "Unidades": 1,
        "total": 2
    }
---
