package br.com.reservacine.model;

public class Sessions {

    private String horario;
    private String sala;
    private String lugarDisp;
    private String lugarOcup;
    private String fkIdFilme;


    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getSala() {
        return sala;
    }

    public void setSala(String sala) {
        this.sala = sala;
    }

    public String getLugarDisp() {
        return lugarDisp;
    }

    public void setLugarDisp(String lugarDisp) {
        this.lugarDisp = lugarDisp;
    }

    public String getLugarOcup() {
        return lugarOcup;
    }

    public void setLugarOcup(String lugarOcup) {
        this.lugarOcup = lugarOcup;
    }
}
