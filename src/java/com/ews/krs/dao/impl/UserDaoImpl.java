package com.ews.krs.dao.impl;

import com.ews.krs.dao.MyDAO;
import com.ews.krs.dao.UserDao;
import com.ews.krs.model.User;
import com.ews.krs.util.ForeignKeyConstraintException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDaoImpl extends MyDAO implements UserDao {
    @Override
    public void insertUser(User user) {
        try {
            ps = con.prepareStatement("INSERT INTO user (username, password, fullname, gender, dob, email, phone, created_at, updated_at, status, isVerified_email, setting_id) VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), NOW(), ?, ?, ?)");
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullname());
            ps.setString(4, user.getGender());
            ps.setTimestamp(5, user.getDob() != null ? new Timestamp(user.getDob().getTime()) : null);
            ps.setString(6, user.getEmail());
            ps.setString(7, user.getPhone());
            ps.setInt(8, user.getStatus());
            ps.setInt(9, user.getIsVerified_email());
            ps.setInt(10, 4);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions (logging, rethrowing, etc.)
        }
    }


    @Override
    public void editUser(User user) {
        try {
            ps = con.prepareStatement("UPDATE user SET " +
                    "username = ?, " +
                    "password = ?, " +
                    "fullname = ?, " +
                    "gender = ?, " +
                    "dob = ?, " +
                    "email = ?, " +
                    "phone = ?, " +
                    "created_at = ?, " +
                    "updated_at = NOW(), " +
                    "avatar = ?, " +
                    "status = ?, " +
                    "isVerified_email = ?, " +
                    "setting_id = ? " +
                    "WHERE user_id = ?");
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullname());
            ps.setString(4, user.getGender());
            ps.setTimestamp(5, user.getDob() != null ? new java.sql.Timestamp(user.getDob().getTime()) : null);
            ps.setString(6, user.getEmail());
            ps.setString(7, user.getPhone());
            ps.setTimestamp(8, user.getCreated_at() != null ? new java.sql.Timestamp(user.getCreated_at().getTime()) : null);
            ps.setString(9, user.getAvatar());
            ps.setInt(10, user.getStatus());
            ps.setInt(11, user.getIsVerified_email());
            ps.setInt(12, user.getSetting_id());
            ps.setInt(13, user.getUser_id());
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    @Override
    public void deleteUser(int id) throws ForeignKeyConstraintException {
        String sql = "DELETE FROM user WHERE user_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            if (e.getErrorCode() == 1451) {
                throw new ForeignKeyConstraintException("Cannot delete user. This user is associated with other records.");
            } else {
                e.printStackTrace();
                throw new RuntimeException("Database error occurred while deleting user.", e);
            }
        }
    }

    @Override
    public User getUser(String username) {
        User user = null;
        try {
            ps = con.prepareStatement("SELECT * FROM user WHERE username = ?");
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setEmail(rs.getString("email"));
                Timestamp dobTimestamp = rs.getTimestamp("dob");
                if (dobTimestamp != null) {
                    user.setDob(new Date(dobTimestamp.getTime()));
                } else {
                    user.setDob(null);
                }
                user.setAvatar(rs.getString("avatar"));
                user.setCreated_at(rs.getTimestamp("created_at"));
                user.setUpdated_at(rs.getTimestamp("updated_at"));
                user.setStatus(rs.getInt("status"));
                user.setIsVerified_email(rs.getInt("isVerified_email")); // Corrected column name
                user.setSetting_id(rs.getInt("setting_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions (logging, rethrowing, etc.)
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle exceptions (logging, rethrowing, etc.)
            }
        }
        return user;
    }

    @Override
    public User getUserByEmail(String email) {
        User user = null;
        try {
            ps = con.prepareStatement("SELECT * FROM user WHERE email = ?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setEmail(rs.getString("email"));
                Timestamp dobTimestamp = rs.getTimestamp("dob");
                if (dobTimestamp != null) {
                    user.setDob(new Date(dobTimestamp.getTime()));
                } else {
                    user.setDob(null);
                }
                user.setAvatar(rs.getString("avatar"));
                user.setCreated_at(rs.getTimestamp("created_at"));
                user.setUpdated_at(rs.getTimestamp("updated_at"));
                user.setStatus(rs.getInt("status"));
                user.setIsVerified_email(rs.getInt("isVerified_email")); // Corrected column name
                user.setSetting_id(rs.getInt("setting_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions (logging, rethrowing, etc.)
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle exceptions (logging, rethrowing, etc.)
            }
        }
        return user;
    }

    @Override
    public User getUser(int id) {
        User user = null;
        try {
            ps = con.prepareStatement("SELECT * FROM user WHERE user_id = ?");
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setEmail(rs.getString("email"));
                Timestamp dobTimestamp = rs.getTimestamp("dob");
                if (dobTimestamp != null) {
                    user.setDob(new Date(dobTimestamp.getTime()));
                } else {
                    user.setDob(null);
                }
                user.setAvatar(rs.getString("avatar"));
                user.setCreated_at(rs.getTimestamp("created_at"));
                user.setUpdated_at(rs.getTimestamp("updated_at"));
                user.setStatus(rs.getInt("status"));
                user.setIsVerified_email(rs.getInt("isVerified_email"));
                user.setSetting_id(rs.getInt("setting_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions (logging, rethrowing, etc.)
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle exceptions (logging, rethrowing, etc.)
            }
        }
        return user;
    }

    @Override
    public List<User> getAllUser() {
        List<User> users = new ArrayList<>();
        try {
            ps = con.prepareStatement("SELECT * FROM user");
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setEmail(rs.getString("email"));
                Timestamp dobTimestamp = rs.getTimestamp("dob");
                if (dobTimestamp != null) {
                    user.setDob(new Date(dobTimestamp.getTime()));
                } else {
                    user.setDob(null);
                }
                user.setAvatar(rs.getString("avatar"));
                user.setCreated_at(rs.getTimestamp("created_at"));
                user.setUpdated_at(rs.getTimestamp("updated_at"));
                user.setStatus(rs.getInt("status"));
                user.setIsVerified_email(rs.getInt("isVerified_email"));
                user.setSetting_id(rs.getInt("setting_id"));

                // Gán roleName dựa trên setting_id
                switch (user.getSetting_id()) {
                    case 2:
                        user.setRoleName("Manager");
                        break;
                    case 3:
                        user.setRoleName("Teacher");
                        break;
                    case 4:
                        user.setRoleName("Student");
                        break;
                    default:
                        user.setRoleName("Admin");
                        break;
                }

                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return users;
    }


    @Override
    public List<User> searchUser(String username) {
        return List.of();
    }

    @Override
    public boolean checkExistEmail(String email) {
        try {
            ps = con.prepareStatement("SELECT * FROM user WHERE email = ?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException ignored) {
        }
        return false;
    }

    @Override
    public boolean checkExistUsername(String username) {
        try {
            ps = con.prepareStatement("SELECT * FROM user WHERE username = ?");
            ps.setString(1, username);
            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException ignored) {
        }
        return false;
    }

    @Override
    public User getUserByID(int uID) {
        String sql = "SELECT * FROM user WHERE user_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, uID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setEmail(rs.getString("email"));
                Timestamp dobTimestamp = rs.getTimestamp("dob");
                if (dobTimestamp != null) {
                    user.setDob(new Date(dobTimestamp.getTime()));
                } else {
                    user.setDob(null);
                }
                user.setAvatar(rs.getString("avatar"));
                user.setCreated_at(rs.getTimestamp("created_at"));
                user.setUpdated_at(rs.getTimestamp("updated_at"));
                user.setStatus(rs.getInt("status"));
                user.setIsVerified_email(rs.getInt("isVerified_email")); // Corrected column name
                user.setSetting_id(rs.getInt("setting_id"));
                return user;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public List<User> searchUser(String searchId, String searchName, String searchRole) {
        List<User> users = new ArrayList<>();
        StringBuilder sqlBuilder = new StringBuilder("SELECT u.*, ss.setting_value ");
        sqlBuilder.append("FROM user u ");
        sqlBuilder.append("JOIN system_setting ss ON u.setting_id = ss.setting_id ");
        sqlBuilder.append("WHERE 1=1");

        List<Object> params = new ArrayList<>();

        if (searchId != null && !searchId.trim().isEmpty()) {
            sqlBuilder.append(" AND u.user_id = ?");
            params.add(Integer.parseInt(searchId.trim()));
        }

        if (searchName != null && !searchName.trim().isEmpty()) {
            sqlBuilder.append(" AND u.fullname LIKE ?");
            params.add("%" + searchName.trim() + "%");
        }

        if (searchRole != null && !searchRole.trim().isEmpty()) {
            sqlBuilder.append(" AND ss.setting_value = ?");
            params.add(searchRole.trim());
        }

        try {
            ps = con.prepareStatement(sqlBuilder.toString());
            int index = 1;
            for (Object param : params) {
                if (param instanceof String) {
                    ps.setString(index++, (String) param);
                } else if (param instanceof Integer) {
                    ps.setInt(index++, (Integer) param);
                }
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setEmail(rs.getString("email"));
                Timestamp dobTimestamp = rs.getTimestamp("dob");
                if (dobTimestamp != null) {
                    user.setDob(new Date(dobTimestamp.getTime()));
                } else {
                    user.setDob(null);
                }
                user.setAvatar(rs.getString("avatar"));
                user.setCreated_at(rs.getTimestamp("created_at"));
                user.setUpdated_at(rs.getTimestamp("updated_at"));
                user.setStatus(rs.getInt("status"));
                user.setIsVerified_email(rs.getInt("isVerified_email"));
                user.setSetting_id(rs.getInt("setting_id"));
                user.setRoleName(rs.getString("setting_value").substring(0, 1).toUpperCase() + rs.getString("setting_value").substring(1).toLowerCase());

                users.add(user);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return users;
    }

    @Override
    public List<User> getUsersBySettingId(int settingId) {
        return List.of();
    }

    @Override
    public void editUsers(User newUser) {
        String sql = "UPDATE user SET username = ?, fullname = ?, gender = ?, dob = ?, email = ?, phone = ? WHERE user_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, newUser.getUsername());
            ps.setString(2, newUser.getFullname());
            ps.setString(3, newUser.getGender());
            ps.setString(4, new SimpleDateFormat("yyyy-MM-dd").format(newUser.getDob()));
            ps.setString(5, newUser.getEmail());
            ps.setString(6, newUser.getPhone());
            ps.setInt(7, newUser.getUser_id());
            ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public List<User> searchUserByRole(String roleName) {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM user WHERE setting_id IN (SELECT setting_id FROM role WHERE role_name = ?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, roleName);
            rs = ps.executeQuery();

            while (rs.next()) {
                User user = new User();
                user.setUser_id(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setPhone(rs.getString("phone"));
                user.setGender(rs.getString("gender"));
                user.setEmail(rs.getString("email"));
                Timestamp dobTimestamp = rs.getTimestamp("dob");
                if (dobTimestamp != null) {
                    user.setDob(new Date(dobTimestamp.getTime()));
                } else {
                    user.setDob(null);
                }
                user.setAvatar(rs.getString("avatar"));
                user.setCreated_at(rs.getTimestamp("created_at"));
                user.setUpdated_at(rs.getTimestamp("updated_at"));
                user.setStatus(rs.getInt("status"));
                user.setIsVerified_email(rs.getInt("isVerified_email"));
                user.setSetting_id(rs.getInt("setting_id"));

                // Gán roleName dựa trên setting_id
                switch (user.getSetting_id()) {
                    case 2:
                        user.setRoleName("Manager");
                        break;
                    case 3:
                        user.setRoleName("Teacher");
                        break;
                    case 4:
                        user.setRoleName("Student");
                        break;
                    default:
                        user.setRoleName("Unknown");
                        break;
                }

                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return users;
    }

    @Override
    public boolean isUserExistsByPhone(String phone) {
        String sql = "SELECT COUNT(*) FROM user WHERE phone = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, phone);
            rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
