package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import utilities.ConnectionFactory;

public class RejectRequestDao {


    public boolean rejectRequest(
            int requestId,
            String donorId) {


        String sql =
                "UPDATE blood_request " +

                "SET status = 'REJECTED', " +
                "donor_id = NULL " +

                "WHERE request_id = ? " +
                "AND donor_id = ? " +
                "AND status = 'PENDING'";


        try (
                Connection cn =
                        new ConnectionFactory().getConn();

                PreparedStatement ps =
                        cn.prepareStatement(sql)
        ) {


            ps.setInt(
                    1,
                    requestId
            );


            ps.setString(
                    2,
                    donorId
            );


            return ps.executeUpdate() > 0;


        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }
}