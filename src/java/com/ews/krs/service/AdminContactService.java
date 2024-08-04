package com.ews.krs.service;

import com.ews.krs.model.AdminContact;
import com.ews.krs.model.Subject;

import java.util.List;

public interface AdminContactService {
    void insertAdminContact(AdminContact adminContact);

    void editAdminContact(AdminContact newAdminContact);

    void deleteAdminContact(int id);

    AdminContact getAdminContact(int id);

    List<AdminContact> getAllAdminContact();
    List<AdminContact> getAllAdminContactBySettingId(int setting_id);

    List<AdminContact> searchAdminContact(String adminContact);

}
