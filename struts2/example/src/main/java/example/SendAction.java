package example;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

import com.google.gson.Gson;

public class SendAction extends ActionSupport {
    private String subject;
    private String body;
    private String receivers;

    public String send() {
        Gson converter = new Gson();
        List<Map> receiversList =
            converter.fromJson(this.receivers, List.class);

        System.out.println("\nTo: ");
        for (Map recv : receiversList) {
            if ("to".equals(recv.get("type"))) {
                System.out.println(recv.get("address"));
            }
        }
        System.out.println("\nCC: ");
        for (Map recv : receiversList) {
            if ("cc".equals(recv.get("type"))) {
                System.out.println(recv.get("address"));
            }
        }
        System.out.println("\nSubject: " + subject);
        System.out.println("\nBody: " + body);

        return SUCCESS;
    }

    public String getSubject() {
        return this.subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getBody() {
        return this.body;
    }
    public void setBody(String body) {
        this.body = body;
    }

    public String getReceivers() {
        return this.receivers;
    }
    public void setReceivers(String receivers) {
        this.receivers = receivers;
    }

}
