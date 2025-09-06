function cargarArticulos() {
    fetch("http://127.0.0.1:8000/api/clientes")
        .then(response => response.json())
        .then(articulos => {
            const tablaArticulos = document.getElementById("tablaArticulos");
            tablaArticulos.innerHTML = "";

            articulos.forEach(articulo => {
                // Formatear la fecha
                const fecha = new Date(articulo.registro);
                const dia = String(fecha.getDate()).padStart(2, '0');
                const mes = String(fecha.getMonth() + 1).padStart(2, '0');
                const anio = fecha.getFullYear();
                const fechaFormateada = `${dia}/${mes}/${anio}`;

                const row = document.createElement("tr");

                row.innerHTML = `
                    <td>${articulo.nombre}</td>
                    <td>${articulo.apellido1}</td>
                    <td>${articulo.apellido2}</td>
                    <td>${articulo.telefono}</td>
                    <td>${articulo.email}</td>
                    <td>${fechaFormateada}</td>
                    <td class="text-center">
                        <button class="btn btn-sm btn-warning me-1" onclick="editarArticulo(${articulo.id})">Editar</button>
                        <button class="btn btn-sm btn-danger" onclick="eliminarArticulo(${articulo.id})">Eliminar</button>
                    </td>
                `;
                
                tablaArticulos.appendChild(row);
            });
        })
        .catch(error => console.error('Error al cargar los artículos:', error));
}


// Función para abrir el modal y rellenar los campos con la información del artículo
function editarArticulo(id) {
    // Aquí deberías obtener los datos del artículo desde tu API
    fetch(`http://127.0.0.1:8000/api/clientes/${id}`) // Cambia esta URL con la URL de tu API
        .then(response => response.json())
        .then(articulo => {
            document.getElementById("nombre").value = articulo.nombre;
            document.getElementById("apellido1").value = articulo.apellido1;
            document.getElementById("apellido2").value = articulo.apellido2;
            document.getElementById("telefono").value = articulo.telefono;
            document.getElementById("email").value = articulo.email;
            document.getElementById("registro").value = articulo.registro;
            document.getElementById("editarModal").setAttribute("data-id", id);

            
            // Mostrar el modal
            new bootstrap.Modal(document.getElementById('editarModal')).show();
        })
        .catch(error => console.error('Error al obtener los datos del artículo:', error));
}

// Función para guardar los cambios en el artículo
function guardarEdicion() {
    const id = document.getElementById("editarModal").getAttribute("data-id");

    if (!id) {
        console.error('ID del cliente no definido');
        alert('Error: No se encontró el ID del cliente.');
        return;
    }

    const nombre = document.getElementById("nombre").value;
    const apellido1 = document.getElementById("apellido1").value;
    const apellido2 = document.getElementById("apellido2").value;
    const telefono = document.getElementById("telefono").value;
    const email = document.getElementById("email").value;
    const registro = document.getElementById("registro").value;

    const articulo = { nombre, apellido1, apellido2, telefono, email, registro };

    fetch(`http://127.0.0.1:8000/api/clientes/${id}`, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(articulo)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error(`Error HTTP: ${response.status}`);
        }
        return response.json();
    })
    .then(data => {
        console.log('Cliente actualizado:', data);
        cargarArticulos();
        const modal = bootstrap.Modal.getInstance(document.getElementById('editarModal'));
        modal.hide();
    })
    .catch(error => {
        console.error('Error al actualizar el cliente:', error);
        alert('No se pudo actualizar el cliente. Verifica que el cliente exista.');
    });
}


// Cargar los artículos cuando la página se cargue
window.onload = cargarArticulos;