package com.example.labo.services.impl;

import com.example.labo.models.entities.Champion;
import com.example.labo.models.entities.User;
import com.example.labo.models.forms.ChampionForm;
import com.example.labo.repositories.ChampionRepository;
import com.example.labo.repositories.impl.ChampionRepositoryImpl;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;

import java.io.Serializable;
import java.util.List;
import java.util.Optional;

@Named
@SessionScoped
public class ChampionServiceImpl implements Serializable {

    @Inject
    private ChampionRepository championRepository;


    public Champion add(ChampionForm champion){
        return championRepository.add(champion.toEntity());
    }

    public Champion getOne(Champion champion ,Long id){
        // Get an Optional of the user with the given ID
        Optional<Champion> optionalChampion = championRepository.getOne(champion, id);

        // Check to see if the Optional is Present
        // Return the user
        // Return null
        return optionalChampion.orElse(null);
    }

    public List<Champion> getMany(){
        return championRepository.getAll();
    }

    public Champion update(Champion champion){
        return championRepository.update(champion);
    }

    public void delete(Champion champion, Long id){
        championRepository.delete(champion, id);
    }
    public Champion getAllInfoById(Long id){
        return championRepository.getAllinfoById(id);
    }

}
