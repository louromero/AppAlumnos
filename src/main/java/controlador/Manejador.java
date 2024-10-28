package controlador;

import entidad.Alumno;
import entidad.AlumnoHasMateria;
import entidad.Carrera;
import entidad.Facultad;
import entidad.Materia;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import session.AlumnoFacade;
import session.AlumnoHasMateriaFacade;
import session.CarreraFacade;
import session.DocenteFacade;
import session.FacultadFacade;
import session.MateriaFacade;

@WebServlet(name = "Manejador",
        loadOnStartup = 1,
        urlPatterns = {
            "/SolicitarDatosAlumno",
            "/AgregarAlumno",
            "/Listar",
            "/ListarCarrera",
            "/ListarMaterias",
            "/ListarDocentes",
            "/ListarAlumnosMaterias",
            "/SolicitarDatosCarrera",
            "/RegistrarCarrera",
            "/SolicitarDatosMateria",
            "/RegistrarMateria",
            "/SolicitarDatosFacultad",
            "/RegistrarFacultad",
            "/SolicitarDatos",
            "/Facultad",
            "/SolicitarDatosDocente"
        }
)
public class Manejador extends HttpServlet {

    @EJB
    private AlumnoFacade alumnoF;
    @EJB
    private CarreraFacade carreraF;
    @EJB
    private MateriaFacade materiaF;
    @EJB
    private FacultadFacade facultadF;
    @EJB
    private AlumnoHasMateriaFacade materiaAlumnoF;
    @EJB
    private DocenteFacade docenteF;

    @Override
    public void init() throws ServletException {
        // Almacena la lista de facultades en el contexto del Servlet
        getServletContext().setAttribute("facultades", facultadF.findAll());
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = null; // Inicia la variable url
        String pathUsuario = request.getServletPath();
        System.out.println("path = " + pathUsuario);

        try {
            switch (pathUsuario) {
                case "/SolicitarDatosAlumno":
                    request.setAttribute("listaCarreras", carreraF.findAll());
                    url = "/WEB-INF/vista/" + pathUsuario + ".jsp";
                    break;

                case "/AgregarAlumno":
                    try {
                        int registro = Integer.parseInt(request.getParameter("registro"));
                        String nombre = request.getParameter("nombre");
                        int carreraId = Integer.parseInt(request.getParameter("carrera"));

                        Alumno a = new Alumno();
                        a.setRegistro(registro);
                        a.setNombre(nombre);

                        Carrera carreraEntidad = carreraF.find(carreraId);
                        a.setCarreraIdcarrera(carreraEntidad);

                        alumnoF.create(a);
                        url = "index.jsp";
                    } catch (NumberFormatException e) {
                        Logger.getLogger(Manejador.class.getName()).log(Level.SEVERE, "Error al agregar alumno: parámetros incorrectos", e);
                        request.setAttribute("error", "Datos incorrectos para registrar alumno.");
                        url = "/WEB-INF/vista/error.jsp";
                    }
                    break;

                case "/Listar":
                    request.setAttribute("lista", alumnoF.findAll());
                    url = "/WEB-INF/vista/" + pathUsuario + ".jsp";
                    break;

                case "/ListarCarrera":
                    request.setAttribute("carreras", carreraF.findAll());
                    url = "/WEB-INF/vista/ListarCarrera.jsp";
                    break;

                case "/ListarMaterias":
                    request.setAttribute("materias", materiaF.findAll());
                    url = "/WEB-INF/vista/ListarMaterias.jsp";
                    break;

                case "/ListarDocentes":
                    request.setAttribute("docentes", docenteF.findAll());
                    url = "/WEB-INF/vista/ListarDocentes.jsp";
                    break;

                case "/ListarAlumnosMaterias":
                    List<AlumnoHasMateria> alumnosConMaterias = materiaAlumnoF.findAlumnosConMaterias();
                    System.out.println("Datos de alumnos con materias: " + alumnosConMaterias);
                    request.setAttribute("alumnosMaterias", alumnosConMaterias);
                    url = "/WEB-INF/vista/ListarAlumnosMaterias.jsp";
                    break;

                case "/SolicitarDatosCarrera":
                    request.setAttribute("listaFacultades", facultadF.findAll());
                    url = "/WEB-INF/vista/" + pathUsuario + ".jsp";
                    break;

                case "/RegistrarCarrera":
                    try {
                        String nombreC = request.getParameter("nombre");
                        int facultadId = Integer.parseInt(request.getParameter("facultad"));

                        Facultad fac = facultadF.find(facultadId);
                        Carrera c = new Carrera();
                        c.setNombre(nombreC);
                        c.setFacultadIdfacultad(fac);

                        carreraF.create(c);
                        url = "index.jsp";
                    } catch (NumberFormatException e) {
                        Logger.getLogger(Manejador.class.getName()).log(Level.SEVERE, "Error al registrar carrera", e);
                        request.setAttribute("error", "Datos incorrectos para registrar carrera.");
                        url = "/WEB-INF/vista/error.jsp";
                    }
                    break;

                case "/SolicitarDatosMateria":
                    url = "/WEB-INF/vista/" + pathUsuario + ".jsp";
                    break;

                case "/RegistrarMateria":
                    String nombreM = request.getParameter("nombre");
                    Materia m = new Materia();
                    m.setNombre(nombreM);
                    materiaF.create(m);
                    url = "index.jsp";
                    break;

                case "/SolicitarDatosFacultad":
                    url = "/WEB-INF/vista/" + pathUsuario + ".jsp";
                    break;

                case "/RegistrarFacultad":
                    String nombreF = request.getParameter("nombre");
                    Facultad f = new Facultad();
                    f.setNombre(nombreF);
                    facultadF.create(f);
                    url = "index.jsp";
                    break;

                case "/SolicitarDatos":
                    try {
                        int numeroRegistro = Integer.parseInt(request.getParameter("numeroRegistro"));
                        List<AlumnoHasMateria> materiasAlumno = materiaAlumnoF.findMateriasByRegistro(numeroRegistro);

                        if (materiasAlumno != null && !materiasAlumno.isEmpty()) {
                            request.setAttribute("materias", materiasAlumno);
                        } else {
                            request.setAttribute("error", "No se encontraron materias para el registro.");
                        }
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "El número de registro debe ser numérico.");
                    }
                    url = "/WEB-INF/vista/SolicitarDatos.jsp";
                    break;

                case "/Facultad":
                    try {
                        int facultadId = Integer.parseInt(request.getParameter("facultadId"));
                        Facultad miFacu = facultadF.find(facultadId);
                        Collection<Carrera> listaCarreras = miFacu.getCarreraCollection();
                        getServletContext().setAttribute("facultad", miFacu);
                        getServletContext().setAttribute("listaCarreras", listaCarreras);
                        url = "/WEB-INF/vista/ListarFacuCarre.jsp";
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "El ID de la facultad no es válido.");
                        url = "/WEB-INF/vista/error.jsp";
                    }
                    break;

                case "/SolicitarDatosDocente":
                    try {
                        int docenteId = Integer.parseInt(request.getParameter("docenteId"));

                        // Obtener la lista de materias y alumnos por docente
                        List<Object[]> resultado = docenteF.getMateriasYAlumnosPorDocente(docenteId);

                        if (resultado != null && !resultado.isEmpty()) {
                            request.setAttribute("alumnosDocente", resultado);

                            // Obtener el nombre del docente del primer resultado
                            String nombreDocente = (String) resultado.get(0)[0]; // El nombre está en la primera posición
                            request.setAttribute("docenteNombre", nombreDocente);
                        } else {
                            request.setAttribute("error", "No se encontraron alumnos para el docente.");
                        }
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "El ID del docente debe ser numérico.");
                    }
                    url = "/WEB-INF/vista/SolicitarDatosDocente.jsp";
                    break;

            }

            request.getRequestDispatcher(url).forward(request, response);

        } catch (Exception e) {
            Logger.getLogger(Manejador.class.getName()).log(Level.SEVERE, "Error en processRequest", e);
            request.setAttribute("error", "Ha ocurrido un error inesperado.");
            request.getRequestDispatcher("/WEB-INF/vista/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Manejador servlet for various actions";
    }
}
