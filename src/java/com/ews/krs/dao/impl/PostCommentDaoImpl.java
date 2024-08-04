package com.ews.krs.dao.impl;

import com.ews.krs.dao.MyDAO;
import com.ews.krs.dao.PostCommentDao;
import com.ews.krs.model.PostComment;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PostCommentDaoImpl extends MyDAO implements PostCommentDao {

    @Override
    public int insertPostComment(PostComment postComment) {
        String sql = "INSERT INTO post_comment (post_id, user_id, comment, created_at) VALUES (?, ?, ?, NOW())";
        try {
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, postComment.getPost_id());
            ps.setInt(2, postComment.getUser_id());
            ps.setString(3, postComment.getComment());
//            ps.setDate(4, new java.sql.Date(postComment.getCreated_at().getTime()));
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Return the generated comment_id
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return 0;
    }

    @Override
    public void editPostComment(PostComment newPostComment) {
        String sql = "UPDATE post_comment SET post_id = ?, user_id = ?, comment = ?, created_at = ? WHERE comment_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, newPostComment.getPost_id());
            ps.setInt(2, newPostComment.getUser_id());
            ps.setString(3, newPostComment.getComment());
            ps.setDate(4, new java.sql.Date(newPostComment.getCreated_at().getTime()));
            ps.setInt(5, newPostComment.getComment_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    @Override
    public void deletePostCommentByPostId(int id) {
        String sql = "DELETE FROM post_comment WHERE post_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    @Override
    public void deletePostComment(int id) {
        String sql = "DELETE FROM post_comment WHERE comment_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    @Override
    public PostComment getPostComment(int id) {
        PostComment postComment = null;
        String sql = "SELECT * FROM post_comment WHERE comment_id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                postComment = new PostComment();
                postComment.setComment_id(rs.getInt("comment_id"));
                postComment.setPost_id(rs.getInt("post_id"));
                postComment.setUser_id(rs.getInt("user_id"));
                postComment.setComment(rs.getString("comment"));
                postComment.setCreated_at(rs.getDate("created_at"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return postComment;
    }

    @Override
    public List<PostComment> getAllPostComment() {
        List<PostComment> postComments = new ArrayList<>();
        String sql = "SELECT * FROM post_comment";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                PostComment postComment = new PostComment();
                postComment.setComment_id(rs.getInt("comment_id"));
                postComment.setPost_id(rs.getInt("post_id"));
                postComment.setUser_id(rs.getInt("user_id"));
                postComment.setComment(rs.getString("comment"));
                postComment.setCreated_at(rs.getDate("created_at"));
                postComments.add(postComment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return postComments;
    }
}
