package br.fiap.controle;

import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.fiap.Util.Util;
import br.fiap.classedao.DroneDAO;
import br.fiap.classedao.LicencaVooDAO;
import br.fiap.modelos.LicencaVooModel;

/**
 * Servlet implementation class CadastroLicensaVooServlet
 */
@WebServlet(name = "CadastroLicencaVoo", urlPatterns = { "/CadastroLicencaVoo" })
public class CadastroLicensaVooServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastroLicensaVooServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Util util = new Util();
		LicencaVooDAO dao = new LicencaVooDAO();
		LicencaVooModel licencaVoo = new LicencaVooModel();
		DroneDAO droneDao= new DroneDAO();
		LocalDate dataEmissao = util.formatarData(request.getParameter("dataDeValidade"));
		LocalDate dataValidade = util.formatarData(request.getParameter("dataDeEmissao"));
		Integer idDrone = Integer.parseInt(request.getParameter("idDrone")); 
		
		
			licencaVoo.setIdDrone(droneDao.pesquisar(idDrone));
		licencaVoo.setLicencaVoo(request.getParameter("licencaVoo"));
		licencaVoo.setDataEmissao(dataEmissao);
		licencaVoo.setDataValidade(dataValidade);
		
		if(dataEmissao.compareTo(dataValidade)== 1) {
		dao.inserir(licencaVoo);	
		RequestDispatcher dispatcher = request.getRequestDispatcher("navegacao.jsp");
		dispatcher.forward(request, response);
		}else {
			System.out.println("data invalida");
		}
		
		
		
	
	}

}
