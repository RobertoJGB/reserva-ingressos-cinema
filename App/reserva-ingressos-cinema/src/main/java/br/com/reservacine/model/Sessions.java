package br.com.reservacine.model;

public class Sessions {
    private String idSession;
    private String horario;
    private String sala;
    private String fkIdFilme;


    public Sessions(String horario, String sala, String fkIdFilme) {
        this.horario = horario;
        this.sala = sala;
        this.fkIdFilme = fkIdFilme;
    }

    public Sessions(String id, String horario, String sala, String fkIdFilme) {
        this.idSession = id;
        this.horario = horario;
        this.sala = sala;
        this.fkIdFilme = fkIdFilme;
    }


    public String getIdSession() {
        return idSession;
    }

    public String getHorario() {
        return horario;
    }

    public String getSala() {
        return sala;
    }

    public String getFkIdFilme() {
        return fkIdFilme;
    }
}
