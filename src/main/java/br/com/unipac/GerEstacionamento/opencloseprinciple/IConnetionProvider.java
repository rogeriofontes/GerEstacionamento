package br.com.unipac.GerEstacionamento.opencloseprinciple;

import java.sql.Connection;

public interface IConnetionProvider {
    Connection establishconnection();
}
