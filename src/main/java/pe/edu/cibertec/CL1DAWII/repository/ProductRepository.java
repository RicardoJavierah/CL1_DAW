package pe.edu.cibertec.CL1DAWII.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pe.edu.cibertec.CL1DAWII.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

}
