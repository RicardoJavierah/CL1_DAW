package pe.edu.cibertec.CL1DAWII.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.edu.cibertec.CL1DAWII.model.Games;

@Repository
public interface GamesRepository extends JpaRepository<Games, Long> {
}
