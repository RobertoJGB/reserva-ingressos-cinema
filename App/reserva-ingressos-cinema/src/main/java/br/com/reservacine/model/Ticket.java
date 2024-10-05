package br.com.reservacine.model;

public class Ticket {

    private String ticket;
    private String lugarEsc;

    public Ticket(String lugarEsc) {
        this.lugarEsc = lugarEsc;
    }

    public Ticket(String id, String lugarEsc){
        this.ticket = id;
        this.lugarEsc = lugarEsc;
    }

    public String getLugarEsc() {
        return lugarEsc;
    }

    public String getTicket() {
        return ticket;
    }


}
