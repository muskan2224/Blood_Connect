package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utilities.ConnectionFactory;

public class SearchDonorDao {

    public ResultSet searchDonors(String bloodGroup,
                                  String city,
                                  Integer minAge,
                                  Integer maxAge) {

        try {
            Connection cn =
                    new ConnectionFactory().getConn();

            /*
             * First make donors AVAILABLE again when their
             * waiting period has expired.
             */
            String updateSql =
                    "UPDATE donor SET status = 'AVAILABLE' " +
                    "WHERE status = 'UNAVAILABLE' " +
                    "AND available_from <= CURDATE()";

            PreparedStatement updatePs =
                    cn.prepareStatement(updateSql);

            updatePs.executeUpdate();
            updatePs.close();

            StringBuilder sql = new StringBuilder();

            sql.append(
                "SELECT r.user_id, r.name, r.age, r.gender, " +
                "r.city, d.donor_id, d.blood_group, d.status " +
                "FROM register r " +
                "JOIN donor d ON r.user_id = d.user_id " +
                "WHERE d.status = 'AVAILABLE' "
            );

            if (bloodGroup != null &&
                !bloodGroup.trim().isEmpty()) {

                sql.append("AND d.blood_group = ? ");
            }

            if (city != null &&
                !city.trim().isEmpty()) {

                sql.append("AND LOWER(r.city) LIKE LOWER(?) ");
            }

            if (minAge != null) {
                sql.append("AND r.age >= ? ");
            }

            if (maxAge != null) {
                sql.append("AND r.age <= ? ");
            }

            sql.append("ORDER BY r.name");

            PreparedStatement ps =
                    cn.prepareStatement(sql.toString());

            int index = 1;

            if (bloodGroup != null &&
                !bloodGroup.trim().isEmpty()) {

                ps.setString(index++, bloodGroup);
            }

            if (city != null &&
                !city.trim().isEmpty()) {

                ps.setString(index++, "%" + city.trim() + "%");
            }

            if (minAge != null) {
                ps.setInt(index++, minAge);
            }

            if (maxAge != null) {
                ps.setInt(index++, maxAge);
            }

            return ps.executeQuery();

        } catch (Exception e) {

            e.printStackTrace();
            return null;
        }
    }
}