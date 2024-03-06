package br.com.fiap.ODS3.DTO;

import br.com.fiap.ODS3.Entities.Indicadores;
import br.com.fiap.ODS3.Entities.Regiao;

import java.util.List;
import java.util.stream.Collectors;


public record DtoIndicadores(

        String id,
        String descricao,
        List<DtoRegiao> regiao

) {


    public DtoIndicadores(Indicadores indicadores) {
        this(indicadores.getId(),indicadores.getDescricao() ,mapRegiaoToDto(indicadores.getRegiao()));
    }

    private static List<DtoRegiao> mapRegiaoToDto(List<Regiao> regiao) {
        return regiao.stream()
                .map(DtoRegiao::new)
                .collect(Collectors.toList());
    }

}
