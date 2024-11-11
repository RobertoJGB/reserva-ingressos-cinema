package br.com.reservacine.model;

public class Movies {
    private final String idMovie;
    private final String nomeFilme;
    private final String genero;
    private final String sinopse;
    //Classificação indicativa
    private final String classInd;
    private final String duracao;
    private final String emcart;


    public Movies(String nomeFilme, String genero, String sinopse, String classInd, String duracao, String emcart) {
        this.nomeFilme = nomeFilme;
        this.genero = genero;
        this.sinopse = sinopse;
        this.classInd = classInd;
        this.duracao = duracao;
        this.emcart = emcart;
        this.idMovie = null;
    }

    public Movies(String idmovie, String nomeFilme, String genero, String sinopse, String classInd, String duracao, String emcart) {
        this.nomeFilme = nomeFilme;
        this.genero = genero;
        this.sinopse = sinopse;
        this.classInd = classInd;
        this.duracao = duracao;
        this.idMovie = idmovie;
        this.emcart = emcart;
    }

    public String getNomeFilme() {
        return nomeFilme;
    }


    public String getGenero() {
        return genero;
    }


    public String getSinopse() {
        return sinopse;
    }


    public String getClassInd() {
        return classInd;
    }


    public String getDuracao() {
        return duracao;
    }

    public String getIdMovie() {
        return idMovie;
    }

    public String getEmcart() {
        return emcart;
    }
}