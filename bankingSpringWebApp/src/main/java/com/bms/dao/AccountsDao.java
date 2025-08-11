package com.bms.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.bms.model.Accounts;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;      // java.sql.Date for DB I/O
import java.util.List;

 @Component
public class AccountsDao {

    @Autowired
    private JdbcTemplate template;

    // ===== CREATE =====
    public int insertAccount(Accounts acc) {
        String sql = "INSERT INTO Accounts " +
                "(accountType, accountHolderName, accountHolderContact, accountBalance, accountSetupDate) " +
                "VALUES (?,?,?,?,?)";
        return template.update(sql,
                acc.getAccountType(),
                acc.getAccountHolderName(),
                acc.getAccountHolderContact(),
                acc.getAccountBalance(),
                acc.getAccountSetupDate() == null ? null : Date.valueOf(acc.getAccountSetupDate())
        );
    }

    // ===== READ (all) =====
    public List<Accounts> getAllAccounts() {
        String sql = "SELECT * FROM Accounts";
        return template.query(sql, accountsRowMapper());
    }

    // ===== READ (by id) =====
    public Accounts getAccountById(int id) {
        String sql = "SELECT * FROM Accounts WHERE accountId = ?";
        List<Accounts> list = template.query(sql, accountsRowMapper(), id);
        return list.isEmpty() ? null : list.get(0);
    }

    // ===== SEARCH (by keyword) =====
    public List<Accounts> searchAccountsByKeyword(String keyword) {
        String sql = "SELECT * FROM Accounts " +
                "WHERE accountType LIKE ? OR accountHolderName LIKE ? OR accountHolderContact LIKE ?";
        String pattern = "%" + keyword + "%";
        return template.query(sql, accountsRowMapper(), pattern, pattern, pattern);
    }

    // ===== UPDATE (by id) =====
    public int updateAccountById(Accounts updated, int idToUpdate) {
        String sql = "UPDATE Accounts SET " +
                "accountType = ?, accountHolderName = ?, accountHolderContact = ?, " +
                "accountBalance = ?, accountSetupDate = ? " +
                "WHERE accountId = ?";
        return template.update(sql,
                updated.getAccountType(),
                updated.getAccountHolderName(),
                updated.getAccountHolderContact(),
                updated.getAccountBalance(),
                updated.getAccountSetupDate() == null ? null : Date.valueOf(updated.getAccountSetupDate()),
                idToUpdate
        );
    }

    // ===== DELETE (by id) =====
    public int deleteAccountById(int idToDelete) {
        String sql = "DELETE FROM Accounts WHERE accountId = ?";
        return template.update(sql, idToDelete);
    }

    // ===== RowMapper =====
    private RowMapper<Accounts> accountsRowMapper() {
        return new RowMapper<Accounts>() {
            @Override
            public Accounts mapRow(ResultSet rs, int rowNum) throws SQLException {
                Accounts acc = new Accounts();
                acc.setAccountId(rs.getInt("accountId"));
                acc.setAccountType(rs.getString("accountType"));
                acc.setAccountHolderName(rs.getString("accountHolderName"));
                acc.setAccountHolderContact(rs.getString("accountHolderContact"));
                acc.setAccountBalance(rs.getDouble("accountBalance"));

                Date d = rs.getDate("accountSetupDate");
                acc.setAccountSetupDate(d == null ? null : d.toLocalDate());

                return acc;
            }
        };
    }
}
