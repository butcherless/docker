package hello;

import java.io.Serializable;

public class Greeting implements Serializable {

    private final Long id;
    private final String content;
    private final String date;

    public Greeting(Long id, String content, String date) {
        this.id = id;
        this.content = content;
        this.date = date;
    }

    public Long getId() {
        return id;
    }

    public String getContent() {
        return content;
    }

    public String getDate() {
        return date;
    }
}
