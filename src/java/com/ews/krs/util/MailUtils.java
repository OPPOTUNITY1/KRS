package com.ews.krs.util;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Properties;

public class MailUtils {
    public static void sendVerificationEmail(String recipientEmail, String verificationCode) {
        String subject = "Your Verification Code";
        String message = "Here is your verification code: " + verificationCode;
        sendMail(recipientEmail, subject, message);
    }

    public static void sendNewPassEmail(String recipientEmail, String password, String username) {
        String subject = "Change Password Successfully";
        String message = "Your account: "+ username + "\nYour new password is: " + password;
        sendMail(recipientEmail, subject, message);
    }

    public static void sendAccountForEmail(String recipientEmail,String username, String password) {
        String subject = "Password Default For Your Account";
        String message = "Your username: "+ username + "\n" + "Your password is: " + password;
        sendMail(recipientEmail, subject, message);
    }

    public static void sendContactMail(String email, String subject, String mess, String name) {
        String text = "My Name: " + name + "\n" +
                "My Email: " + email + "\n" +
                "Message: " + mess;
        //Mail admin
        sendMail("esteemws203@gmail.com", subject, text);
    }

    public static void sendInfoMail(String email, String subject) {
        String text = "Dear " + email + ",\n\n" +
                "We are excited to introduce you to our online learning platform, LearnOnline. " +
                "Our website offers a variety of courses designed to help you develop new skills and knowledge " +
                "from the comfort of your home. Whether you are looking to enhance your professional skills, " +
                "learn a new hobby, or advance your education, we have something for everyone.\n\n" +
                "Here are some of the courses we offer:\n" +
                "1. Web Development: Learn the fundamentals of web development, including HTML, CSS, JavaScript, and more.\n" +
                "2. Data Science: Dive into the world of data analysis and machine learning with our comprehensive data science courses.\n" +
                "3. Graphic Design: Explore your creativity and learn the principles of design using tools like Photoshop and Illustrator.\n" +
                "4. Business Management: Develop your management skills and learn how to effectively lead teams and projects.\n" +
                "5. Language Learning: Improve your proficiency in various languages such as English, Spanish, French, and more.\n\n" +
                "You can explore all our courses and sign up for the ones that interest you by visiting our website: " +
                "http://localhost:9999/KRS/subject\n\n" +
                "We hope you find our courses engaging and beneficial. Happy learning!\n\n" +
                "Best regards,\n" +
                "The LearnOnline Team";
        sendMail(email, subject, text);
    }


    public static void sendMail(String to, String subject, String text) {
        final String from = "esteemws203@gmail.com";
        final String password = "negywybqoohnrpbw";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(text);
            Transport.send(message);
        } catch (MessagingException ignored) {
        }
    }
}

