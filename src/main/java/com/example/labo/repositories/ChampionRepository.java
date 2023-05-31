package com.example.labo.repositories;

import com.example.labo.models.entities.Champion;

public interface ChampionRepository extends BaseRepository<Long, Champion> {

    Champion getAllinfoById(Long id);

}
