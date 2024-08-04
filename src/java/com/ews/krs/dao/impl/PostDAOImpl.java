package com.ews.krs.dao.impl;

import com.ews.krs.dao.MyDAO;
import com.ews.krs.dao.PostDao;
import com.ews.krs.model.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDaoImpl extends MyDAO implements PostDao {
    @Override
    public void insertPost(Post post) {
        String sql = "INSERT INTO post (title, content, thumbnail, created_by, created_at, updated_at, setting_id, updated_by) VALUES (?, ?, ?, ?, NOW(), NOW(), ?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, post.getTitle());
            ps.setString(2, post.getContent());
            ps.setString(3, post.getThumbnail());
            ps.setInt(4, post.getCreated_by());
//            ps.setDate(5, new java.sql.Date(post.getCreated_at().getTime()));
//            ps.setDate(6, new java.sql.Date(post.getUpdated_at().getTime()));
            ps.setInt(5, post.getSetting_id());
            ps.setInt(6, post.getUpdated_by());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    @Override
    public void editPost(Post post) {
        String sql = "UPDATE post SET title = ?, content = ?, thumbnail = ?, created_by = ?, created_at = ?, updated_at = ?, setting_id = ?, updated_by = ? WHERE post_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, post.getTitle());
            ps.setString(2, post.getContent());
            ps.setString(3, post.getThumbnail());
            ps.setInt(4, post.getCreated_by());
            ps.setDate(5, new java.sql.Date(post.getCreated_at().getTime()));
            ps.setDate(6, new java.sql.Date(post.getUpdated_at().getTime()));
            ps.setInt(7, post.getSetting_id());
            ps.setInt(8, post.getUpdated_by());
            ps.setInt(9, post.getPost_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    @Override
    public void deletePost(Post post) {
        String sql = "DELETE FROM post WHERE post_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, post.getPost_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    @Override
    public List<Post> getAllPost() {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM post";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPost_id(rs.getInt("post_id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setThumbnail(rs.getString("thumbnail"));
                post.setCreated_at(rs.getDate("created_at"));
                post.setCreated_by(rs.getInt("created_by"));
                post.setUpdated_at(rs.getDate("updated_at"));
                post.setUpdated_by(rs.getInt("updated_by"));
                post.setSetting_id(rs.getInt("setting_id"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return posts;
    }

    @Override
    public List<Post> getAllPostById(int setting_id) {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM post WHERE setting_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, setting_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPost_id(rs.getInt("post_id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setThumbnail(rs.getString("thumbnail"));
                post.setCreated_at(rs.getDate("created_at"));
                post.setCreated_by(rs.getInt("created_by"));
                post.setUpdated_at(rs.getDate("updated_at"));
                post.setUpdated_by(rs.getInt("updated_by"));
                post.setSetting_id(rs.getInt("setting_id"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return posts;
    }

    @Override
    public Post getPostById(int id) {
        Post post = null;
        String sql = "SELECT * FROM post WHERE post_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                post = new Post();
                post.setPost_id(rs.getInt("post_id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setThumbnail(rs.getString("thumbnail"));
                post.setCreated_at(rs.getDate("created_at"));
                post.setCreated_by(rs.getInt("created_by"));
                post.setUpdated_at(rs.getDate("updated_at"));
                post.setUpdated_by(rs.getInt("updated_by"));
                post.setSetting_id(rs.getInt("setting_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return post;
    }

    @Override
    public List<Post> getPostByTitle(String title) {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM post WHERE title LIKE ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + title + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPost_id(rs.getInt("post_id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setThumbnail(rs.getString("thumbnail"));
                post.setCreated_at(rs.getDate("created_at"));
                post.setCreated_by(rs.getInt("created_by"));
                post.setUpdated_at(rs.getDate("updated_at"));
                post.setUpdated_by(rs.getInt("updated_by"));
                post.setSetting_id(rs.getInt("setting_id"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return posts;
    }


    @Override
    public List<Post> getFourLatestPost() {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM post ORDER BY created_at DESC LIMIT 4";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPost_id(rs.getInt("post_id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setThumbnail(rs.getString("thumbnail"));
                post.setCreated_at(rs.getDate("created_at"));
                post.setCreated_by(rs.getInt("created_by"));
                post.setUpdated_at(rs.getDate("updated_at"));
                post.setUpdated_by(rs.getInt("updated_by"));
                post.setSetting_id(rs.getInt("setting_id"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return posts;
    }

    @Override
    public List<Post> searchByTitle(String txtSearch) {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT * FROM post WHERE title LIKE ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPost_id(rs.getInt("post_id"));
                post.setTitle(rs.getString("title"));
                post.setContent(rs.getString("content"));
                post.setThumbnail(rs.getString("thumbnail"));
                post.setCreated_at(rs.getDate("created_at"));
                post.setCreated_by(rs.getInt("created_by"));
                post.setUpdated_at(rs.getDate("updated_at"));
                post.setUpdated_by(rs.getInt("updated_by"));
                post.setSetting_id(rs.getInt("setting_id"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return posts;
    }
}
