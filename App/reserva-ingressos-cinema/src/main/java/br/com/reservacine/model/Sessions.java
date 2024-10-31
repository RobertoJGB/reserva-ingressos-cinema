package br.com.reservacine.model;

public class Sessions {
    private String idSession;
    private String horario;
    private String fkSala;
    private String fkIdFilme;
    private String nomeFilme;
    private String lugar;
    private String dispo;



    public Sessions(String horario, String fkSala, String fkIdFilme) {
        this.horario = horario;
        this.fkSala = fkSala;
        this.fkIdFilme = fkIdFilme;
    }

    public Sessions(String idSession, String horario, String nomeFilme, String lugar, String dispo) {
        this.idSession = idSession;
        this.horario = horario;
        this.nomeFilme = nomeFilme;
        this.lugar = lugar;
        this.dispo = dispo;
    }

    public String getNomeFilme() {
        return nomeFilme;
    }

    public String getLugar() {
        return lugar;
    }

    public String getDispo() {
        return dispo;
    }
    public String getIdSession() {
        return idSession;
    }

    public String getHorario() {
        return horario;
    }

    public String getFkSala() {
        return fkSala;
    }

    public String getFkIdFilme() {
        return fkIdFilme;
    }
}
