package br.com.fiap.ODS3.Entities;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;


@Table(name = "Indicadores")
@Entity(name ="Indicadores")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")

public class Indicadores {
    @Column(insertable=false, updatable=false)
    @Id
    private String id;
    @ManyToOne
    @JoinColumn(name = "ods3_id")
    private ODS3 ods3;
    private String descricao;
    @OneToMany(mappedBy = "indicadores", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Regiao> regiao;


}
