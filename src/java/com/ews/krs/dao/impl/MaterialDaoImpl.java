/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ews.krs.dao.impl;

import com.ews.krs.dao.MaterialDao;
import com.ews.krs.dao.MyDAO;
import com.ews.krs.model.Material;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class MaterialDaoImpl extends MyDAO implements MaterialDao {

  public List<Material> getAll() {
    String sql = "SELECT * FROM krs.material";
    List<Material> list = new ArrayList<>();

    try {
      ps = con.prepareStatement(sql);
      rs = ps.executeQuery();
      while (rs.next()) {
        list.add(construct(rs));
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return list;
  }

  @Override
  public void insert(Material material) {
    String sql = "INSERT INTO krs.material (subject_id, material_file) VALUES (?, ?)";

    try (PreparedStatement ps = con.prepareStatement(sql)) {
      ps.setInt(1, material.getSubject_id());
      ps.setString(2, material.getMaterialFile());

      ps.executeUpdate();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  @Override
  public void edit(Material material) {
    String sql = "UPDATE krs.material SET material_file = ? WHERE id = ?";

    try (PreparedStatement ps = con.prepareStatement(sql)) {
      ps.setString(1, material.getMaterialFile());
      ps.setInt(2, material.getId());

      int rowsUpdated = ps.executeUpdate();
      if (rowsUpdated > 0) {
        System.out.println("Material with ID " + material.getId() + " updated successfully.");
      } else {
        System.out.println("Material update failed, no rows affected.");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  private Material construct(ResultSet rs) throws SQLException {
    return new Material(rs.getInt("id"), rs.getInt("subject_id"), rs.getString("material_file"));
  }

  public void delete(Material material) {
    String sql = "DELETE FROM krs.material WHERE id = ?";

    try (PreparedStatement ps = con.prepareStatement(sql)) {
      ps.setInt(1, material.getId());

      int rowsDeleted = ps.executeUpdate();
      if (rowsDeleted > 0) {
        System.out.println("Material with ID " + material.getId() + " deleted successfully.");
      } else {
        System.out.println("Material deletion failed, no rows affected.");
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  public Material get(int id) {
    String sql = "SELECT * FROM krs.material WHERE id = ?";
    Material material = null;

    try (PreparedStatement ps = con.prepareStatement(sql)) {
      ps.setInt(1, id);
      ResultSet rs = ps.executeQuery();

      if (rs.next()) {
        material = construct(rs);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }

    return material;
  }

}
