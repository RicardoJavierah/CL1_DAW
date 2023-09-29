package pe.edu.cibertec.CL1DAWII.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.Set;

@Entity
@Table(name="product_category")
@Getter
@Setter
public class ProductCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name="category_name")
    private String category_name;



    @OneToMany(cascade = CascadeType.ALL, mappedBy = "category")
    private Set<Product> products;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "category")
    private Set<Accesories> accesories;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "category")
    private Set<Consoles> consoles;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "category")
    private Set<Games> games;
}