<%@page import="br.fiap.classedao.DroneDAO"%>
<%@page import="br.fiap.modelos.DroneModelo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listagem de Drones</title>
<link rel="stylesheet" type="text/css" href="listagemDrones.css"/>
</head>
<body>
	<% List<DroneModelo> lista = new DroneDAO().listar(); %>

<div class="main">
	<h1>Listagem de Drones</h1>
	<table >
		<thead>
			<tr>
				<th>ID do drone</th>
				<th>Modelo</th>
				<th>Número de série</th>
				<th>Data de compra</th>
				<th>Capacidade de bateria</th>
				<th>Capacidade de carga da bateria</th>
				<th>Licença de voo</th>
			</tr>
		</thead>
		<tbody>
			<%for(DroneModelo drone : lista) { %>
			<tr>
				<td><%= drone.getId()%></td>
				<td><%=drone.getModelo()%></td>
				<td><%=drone.getNumeroSerie() %></td>
				<td><%=drone.getDataCompra()%></td>
				<td><%=drone.getCapacidadeBateria() %></td>
				<td><%=drone.getCapacidadeCarga() %></td>
				<td><a href="cadastroLicencaVoo.jsp?drone_id=<%=drone.getId()%>" style="text-decoration: none">
						<button id="botaoAlterar" type="submit">Adicionar licença</button>
					</a>
				</td>
				</tr>
			<% } %>
		</tbody>
	</table>
	 <a href="navegacao.jsp" ><button class="button back" type="button">Voltar</button></a>

</div>
	
</body>
</html>