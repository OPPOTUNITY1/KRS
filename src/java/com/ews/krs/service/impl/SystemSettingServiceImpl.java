package com.ews.krs.service.impl;

import com.ews.krs.dao.SystemSettingDao;
import com.ews.krs.dao.impl.SystemSettingDaoImpl;
import com.ews.krs.model.SystemSetting;
import com.ews.krs.service.SystemSettingService;

import java.util.List;

public class SystemSettingServiceImpl implements SystemSettingService {
    SystemSettingDao systemSettingDao = new SystemSettingDaoImpl();
    @Override
    public List<SystemSetting> getAllSystem_setting() {
        return systemSettingDao.getAllSystemSetting();
    }

    @Override
    public void insertSystemSetting(SystemSetting systemSetting) {
        systemSettingDao.insertSystemSetting(systemSetting);
    }

    @Override
    public void editSystemSetting(SystemSetting newSystemSetting) {
        systemSettingDao.editSystemSetting(newSystemSetting);
    }

    @Override
    public void deleteSystemSetting(int setting_id) {
        systemSettingDao.deleteSystemSetting(setting_id);
    }

    @Override
    public SystemSetting getSystemSetting(String setting_type) {
        return systemSettingDao.getSystemSetting(setting_type);
    }

    @Override
    public boolean checkDuplicateSetting(String settingType, String settingValue) {
        return systemSettingDao.checkDuplicateSetting(settingType, settingValue);
    }

    @Override
    public SystemSetting getSystemSetting(int setting_id) {
        return systemSettingDao.getSystemSetting(setting_id);
    }

    @Override
    public List<String> getAllSettingType() {
        return systemSettingDao.getAllSettingType();
    }
}
