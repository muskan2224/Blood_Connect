package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

import utilities.ConnectionFactory;

public class RegisterDao {

    // =====================================================
    // CHECK 3-MONTH DONOR COOLDOWN
    // =====================================================

    public Date getCooldownDate(String phone) {

        String sql = "SELECT MAX(eligible_date) AS eligible_date FROM donor_cooldown WHERE phone = ? AND eligible_date > CURDATE()";

        try (Connection cn = new ConnectionFactory().getConn();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setString(1, phone);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    return rs.getDate("eligible_date");
                }
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return null;
    }


    // =====================================================
    // REGISTER NEW DONOR
    // =====================================================

    public String registerUser(String name,
                               int age,
                               String gender,
                               String phone,
                               String city,
                               String bloodGroup,
                               String password) {

        Connection cn = null;

        try {

            cn = new ConnectionFactory().getConn();

            /*
             * FIRST CHECK:
             * Has this phone number donated within
             * the last 3 months?
             */

            Date cooldownDate =
                    getCooldownDateUsingConnection(cn, phone);

            if (cooldownDate != null) {

                return null;
            }


            // =================================================
            // GENERATE UNIQUE USER ID
            // =================================================

            String userId;

            while (true) {

                userId =
                        "BDU" +
                        UUID.randomUUID()
                           .toString()
                           .replace("-", "")
                           .substring(0, 8)
                           .toUpperCase();

                String checkSql =
                        "SELECT user_id " +
                        "FROM register " +
                        "WHERE user_id = ?";

                try (PreparedStatement checkPs =
                             cn.prepareStatement(checkSql)) {

                    checkPs.setString(1, userId);

                    try (ResultSet rs =
                                 checkPs.executeQuery()) {

                        if (!rs.next()) {

                            break;
                        }
                    }
                }
            }


            // =================================================
            // START TRANSACTION
            // =================================================

            cn.setAutoCommit(false);


            // =================================================
            // INSERT USER INTO REGISTER
            // =================================================

            String userSql =
                    "INSERT INTO register " +
                    "(user_id, password, name, age, gender, " +
                    "phone, city, role) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, 'USER')";

            try (PreparedStatement userPs =
                         cn.prepareStatement(userSql)) {

                userPs.setString(1, userId);
                userPs.setString(2, password);
                userPs.setString(3, name);
                userPs.setInt(4, age);
                userPs.setString(5, gender);
                userPs.setString(6, phone);
                userPs.setString(7, city);

                userPs.executeUpdate();
            }


            // =================================================
            // INSERT DONOR
            // =================================================

            String donorSql =
                    "INSERT INTO donor " +
                    "(blood_group, last_donation_date, " +
                    "available_from, user_id) " +
                    "VALUES (?, NULL, NULL, ?)";

            try (PreparedStatement donorPs =
                         cn.prepareStatement(donorSql)) {

                donorPs.setString(1, bloodGroup);
                donorPs.setString(2, userId);

                donorPs.executeUpdate();
            }


            // =================================================
            // COMMIT
            // =================================================

            cn.commit();

            return userId;

        } catch (Exception e) {

            e.printStackTrace();

            try {

                if (cn != null) {

                    cn.rollback();
                }

            } catch (SQLException ex) {

                ex.printStackTrace();
            }

            return null;

        } finally {

            try {

                if (cn != null) {

                    cn.setAutoCommit(true);
                    cn.close();
                }

            } catch (SQLException e) {

                e.printStackTrace();
            }
        }
    }


    // =====================================================
    // COOLDOWN CHECK USING EXISTING CONNECTION
    // =====================================================

    private Date getCooldownDateUsingConnection(
            Connection cn,
            String phone) throws SQLException {

        String sql =
                "SELECT MAX(eligible_date) AS eligible_date " +
                "FROM donor_cooldown " +
                "WHERE phone = ? " +
                "AND eligible_date > CURDATE()";

        try (PreparedStatement ps =
                     cn.prepareStatement(sql)) {

            ps.setString(1, phone);

            try (ResultSet rs =
                         ps.executeQuery()) {

                if (rs.next()) {

                    return rs.getDate("eligible_date");
                }
            }
        }

        return null;
    }


    // =====================================================
    // LOGIN CHECK
    // =====================================================

    public boolean checkLogin(String userId,
                              String password) {

        String sql =
                "SELECT user_id " +
                "FROM register " +
                "WHERE user_id = ? " +
                "AND password = ?";

        try (Connection cn =
                     new ConnectionFactory().getConn();
             PreparedStatement ps =
                     cn.prepareStatement(sql)) {

            ps.setString(1, userId);
            ps.setString(2, password);

            try (ResultSet rs =
                         ps.executeQuery()) {

                return rs.next();
            }

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }
}