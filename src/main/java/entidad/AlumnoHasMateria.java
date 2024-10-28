/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidad;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author lulur
 */
@Entity
@Table(name = "alumno_has_materia", catalog = "bdalumnos", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AlumnoHasMateria.findAll", query = "SELECT a FROM AlumnoHasMateria a"),
    @NamedQuery(name = "AlumnoHasMateria.findByAlumnoIdalumno", query = "SELECT a FROM AlumnoHasMateria a WHERE a.alumnoHasMateriaPK.alumnoIdalumno = :alumnoIdalumno"),
    @NamedQuery(name = "AlumnoHasMateria.findByMateriaIdmateria", query = "SELECT a FROM AlumnoHasMateria a WHERE a.alumnoHasMateriaPK.materiaIdmateria = :materiaIdmateria"),
    @NamedQuery(name = "AlumnoHasMateria.findByFecha", query = "SELECT a FROM AlumnoHasMateria a WHERE a.alumnoHasMateriaPK.fecha = :fecha"),
    @NamedQuery(name = "AlumnoHasMateria.findByNota", query = "SELECT a FROM AlumnoHasMateria a WHERE a.nota = :nota")})
public class AlumnoHasMateria implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected AlumnoHasMateriaPK alumnoHasMateriaPK;
    @Column(name = "nota")
    private Integer nota;
    @JoinColumn(name = "alumno_idalumno", referencedColumnName = "idalumno", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Alumno alumno;
    @JoinColumn(name = "materia_idmateria", referencedColumnName = "idmateria", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Materia materia;

    public AlumnoHasMateria() {
    }

    public AlumnoHasMateria(AlumnoHasMateriaPK alumnoHasMateriaPK) {
        this.alumnoHasMateriaPK = alumnoHasMateriaPK;
    }

    public AlumnoHasMateria(int alumnoIdalumno, int materiaIdmateria, Date fecha) {
        this.alumnoHasMateriaPK = new AlumnoHasMateriaPK(alumnoIdalumno, materiaIdmateria, fecha);
    }

    public AlumnoHasMateriaPK getAlumnoHasMateriaPK() {
        return alumnoHasMateriaPK;
    }

    public void setAlumnoHasMateriaPK(AlumnoHasMateriaPK alumnoHasMateriaPK) {
        this.alumnoHasMateriaPK = alumnoHasMateriaPK;
    }

    public Integer getNota() {
        return nota;
    }

    public void setNota(Integer nota) {
        this.nota = nota;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

    public Materia getMateria() {
        return materia;
    }

    public void setMateria(Materia materia) {
        this.materia = materia;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (alumnoHasMateriaPK != null ? alumnoHasMateriaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AlumnoHasMateria)) {
            return false;
        }
        AlumnoHasMateria other = (AlumnoHasMateria) object;
        if ((this.alumnoHasMateriaPK == null && other.alumnoHasMateriaPK != null) || (this.alumnoHasMateriaPK != null && !this.alumnoHasMateriaPK.equals(other.alumnoHasMateriaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entidad.AlumnoHasMateria[ alumnoHasMateriaPK=" + alumnoHasMateriaPK + " ]";
    }
    
}
