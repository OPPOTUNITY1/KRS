package com.ews.krs.dao.impl;

import com.ews.krs.dao.AdminContactDao;
import com.ews.krs.dao.MyDAO;
import com.ews.krs.model.AdminContact;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminContactDaoImpl extends MyDAO implements AdminContactDao {

    @Override
    public void insertAdminContact(AdminContact adminContact) {
        xSql = "INSERT INTO admin_contact (full_name, email, mobile, setting_id, created_by, subject_name, message) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, adminContact.getFull_name());
            ps.setString(2, adminContact.getEmail());
            ps.setString(3, adminContact.getMobile());
            ps.setInt(4, adminContact.getSetting_id());
            ps.setInt(5, adminContact.getCreate_by());
            ps.setString(6, adminContact.getSubject_name());
            ps.setString(7, adminContact.getMessage());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    @Override
    public void editAdminContact(AdminContact newAdminContact) {
        xSql = "UPDATE admin_contact SET full_name = ?, email = ?, mobile = ?, setting_id = ?, created_by = ?, subject_name = ?, message = ? WHERE contact_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, newAdminContact.getFull_name());
            ps.setString(2, newAdminContact.getEmail());
            ps.setString(3, newAdminContact.getMobile());
            ps.setInt(4, newAdminContact.getSetting_id());
            ps.setInt(5, newAdminContact.getCreate_by());
            ps.setString(6, newAdminContact.getSubject_name());
            ps.setString(7, newAdminContact.getMessage());
            ps.setInt(8, newAdminContact.getContact_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    @Override
    public void deleteAdminContact(int contact_id) {
        xSql = "DELETE FROM admin_contact WHERE contact_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, contact_id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    @Override
    public AdminContact getAdminContact(int contact_id) {
        AdminContact contact = null;
        xSql = "SELECT * FROM admin_contact WHERE contact_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, contact_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                contact = new AdminContact(
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("mobile"),
                        rs.getInt("setting_id"),
                        rs.getInt("created_by"),
                        rs.getString("subject_name"),
                        rs.getString("message")
                );
                contact.setContact_id(rs.getInt("contact_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return contact;
    }

    @Override
    public List<AdminContact> getAllAdminContact() {
        List<AdminContact> contacts = new ArrayList<>();
        xSql = "SELECT * FROM admin_contact";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                AdminContact contact = new AdminContact(
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("mobile"),
                        rs.getInt("setting_id"),
                        rs.getInt("created_by"),
                        rs.getString("subject_name"),
                        rs.getString("message")
                );
                contact.setContact_id(rs.getInt("contact_id"));
                contacts.add(contact);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return contacts;
    }

    @Override
    public List<AdminContact> getAllAdminContactBySettingId(int setting_id) {
        List<AdminContact> contacts = new ArrayList<>();
        xSql = "SELECT * FROM admin_contact WHERE setting_id = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, setting_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                AdminContact contact = new AdminContact(
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("mobile"),
                        rs.getInt("setting_id"),
                        rs.getInt("created_by"),
                        rs.getString("subject_name"),
                        rs.getString("message")
                );
                contact.setContact_id(rs.getInt("contact_id"));
                contacts.add(contact);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return contacts;
    }

    @Override
    public List<AdminContact> searchAdminContact(String adminContact) {
        List<AdminContact> contacts = new ArrayList<>();
        xSql = "SELECT * FROM admin_contact WHERE full_name LIKE ? OR email LIKE ? OR subject_name LIKE ?";
        try {
            ps = con.prepareStatement(xSql);
            String searchQuery = "%" + adminContact + "%";
            ps.setString(1, searchQuery);
            ps.setString(2, searchQuery);
            ps.setString(3, searchQuery);
            rs = ps.executeQuery();
            while (rs.next()) {
                AdminContact contact = new AdminContact(
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("mobile"),
                        rs.getInt("setting_id"),
                        rs.getInt("created_by"),
                        rs.getString("subject_name"),
                        rs.getString("message")
                );
                contact.setContact_id(rs.getInt("contact_id"));
                contacts.add(contact);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return contacts;
    }
}
