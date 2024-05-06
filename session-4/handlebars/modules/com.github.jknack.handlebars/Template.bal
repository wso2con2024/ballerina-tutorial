import templates.java.io as javaio;
import templates.java.lang as javalang;
import templates.java.util as javautil;

import ballerina/jballerina.java;
import ballerina/jballerina.java.arrays as jarrays;

# Ballerina class mapping for the Java `com.github.jknack.handlebars.Template` interface.
@java:Binding {'class: "com.github.jknack.handlebars.Template"}
public distinct class Template {

    *java:JObject;

    # The `handle` field that stores the reference to the `com.github.jknack.handlebars.Template` object.
    public handle jObj;

    # The init function of the Ballerina class mapping the `com.github.jknack.handlebars.Template` Java interface.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string representation of the Ballerina class mapping the `com.github.jknack.handlebars.Template` Java interface.
    #
    # + return - The `string` form of the Java object instance.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # The function that maps to the `apply` method of `com.github.jknack.handlebars.Template`.
    #
    # + arg0 - The `Context` value required to map with the Java method parameter.
    # + return - The `string` or the `javaio:IOException` value returning from the Java mapping.
    public function apply(Context arg0) returns string|javaio:IOException {
        handle|error externalObj = com_github_jknack_handlebars_Template_apply(self.jObj, arg0.jObj);
        if (externalObj is error) {
            javaio:IOException e = error javaio:IOException(javaio:IOEXCEPTION, externalObj, message = externalObj.message());
            return e;
        } else {
            return java:toString(externalObj) ?: "";
        }
    }

    # The function that maps to the `apply` method of `com.github.jknack.handlebars.Template`.
    #
    # + arg0 - The `Context` value required to map with the Java method parameter.
    # + arg1 - The `javaio:Writer` value required to map with the Java method parameter.
    # + return - The `javaio:IOException` value returning from the Java mapping.
    public function apply2(Context arg0, javaio:Writer arg1) returns javaio:IOException? {
        error|() externalObj = com_github_jknack_handlebars_Template_apply2(self.jObj, arg0.jObj, arg1.jObj);
        if (externalObj is error) {
            javaio:IOException e = error javaio:IOException(javaio:IOEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `apply` method of `com.github.jknack.handlebars.Template`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `string` or the `javaio:IOException` value returning from the Java mapping.
    public function apply3(javalang:Object arg0) returns string|javaio:IOException {
        handle|error externalObj = com_github_jknack_handlebars_Template_apply3(self.jObj, arg0.jObj);
        if (externalObj is error) {
            javaio:IOException e = error javaio:IOException(javaio:IOEXCEPTION, externalObj, message = externalObj.message());
            return e;
        } else {
            return java:toString(externalObj) ?: "";
        }
    }

    # The function that maps to the `apply` method of `com.github.jknack.handlebars.Template`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + arg1 - The `javaio:Writer` value required to map with the Java method parameter.
    # + return - The `javaio:IOException` value returning from the Java mapping.
    public function apply4(javalang:Object arg0, javaio:Writer arg1) returns javaio:IOException? {
        error|() externalObj = com_github_jknack_handlebars_Template_apply4(self.jObj, arg0.jObj, arg1.jObj);
        if (externalObj is error) {
            javaio:IOException e = error javaio:IOException(javaio:IOEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `as` method of `com.github.jknack.handlebars.Template`.
    #
    # + return - The `TypeSafeTemplate` value returning from the Java mapping.
    public function 'as() returns TypeSafeTemplate {
        handle externalObj = com_github_jknack_handlebars_Template_as(self.jObj);
        TypeSafeTemplate newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `as` method of `com.github.jknack.handlebars.Template`.
    #
    # + arg0 - The `javalang:Class` value required to map with the Java method parameter.
    # + return - The `TypeSafeTemplate` value returning from the Java mapping.
    public function as2(javalang:Class arg0) returns TypeSafeTemplate {
        handle externalObj = com_github_jknack_handlebars_Template_as2(self.jObj, arg0.jObj);
        TypeSafeTemplate newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `collect` method of `com.github.jknack.handlebars.Template`.
    #
    # + arg0 - The `TagType[]` value required to map with the Java method parameter.
    # + return - The `javautil:List` value returning from the Java mapping.
    public function collect(TagType[] arg0) returns javautil:List|error {
        handle externalObj = com_github_jknack_handlebars_Template_collect(self.jObj, check jarrays:toHandle(arg0, "com.github.jknack.handlebars.TagType"));
        javautil:List newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `collectReferenceParameters` method of `com.github.jknack.handlebars.Template`.
    #
    # + return - The `javautil:List` value returning from the Java mapping.
    public function collectReferenceParameters() returns javautil:List {
        handle externalObj = com_github_jknack_handlebars_Template_collectReferenceParameters(self.jObj);
        javautil:List newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `filename` method of `com.github.jknack.handlebars.Template`.
    #
    # + return - The `string` value returning from the Java mapping.
    public function filename() returns string {
        return java:toString(com_github_jknack_handlebars_Template_filename(self.jObj)) ?: "";
    }

    # The function that maps to the `position` method of `com.github.jknack.handlebars.Template`.
    #
    # + return - The `int[]` value returning from the Java mapping.
    public function position() returns int[]|error {
        handle externalObj = com_github_jknack_handlebars_Template_position(self.jObj);
        return <int[]>check jarrays:fromHandle(externalObj, "int");
    }

    # The function that maps to the `text` method of `com.github.jknack.handlebars.Template`.
    #
    # + return - The `string` value returning from the Java mapping.
    public function text() returns string {
        return java:toString(com_github_jknack_handlebars_Template_text(self.jObj)) ?: "";
    }

    # The function that maps to the `toJavaScript` method of `com.github.jknack.handlebars.Template`.
    #
    # + return - The `string` value returning from the Java mapping.
    public function toJavaScript() returns string {
        return java:toString(com_github_jknack_handlebars_Template_toJavaScript(self.jObj)) ?: "";
    }

}

# The function that retrieves the value of the public field `EMPTY`.
#
# + return - The `Template` value of the field.
public function Template_getEMPTY() returns Template {
    handle externalObj = com_github_jknack_handlebars_Template_getEMPTY();
    Template newObj = new (externalObj);
    return newObj;
}

function com_github_jknack_handlebars_Template_apply(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "apply",
    'class: "com.github.jknack.handlebars.Template",
    paramTypes: ["com.github.jknack.handlebars.Context"]
} external;

function com_github_jknack_handlebars_Template_apply2(handle receiver, handle arg0, handle arg1) returns error? = @java:Method {
    name: "apply",
    'class: "com.github.jknack.handlebars.Template",
    paramTypes: ["com.github.jknack.handlebars.Context", "java.io.Writer"]
} external;

function com_github_jknack_handlebars_Template_apply3(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "apply",
    'class: "com.github.jknack.handlebars.Template",
    paramTypes: ["java.lang.Object"]
} external;

function com_github_jknack_handlebars_Template_apply4(handle receiver, handle arg0, handle arg1) returns error? = @java:Method {
    name: "apply",
    'class: "com.github.jknack.handlebars.Template",
    paramTypes: ["java.lang.Object", "java.io.Writer"]
} external;

function com_github_jknack_handlebars_Template_as(handle receiver) returns handle = @java:Method {
    name: "as",
    'class: "com.github.jknack.handlebars.Template",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Template_as2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "as",
    'class: "com.github.jknack.handlebars.Template",
    paramTypes: ["java.lang.Class"]
} external;

function com_github_jknack_handlebars_Template_collect(handle receiver, handle arg0) returns handle = @java:Method {
    name: "collect",
    'class: "com.github.jknack.handlebars.Template",
    paramTypes: ["[Lcom.github.jknack.handlebars.TagType;"]
} external;

function com_github_jknack_handlebars_Template_collectReferenceParameters(handle receiver) returns handle = @java:Method {
    name: "collectReferenceParameters",
    'class: "com.github.jknack.handlebars.Template",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Template_filename(handle receiver) returns handle = @java:Method {
    name: "filename",
    'class: "com.github.jknack.handlebars.Template",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Template_position(handle receiver) returns handle = @java:Method {
    name: "position",
    'class: "com.github.jknack.handlebars.Template",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Template_text(handle receiver) returns handle = @java:Method {
    name: "text",
    'class: "com.github.jknack.handlebars.Template",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Template_toJavaScript(handle receiver) returns handle = @java:Method {
    name: "toJavaScript",
    'class: "com.github.jknack.handlebars.Template",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Template_getEMPTY() returns handle = @java:FieldGet {
    name: "EMPTY",
    'class: "com.github.jknack.handlebars.Template"
} external;

