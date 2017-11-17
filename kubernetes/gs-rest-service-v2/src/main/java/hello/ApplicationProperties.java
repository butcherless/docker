package hello;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.io.Serializable;

@Component
public class ApplicationProperties implements Serializable {
    @Value("${name}")
    private String name;

    @Value("${version}")
    private String version;

    public String getVersion() {
        return version;
    }

    public String getName() {

        return name;
    }

    public String getApplicationVersion() {
        return StringUtils.arrayToDelimitedString(
                new String[]{this.name, this.version}, ":");
    }
}
