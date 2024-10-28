<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Agregar Alumno</title>
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
        h1 {
            color: #FC8B0B;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-primary {
            background-color: #FC8B0B;
            border: none;
        }
        .btn-primary:hover {
            background-color: #e07a0b;
        }
        .btn-secondary {
            margin-right: 10px;
        }
        .mt-3 {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Nuevo Alumno</h1>
        <form action="AgregarAlumno" method="post">
            <div class="form-group">
                <label for="registro">Registro:</label>
                <input type="text" class="form-control" id="registro" name="registro" required>
            </div>
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>
            <div class="form-group">
                <label for="carrera">Carrera:</label>
                <select class="form-control" id="carrera" name="carrera" required>
                    <option value="">Seleccionar...</option>
                    <c:forEach var="carrera" items="${listaCarreras}">
                        <option value="${carrera.idcarrera}">${carrera.nombre}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Crear</button>
        </form>
        <div class="mt-3">
            <a href="javascript:window.history.back();" class="btn btn-secondary">&laquo; Volver atrás</a>
            <a href="./index.jsp" class="btn btn-secondary">Volver</a>
        </div>
    </div>
</body>
</html>
