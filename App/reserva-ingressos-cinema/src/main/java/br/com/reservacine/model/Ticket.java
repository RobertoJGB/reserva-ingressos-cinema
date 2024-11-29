package br.com.reservacine.model;

public class Ticket {

    private String fkIdUser;
    private String fkIdFilme;
    private String fkIdsession;
    private String fkidlugar;
    private String idTicket;


    public Ticket(String fkIdUser, String fkIdFilme, String fkIdsession, String fkidlugar) {
        this.fkIdUser = fkIdUser;
        this.fkIdFilme = fkIdFilme;
        this.fkIdsession = fkIdsession;
        this.fkidlugar = fkidlugar;
    }

    public Ticket(String idTicket, String fkIdUser, String fkIdFilme,String fkidlugar, String fkIdsession) {
        this.idTicket = idTicket;
        this.fkIdUser = fkIdUser;
        this.fkIdFilme = fkIdFilme;
        this.fkidlugar = fkidlugar;
        this.fkIdsession = fkIdsession;
    }

    public String getFkIdUser() {
        return fkIdUser;
    }


    public String getFkIdFilme() {
        return fkIdFilme;
    }



    public String getFkIdsession() {
        return fkIdsession;
    }



    public String getFkidlugar() {
        return fkidlugar;
    }



    public String getIdTicket() {
        return idTicket;
    }



}