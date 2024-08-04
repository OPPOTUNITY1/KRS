package com.ews.krs.service;

import com.ews.krs.model.SystemSetting;

import java.util.List;

public interface SystemSettingService {
    List<SystemSetting> getAllSystem_setting();
    
    void insertSystemSetting(SystemSetting systemSetting);

    void editSystemSetting(SystemSetting newSystemSetting);

    void deleteSystemSetting(int setting_id);

    SystemSetting getSystemSetting(String setting_type);
    
    SystemSetting getSystemSetting(int setting_id);
    
    List<String> getAllSettingType();
    
    public boolean checkDuplicateSetting(String settingType, String settingValue);
}
