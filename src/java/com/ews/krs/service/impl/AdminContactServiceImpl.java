package com.ews.krs.service.impl;

import com.ews.krs.dao.AdminContactDao;
import com.ews.krs.dao.impl.AdminContactDaoImpl;
import com.ews.krs.model.AdminContact;
import com.ews.krs.model.Subject;
import com.ews.krs.service.AdminContactService;

import java.util.List;

public class AdminContactServiceImpl implements AdminContactService {

    AdminContactDao adminContactDao = new AdminContactDaoImpl();
    @Override
    public void insertAdminContact(AdminContact adminContact) {
        adminContactDao.insertAdminContact(adminContact);
    }

    @Override
    public void editAdminContact(AdminContact newAdminContact) {

    }

    @Override
    public void deleteAdminContact(int id) {

    }

    @Override
    public AdminContact getAdminContact(int id) {
        return null;
    }

    @Override
    public List<AdminContact> getAllAdminContact() {
        return List.of();
    }

    @Override
    public List<AdminContact> getAllAdminContactBySettingId(int setting_id) {
        return List.of();
    }

    @Override
    public List<AdminContact> searchAdminContact(String adminContact) {
        return List.of();
    }
}
