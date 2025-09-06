document.getElementById("btnIngresarCliente").addEventListener("click", function () {
    const nombre = document.getElementById("clienteNombre").value;
    const apellido1 = document.getElementById("clienteApellido1").value;
    const apellido2 = document.getElementById("clienteApellido2").value;
    const telefono = document.getElementById("clienteTelefono").value;
    const email = document.getElementById("clienteEmail").value;

    const data = {
        nombre,
        apellido1,
        apellido2,
        telefono,
        email
    };

    fetch("http://127.0.0.1:8000/api/clientes", { // <-- Asegúrate que esta sea tu ruta real
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
        alert("Cliente ingresado con éxito");
        console.log(result);
    })
    .catch(error => {
        console.error("Error:", error);
        alert("Ocurrió un error al enviar los datos.");
    });
});