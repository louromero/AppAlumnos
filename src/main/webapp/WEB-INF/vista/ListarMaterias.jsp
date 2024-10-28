<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listar Docentes</title>
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
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Listado de Docentes</h1>
        <hr>
        <table class="table table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>ID Docente</th>
                    <th>Nombre</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="docente" items="${requestScope.docentes}">
                    <tr>
                        <td>${docente.idmateria}</td>
                        <td>${docente.nombre}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>

