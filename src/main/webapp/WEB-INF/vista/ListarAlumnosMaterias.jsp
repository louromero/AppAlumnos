<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Alumnos con Materias</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f0f0f0;
        }
        h1 {
            color: #FC8B0B;
            font-weight: bold;
            margin-top: 20px;
        }
        hr {
            border-top: 3px solid #FC8B0B;
            width: 60%;
            margin: auto;
            margin-bottom: 30px;
        }
        table {
            margin-top: 20px;
            background-color: #fff;
        }
        thead.thead-dark th {
            background-color: #FC8B0B !important;
            color: white;
        }
        tbody tr:hover {
            background-color: #FFE5CC;
        }
        .table-bordered th, .table-bordered td {
            border: 1px solid #FC8B0B;
        }
        .text-danger {
            color: #FC8B0B !important;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Listado de Alumnos con Materias</h1>
        <hr>

        <!-- Verificación de que la lista no esté vacía -->
        <c:if test="${not empty requestScope.alumnosMaterias}">
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Registro Alumno</th>
                        <th>Nombre Alumno</th>
                        <th>Nombre Materia</th>
                        <th>Nota</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="relacion" items="${requestScope.alumnosMaterias}">
                        <tr>
                            <td>${relacion.alumno.registro}</td>
                            <td>${relacion.alumno.nombre}</td>
                            <td>${relacion.materia.nombre}</td>
                            <td>${relacion.nota}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        
        <!-- Mensaje en caso de que la lista esté vacía -->
        <c:if test="${empty requestScope.alumnosMaterias}">
            <p class="text-center text-danger">No se encontraron datos para mostrar.</p>
        </c:if>
    </div>
</body>
</html>
