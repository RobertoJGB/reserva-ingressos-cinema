package br.com.reservacine.model;

public class Ticket {

    private String idTicket;
    private String fkIdUser;
    private String fkIdFilme;
    private String fkIdsession;

    public Ticket(String fkIdUser, String fkIdFilme, String fkIdsession) {
        this.fkIdUser = fkIdUser;
        this.fkIdFilme = fkIdFilme;
        this.fkIdsession = fkIdsession;
    }

    public Ticket(String idTicket, String fkIdUser, String fkIdFilme, String fkIdsession) {
        this.idTicket = idTicket;
        this.fkIdUser = fkIdUser;
        this.fkIdFilme = fkIdFilme;
        this.fkIdsession = fkIdsession;
    }

    public String getIdTicket() {
        return idTicket;
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
}
