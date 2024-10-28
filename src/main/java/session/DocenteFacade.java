/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package session;

import entidad.Docente;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import java.util.List;

/**
 *
 * @author lulur
 */
@Stateless
public class DocenteFacade extends AbstractFacade<Docente> {

    @PersistenceContext(unitName = "my_persistence_unit")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DocenteFacade() {
        super(Docente.class);
    }

    @Override
    public List<Docente> findAll() {
        // Este método debería devolver todos los docentes en la base de datos
        return em.createQuery("SELECT d FROM Docente d", Docente.class).getResultList();
    }

    public List<Object[]> getMateriasYAlumnosPorDocente(int docenteId) {
        String sql = "SELECT d.nombre AS docente, m.nombre AS materia, a.nombre AS alumno "
                + "FROM materia m "
                + "JOIN docente_has_materia md ON m.idmateria = md.materia_idmateria "
                + "JOIN docente d ON md.docente_iddocente = d.iddocente "
                + "JOIN alumno_has_materia ma ON m.idmateria = ma.materia_idmateria "
                + "JOIN alumno a ON ma.alumno_idalumno = a.idalumno "
                + "WHERE d.iddocente = " + docenteId;

        Query query = em.createNativeQuery(sql);
        return query.getResultList();
    }
}