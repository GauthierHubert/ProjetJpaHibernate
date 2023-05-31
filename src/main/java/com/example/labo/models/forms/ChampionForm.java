package com.example.labo.models.forms;


import com.example.labo.models.entities.Champion;
import com.example.labo.models.entities.enumerations.ClassType;
import com.example.labo.models.entities.enumerations.Region;
import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ChampionForm {

    private String name;
    private byte[] icon;
    private ClassType aClassType;
    private Region region;
    private LocalDate creationDate;


   public Champion toEntity() {
       return new Champion(name, icon, aClassType, region, creationDate);
   }
}
