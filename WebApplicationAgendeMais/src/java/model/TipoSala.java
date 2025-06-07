/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author isabe
 */


public class TipoSala {
    private int id;  // pode ser idTipo, veja o nome correto do atributo
    private String descricao;

    // Getter para id (ou idTipo)
    public int getId() {
        return id;
    }

    // Setter para id (ou idTipo)
    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
