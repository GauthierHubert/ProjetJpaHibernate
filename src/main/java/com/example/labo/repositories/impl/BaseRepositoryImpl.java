package com.example.labo.repositories.impl;

import com.example.labo.repositories.BaseRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.List;
import java.util.Optional;

/**
 * Implémentation abstraite de l'interface BaseRepository.
 *
 * @param <TKey>    Le type de la clé primaire de l'entité.
 * @param <TEntity> Le type de l'entité.
 */
public abstract class BaseRepositoryImpl<TKey, TEntity> implements BaseRepository<TKey, TEntity> {

    protected EntityManagerFactory emf;
    protected EntityManager em;

    /**
     * Constructeur de la classe BaseRepositoryImpl.
     * Initialise l'EntityManagerFactory et l'EntityManager.
     */
    public BaseRepositoryImpl() {
        this.emf = Persistence.createEntityManagerFactory("LaboJavaWeb");
        this.em = emf.createEntityManager();
    }

    @Override
    public TEntity add(TEntity entity) {
        // Démarre une transaction
        em.getTransaction().begin();

        // Persiste l'entité dans la base de données
        em.persist(entity);

        // Valide la transaction
        em.getTransaction().commit();

        // Retourne l'entité persistée
        return entity;
    }


    @Override
    public Optional<TEntity> getOne(TEntity entity, TKey id) {

        // Obtient la classe de l'entité
        Class<TEntity> tEntityClass = (Class<TEntity>) entity.getClass();

        // Récupère l'entité à partir de son ID en utilisant EntityManager
        TEntity tEntity = em.find(tEntityClass, id);

        // Retourne l'entité trouvée, enveloppée dans un Optional
        return Optional.ofNullable(tEntity);
    }


    @Override
    public abstract List<TEntity> getAll();

    @Override
    public TEntity update(TEntity entity) {
        // Démarre une transaction
        em.getTransaction().begin();

        // Met à jour l'entité dans la base de données en utilisant EntityManager
        em.merge(entity);

        // Valide la transaction
        em.getTransaction().commit();

        // Retourne l'entité mise à jour
        return entity;
    }


    @Override
    public void delete(TEntity e, TKey id) {
        // Récupère l'entité à supprimer en utilisant la méthode getOne
        Optional<TEntity> entity = getOne(e, id);

        // Vérifie si l'entité existe
        if (entity.isPresent()) {
            // Démarre une transaction
            em.getTransaction().begin();

            // Supprime l'entité de la base de données en utilisant EntityManager
            em.remove(entity.get());

            // Valide la transaction
            em.getTransaction().commit();
        }
    }

}
