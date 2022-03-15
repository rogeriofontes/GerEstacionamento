package br.com.unipac;

public class FabricaDeVeiculos {
    public static void main(String[] args) {
        Automovel gol = new Carro();
        gol.setAno("2002");
        System.out.println(gol.getAno());
        gol.frear();

        /*Caminhao volvo = new Caminhao();
        System.out.println(volvo.getCarga());
        volvo.correr();*/
    }
}
