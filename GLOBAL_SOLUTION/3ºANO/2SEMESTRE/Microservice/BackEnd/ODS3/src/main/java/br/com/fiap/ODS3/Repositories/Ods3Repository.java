package br.com.fiap.ODS3.Repositories;

import br.com.fiap.ODS3.Entities.ODS3;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface Ods3Repository extends JpaRepository<ODS3,String> {

}
