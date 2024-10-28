<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Solicitar Datos Facultad</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f0f0f0;
            font-family: 'Arial', sans-serif;
        }
        .container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
        }
        h2 {
            color: #FC8B0B;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
        }
        .btn-primary {
            background-color: #FC8B0B;
            border: none;
        }
        .btn-primary:hover {
            background-color: #e07a0b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Registrar Nueva Facultad</h2>
        <form action="RegistrarFacultad" method="post" class="mb-4">
            <div class="form-group">
                <label for="nombre">Nombre de la Facultad:</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Registrar</button>
        </form>
        <div class="mt-3 text-center">
            <a href="./index.jsp" class="btn btn-secondary">Volver</a>
        </div>
    </div>
</body>
</html>
