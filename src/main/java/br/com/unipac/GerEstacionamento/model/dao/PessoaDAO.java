package br.com.unipac.GerEstacionamento.model.dao;

import br.com.unipac.GerEstacionamento.infra.H2Infra;
import br.com.unipac.GerEstacionamento.model.domain.Pessoa;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PessoaDAO {

    H2Infra infra = new H2Infra();

    public void create() {

        String sql = "CREATE TABLE IF NOT EXISTS Pessoa " +
            "(id INTEGER not NULL, " +
            " first VARCHAR(255), " +
            " last VARCHAR(255), " +
            " age INTEGER, " +
            " PRIMARY KEY ( id ))";

        execute(sql);
    }

    public void save(Pessoa pessoa) {
        String sql1 = "INSERT INTO Pessoa (id, first, last, age) VALUES ('" + pessoa.getId() + "', '" + pessoa.getFirst() + "', '" + pessoa.getLast() + "', '" + pessoa.getAge() + "')";
        execute(sql1);
    }

    public void execute(String sql) {
        try {
            infra.getStatement().executeUpdate(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            infra.close();
        }
    }

    public void buscaPessoas() {
        try {
            String sql = "SELECT id, first, last, age FROM Pessoa";
            ResultSet rs = infra.getStatement().executeQuery(sql);

            while (rs.next()) {

                int id = rs.getInt("id");
                int age = rs.getInt("age");
                String first = rs.getString("first");
                String last = rs.getString("last");

                System.out.print("ID: " + id);
                System.out.print(", Age: " + age);
                System.out.print(", First: " + first);
                System.out.println(", Last: " + last);
            }

        } catch (SQLException se) {
            se.printStackTrace();
        } finally {
            infra.close();
        }
    }

    public static void main(String[] args) {
        PessoaDAO pessoaDAO = new PessoaDAO();
        pessoaDAO.create();

        Pessoa pessoa = new Pessoa();
        pessoa.setId(2L);
        pessoa.setFirst("Rogerio");
        pessoa.setLast("Tomaz");
        pessoaDAO.save(pessoa);

        pessoaDAO.buscaPessoas();
    }
}
