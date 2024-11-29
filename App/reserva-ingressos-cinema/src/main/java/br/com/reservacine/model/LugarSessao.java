package br.com.reservacine.model;

public class LugarSessao {

    private String idLugarSessao;
    private String fkSessao;
    private String lugar;
    private boolean disponivel;


    public LugarSessao(String idLugarSessao, String fkSessao, String lugar, boolean disponivel) {
        this.idLugarSessao = idLugarSessao;
        this.fkSessao = fkSessao;
        this.lugar = lugar;
        this.disponivel = disponivel;
    }

    public String getIdLugarSessao() {
        return idLugarSessao;
    }

    public void setIdLugarSessao(String idLugarSessao) {
        this.idLugarSessao = idLugarSessao;
    }

    public String getFkSessao() {
        return fkSessao;
    }

    public void setFkSessao(String fkSessao) {
        this.fkSessao = fkSessao;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public boolean isDisponivel() {
        return disponivel;
    }

    public void setDisponivel(boolean disponivel) {
        this.disponivel = disponivel;
    }
}


