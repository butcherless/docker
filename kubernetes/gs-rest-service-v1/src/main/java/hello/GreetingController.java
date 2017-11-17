package hello;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.atomic.AtomicLong;

@RestController
public class GreetingController {
    private static final Logger log = LoggerFactory.getLogger(GreetingController.class);

    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();


    @Autowired
    private ApplicationProperties properties;

    @GetMapping("/greeting")
    public Greeting greeting(@RequestParam(value = "name", defaultValue = "World") String name) {
        log.info("greeting: {}", name);
        return new Greeting(
                counter.incrementAndGet(),
                String.format(template, name)
        );
    }

    @GetMapping("/version")
    public String version() {
        log.info("version: {}:{}", this.properties.getApplicationVersion());
        return this.properties.getApplicationVersion();
    }

}
