package br.com.fiap.ODS3.DTO;

import br.com.fiap.ODS3.Entities.Indicadores;
import br.com.fiap.ODS3.Entities.ODS3;


import java.util.List;
import java.util.stream.Collectors;

public record DtoOds3ListaId(

        List<DtoIndicadores> indicadores

) {

    public DtoOds3ListaId(ODS3 ods3) {
        this(mapIndicadoresToDto(ods3.getIndicadores()));
    }

    private static List<DtoIndicadores> mapIndicadoresToDto(List<Indicadores> indicadores) {
        return indicadores.stream()
                .map(DtoIndicadores::new)
                .collect(Collectors.toList());
    }




}
