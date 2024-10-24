package br.com.reservacine.model;

public class Users {

    private String nome;
    private String dtNasc;
    private String cpf;
    private String usuario;
    private String senha;

    public Users(String nome, String dtNasc, String cpf, String usuario, String senha) {
        this.nome = nome;
        this.dtNasc = dtNasc;
        this.cpf = cpf;
        this.usuario = usuario;
        this.senha = senha;
    }

    public String getNome() {
        return nome;
    }



    public String getDtNasc() {
        return dtNasc;
    }



    public String getCpf() {
        return cpf;
    }



    public String getUsuario() {
        return usuario;
    }



    public String getSenha() {
        return senha;
    }



}
