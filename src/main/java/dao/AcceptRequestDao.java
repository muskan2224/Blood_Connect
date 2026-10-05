package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utilities.ConnectionFactory;

public class AcceptRequestDao {

public boolean acceptRequest(int requestId, String donorId) {

    Connection cn = null;

    try {

        cn = new ConnectionFactory().getConn();

        cn.setAutoCommit(false);

        // =================================================
        // 1. GET DONOR DETAILS AND CHECK REQUEST
        // =================================================

        String checkSql =
                "SELECT br.requester_id, " +
                "r.name, r.age, r.gender, " +
                "r.phone, r.city " +
                "FROM blood_request br " +
                "JOIN register r " +
                "ON br.donor_id = r.user_id " +
                "WHERE br.request_id = ? " +
                "AND br.donor_id = ? " +
                "AND br.status = 'PENDING'";

        PreparedStatement checkPs =
                cn.prepareStatement(checkSql);

        checkPs.setInt(1, requestId);
        checkPs.setString(2, donorId);

        ResultSet rs =
                checkPs.executeQuery();

        if (!rs.next()) {

            rs.close();
            checkPs.close();

            cn.rollback();

            return false;
        }

        String donorName =
                rs.getString("name");

        int donorAge =
                rs.getInt("age");

        String donorGender =
                rs.getString("gender");

        String donorPhone =
                rs.getString("phone");

        String donorCity =
                rs.getString("city");

        rs.close();
        checkPs.close();

        // =================================================
        // 2. ACCEPT THE SELECTED REQUEST
        // =================================================

        String updateSql =
                "UPDATE blood_request SET " +
                "status = 'ACCEPTED', " +
                "accepted_date = CURDATE(), " +
                "donor_id = NULL, " +
                "donor_name = ?, " +
                "donor_age = ?, " +
                "donor_gender = ?, " +
                "donor_phone = ?, " +
                "donor_city = ? " +
                "WHERE request_id = ? " +
                "AND donor_id = ? " +
                "AND status = 'PENDING'";

        PreparedStatement updatePs =
                cn.prepareStatement(updateSql);

        updatePs.setString(1, donorName);
        updatePs.setInt(2, donorAge);
        updatePs.setString(3, donorGender);
        updatePs.setString(4, donorPhone);
        updatePs.setString(5, donorCity);
        updatePs.setInt(6, requestId);
        updatePs.setString(7, donorId);

        int updated =
                updatePs.executeUpdate();

        updatePs.close();

        if (updated != 1) {

            cn.rollback();

            return false;
        }

        // =================================================
        // 3. REJECT ALL OTHER PENDING REQUESTS
        // =================================================

        String rejectOtherSql =
                "UPDATE blood_request SET " +
                "status = 'REJECTED', " +
                "donor_id = NULL " +
                "WHERE donor_id = ? " +
                "AND status = 'PENDING' " +
                "AND request_id <> ?";

        PreparedStatement rejectPs =
                cn.prepareStatement(
                        rejectOtherSql
                );

        rejectPs.setString(1, donorId);
        rejectPs.setInt(2, requestId);

        rejectPs.executeUpdate();

        rejectPs.close();

        // =================================================
        // 4. SAVE 3-MONTH COOLDOWN
        // =================================================

        String cooldownSql =
                "INSERT INTO donor_cooldown " +
                "(phone, donated_on, eligible_date) " +
                "VALUES " +
                "(?, CURDATE(), " +
                "DATE_ADD(CURDATE(), INTERVAL 3 MONTH))";

        PreparedStatement cooldownPs =
                cn.prepareStatement(
                        cooldownSql
                );

        cooldownPs.setString(
                1,
                donorPhone
        );

        cooldownPs.executeUpdate();

        cooldownPs.close();

        // =================================================
        // 5. DELETE DONOR RECORD
        // =================================================

        String deleteDonorSql =
                "DELETE FROM donor " +
                "WHERE user_id = ?";

        PreparedStatement deleteDonorPs =
                cn.prepareStatement(
                        deleteDonorSql
                );

        deleteDonorPs.setString(
                1,
                donorId
        );

        deleteDonorPs.executeUpdate();

        deleteDonorPs.close();

        // =================================================
        // 6. DELETE LOGIN/REGISTER RECORD
        // =================================================

        String deleteUserSql =
                "DELETE FROM register " +
                "WHERE user_id = ?";

        PreparedStatement deleteUserPs =
                cn.prepareStatement(
                        deleteUserSql
                );

        deleteUserPs.setString(
                1,
                donorId
        );

        deleteUserPs.executeUpdate();

        deleteUserPs.close();

        // =================================================
        // 7. COMMIT EVERYTHING
        // =================================================

        cn.commit();

        return true;

    } catch (Exception e) {

        e.printStackTrace();

        try {

            if (cn != null) {
                cn.rollback();
            }

        } catch (Exception ex) {

            ex.printStackTrace();
        }

        return false;

    } finally {

        try {

            if (cn != null) {

                cn.setAutoCommit(true);

                cn.close();
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}


}
