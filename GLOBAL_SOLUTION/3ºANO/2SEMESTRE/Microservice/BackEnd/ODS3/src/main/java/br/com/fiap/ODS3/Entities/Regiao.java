package br.com.fiap.ODS3.Entities;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Table(name = "Regiao")
@Entity
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class Regiao {

    @Column(insertable=false, updatable=false)
    @Id
    private long id_regiao;
    @ManyToOne
    @JoinColumn(name = "idIndicadores")
    private Indicadores indicadores;

    private String regiao;
    private String consumo;
    private String ano;



}
