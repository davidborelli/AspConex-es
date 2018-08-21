package br.com.aspconexoes.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.aspconexoes.models.Grupo;

@Repository
public interface Grupos extends JpaRepository<Grupo, Long> {

}
