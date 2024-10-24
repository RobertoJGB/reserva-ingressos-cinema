package br.com.reservacine.model;

public class Sessions {

    private String horario;
    private String sala;
    private String lugarDisp;
    private String lugarOcup;
    private String fkIdFilme;


    public Sessions(String horario, String sala, String lugarDisp, String lugarOcup, String fkIdFilme) {
        this.horario = horario;
        this.sala = sala;
        this.lugarDisp = lugarDisp;
        this.lugarOcup = lugarOcup;
        this.fkIdFilme = fkIdFilme;
    }

    public String getHorario() {
        return horario;
    }

    public String getSala() {
        return sala;
    }

    public String getLugarDisp() {
        return lugarDisp;
    }

    public String getLugarOcup() {
        return lugarOcup;
    }

    public String getFkIdFilme() {
        return fkIdFilme;
    }

}
