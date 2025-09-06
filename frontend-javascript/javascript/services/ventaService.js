document.addEventListener("DOMContentLoaded", function () {
    cargarVentas();
});

function cargarVentas() {
    fetch("http://127.0.0.1:8000/api/ventas")
        .then(response => response.json())
        .then(ventas => {
            const tabla = document.getElementById("tablaArticulos");
            tabla.innerHTML = "";

            ventas.forEach(venta => {
                const fecha = new Date(venta.fecha);
                const dia = String(fecha.getDate()).padStart(2, '0');
                const mes = String(fecha.getMonth() + 1).padStart(2, '0');
                const anio = fecha.getFullYear();
                const fechaFormateada = `${dia}/${mes}/${anio}`;

                const nombreCliente = `${venta.cliente.nombre} ${venta.cliente.apellido1} ${venta.cliente.apellido2}`;
                const nombreArticulo = venta.articulo.nombre;

                const fila = document.createElement("tr");
                fila.innerHTML = `
                    <td>${nombreCliente}</td>
                    <td>${nombreArticulo}</td>
                    <td>${venta.Unidades}</td>
                    <td>${venta.total}</td>
                    <td>${fechaFormateada}</td>
                    <td class="text-center">
                        <button class="btn btn-sm btn-warning me-1" onclick="editarVenta(${venta.id})">Editar</button>
                        <button class="btn btn-sm btn-danger" onclick="eliminarVenta(${venta.id})">Eliminar</button>
                    </td>
                `;
                tabla.appendChild(fila);
            });
        })
        .catch(error => console.error("Error al cargar ventas:", error));
}

function eliminarVenta(id) {
    if (confirm("¿Estás seguro de eliminar esta venta?")) {
        fetch(`http://127.0.0.1:8000/api/ventas/${id}`, {
            method: "DELETE"
        })
        .then(response => {
            if (response.ok) {
                alert("Venta eliminada correctamente.");
                cargarVentas();
            } else {
                alert("Error al eliminar la venta.");
            }
        })
        .catch(error => console.error("Error al eliminar:", error));
    }
}
// Mostrar datos en el modal
function editarVenta(id) {
    fetch(`http://127.0.0.1:8000/api/ventas/${id}`)
        .then(response => response.json())
        .then(venta => {
            document.getElementById("idVenta").value = venta.id;
            document.getElementById("cliente").value = venta.id_cliente;
            document.getElementById("articulo").value = venta.id_articulo;
            document.getElementById("unidades").value = venta.Unidades;
            document.getElementById("total").value = venta.total;

            const fecha = new Date(venta.fecha);
            const yyyy = fecha.getFullYear();
            const mm = String(fecha.getMonth() + 1).padStart(2, '0');
            const dd = String(fecha.getDate()).padStart(2, '0');
            document.getElementById("fecha").value = `${yyyy}-${mm}-${dd}`;

            cargarClientesSelect();
            cargarArticulosSelect();

            new bootstrap.Modal(document.getElementById("editarModal")).show();
        });
}

// Guardar cambios
function guardarCambios() {
    const id = document.getElementById("idVenta").value;

    const ventaActualizada = {
        id_cliente: parseInt(document.getElementById("cliente").value),
        id_articulo: parseInt(document.getElementById("articulo").value),
        Unidades: parseInt(document.getElementById("unidades").value),
        total: parseFloat(document.getElementById("total").value),
        fecha: document.getElementById("fecha").value
    };

    fetch(`http://127.0.0.1:8000/api/ventas/${id}`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(ventaActualizada)
    })
    .then(response => {
        if (response.ok) {
            alert("Venta actualizada correctamente.");
            cargarVentas();
            bootstrap.Modal.getInstance(document.getElementById("editarModal")).hide();
        } else {
            alert("Error al actualizar la venta.");
        }
    })
    .catch(error => console.error("Error al guardar los cambios:", error));
}

function cargarClientesSelect() {
    fetch("http://127.0.0.1:8000/api/clientes")
        .then(res => res.json())
        .then(clientes => {
            const select = document.getElementById("cliente");
            select.innerHTML = "";
            clientes.forEach(cliente => {
                const option = document.createElement("option");
                option.value = cliente.id;
                option.text = `${cliente.nombre} ${cliente.apellido1} ${cliente.apellido2}`;
                select.appendChild(option);
            });
        });
}

// Cargar select de artículos
function cargarArticulosSelect() {
    fetch("http://127.0.0.1:8000/api/articulos")
        .then(res => res.json())
        .then(articulos => {
            const select = document.getElementById("articulo");
            select.innerHTML = "";
            articulos.forEach(articulo => {
                const option = document.createElement("option");
                option.value = articulo.id;
                option.text = articulo.nombre;
                select.appendChild(option);
            });
        });
}