package com.example.labo.models.entities;

import com.example.labo.models.entities.enumerations.ClassType;
import com.example.labo.models.entities.enumerations.Region;
import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Base64;

@Getter @Setter
@Table(name = "CHAMPION")
@Entity
public class Champion implements Serializable {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "NAME")
    private String name;

    @Lob
    @Column(name = "ICON_STRING")
    private String stringIcon;

    @Column(name = "CLASS")
    @Enumerated(EnumType.STRING)
    private ClassType aClassType;

    @Column(name = "REGION")
    @Enumerated(EnumType.STRING)
    private Region region;

    @Column(name = "CREATION_DATE")
    @Temporal(TemporalType.DATE)
    private LocalDate creationDate;

    public Champion(String name,byte[] icon, ClassType aClassType, Region region, LocalDate creationDate) {
        this.name = name;
        this.stringIcon = Base64.getEncoder().encodeToString(icon);
        this.aClassType = aClassType;
        this.region = region;
        this.creationDate = creationDate;
    }
}
