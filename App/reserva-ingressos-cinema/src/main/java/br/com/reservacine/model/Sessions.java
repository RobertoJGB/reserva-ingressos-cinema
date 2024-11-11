package br.com.reservacine.model;

public class Sessions {
    private String idSession;
    private String horario;
    private String fkSala;
    private String fkIdFilme;


    public Sessions(String horario, String fkSala, String fkIdFilme) {
        this.horario = horario;
        this.fkSala = fkSala;
        this.fkIdFilme = fkIdFilme;
    }

    public Sessions(String idSession,String horario, String fkSala, String fkIdFilme) {
        this.idSession =  idSession;
        this.horario = horario;
        this.fkSala = fkSala;
        this.fkIdFilme = fkIdFilme;
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
