package com.ews.krs.dao.impl;

import com.ews.krs.dao.MyDAO;
import com.ews.krs.dao.SystemSettingDao;
import com.ews.krs.model.SystemSetting;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SystemSettingDaoImpl extends MyDAO implements SystemSettingDao {

    @Override
    public void insertSystemSetting(SystemSetting systemSetting) {
        try {
            ps = con.prepareStatement("INSERT INTO system_setting ( setting_type, setting_name, setting_value) VALUES (?, ?, ?)");
            ps.setString(1, systemSetting.getSetting_type());
            ps.setString(2, systemSetting.getSetting_name());
            ps.setString(3, systemSetting.getSetting_value());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            System.out.println("++/ Insert setting failed: " + e.getMessage());
        }
    }

    @Override
    public void editSystemSetting(SystemSetting setting) {
        try {
            ps = con.prepareStatement("UPDATE system_setting SET "
                    + "setting_type = ?, "
                    + "setting_name = ?, "
                    + "setting_value = ? "
                    + "WHERE setting_id = ?");
            ps.setString(1, setting.getSetting_type());
            ps.setString(2, setting.getSetting_name());
            ps.setString(3, setting.getSetting_value());
            ps.setInt(4, setting.getSetting_id());

            int rowsAffected = ps.executeUpdate();
            System.out.println("Setting updated, rows affected: " + rowsAffected);

            ps.close();
        } catch (SQLException e) {
            System.out.println("++/ Edit setting failed: " + e.getMessage());
        }
    }

    @Override
    public void deleteSystemSetting(int id) {
        try {
            String sql = "delete from system_setting where setting_id=?";
                         ;
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("--Delete setting failed" + e.getMessage());
        }
    }

    @Override
    public SystemSetting getSystemSetting(String settingType) {
        try {
            ps = con.prepareStatement("Select * from system_setting where setting_type=?");
            ps.setString(1, settingType);
            rs = ps.executeQuery();
            if (rs.next()) {
                SystemSetting setting = new SystemSetting();
                setting.setSetting_id(rs.getInt(1));
                setting.setSetting_type(rs.getString(2));
                setting.setSetting_name(rs.getString(3));
                setting.setSetting_value(rs.getString(4));
                ps.close();
                rs.close();
                return setting;
            }
        } catch (SQLException e) {
            System.out.println("++/ Get setting by type failed: " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<SystemSetting> getAllSystemSetting() {
        List<SystemSetting> systemSettings = new ArrayList<>();
        try {
            ps = con.prepareStatement("SELECT * FROM system_setting");
            rs = ps.executeQuery();
            while (rs.next()) {
                SystemSetting systemSetting = new SystemSetting();
                systemSetting.setSetting_id(rs.getInt("setting_id"));
                systemSetting.setSetting_type(rs.getString("setting_type"));
                systemSetting.setSetting_name(rs.getString("setting_name"));
                systemSetting.setSetting_value(rs.getString("setting_value"));
                systemSetting.setCreated_at(rs.getTimestamp("created_at"));
                systemSetting.setUpdated_at(rs.getTimestamp("updated_at"));
                systemSetting.setCreated_by(rs.getInt("created_by"));
                systemSetting.setUpdated_by(rs.getInt("updated_by"));
                systemSettings.add(systemSetting);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions (logging, rethrowing, etc.)
        }
        return systemSettings;
    }

    @Override
    public boolean checkDuplicateSetting(String settingType, String settingValue) {
        try {
            String sql = """
                         SELECT * FROM system_setting where setting_type = ? and setting_value = ?;
                         """;
            ps = con.prepareStatement(sql);
            ps.setString(1, settingType);
            ps.setString(2, settingValue);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("--Check dup setting failed" + e.getMessage());
        }
        return false;
    }

    @Override
    public SystemSetting getSystemSetting(int setting_id) {
        try {
            ps = con.prepareStatement("Select * from system_setting where setting_id=?");
            ps.setInt(1, setting_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                SystemSetting setting = new SystemSetting();
                setting.setSetting_id(rs.getInt(1));
                setting.setSetting_type(rs.getString(2));
                setting.setSetting_name(rs.getString(3));
                setting.setSetting_value(rs.getString(4));
                ps.close();
                rs.close();
                return setting;
            }
        } catch (SQLException e) {
            System.out.println("++/ Get setting by id failed: " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<String> getAllSettingType() {
        List<String> typeList = new ArrayList<>();
        try {
            ps = con.prepareStatement("SELECT distinct setting_type FROM system_setting");
            rs = ps.executeQuery();
            while (rs.next()) {
                typeList.add(rs.getString(1));
            }
        } catch (SQLException e) {
            System.out.println("++/Get type list failed: "+e.getMessage());
            // Handle exceptions (logging, rethrowing, etc.)
        }
        return typeList;
    }

}
