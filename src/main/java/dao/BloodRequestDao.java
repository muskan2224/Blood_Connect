
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;

import utilities.ConnectionFactory;

public class BloodRequestDao {

    public int sendRequest(String requesterId,
                           String donorId,
                           String bloodGroup,
                           int neededInHours,
                           Integer minAge,
                           Integer maxAge,
                           String requesterCity) {

        try (Connection cn =
                new ConnectionFactory().getConn()) {

            // Check donor
            String checkSql =
                    "SELECT status, blood_group " +
                    "FROM donor " +
                    "WHERE user_id = ?";

            try (PreparedStatement ps =
                    cn.prepareStatement(checkSql)) {

                ps.setString(1, donorId);

                try (ResultSet rs =
                        ps.executeQuery()) {

                    if (!rs.next()) {
                        return -1; // Donor not found
                    }

                    String status =
                            rs.getString("status");

                    String donorBloodGroup =
                            rs.getString("blood_group");

                    // Donor unavailable
                    if (!"AVAILABLE".equalsIgnoreCase(status)) {
                        return -2;
                    }

                    // Blood group mismatch
                    if (!bloodGroup.equalsIgnoreCase(
                            donorBloodGroup)) {
                        return -3;
                    }
                }
            }

            // User cannot request himself
            if (requesterId.equals(donorId)) {
                return -4;
            }

            // Duration validation
            if (neededInHours <= 0) {
                return -5;
            }

            // Minimum age validation
            if (minAge != null && minAge < 18) {
                return -6;
            }

            // Maximum age validation
            if (maxAge != null && maxAge < 18) {
                return -7;
            }

            // Age range validation
            if (minAge != null &&
                maxAge != null &&
                minAge > maxAge) {

                return -8;
            }

            /*
             * Insert new request
             */
            String sql =
                    "INSERT INTO blood_request " +
                    "(requester_id, donor_id, blood_group, " +
                    "request_date, status, needed_in_hours, " +
                    "min_age, max_age, requester_city) " +
                    "VALUES (?, ?, ?, CURDATE(), 'PENDING', ?, ?, ?, ?)";

            try (PreparedStatement ps =
                    cn.prepareStatement(
                            sql,
                            PreparedStatement.RETURN_GENERATED_KEYS)) {

                ps.setString(1, requesterId);
                ps.setString(2, donorId);
                ps.setString(3, bloodGroup);
                ps.setInt(4, neededInHours);

                if (minAge != null) {
                    ps.setInt(5, minAge);
                } else {
                    ps.setNull(5, Types.INTEGER);
                }

                if (maxAge != null) {
                    ps.setInt(6, maxAge);
                } else {
                    ps.setNull(6, Types.INTEGER);
                }

                if (requesterCity != null &&
                    !requesterCity.trim().isEmpty()) {

                    ps.setString(
                            7,
                            requesterCity.trim()
                    );

                } else {

                    ps.setNull(
                            7,
                            Types.VARCHAR
                    );
                }

                ps.executeUpdate();

                try (ResultSet rs =
                        ps.getGeneratedKeys()) {

                    if (rs.next()) {
                        return rs.getInt(1);
                    }
                }
            }

            return -9;

        } catch (Exception e) {

            e.printStackTrace();
            return -9;
        }
    }
}
