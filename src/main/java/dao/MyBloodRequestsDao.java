
package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utilities.ConnectionFactory;

public class MyBloodRequestsDao {

    public ResultSet getMyRequests(String requesterId) {

        try {

            Connection cn =
                    new ConnectionFactory().getConn();

            String sql =
                    "SELECT request_id, blood_group, " +
                    "request_date, accepted_date, status, " +
                    "needed_in_hours, min_age, max_age, " +
                    "requester_city, donor_name, donor_age, " +
                    "donor_gender, donor_phone, donor_city " +
                    "FROM blood_request " +
                    "WHERE requester_id = ? " +
                    "ORDER BY request_date DESC, request_id DESC";

            PreparedStatement ps =
                    cn.prepareStatement(sql);

            ps.setString(1, requesterId);

            return ps.executeQuery();

        } catch (Exception e) {
            System.out.println("MyBloodRequestsDao ERROR:");
            e.printStackTrace();
            return null;
        }
    }
}
