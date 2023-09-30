package pe.edu.cibertec.CL1DAWII.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pe.edu.cibertec.CL1DAWII.model.Consoles;
import pe.edu.cibertec.CL1DAWII.repository.ConsolesRepository;

import java.io.Console;
import java.util.List;
@Service
public class ConsolesService {
    @Autowired
    private ConsolesRepository consolesRepository;

    public List<Consoles> listarConsolas(){
        return consolesRepository.findAll();
    }

    public void registrarConsola(Consoles consola) {
        consolesRepository.save(consola);
    }

    public void eliminarConsola(Long id_console) {
        consolesRepository.deleteById(id_console);
    }
}
