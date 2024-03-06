<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro</title>
<link rel="stylesheet" type="text/css" href="cadastroUsuario.css"/>
</head>
<body>
	
	
	<div class="main">
		<div class="form-cadastro">
			<form method="post" action="Usuario">
				<h1>Faça seu cadastro!</h1>
	
				<label>Cargo</label> 
					<select name="cargo">
						<option value="" disabled="disabled" selected>Selecione o cargo</option>							
						<option value="administrador">Administrador</option>
						<option value="usuario">Usuário</option>
					</select>
	
					<p>
						<label for="senha">Senha</label> 
						<input id="senha" name="senha" required="required" type="password" placeholder="senha" />
					</p>

					<div class="buttons">	
	        			 <a href="index.jsp" ><button class="button back" type="button">Voltar</button></a>
	        			 <p>
							<input  type="submit" value="Cadastrar" class="button" />
						</p>
					</div>
			</form>
		</div>
	</div>
	

</body>
</html>