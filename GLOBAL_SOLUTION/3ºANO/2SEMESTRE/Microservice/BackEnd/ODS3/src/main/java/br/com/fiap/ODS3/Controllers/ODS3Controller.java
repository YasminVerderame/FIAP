package br.com.fiap.ODS3.Controllers;


import br.com.fiap.ODS3.DTO.DtoOds3;
import br.com.fiap.ODS3.DTO.DtoOds3ListaId;
import br.com.fiap.ODS3.Entities.ODS3;
import br.com.fiap.ODS3.Repositories.Ods3Repository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = "http://localhost:32768")
@RestController
@RequestMapping("/ODS3")
public class ODS3Controller {

    @Autowired
    private Ods3Repository repository;


    @GetMapping("/listarODS3")
    public Page<DtoOds3> listarOds3(Pageable paginacao){

        return repository.findAll(paginacao).map(DtoOds3:: new);

    }

    @GetMapping("/listarId/{id}")
    public DtoOds3ListaId listarPorId(@PathVariable String id) {
        ODS3 ods3 = repository.getReferenceById(id);

        if (ods3 != null) {
            return new DtoOds3ListaId(ods3);
        } else {
            throw new EntityNotFoundException("ODS3 not found with id: " + id);
        }
    }


}
