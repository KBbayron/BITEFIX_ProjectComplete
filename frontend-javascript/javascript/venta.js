document.getElementById("btnIngresarVenta").addEventListener("click", function () {
    const id_cliente = parseInt(document.getElementById("ventaCliente").value);
    const id_articulo = parseInt(document.getElementById("ventaArticulo").value);
    const Unidades = parseInt(document.getElementById("ventaUnidades").value);
    const total = parseFloat(document.getElementById("ventaTotal").value);

    const data = {
        id_cliente,
        id_articulo,
        Unidades,
        total
    };
    console.log(data);

    fetch("http://127.0.0.1:8000/api/ventas", { // ← Cambiá esto si tu endpoint es diferente
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
    })
    .then(response => {
        if (!response.ok) throw new Error("Error en la solicitud");
        return response.json();
    })
    .then(result => {
        alert("Venta ingresada con éxito");
        console.log(result);
    })
    .catch(error => {
        console.error("Error:", error);
        alert("Ocurrió un error al ingresar la venta.");
    });
});