package cl.aduana.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cl.aduana.entities.Categoria;
import cl.aduana.model.ServicioLocal;


/**
 * Servlet implementation class Controller
 */
@WebServlet(name = "control.do", urlPatterns = { "/control.do" })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ServicioLocal servicioLocal;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }
    
protected void inicio(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	String boton = request.getParameter("boton");
		
		switch (boton){
			case "insertar":
				
				this.insertar(request, response);
				
				break;
				
			default:
				
				break;
		}
	}
    
    protected void insertar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		Integer estado = Integer.valueOf(request.getParameter("estado"));
		
		Categoria cat = new Categoria();
		/*cat.setCodigocategoria(0L);*/
		cat.setNombre(nombre);
		cat.setDescripcion(descripcion);
		cat.setEstado(estado);
		servicioLocal.insertar(cat);
		
		response.sendRedirect("index.jsp");
		
	}
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.inicio(request, response);
	}

}
