package br.com.unipac;

public class Carro extends Automovel {

    @Override
    public void andar() {
        System.out.println("Andar Carro");
    }

    @Override
    public void frear() {
        System.out.println("Frear Carro");
    }

    @Override
    public void correr() {
        System.out.println("Acelerar o Carro");
    }

    public void maisDe10Anos() {
        String cor = super.getCor();
        if (cor.equals("Vermelho")) {
            super.setCor("Cinza");
        }
    }
}
