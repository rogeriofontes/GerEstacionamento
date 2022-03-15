package br.com.unipac;

public abstract class Automovel {
   private String cor;
   private String modelo;
   private String ano;
    //default/private/public/protected

    public abstract void andar();

    public abstract void frear();

    public abstract void correr();

    public String getCor() {
        return this.cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

}
