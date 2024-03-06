package br.com.fiap.ODS3.DTO;

import br.com.fiap.ODS3.Entities.Indicadores;



public record DtoIndicadoresOds3(

        String id,

        String descricao

) {

    public DtoIndicadoresOds3(Indicadores indicador) {
        this(indicador.getId(), indicador.getDescricao());
    }

}
