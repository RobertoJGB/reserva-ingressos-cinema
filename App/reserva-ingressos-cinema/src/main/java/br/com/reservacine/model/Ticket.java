package br.com.reservacine.model;

public class Ticket {

    private final String fkIdUser;
    private final String fkIdFilme;
    private final String fkIdsession;
    private String idTicket;

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
