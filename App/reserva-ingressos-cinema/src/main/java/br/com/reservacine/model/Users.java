package br.com.reservacine.model;

public class Users {

    private String idUser;
    private final String nome;
    private final String dtNasc;
    private final String cpf;
    private final String email;
    private final String senha;

    public Users(String nome, String dtNasc, String cpf, String email, String senha) {
        this.nome = nome;
        this.dtNasc = dtNasc;
        this.cpf = cpf;
        this.email = email;
        this.senha = senha;
    }

    public Users(String idUser, String nome, String dtNasc, String cpf, String email, String senha) {
        this.idUser = idUser;
        this.nome = nome;
        this.dtNasc = dtNasc;
        this.cpf = cpf;
        this.email = email;
        this.senha = senha;
    }

    public String getIdUser() {
        return idUser;
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


    public String getEmail() {
        return email;
    }


    public String getSenha() {
        return senha;
    }


}
