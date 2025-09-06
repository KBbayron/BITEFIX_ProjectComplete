document.getElementById("btnIngresar").addEventListener("click", function () {
    const nombre = document.getElementById("nombre").value;
    const marca = document.getElementById("marca").value;
    const modelo = document.getElementById("modelo").value;
    const precio = parseFloat(document.getElementById("precio").value);
    const in_stock = parseInt(document.getElementById("stock").value);
    const descripcion = document.getElementById("descripcion").value;

    const data = {
        nombre,
        descripcion,
        MARCA: marca,
        MODELO: modelo,
        precio,
        in_stock
    };

    fetch("http://127.0.0.1:8000/api/inventario", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error("Error en la solicitud");
        }
        return response.json();
    })
    .then(result => {
        alert("Artículo ingresado con éxito");
        console.log(result);
    })
    .catch(error => {
        console.error("Error:", error);
        alert("Ocurrió un error al enviar los datos.");
    });
});