package com.ews.krs.controller.user;

import com.ews.krs.model.AdminContact;
import com.ews.krs.model.User;
import com.ews.krs.service.AdminContactService;
import com.ews.krs.service.impl.AdminContactServiceImpl;
import com.ews.krs.util.MailUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class ContactController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/user/contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String message = request.getParameter("message");
        String subject = request.getParameter("subject");
        String mobile = request.getParameter("mobile");
        String contactType = request.getParameter("contact_type");

        AdminContact adminContact = new AdminContact();

        AdminContactService adminContactService = new AdminContactServiceImpl();

        if(contactType.equals("contact_admin")){
            adminContact.setSetting_id(12);
        } else if(contactType.equals("issue_class")){
            adminContact.setSetting_id(13);
        } else if(contactType.equals("issue_subject")){
            adminContact.setSetting_id(14);
        }

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if(user != null) {
            adminContact.setCreate_by(user.getUser_id());
        } else {
            adminContact.setCreate_by(2);
        }

        if (isInputValid(email, name, message, subject)) {
            try {
                sendContactEmail(email, subject, message, name);

                adminContact.setEmail(email);
                adminContact.setFull_name(name);
                adminContact.setSubject_name(subject);
                adminContact.setMessage(message);
                adminContact.setMobile(mobile);
                adminContactService.insertAdminContact(adminContact);
                response.sendRedirect(request.getContextPath() + "/contact?success=true");
            } catch (Exception e) {
                response.sendRedirect(request.getContextPath() + "/contact?error=true");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/contact?error=validation");
        }
    }

    private boolean isInputValid(String email, String name, String message, String subject) {
        return email != null && !email.isEmpty() &&
                name != null && !name.isEmpty() &&
                message != null && !message.isEmpty() &&
                subject != null && !subject.isEmpty();
    }

    private void sendContactEmail(String email, String subject, String message, String name) throws Exception {
        MailUtils.sendContactMail(email, subject, message, name);
    }
}
