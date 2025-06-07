/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author isabe
 */
import java.util.Date;

public class Reserva {
    private int idReserva;
    private int idUsuario;
    private String nome;
    private int idSala;
    private Date dataInicio;
    private Date dataFim;
    private int StatusReserva;

    public Reserva() {}

    public Reserva(int idReserva, int idUsuario, String nome, int idSala, Date dataInicio, Date dataFim, int statusReserva) {
        this.idReserva = idReserva;
        this.idUsuario = idUsuario;
        this.nome = nome;
        this.idSala = idSala;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.StatusReserva = statusReserva;
    }

    public int getIdReserva() {
        return idReserva;
    }

    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
   public void setNome(String nome) {
        this.nome = nome;
    }
      
   public String getNome() {
        return nome;
    }

    public int getIdSala() {
        return idSala;
    }

    public void setIdSala(int idSala) {
        this.idSala = idSala;
    }

    public Date getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(Date dataInicio) {
        this.dataInicio = dataInicio;
    }

    public Date getDataFim() {
        return dataFim;
    }

    public void setDataFim(Date dataFim) {
        this.dataFim = dataFim;
    }

    public int getStatusReserva() {
        return StatusReserva;
    }

    public void setStatusReserva(int statusId) {
        this.StatusReserva = statusId;
    }
}
