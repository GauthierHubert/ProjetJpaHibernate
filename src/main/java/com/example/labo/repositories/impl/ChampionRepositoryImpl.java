package com.example.labo.repositories.impl;

import com.example.labo.models.entities.Champion;
import com.example.labo.repositories.ChampionRepository;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;
import jakarta.persistence.TypedQuery;

import java.io.Serializable;
import java.util.List;

@Named
@SessionScoped
public class ChampionRepositoryImpl extends BaseRepositoryImpl<Long, Champion> implements ChampionRepository, Serializable {

    // Implémente l'interface ChampionRepository et étend la classe BaseRepositoryImpl
    // Spécifie les paramètres génériques Long (pour la clé primaire) et Champion (pour l'entité)


    public ChampionRepositoryImpl() {
    }

    @Override
    public Champion getAllinfoById(Long id) {
        // Crée une requête typée pour récupérer les informations complètes d'un champion par son ID
        TypedQuery<Champion> query = em.createQuery("select c from Champion c where id = :id", Champion.class);
        query.setParameter("id", id);
        // Exécute la requête et récupère le champion unique correspondant à l'ID
        Champion champion = query.getSingleResult();
        // Retourne le champion
        return champion;
    }

    @Override
    public List<Champion> getAll() {
        // Crée une requête typée pour récupérer tous les champions
        TypedQuery<Champion> query = em.createQuery("select a from Champion a ", Champion.class);
        // Récupère la liste des champions résultant de la requête
        List<Champion> champions = query.getResultList();
        // Affiche les résultats reçus
        System.out.println("Résultat(s) reçu : ");
        champions.forEach(System.out::println);
        // Efface le contexte de l'EntityManager
        em.clear();
        // Retourne la liste des champions
        return champions;
    }
}
