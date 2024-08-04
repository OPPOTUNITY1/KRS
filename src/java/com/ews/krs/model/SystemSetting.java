package com.ews.krs.model;

import java.util.Date;
import java.util.Objects;

public class SystemSetting {
    private int setting_id;
    private String setting_type;
    private String setting_name;
    private String setting_value;
    private Date created_at;
    private Date updated_at;
    private int created_by;
    private int updated_by;

    public SystemSetting() {
    }

    public SystemSetting(int setting_id, String setting_type, String setting_name, String setting_value, Date created_at, Date updated_at, int created_by, int updated_by) {
        this.setting_id = setting_id;
        this.setting_type = setting_type;
        this.setting_name = setting_name;
        this.setting_value = setting_value;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.created_by = created_by;
        this.updated_by = updated_by;
    }
    public SystemSetting(int setting_id, String setting_type, String setting_name, String setting_value) {
        this.setting_id = setting_id;
        this.setting_type = setting_type;
        this.setting_name = setting_name;
        this.setting_value = setting_value;
    }

    public SystemSetting(int setting_id, String setting_value) {
        this.setting_id = setting_id;
        this.setting_value = setting_value;
    }

    public int getSetting_id() {
        return setting_id;
    }

    public void setSetting_id(int setting_id) {
        this.setting_id = setting_id;
    }

    public String getSetting_type() {
        return setting_type;
    }

    public void setSetting_type(String setting_type) {
        this.setting_type = setting_type;
    }

    public String getSetting_name() {
        return setting_name;
    }

    public void setSetting_name(String setting_name) {
        this.setting_name = setting_name;
    }

    public String getSetting_value() {
        return setting_value;
    }

    public void setSetting_value(String setting_value) {
        this.setting_value = setting_value;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
    }

    public int getUpdated_by() {
        return updated_by;
    }

    public void setUpdated_by(int updated_by) {
        this.updated_by = updated_by;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        SystemSetting that = (SystemSetting) o;
        return setting_id == that.setting_id;
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(setting_id);
    }
}
