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
 * Servlet implementation class Loginservelet
 */
@WebServlet(name = "Login", urlPatterns = { "/Login" })
public class Loginservelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Loginservelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
			
		UsuarioDAO dao = new UsuarioDAO();
		UsuarioModel u;
		
		String idUsuario = request.getParameter("idLogin");
		String senha =request.getParameter("senha");
		u = dao.pesquisar(idUsuario, senha);
	
		if(u.getCargo().equals("administrador")) {		
			RequestDispatcher dispatcher = request.getRequestDispatcher("navegacao.jsp");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp?");
			dispatcher.forward(request, response);
		}
			
		
		
		
		
		
	}

}
