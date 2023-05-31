package com.example.labo.repositories.impl;

import com.example.labo.exceptions.EntityNotFoundException;
import com.example.labo.models.entities.User;
import com.example.labo.repositories.UserRepository;
import jakarta.enterprise.context.SessionScoped;
import jakarta.inject.Named;
import jakarta.persistence.TypedQuery;

import java.io.Serializable;
import java.util.List;

@Named
@SessionScoped
public class UserRepositoryImpl extends BaseRepositoryImpl<Long, User> implements UserRepository, Serializable {

    // Implémente l'interface UserRepository et étend la classe BaseRepositoryImpl
    // Spécifie les paramètres génériques Long (pour la clé primaire) et User (pour l'entité)

    public UserRepositoryImpl() {
        // Constructeur par défaut de la classe
    }

    @Override
    public User getAllinfoById(Long id) {
        // Crée une requête typée pour récupérer les informations complètes d'un utilisateur par son ID
        TypedQuery<User> query = em.createQuery("select u from User u where id = :id", User.class);
        query.setParameter("id", id);

        // Exécute la requête et récupère l'utilisateur unique correspondant à l'ID
        User user = query.getSingleResult();

        // Retourne l'utilisateur
        return user;
    }

    @Override
    public User findByLogin(String login) {
        // Crée une requête typée pour rechercher un utilisateur par son nom d'utilisateur ou son email
        TypedQuery<User> query = em.createQuery("select u from User u where username = :login or email = :login", User.class);
        query.setParameter("login", login);

        // Exécute la requête et récupère la liste des résultats correspondants
        List<User> users = query.getResultList();

        if (users.isEmpty()) {
            // Aucun utilisateur trouvé, lance une exception
            throw new EntityNotFoundException("User not found with login: " + login);
        }

        // Un seul utilisateur trouvé, retourne le premier élément de la liste
        return users.get(0);
    }

    @Override
    public List<User> getAll() {
        // Crée une requête typée pour récupérer tous les utilisateurs
        TypedQuery<User> query = em.createQuery("select a from User a ", User.class);
        // Récupère la liste des utilisateurs résultant de la requête
        List<User> users = query.getResultList();
        // Affiche le nombre de résultats reçus
        System.out.println("Résultat(s) reçu : " + users.size());
        // Affiche chaque utilisateur
        users.forEach(System.out::println);
        // Efface le contexte de l'EntityManager
        em.clear();
        // Retourne la liste des utilisateurs
        return users;
    }

    public void SetAdmin(Long id){
        User user = em.find(User.class, id);

// Changer la valeur du discriminant
        em.getTransaction().begin();
        //user.setDiscriminatorValue("ADMIN");
        em.getTransaction().commit();
    }
}
