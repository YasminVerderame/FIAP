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

import br.fiap.modelos.DroneModelo;

/**
 * Servlet implementation class CadastroDroneServlet
 */
@WebServlet(name = "CadastroDrone", urlPatterns = { "/CadastroDrone" })
public class CadastroDroneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastroDroneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Util util = new Util();
		DroneDAO dao = new DroneDAO();
		DroneModelo drone = new DroneModelo();
		LocalDate data = util.formatarData(request.getParameter("dataCompra"));
		
		drone.setModelo(request.getParameter("modelo"));
		drone.setDataCompra(data);
		drone.setCapacidadeBateria(request.getParameter("capacidadeBateria"));
		drone.setCapacidadeCarga(request.getParameter("capacidadeCarga"));
		drone.setNumeroSerie(request.getParameter("nSerie"));
		
		dao.inserir(drone);	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("listagemDrones.jsp");
		dispatcher.forward(request, response);
		
	}

}
