package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import utilities.ConnectionFactory;

public class DonationDao {

    public boolean recordDonation(String userId) {

        String sql =
                "UPDATE donor SET " +
                "last_donation_date = ?, " +
                "available_from = ?, " +
                "status = 'UNAVAILABLE' " +
                "WHERE user_id = ?";

        try (Connection cn =
                     new ConnectionFactory().getConn();
             PreparedStatement ps =
                     cn.prepareStatement(sql)) {

            // Today's date
            LocalDate donationDate = LocalDate.now();

            // Donor becomes available after 3 months
            LocalDate availableDate =
                    donationDate.plusMonths(3);

            ps.setDate(
                    1,
                    Date.valueOf(donationDate)
            );

            ps.setDate(
                    2,
                    Date.valueOf(availableDate)
            );

            ps.setString(
                    3,
                    userId
            );

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }
}