package br.com.fiap.ODS3.DTO;

import br.com.fiap.ODS3.Entities.Regiao;


public record DtoRegiao(

        long id_regiao,
        String nomeRegiao,

        String consumo,

        String ano

) {

    public DtoRegiao(Regiao regiao){
       this(regiao.getId_regiao(),regiao.getRegiao(), regiao.getConsumo(), regiao.getAno());
    }

}
