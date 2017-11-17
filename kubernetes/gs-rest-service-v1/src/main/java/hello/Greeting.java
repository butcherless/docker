package hello;

import java.io.Serializable;

public class Greeting implements Serializable {

    private final Long id;
    private final String content;

    public Greeting(Long id, String content) {
        this.id = id;
        this.content = content;
    }

    public Long getId() {
        return id;
    }

    public String getContent() {
        return content;
    }
}
