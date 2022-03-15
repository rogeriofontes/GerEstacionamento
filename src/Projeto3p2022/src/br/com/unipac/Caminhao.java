package br.com.unipac;

public class Caminhao extends Automovel {
    private Integer carga = 5;

    @Override
    public void andar() {
        System.out.println("Andar caminhao");
    }

    @Override
    public void frear() {
        System.out.println("frear caminha");
    }

    @Override
    public void correr() {
        System.out.println("correr a mais de 150 km/h");
        super.setCor("Azul Claro");
        this.setCarga(1);
        this.getCarga();
    }

    public Integer getCarga() {
        return carga;
    }

    public void setCarga(Integer carga) {
        this.carga = carga;
    }
}
