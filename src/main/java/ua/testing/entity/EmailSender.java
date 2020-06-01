package ua.testing.entity;

import lombok.*;

import java.io.*;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * <h1>Final Spring Project (option 12) – Student Testing</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-23
 */
@Getter
@Setter
public class EmailSender {
    private String to;

    public void sendEmail() {
        FileInputStream fis;
        Properties property = new Properties();
        try {
            fis = new FileInputStream("src/main/resources/mail.properties");
            property.load(fis);

        } catch (IOException e) {
            System.err.println("Error access to mail properties file!");
        }

        Session session = Session.getDefaultInstance(property);
        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(this.to));
            message.setSubject(property.getProperty("subject"));
            message.setText(property.getProperty("text"));
            message.setFrom(new InternetAddress(property.getProperty("mail.smtp.from")));

            Transport transport = session.getTransport(property.getProperty("mail.transport.protocol"));
            transport.connect(property.getProperty("mail.smtp.username"), property.getProperty("mail.smtp.password"));
            transport.sendMessage(message, message.getAllRecipients());
            System.out.println("Email sent successfully.");
            transport.close();

        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }

    public void setTo(String to) {
        this.to = to;
    }
}
