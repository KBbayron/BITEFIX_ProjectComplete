document.addEventListener("DOMContentLoaded", obtenerArticulos);

function obtenerArticulos() {
    fetch("http://127.0.0.1:8000/api/inventario")
        .then(res => res.json())
        .then(data => {
            const tabla = document.getElementById("tablaArticulos");
            tabla.innerHTML = "";
            data.forEach(articulo => {
                tabla.innerHTML += `
                    <tr>
                        <td>${articulo.nombre}</td>
                        <td>${articulo.descripcion}</td>
                        <td>${articulo.precio}</td>
                        <td>${articulo.MARCA}</td>
                        <td>${articulo.MODELO}</td>
                        <td>${articulo.in_stock}</td>
                        <td class="d-flex align-items-center justify-content-center">
                            <button class="btn btn-sm btn-warning me-1" onclick="editarArticulo(${articulo.id})">Editar</button>
                            <button class="btn btn-sm btn-danger" onclick="eliminarArticulo(${articulo.id})">Eliminar</button>
                        </td>
                    </tr>`;
            });
        });
}

function editarArticulo(id) {
    fetch(`http://127.0.0.1:8000/api/inventario/${id}`)
        .then(res => res.json())
        .then(articulo => {
            document.getElementById("editarId").value = articulo.id;
            document.getElementById("editarNombre").value = articulo.nombre;
            document.getElementById("editarDescripcion").value = articulo.descripcion;
            document.getElementById("editarPrecio").value = articulo.precio;
            document.getElementById("editarMarca").value = articulo.MARCA;
            document.getElementById("editarModelo").value = articulo.MODELO;
            document.getElementById("editarStock").value = articulo.in_stock;

            const modal = new bootstrap.Modal(document.getElementById("modalEditar"));
            modal.show();
        });
}

function guardarEdicion() {
    const id = document.getElementById("editarId").value;

    const data = {
        nombre: document.getElementById("editarNombre").value,
        descripcion: document.getElementById("editarDescripcion").value,
        precio: parseFloat(document.getElementById("editarPrecio").value),
        MARCA: document.getElementById("editarMarca").value,
        MODELO: document.getElementById("editarModelo").value,
        in_stock: parseInt(document.getElementById("editarStock").value)
    };

    fetch(`http://127.0.0.1:8000/api/inventario/${id}`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
    })
    .then(res => {
        if (!res.ok) throw new Error("Error al actualizar");
        return res.json();
    })
    .then(() => {
        alert("Artículo actualizado correctamente");
        obtenerArticulos();
        bootstrap.Modal.getInstance(document.getElementById("modalEditar")).hide();
    })
    .catch(err => {
        console.error(err);
        alert("Error al guardar cambios");
    });
}

function eliminarArticulo(id) {
    if (!confirm("¿Estás seguro de eliminar este artículo?")) return;

    fetch(`http://127.0.0.1:8000/api/inventario/${id}`, {
        method: "DELETE"
    })
    .then(res => {
        if (!res.ok) throw new Error("Error al eliminar");
        return res.json();
    })
    .then(() => {
        alert("Artículo eliminado correctamente");
        obtenerArticulos();
    })
    .catch(err => {
        console.error(err);
        alert("Error al eliminar el artículo");
    });
}
