package br.fiap.controle;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import br.fiap.classedao.UsuarioDAO;

import br.fiap.modelos.UsuarioModel;

/**
 * Servlet implementation class UsuarioServelet
 */
@WebServlet(name = "Usuario", urlPatterns = { "/Usuario" })
public class UsuarioServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsuarioServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		UsuarioDAO dao = new UsuarioDAO();
		String senha =	request.getParameter("senha");
		String cargo =	request.getParameter("cargo");
		UsuarioModel u = new UsuarioModel(senha,cargo);
	
		dao.inserir(u);	
		System.out.println(u.getId());
		
		
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp?usuarioid="+u.getId());
		dispatcher.forward(request, response);
		
		
		
	}

}
