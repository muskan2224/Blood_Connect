package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utilities.ConnectionFactory;

public class AdminDao {


    // =====================================================
    // GET ALL ACTIVE DONORS
    // =====================================================

    public ResultSet getActiveDonors() {

        try {

            Connection cn =
                    new ConnectionFactory().getConn();


            String sql =
                    "SELECT " +

                    "r.user_id, " +
                    "r.name, " +
                    "r.age, " +
                    "r.gender, " +
                    "r.phone, " +
                    "r.city, " +

                    "d.blood_group, " +
                    "d.status " +

                    "FROM register r " +

                    "JOIN donor d " +
                    "ON r.user_id = d.user_id " +

                    "WHERE d.status = 'AVAILABLE' " +

                    "ORDER BY r.name";


            PreparedStatement ps =
                    cn.prepareStatement(sql);


            return ps.executeQuery();


        } catch (Exception e) {

            e.printStackTrace();

            return null;
        }
    }


    // =====================================================
    // GET ALL BLOOD REQUESTS
    // =====================================================

    public ResultSet getAllRequests() {

        try {

            Connection cn =
                    new ConnectionFactory().getConn();


            String sql =
                    "SELECT " +

                    "br.request_id, " +
                    "br.blood_group, " +
                    "br.request_date, " +
                    "br.accepted_date, " +
                    "br.status, " +
                    "br.requester_city, " +

                    "br.donor_name, " +
                    "br.donor_phone, " +

                    "r.name AS requester_name, " +
                    "r.phone AS requester_phone " +

                    "FROM blood_request br " +

                    "LEFT JOIN register r " +
                    "ON br.requester_id = r.user_id " +

                    "ORDER BY " +
                    "br.request_date DESC, " +
                    "br.request_id DESC";


            PreparedStatement ps =
                    cn.prepareStatement(sql);


            return ps.executeQuery();


        } catch (Exception e) {

            e.printStackTrace();

            return null;
        }
    }
}