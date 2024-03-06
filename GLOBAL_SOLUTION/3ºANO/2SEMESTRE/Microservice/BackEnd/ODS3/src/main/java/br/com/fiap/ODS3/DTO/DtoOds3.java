package br.com.fiap.ODS3.DTO;

import br.com.fiap.ODS3.Entities.Indicadores;
import br.com.fiap.ODS3.Entities.ODS3;
import br.com.fiap.ODS3.Entities.Objetivos;

import java.util.List;
import java.util.stream.Collectors;

public record DtoOds3(

        String id,
        Objetivos objetivos,
        List<DtoIndicadoresOds3> indicadores

) {

    public DtoOds3(ODS3 ods3) {
        this(ods3.getId(), ods3.getObjetivo(), mapIndicadoresToDto(ods3.getIndicadores()));
    }

    private static List<DtoIndicadoresOds3> mapIndicadoresToDto(List<Indicadores> indicadores) {
        return indicadores.stream()
                .map(DtoIndicadoresOds3::new)
                .collect(Collectors.toList());
    }




}
