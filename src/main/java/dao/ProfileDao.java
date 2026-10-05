package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utilities.ConnectionFactory;

public class ProfileDao {


public void updateAvailability(String userId) {

    String sql =
            "UPDATE donor SET status = 'AVAILABLE' " +
            "WHERE user_id = ? " +
            "AND status = 'UNAVAILABLE' " +
            "AND available_from <= CURDATE()";

    try (Connection cn = new ConnectionFactory().getConn();
         PreparedStatement ps = cn.prepareStatement(sql)) {

        ps.setString(1, userId);
        ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }
}

public ResultSet getProfile(String userId) {

    String sql =
            "SELECT r.user_id, r.name, r.age, r.gender, " +
            "r.phone, r.city, " +
            "d.donor_id, d.blood_group, " +
            "d.last_donation_date, d.available_from, " +
            "d.status " +
            "FROM register r " +
            "LEFT JOIN donor d ON r.user_id = d.user_id " +
            "WHERE r.user_id = ?";

    try {

        Connection cn = new ConnectionFactory().getConn();
        PreparedStatement ps = cn.prepareStatement(sql);

        ps.setString(1, userId);

        return ps.executeQuery();

    } catch (Exception e) {

        e.printStackTrace();
        return null;
    }
}

public boolean updateProfile(String userId,
                             String name,
                             int age,
                             String gender,
                             String phone,
                             String city) {

    String sql =
            "UPDATE register SET " +
            "name = ?, age = ?, gender = ?, " +
            "phone = ?, city = ? " +
            "WHERE user_id = ?";

    try (Connection cn = new ConnectionFactory().getConn();
         PreparedStatement ps = cn.prepareStatement(sql)) {

        ps.setString(1, name);
        ps.setInt(2, age);
        ps.setString(3, gender);
        ps.setString(4, phone);
        ps.setString(5, city);
        ps.setString(6, userId);

        int rows = ps.executeUpdate();

        return rows > 0;

    } catch (Exception e) {

        e.printStackTrace();
        return false;
    }
}


}
