/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package session;

import entidad.Alumno;
import entidad.AlumnoHasMateria;
import entidad.Materia;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import java.util.List;

/**
 *
 * @author lulur
 */
@Stateless
public class AlumnoHasMateriaFacade extends AbstractFacade<AlumnoHasMateria> {

    @PersistenceContext(unitName = "my_persistence_unit")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AlumnoHasMateriaFacade() {
        super(AlumnoHasMateria.class);
    }
    
    public List<AlumnoHasMateria> findAlumnosConMaterias() {
        // Consulta para obtener la relación entre alumno y materia
        TypedQuery<AlumnoHasMateria> query = em.createQuery(
                "SELECT m FROM AlumnoHasMateria m JOIN FETCH m.alumno a JOIN FETCH m.materia",
                AlumnoHasMateria.class
        );
        return query.getResultList();
    }

    public List<AlumnoHasMateria> findMateriasByRegistro(int registro) {
        TypedQuery<AlumnoHasMateria> query = em.createQuery(
                "SELECT m FROM AlumnoHasMateria m JOIN FETCH m.alumno a JOIN FETCH m.materia WHERE a.registro = :registro",
                AlumnoHasMateria.class
        );
        query.setParameter("registro", registro);
        return query.getResultList();
    }

    public List<Alumno> findAlumnosByMateria(Materia materia) {
        return em.createQuery("SELECT m.alumno FROM AlumnoHasMateria m WHERE m.materia = :materia", Alumno.class)
                .setParameter("materia", materia)
                .getResultList();
    }
    
}
