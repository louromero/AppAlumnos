<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Alumnos por Docente</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f0f0f0;
        }
        h2 {
            color: #FC8B0B;
            font-weight: bold;
            margin-top: 20px;
            text-align: center;
        }
        form {
            max-width: 500px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        form input[type="text"] {
            border: 1px solid #FC8B0B;
        }
        form button {
            background-color: #FC8B0B;
            border: none;
        }
        form button:hover {
            background-color: #e07a0b;
        }
        h3 {
            color: #333;
            margin-top: 20px;
        }
        hr {
            border-top: 2px solid #FC8B0B;
            width: 60%;
            margin: auto;
            margin-bottom: 20px;
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
        .no-data {
            text-align: center;
            color: red;
            font-weight: bold;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Consultar Materias y Alumnos por Docente</h2>
        <hr>
        <form action="SolicitarDatosDocente" method="post" class="mb-4">
            <input type="text" name="docenteId" placeholder="Ingrese ID de docente" class="form-control" required>
            <button type="submit" class="btn btn-primary mt-2">Buscar</button>
        </form>

        <c:if test="${not empty alumnosDocente}">
            <h3 class="text-center">Resultados para el Docente: ${docenteNombre}</h3>
            <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Materia</th>
                        <th>Alumno</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="fila" items="${alumnosDocente}">
                        <tr>
                            <td>${fila[0]}</td> <!-- Materia -->
                            <td>${fila[1]}</td> <!-- Alumno -->
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        
        <c:if test="${empty alumnosDocente}">
            <p class="no-data">No se encontraron alumnos para este docente.</p>
        </c:if>
        
        <c:if test="${not empty error}">
            <p class="no-data">${error}</p>
        </c:if>
    </div>
</body>
</html>
