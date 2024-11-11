package br.com.reservacine.model;

public class LugarSessao {

        private int idLugarSessao;
        private int fkSessao;
        private String lugar;
        private boolean disponivel;


        public LugarSessao(int idLugarSessao, int fkSessao, String lugar, boolean disponivel) {
            this.idLugarSessao = idLugarSessao;
            this.fkSessao = fkSessao;
            this.lugar = lugar;
            this.disponivel = disponivel;
        }

        public int getIdLugarSessao() {
            return idLugarSessao;
        }

        public void setIdLugarSessao(int idLugarSessao) {
            this.idLugarSessao = idLugarSessao;
        }

        public int getFkSessao() {
            return fkSessao;
        }

        public void setFkSessao(int fkSessao) {
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


