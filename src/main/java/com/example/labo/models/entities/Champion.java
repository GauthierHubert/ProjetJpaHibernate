package com.example.labo.models.entities;

import com.example.labo.models.entities.enumerations.ClassType;
import com.example.labo.models.entities.enumerations.Region;
import jakarta.persistence.*;
import lombok.*;

import java.io.File;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.*;

import static com.example.labo.models.entities.enumerations.ClassType.CONTROLLER;
import static com.example.labo.models.entities.enumerations.Region.BANDLE_CITY;

@Getter @Setter
@Table(name = "CHAMPION")
@Entity
public class Champion implements Serializable {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "NAME")
    private String name;

    @Column(name = "ICON")
    private String icon;

    @Column(name = "CLASS")
    @Enumerated(EnumType.STRING)
    private ClassType classType;

    @Column(name = "REGION")
    @Enumerated(EnumType.STRING)
    private Region region;

    @Column(name = "CREATION_DATE")
    @Temporal(TemporalType.DATE)
    private LocalDate creationDate;

    @OneToMany(mappedBy = "champion",cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
    private Set<Loading> loading ;

    @OneToMany(mappedBy = "champion",cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
    private Set<Splash> splash ;

    private File url1 = new File("C:\\Users\\Administrator\\IdeaProjects\\LaboLoL\\src\\main\\webapp\\images\\1");
    private File url2 = new File("C:\\Users\\Administrator\\IdeaProjects\\LaboLoL\\src\\main\\webapp\\images\\2");

    public Champion() {
        this.loading = new HashSet<>();
        this.splash = new HashSet<>();
    }

    public Champion(String name) {
        this();
        this.name = name;
        this.classType = CONTROLLER;
        this.region = BANDLE_CITY;
        this.creationDate = null;
        this.icon = "images/1/"+ name + ".jpg";
        createSkinUrl(name);


    }

    public void createSkinUrl(String name){
        File[] listFile = url2.listFiles();
        for(File loading : listFile){
            if(loading.getName().substring(0, loading.getName().lastIndexOf("_")).equals(name)){
                Loading l = new Loading("images/2/" + loading.getName());
                l.setChampion(this);
                this.loading.add(l);
                Splash s = new Splash("images/3/" + loading.getName());
                s.setChampion(this);
                this.splash.add(s);
            }
        }
    }
}
