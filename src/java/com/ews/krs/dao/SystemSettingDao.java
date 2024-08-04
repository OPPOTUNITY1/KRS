package com.ews.krs.dao;

import com.ews.krs.model.SystemSetting;

import java.util.List;

public interface SystemSettingDao {
    void insertSystemSetting(SystemSetting systemSetting);
    void editSystemSetting(SystemSetting newSystemSetting);
    void deleteSystemSetting(int setting_id);
    SystemSetting getSystemSetting(String setting_type);
    SystemSetting getSystemSetting(int setting_id);
    List<String> getAllSettingType();
    List<SystemSetting> getAllSystemSetting();
    public boolean checkDuplicateSetting(String settingType, String settingValue);
}
