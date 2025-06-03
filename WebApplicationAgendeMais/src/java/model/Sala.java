/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author isabe
 */


public class Sala {
    private int idSala;
    private String nomeSala;
    private int capacidade;
    private int tipoSalaId; // chave estrangeira para TipoSala

    public int getIdSala() {
        return idSala;
    }

    public void setIdSala(int idSala) {
        this.idSala = idSala;
    }

    public String getNomeSala() {
        return nomeSala;
    }

    public void setNomeSala(String nomeSala) {
        this.nomeSala = nomeSala;
    }

    public int getCapacidade() {
        return capacidade;
    }

    public void setCapacidade(int capacidade) {
        this.capacidade = capacidade;
    }

    public int getTipoSalaId() {
        return tipoSalaId;
    }

    public void setTipoSalaId(int tipoSalaId) {
        this.tipoSalaId = tipoSalaId;
    }
}

