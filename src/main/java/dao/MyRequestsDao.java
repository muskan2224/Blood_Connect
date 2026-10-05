package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utilities.ConnectionFactory;

public class MyRequestsDao {


public ResultSet getRequests(String donorId) {

    String sql =
            "SELECT br.request_id, " +
            "br.requester_id, " +
            "br.donor_id, " +
            "br.blood_group, " +
            "br.request_date, " +
            "br.status, " +
            "br.needed_in_hours, " +
            "br.min_age, " +
            "br.max_age, " +
            "br.requester_city, " +
            "r.name AS requester_name, " +
            "r.phone AS requester_phone " +
            "FROM blood_request br " +
            "LEFT JOIN register r " +
            "ON br.requester_id = r.user_id " +
            "WHERE br.donor_id = ? " +
            "AND br.status = 'PENDING' " +
            "ORDER BY br.request_date ASC, br.request_id ASC";

    try {

        Connection cn =
                new ConnectionFactory().getConn();

        PreparedStatement ps =
                cn.prepareStatement(sql);

        ps.setString(1, donorId);

        System.out.println(
                "MyRequestsDao - Searching requests for donor: "
                + donorId
        );

        ResultSet rs =
                ps.executeQuery();

        return rs;

    } catch (Exception e) {

        System.out.println(
                "MyRequestsDao ERROR: "
                + e.getMessage()
        );

        e.printStackTrace();

        return null;
    }
}


}
