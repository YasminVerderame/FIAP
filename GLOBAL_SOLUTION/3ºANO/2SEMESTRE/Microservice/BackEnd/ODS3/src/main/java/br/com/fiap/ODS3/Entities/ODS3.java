package br.com.fiap.ODS3.Entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

@Table(name = "ODS3")
@Entity(name ="ODS3")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of = "id")
public class ODS3 {

    @Id
    @Column(insertable=false, updatable=false)
    private String id;
    @OneToMany(mappedBy = "ods3", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Indicadores> indicadores;
    private Objetivos objetivo;



}
