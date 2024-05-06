# Java Bindgen Tool

In this guide, we will use the Ballerina Bindgen tool to generate Ballerina bindings for the Handlebars Java library. Handlebars allows for the compilation and application of templates, which can be highly useful in various development scenarios.

Below is a simple example demonstrating the use of Handlebars in Java:

```java
Handlebars handlebars = new Handlebars();
Template template = handlebars.compileInline("Hi {{name}}!");
Map<String, String> parameterMap = new HashMap<>();
parameterMap.put("name", "Baeldung");

String templateString = template.apply(parameterMap);
```

## Key Points

1. **Generating Ballerina Bindings:**
   We will utilize the Bindgen tool to generate Ballerina bindings for the Handlebars library as follows:

```bash
bal bindgen -mvn com.github.jknack:handlebars:4.3.1 --public com.github.jknack.handlebars.Handlebars com.github.jknack.handlebars.Template import java.util.HashMap
```

This command generates Java bindings for the following classes along with their direct dependencies:
- `com.github.jknack.handlebars.Handlebars`
- `com.github.jknack.handlebars.Template`
- `java.util.HashMap`

2. **Using Bindings in Ballerina:**
   After the bindings are generated, you can use the created Ballerina bindings to leverage the Handlebars library in Ballerina. See `main.bal` for an example.

## Useful Resources

- [Call Java Code from Ballerina](https://ballerina.io/learn/call-java-code-from-ballerina/)
- [Ballerina Foreign Function Interface](https://ballerina.io/learn/ballerina-ffi/)
- [Bindgen Tool Documentation](https://ballerina.io/learn/the-bindgen-tool/)
