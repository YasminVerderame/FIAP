package br.fiap.controle;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.fiap.Util.Util;
import br.fiap.classedao.HistoricoVooDAO;
import br.fiap.modelos.HistoricoVooModel;


/**
 * Servlet implementation class HistoricoVooServlet
 */
@WebServlet(name = "HistoricoVoo", urlPatterns = { "/HistoricoVoo" })
public class HistoricoVooServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoricoVooServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Util util = new Util();
		HistoricoVooModel histvoo = new HistoricoVooModel();
		
		histvoo.setIdDrone(Integer.parseInt(request.getParameter("idDrone")));
		histvoo.setLatitudeInicioVoo(request.getParameter("latitudeInicio"));
		histvoo.setLatitudeFimVoo(request.getParameter("latitudeFim"));
		histvoo.setLongitudeInicioVoo(request.getParameter("longitudeInicio"));
		histvoo.setLongitudeFimVoo(request.getParameter("longituteFim"));
		histvoo.setAltitudeMedia(request.getParameter("altitudeMedia"));
		histvoo.setVelocidadeMedia(request.getParameter("velocidadeMedia"));
		LocalDate dataDecolagem = util.formatarData(request.getParameter("dataDecolagem"));
		LocalDate dataAterrissagem = util.formatarData(request.getParameter("dataAterrissagem"));
		histvoo.setDataDecolagem(dataDecolagem);
		histvoo.setDataAterrissagem(dataAterrissagem);
		System.out.println("funfou");
		
		HistoricoVooDAO dao = new HistoricoVooDAO();
		dao.inserir(histvoo);
		
		response.setStatus(HttpServletResponse.SC_OK);
	}

}
