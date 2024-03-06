package br.fiap.controle;

import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.Integer;
import br.fiap.Util.Util;
import br.fiap.classedao.TelemetriaDAO;
import br.fiap.modelos.TelemetriaModel;

/**
 * Servlet implementation class CadastroDroneServlet
 */
@WebServlet(name = "Telemetria", urlPatterns = { "/Telemetria" })
public class TelemetriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TelemetriaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Util util = new Util();
		TelemetriaModel telemetria = new TelemetriaModel();
	System.out.println(request.getParameter("idDrone"));
		telemetria.setIdDrone(Integer.parseInt(request.getParameter("idDrone")));
		telemetria.setLatitude(request.getParameter("latitude"));
		telemetria.setLongitude(request.getParameter("longitude"));
		telemetria.setVelocidade(request.getParameter("velocidade"));
		telemetria.setDirecao(request.getParameter("direcao"));
		LocalDate dataHora = util.formatarData(request.getParameter("dataCompra"));
		telemetria.setDataHora(dataHora);
		TelemetriaDAO dao = new TelemetriaDAO();
		dao.inserir(telemetria);
		System.out.println("funfou");
	
		response.setStatus(HttpServletResponse.SC_OK);
		
	}

}
