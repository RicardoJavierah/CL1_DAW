package pe.edu.cibertec.CL1DAWII.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.edu.cibertec.CL1DAWII.model.Consoles;

@Repository
public interface ConsolesRepository extends JpaRepository<Consoles, Long> {
}
