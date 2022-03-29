package br.com.unipac.GerEstacionamento;

import br.com.unipac.GerEstacionamento.opencloseprinciple.H2ConnectionProvider;
import br.com.unipac.GerEstacionamento.opencloseprinciple.IConnetionProvider;
import br.com.unipac.GerEstacionamento.opencloseprinciple.MySQLConnectionProvider;
import br.com.unipac.GerEstacionamento.opencloseprinciple.OracleConnectionProvider;

public class main {
    public static void main(String[] args) {
        IConnetionProvider connetionProvider = new MySQLConnectionProvider();
        //IConnetionProvider connetionProvider = new H2ConnectionProvider();
        //IConnetionProvider connetionProvider = new OracleConnectionProvider();
        connetionProvider.establishconnection();

    }
}
