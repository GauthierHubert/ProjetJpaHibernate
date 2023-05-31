package com.example.labo.repositories;

import java.util.List;
import java.util.Optional;

public interface BaseRepository<TKey, TEntity> {

    TEntity add(TEntity entity);

    Optional<TEntity> getOne(TEntity entity, TKey id);

    List<TEntity> getAll();

    TEntity update(TEntity entity);

    void delete(TEntity entity, TKey id);

}
