import templates.com.github.jknack.handlebars.cache as comgithubjknackhandlebarscache;
import templates.com.github.jknack.handlebars.io as comgithubjknackhandlebarsio;
import templates.java.io as javaio;
import templates.java.lang as javalang;
import templates.java.net as javanet;
import templates.java.nio.charset as javaniocharset;
import templates.java.util as javautil;

import ballerina/jballerina.java;
import ballerina/jballerina.java.arrays as jarrays;

# Ballerina class mapping for the Java `com.github.jknack.handlebars.Handlebars` class.
@java:Binding {'class: "com.github.jknack.handlebars.Handlebars"}
public distinct class Handlebars {

    *java:JObject;
    *javalang:Object;

    # The `handle` field that stores the reference to the `com.github.jknack.handlebars.Handlebars` object.
    public handle jObj;

    # The init function of the Ballerina class mapping the `com.github.jknack.handlebars.Handlebars` Java class.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string representation of the Ballerina class mapping the `com.github.jknack.handlebars.Handlebars` Java class.
    #
    # + return - The `string` form of the Java object instance.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # The function that maps to the `compile` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Template` or the `javaio:IOException` value returning from the Java mapping.
    public function compile(string arg0) returns Template|javaio:IOException {
        handle|error externalObj = com_github_jknack_handlebars_Handlebars_compile(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            javaio:IOException e = error javaio:IOException(javaio:IOEXCEPTION, externalObj, message = externalObj.message());
            return e;
        } else {
            Template newObj = new (externalObj);
            return newObj;
        }
    }

    # The function that maps to the `compile` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `string` value required to map with the Java method parameter.
    # + arg2 - The `string` value required to map with the Java method parameter.
    # + return - The `Template` or the `javaio:IOException` value returning from the Java mapping.
    public function compile2(string arg0, string arg1, string arg2) returns Template|javaio:IOException {
        handle|error externalObj = com_github_jknack_handlebars_Handlebars_compile2(self.jObj, java:fromString(arg0), java:fromString(arg1), java:fromString(arg2));
        if (externalObj is error) {
            javaio:IOException e = error javaio:IOException(javaio:IOEXCEPTION, externalObj, message = externalObj.message());
            return e;
        } else {
            Template newObj = new (externalObj);
            return newObj;
        }
    }

    # The function that maps to the `compile` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `comgithubjknackhandlebarsio:TemplateSource` value required to map with the Java method parameter.
    # + return - The `Template` or the `javaio:IOException` value returning from the Java mapping.
    public function compile3(comgithubjknackhandlebarsio:TemplateSource arg0) returns Template|javaio:IOException {
        handle|error externalObj = com_github_jknack_handlebars_Handlebars_compile3(self.jObj, arg0.jObj);
        if (externalObj is error) {
            javaio:IOException e = error javaio:IOException(javaio:IOEXCEPTION, externalObj, message = externalObj.message());
            return e;
        } else {
            Template newObj = new (externalObj);
            return newObj;
        }
    }

    # The function that maps to the `compile` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `comgithubjknackhandlebarsio:TemplateSource` value required to map with the Java method parameter.
    # + arg1 - The `string` value required to map with the Java method parameter.
    # + arg2 - The `string` value required to map with the Java method parameter.
    # + return - The `Template` or the `javaio:IOException` value returning from the Java mapping.
    public function compile4(comgithubjknackhandlebarsio:TemplateSource arg0, string arg1, string arg2) returns Template|javaio:IOException {
        handle|error externalObj = com_github_jknack_handlebars_Handlebars_compile4(self.jObj, arg0.jObj, java:fromString(arg1), java:fromString(arg2));
        if (externalObj is error) {
            javaio:IOException e = error javaio:IOException(javaio:IOEXCEPTION, externalObj, message = externalObj.message());
            return e;
        } else {
            Template newObj = new (externalObj);
            return newObj;
        }
    }

    # The function that maps to the `compileInline` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Template` or the `javaio:IOException` value returning from the Java mapping.
    public function compileInline(string arg0) returns Template|javaio:IOException {
        handle|error externalObj = com_github_jknack_handlebars_Handlebars_compileInline(self.jObj, java:fromString(arg0));
        if (externalObj is error) {
            javaio:IOException e = error javaio:IOException(javaio:IOEXCEPTION, externalObj, message = externalObj.message());
            return e;
        } else {
            Template newObj = new (externalObj);
            return newObj;
        }
    }

    # The function that maps to the `compileInline` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `string` value required to map with the Java method parameter.
    # + arg2 - The `string` value required to map with the Java method parameter.
    # + return - The `Template` or the `javaio:IOException` value returning from the Java mapping.
    public function compileInline2(string arg0, string arg1, string arg2) returns Template|javaio:IOException {
        handle|error externalObj = com_github_jknack_handlebars_Handlebars_compileInline2(self.jObj, java:fromString(arg0), java:fromString(arg1), java:fromString(arg2));
        if (externalObj is error) {
            javaio:IOException e = error javaio:IOException(javaio:IOEXCEPTION, externalObj, message = externalObj.message());
            return e;
        } else {
            Template newObj = new (externalObj);
            return newObj;
        }
    }

    # The function that maps to the `decorator` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Decorator` value returning from the Java mapping.
    public function decorator(string arg0) returns Decorator {
        handle externalObj = com_github_jknack_handlebars_Handlebars_decorator(self.jObj, java:fromString(arg0));
        Decorator newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `deletePartialAfterMerge` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `boolean` value returning from the Java mapping.
    public function deletePartialAfterMerge() returns boolean {
        return com_github_jknack_handlebars_Handlebars_deletePartialAfterMerge(self.jObj);
    }

    # The function that maps to the `deletePartialAfterMerge` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `boolean` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function deletePartialAfterMerge2(boolean arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_deletePartialAfterMerge2(self.jObj, arg0);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `endDelimiter` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function endDelimiter(string arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_endDelimiter(self.jObj, java:fromString(arg0));
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `equals` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function 'equals(javalang:Object arg0) returns boolean {
        return com_github_jknack_handlebars_Handlebars_equals(self.jObj, arg0.jObj);
    }

    # The function that maps to the `getCache` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `comgithubjknackhandlebarscache:TemplateCache` value returning from the Java mapping.
    public function getCache() returns comgithubjknackhandlebarscache:TemplateCache {
        handle externalObj = com_github_jknack_handlebars_Handlebars_getCache(self.jObj);
        comgithubjknackhandlebarscache:TemplateCache newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getCharset` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `javaniocharset:Charset` value returning from the Java mapping.
    public function getCharset() returns javaniocharset:Charset {
        handle externalObj = com_github_jknack_handlebars_Handlebars_getCharset(self.jObj);
        javaniocharset:Charset newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getClass` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `javalang:Class` value returning from the Java mapping.
    public function getClass() returns javalang:Class {
        handle externalObj = com_github_jknack_handlebars_Handlebars_getClass(self.jObj);
        javalang:Class newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getEndDelimiter` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `string` value returning from the Java mapping.
    public function getEndDelimiter() returns string {
        return java:toString(com_github_jknack_handlebars_Handlebars_getEndDelimiter(self.jObj)) ?: "";
    }

    # The function that maps to the `getEscapingStrategy` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `EscapingStrategy` value returning from the Java mapping.
    public function getEscapingStrategy() returns EscapingStrategy {
        handle externalObj = com_github_jknack_handlebars_Handlebars_getEscapingStrategy(self.jObj);
        EscapingStrategy newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getFormatter` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `Chain` value returning from the Java mapping.
    public function getFormatter() returns Chain {
        handle externalObj = com_github_jknack_handlebars_Handlebars_getFormatter(self.jObj);
        Chain newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getLoader` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `comgithubjknackhandlebarsio:TemplateLoader` value returning from the Java mapping.
    public function getLoader() returns comgithubjknackhandlebarsio:TemplateLoader {
        handle externalObj = com_github_jknack_handlebars_Handlebars_getLoader(self.jObj);
        comgithubjknackhandlebarsio:TemplateLoader newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getParserFactory` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `ParserFactory` value returning from the Java mapping.
    public function getParserFactory() returns ParserFactory {
        handle externalObj = com_github_jknack_handlebars_Handlebars_getParserFactory(self.jObj);
        ParserFactory newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getStartDelimiter` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `string` value returning from the Java mapping.
    public function getStartDelimiter() returns string {
        return java:toString(com_github_jknack_handlebars_Handlebars_getStartDelimiter(self.jObj)) ?: "";
    }

    # The function that maps to the `handlebarsJsFile` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `string` value returning from the Java mapping.
    public function handlebarsJsFile() returns string {
        return java:toString(com_github_jknack_handlebars_Handlebars_handlebarsJsFile(self.jObj)) ?: "";
    }

    # The function that maps to the `handlebarsJsFile` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function handlebarsJsFile2(string arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_handlebarsJsFile2(self.jObj, java:fromString(arg0));
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `hashCode` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `int` value returning from the Java mapping.
    public function hashCode() returns int {
        return com_github_jknack_handlebars_Handlebars_hashCode(self.jObj);
    }

    # The function that maps to the `helper` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Helper` value returning from the Java mapping.
    public function helper(string arg0) returns Helper {
        handle externalObj = com_github_jknack_handlebars_Handlebars_helper(self.jObj, java:fromString(arg0));
        Helper newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `helpers` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `javautil:Set` value returning from the Java mapping.
    public function helpers() returns javautil:Set {
        handle externalObj = com_github_jknack_handlebars_Handlebars_helpers(self.jObj);
        javautil:Set newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `infiniteLoops` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `boolean` value returning from the Java mapping.
    public function infiniteLoops() returns boolean {
        return com_github_jknack_handlebars_Handlebars_infiniteLoops(self.jObj);
    }

    # The function that maps to the `infiniteLoops` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `boolean` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function infiniteLoops2(boolean arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_infiniteLoops2(self.jObj, arg0);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `notify` method of `com.github.jknack.handlebars.Handlebars`.
    public function notify() {
        com_github_jknack_handlebars_Handlebars_notify(self.jObj);
    }

    # The function that maps to the `notifyAll` method of `com.github.jknack.handlebars.Handlebars`.
    public function notifyAll() {
        com_github_jknack_handlebars_Handlebars_notifyAll(self.jObj);
    }

    # The function that maps to the `parentScopeResolution` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `boolean` value returning from the Java mapping.
    public function parentScopeResolution() returns boolean {
        return com_github_jknack_handlebars_Handlebars_parentScopeResolution(self.jObj);
    }

    # The function that maps to the `parentScopeResolution` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `boolean` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function parentScopeResolution2(boolean arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_parentScopeResolution2(self.jObj, arg0);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `preEvaluatePartialBlocks` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `boolean` value returning from the Java mapping.
    public function preEvaluatePartialBlocks() returns boolean {
        return com_github_jknack_handlebars_Handlebars_preEvaluatePartialBlocks(self.jObj);
    }

    # The function that maps to the `preEvaluatePartialBlocks` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `boolean` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function preEvaluatePartialBlocks2(boolean arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_preEvaluatePartialBlocks2(self.jObj, arg0);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `precompile` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `string` value returning from the Java mapping.
    public function precompile(string arg0) returns string {
        return java:toString(com_github_jknack_handlebars_Handlebars_precompile(self.jObj, java:fromString(arg0))) ?: "";
    }

    # The function that maps to the `precompileInline` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `string` value returning from the Java mapping.
    public function precompileInline(string arg0) returns string {
        return java:toString(com_github_jknack_handlebars_Handlebars_precompileInline(self.jObj, java:fromString(arg0))) ?: "";
    }

    # The function that maps to the `prettyPrint` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `boolean` value returning from the Java mapping.
    public function prettyPrint() returns boolean {
        return com_github_jknack_handlebars_Handlebars_prettyPrint(self.jObj);
    }

    # The function that maps to the `prettyPrint` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `boolean` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function prettyPrint2(boolean arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_prettyPrint2(self.jObj, arg0);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `registerDecorator` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `Decorator` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function registerDecorator(string arg0, Decorator arg1) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_registerDecorator(self.jObj, java:fromString(arg0), arg1.jObj);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `registerHelper` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `Helper` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function registerHelper(string arg0, Helper arg1) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_registerHelper(self.jObj, java:fromString(arg0), arg1.jObj);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `registerHelperMissing` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `Helper` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function registerHelperMissing(Helper arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_registerHelperMissing(self.jObj, arg0.jObj);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `registerHelpers` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `javalang:Class` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function registerHelpers(javalang:Class arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_registerHelpers(self.jObj, arg0.jObj);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `registerHelpers` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `javaio:File` value required to map with the Java method parameter.
    # + return - The `Handlebars` or the `javalang:Exception` value returning from the Java mapping.
    public function registerHelpers2(javaio:File arg0) returns Handlebars|javalang:Exception {
        handle|error externalObj = com_github_jknack_handlebars_Handlebars_registerHelpers2(self.jObj, arg0.jObj);
        if (externalObj is error) {
            javalang:Exception e = error javalang:Exception(javalang:EXCEPTION, externalObj, message = externalObj.message());
            return e;
        } else {
            Handlebars newObj = new (externalObj);
            return newObj;
        }
    }

    # The function that maps to the `registerHelpers` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function registerHelpers3(javalang:Object arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_registerHelpers3(self.jObj, arg0.jObj);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `registerHelpers` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `javaio:InputStream` value required to map with the Java method parameter.
    # + return - The `Handlebars` or the `javalang:Exception` value returning from the Java mapping.
    public function registerHelpers4(string arg0, javaio:InputStream arg1) returns Handlebars|javalang:Exception {
        handle|error externalObj = com_github_jknack_handlebars_Handlebars_registerHelpers4(self.jObj, java:fromString(arg0), arg1.jObj);
        if (externalObj is error) {
            javalang:Exception e = error javalang:Exception(javalang:EXCEPTION, externalObj, message = externalObj.message());
            return e;
        } else {
            Handlebars newObj = new (externalObj);
            return newObj;
        }
    }

    # The function that maps to the `registerHelpers` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `javaio:Reader` value required to map with the Java method parameter.
    # + return - The `Handlebars` or the `javalang:Exception` value returning from the Java mapping.
    public function registerHelpers5(string arg0, javaio:Reader arg1) returns Handlebars|javalang:Exception {
        handle|error externalObj = com_github_jknack_handlebars_Handlebars_registerHelpers5(self.jObj, java:fromString(arg0), arg1.jObj);
        if (externalObj is error) {
            javalang:Exception e = error javalang:Exception(javalang:EXCEPTION, externalObj, message = externalObj.message());
            return e;
        } else {
            Handlebars newObj = new (externalObj);
            return newObj;
        }
    }

    # The function that maps to the `registerHelpers` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + arg1 - The `string` value required to map with the Java method parameter.
    # + return - The `Handlebars` or the `javaio:IOException` value returning from the Java mapping.
    public function registerHelpers6(string arg0, string arg1) returns Handlebars|javaio:IOException {
        handle|error externalObj = com_github_jknack_handlebars_Handlebars_registerHelpers6(self.jObj, java:fromString(arg0), java:fromString(arg1));
        if (externalObj is error) {
            javaio:IOException e = error javaio:IOException(javaio:IOEXCEPTION, externalObj, message = externalObj.message());
            return e;
        } else {
            Handlebars newObj = new (externalObj);
            return newObj;
        }
    }

    # The function that maps to the `registerHelpers` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `javanet:URI` value required to map with the Java method parameter.
    # + return - The `Handlebars` or the `javalang:Exception` value returning from the Java mapping.
    public function registerHelpers7(javanet:URI arg0) returns Handlebars|javalang:Exception {
        handle|error externalObj = com_github_jknack_handlebars_Handlebars_registerHelpers7(self.jObj, arg0.jObj);
        if (externalObj is error) {
            javalang:Exception e = error javalang:Exception(javalang:EXCEPTION, externalObj, message = externalObj.message());
            return e;
        } else {
            Handlebars newObj = new (externalObj);
            return newObj;
        }
    }

    # The function that maps to the `setCharset` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `javaniocharset:Charset` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function setCharset(javaniocharset:Charset arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_setCharset(self.jObj, arg0.jObj);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `setDeletePartialAfterMerge` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `boolean` value required to map with the Java method parameter.
    public function setDeletePartialAfterMerge(boolean arg0) {
        com_github_jknack_handlebars_Handlebars_setDeletePartialAfterMerge(self.jObj, arg0);
    }

    # The function that maps to the `setEndDelimiter` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    public function setEndDelimiter(string arg0) {
        com_github_jknack_handlebars_Handlebars_setEndDelimiter(self.jObj, java:fromString(arg0));
    }

    # The function that maps to the `setInfiniteLoops` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `boolean` value required to map with the Java method parameter.
    public function setInfiniteLoops(boolean arg0) {
        com_github_jknack_handlebars_Handlebars_setInfiniteLoops(self.jObj, arg0);
    }

    # The function that maps to the `setParentScopeResolution` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `boolean` value required to map with the Java method parameter.
    public function setParentScopeResolution(boolean arg0) {
        com_github_jknack_handlebars_Handlebars_setParentScopeResolution(self.jObj, arg0);
    }

    # The function that maps to the `setPreEvaluatePartialBlocks` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `boolean` value required to map with the Java method parameter.
    public function setPreEvaluatePartialBlocks(boolean arg0) {
        com_github_jknack_handlebars_Handlebars_setPreEvaluatePartialBlocks(self.jObj, arg0);
    }

    # The function that maps to the `setPrettyPrint` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `boolean` value required to map with the Java method parameter.
    public function setPrettyPrint(boolean arg0) {
        com_github_jknack_handlebars_Handlebars_setPrettyPrint(self.jObj, arg0);
    }

    # The function that maps to the `setStartDelimiter` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    public function setStartDelimiter(string arg0) {
        com_github_jknack_handlebars_Handlebars_setStartDelimiter(self.jObj, java:fromString(arg0));
    }

    # The function that maps to the `setStringParams` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `boolean` value required to map with the Java method parameter.
    public function setStringParams(boolean arg0) {
        com_github_jknack_handlebars_Handlebars_setStringParams(self.jObj, arg0);
    }

    # The function that maps to the `startDelimiter` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `string` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function startDelimiter(string arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_startDelimiter(self.jObj, java:fromString(arg0));
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `stringParams` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `boolean` value returning from the Java mapping.
    public function stringParams() returns boolean {
        return com_github_jknack_handlebars_Handlebars_stringParams(self.jObj);
    }

    # The function that maps to the `stringParams` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `boolean` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function stringParams2(boolean arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_stringParams2(self.jObj, arg0);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `wait` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + return - The `javalang:InterruptedException` value returning from the Java mapping.
    public function 'wait() returns javalang:InterruptedException? {
        error|() externalObj = com_github_jknack_handlebars_Handlebars_wait(self.jObj);
        if (externalObj is error) {
            javalang:InterruptedException e = error javalang:InterruptedException(javalang:INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `javalang:InterruptedException` value returning from the Java mapping.
    public function wait2(int arg0) returns javalang:InterruptedException? {
        error|() externalObj = com_github_jknack_handlebars_Handlebars_wait2(self.jObj, arg0);
        if (externalObj is error) {
            javalang:InterruptedException e = error javalang:InterruptedException(javalang:INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `javalang:InterruptedException` value returning from the Java mapping.
    public function wait3(int arg0, int arg1) returns javalang:InterruptedException? {
        error|() externalObj = com_github_jknack_handlebars_Handlebars_wait3(self.jObj, arg0, arg1);
        if (externalObj is error) {
            javalang:InterruptedException e = error javalang:InterruptedException(javalang:INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `with` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `EscapingStrategy` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function 'with(EscapingStrategy arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_with(self.jObj, arg0.jObj);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `with` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `EscapingStrategy[]` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function with2(EscapingStrategy[] arg0) returns Handlebars|error {
        handle externalObj = com_github_jknack_handlebars_Handlebars_with2(self.jObj, check jarrays:toHandle(arg0, "com.github.jknack.handlebars.EscapingStrategy"));
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `with` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `Formatter` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function with3(Formatter arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_with3(self.jObj, arg0.jObj);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `with` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `HelperRegistry` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function with4(HelperRegistry arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_with4(self.jObj, arg0.jObj);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `with` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `ParserFactory` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function with5(ParserFactory arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_with5(self.jObj, arg0.jObj);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `with` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `comgithubjknackhandlebarscache:TemplateCache` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function with6(comgithubjknackhandlebarscache:TemplateCache arg0) returns Handlebars {
        handle externalObj = com_github_jknack_handlebars_Handlebars_with6(self.jObj, arg0.jObj);
        Handlebars newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `with` method of `com.github.jknack.handlebars.Handlebars`.
    #
    # + arg0 - The `comgithubjknackhandlebarsio:TemplateLoader[]` value required to map with the Java method parameter.
    # + return - The `Handlebars` value returning from the Java mapping.
    public function with7(comgithubjknackhandlebarsio:TemplateLoader[] arg0) returns Handlebars|error {
        handle externalObj = com_github_jknack_handlebars_Handlebars_with7(self.jObj, check jarrays:toHandle(arg0, "com.github.jknack.handlebars.io.TemplateLoader"));
        Handlebars newObj = new (externalObj);
        return newObj;
    }

}

# The constructor function to generate an object of `com.github.jknack.handlebars.Handlebars`.
#
# + return - The new `Handlebars` class generated.
public function newHandlebars1() returns Handlebars {
    handle externalObj = com_github_jknack_handlebars_Handlebars_newHandlebars1();
    Handlebars newObj = new (externalObj);
    return newObj;
}

# The constructor function to generate an object of `com.github.jknack.handlebars.Handlebars`.
#
# + arg0 - The `comgithubjknackhandlebarsio:TemplateLoader` value required to map with the Java constructor parameter.
# + return - The new `Handlebars` class generated.
public function newHandlebars2(comgithubjknackhandlebarsio:TemplateLoader arg0) returns Handlebars {
    handle externalObj = com_github_jknack_handlebars_Handlebars_newHandlebars2(arg0.jObj);
    Handlebars newObj = new (externalObj);
    return newObj;
}

# The function that maps to the `debug` method of `com.github.jknack.handlebars.Handlebars`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
public function Handlebars_debug(string arg0) {
    com_github_jknack_handlebars_Handlebars_debug(java:fromString(arg0));
}

# The function that maps to the `debug` method of `com.github.jknack.handlebars.Handlebars`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
# + arg1 - The `javalang:Object[]` value required to map with the Java method parameter.
# + return - The `error?` value returning from the Java mapping.
public function Handlebars_debug2(string arg0, javalang:Object[] arg1) returns error? {
    com_github_jknack_handlebars_Handlebars_debug2(java:fromString(arg0), check jarrays:toHandle(arg1, "java.lang.Object"));
}

# The function that maps to the `error` method of `com.github.jknack.handlebars.Handlebars`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
public function Handlebars_error(string arg0) {
    com_github_jknack_handlebars_Handlebars_error(java:fromString(arg0));
}

# The function that maps to the `error` method of `com.github.jknack.handlebars.Handlebars`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
# + arg1 - The `javalang:Object[]` value required to map with the Java method parameter.
# + return - The `error?` value returning from the Java mapping.
public function Handlebars_error2(string arg0, javalang:Object[] arg1) returns error? {
    com_github_jknack_handlebars_Handlebars_error2(java:fromString(arg0), check jarrays:toHandle(arg1, "java.lang.Object"));
}

# The function that maps to the `log` method of `com.github.jknack.handlebars.Handlebars`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
public function Handlebars_log(string arg0) {
    com_github_jknack_handlebars_Handlebars_log(java:fromString(arg0));
}

# The function that maps to the `log` method of `com.github.jknack.handlebars.Handlebars`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
# + arg1 - The `javalang:Object[]` value required to map with the Java method parameter.
# + return - The `error?` value returning from the Java mapping.
public function Handlebars_log2(string arg0, javalang:Object[] arg1) returns error? {
    com_github_jknack_handlebars_Handlebars_log2(java:fromString(arg0), check jarrays:toHandle(arg1, "java.lang.Object"));
}

# The function that maps to the `warn` method of `com.github.jknack.handlebars.Handlebars`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
public function Handlebars_warn(string arg0) {
    com_github_jknack_handlebars_Handlebars_warn(java:fromString(arg0));
}

# The function that maps to the `warn` method of `com.github.jknack.handlebars.Handlebars`.
#
# + arg0 - The `string` value required to map with the Java method parameter.
# + arg1 - The `javalang:Object[]` value required to map with the Java method parameter.
# + return - The `error?` value returning from the Java mapping.
public function Handlebars_warn2(string arg0, javalang:Object[] arg1) returns error? {
    com_github_jknack_handlebars_Handlebars_warn2(java:fromString(arg0), check jarrays:toHandle(arg1, "java.lang.Object"));
}

# The function that retrieves the value of the public field `DELIM_START`.
#
# + return - The `string` value of the field.
public function Handlebars_getDELIM_START() returns string {
    return java:toString(com_github_jknack_handlebars_Handlebars_getDELIM_START()) ?: "";
}

# The function that retrieves the value of the public field `DELIM_END`.
#
# + return - The `string` value of the field.
public function Handlebars_getDELIM_END() returns string {
    return java:toString(com_github_jknack_handlebars_Handlebars_getDELIM_END()) ?: "";
}

# The function that retrieves the value of the public field `HELPER_MISSING`.
#
# + return - The `string` value of the field.
public function Handlebars_getHELPER_MISSING() returns string {
    return java:toString(com_github_jknack_handlebars_Handlebars_getHELPER_MISSING()) ?: "";
}

function com_github_jknack_handlebars_Handlebars_compile(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "compile",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_compile2(handle receiver, handle arg0, handle arg1, handle arg2) returns handle|error = @java:Method {
    name: "compile",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String", "java.lang.String", "java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_compile3(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "compile",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["com.github.jknack.handlebars.io.TemplateSource"]
} external;

function com_github_jknack_handlebars_Handlebars_compile4(handle receiver, handle arg0, handle arg1, handle arg2) returns handle|error = @java:Method {
    name: "compile",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["com.github.jknack.handlebars.io.TemplateSource", "java.lang.String", "java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_compileInline(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "compileInline",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_compileInline2(handle receiver, handle arg0, handle arg1, handle arg2) returns handle|error = @java:Method {
    name: "compileInline",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String", "java.lang.String", "java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_debug(handle arg0) = @java:Method {
    name: "debug",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_debug2(handle arg0, handle arg1) = @java:Method {
    name: "debug",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String", "[Ljava.lang.Object;"]
} external;

function com_github_jknack_handlebars_Handlebars_decorator(handle receiver, handle arg0) returns handle = @java:Method {
    name: "decorator",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_deletePartialAfterMerge(handle receiver) returns boolean = @java:Method {
    name: "deletePartialAfterMerge",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_deletePartialAfterMerge2(handle receiver, boolean arg0) returns handle = @java:Method {
    name: "deletePartialAfterMerge",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["boolean"]
} external;

function com_github_jknack_handlebars_Handlebars_endDelimiter(handle receiver, handle arg0) returns handle = @java:Method {
    name: "endDelimiter",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.Object"]
} external;

function com_github_jknack_handlebars_Handlebars_error(handle arg0) = @java:Method {
    name: "error",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_error2(handle arg0, handle arg1) = @java:Method {
    name: "error",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String", "[Ljava.lang.Object;"]
} external;

function com_github_jknack_handlebars_Handlebars_getCache(handle receiver) returns handle = @java:Method {
    name: "getCache",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_getCharset(handle receiver) returns handle = @java:Method {
    name: "getCharset",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_getEndDelimiter(handle receiver) returns handle = @java:Method {
    name: "getEndDelimiter",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_getEscapingStrategy(handle receiver) returns handle = @java:Method {
    name: "getEscapingStrategy",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_getFormatter(handle receiver) returns handle = @java:Method {
    name: "getFormatter",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_getLoader(handle receiver) returns handle = @java:Method {
    name: "getLoader",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_getParserFactory(handle receiver) returns handle = @java:Method {
    name: "getParserFactory",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_getStartDelimiter(handle receiver) returns handle = @java:Method {
    name: "getStartDelimiter",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_handlebarsJsFile(handle receiver) returns handle = @java:Method {
    name: "handlebarsJsFile",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_handlebarsJsFile2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "handlebarsJsFile",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_helper(handle receiver, handle arg0) returns handle = @java:Method {
    name: "helper",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_helpers(handle receiver) returns handle = @java:Method {
    name: "helpers",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_infiniteLoops(handle receiver) returns boolean = @java:Method {
    name: "infiniteLoops",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_infiniteLoops2(handle receiver, boolean arg0) returns handle = @java:Method {
    name: "infiniteLoops",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["boolean"]
} external;

function com_github_jknack_handlebars_Handlebars_log(handle arg0) = @java:Method {
    name: "log",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_log2(handle arg0, handle arg1) = @java:Method {
    name: "log",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String", "[Ljava.lang.Object;"]
} external;

function com_github_jknack_handlebars_Handlebars_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_parentScopeResolution(handle receiver) returns boolean = @java:Method {
    name: "parentScopeResolution",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_parentScopeResolution2(handle receiver, boolean arg0) returns handle = @java:Method {
    name: "parentScopeResolution",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["boolean"]
} external;

function com_github_jknack_handlebars_Handlebars_preEvaluatePartialBlocks(handle receiver) returns boolean = @java:Method {
    name: "preEvaluatePartialBlocks",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_preEvaluatePartialBlocks2(handle receiver, boolean arg0) returns handle = @java:Method {
    name: "preEvaluatePartialBlocks",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["boolean"]
} external;

function com_github_jknack_handlebars_Handlebars_precompile(handle receiver, handle arg0) returns handle = @java:Method {
    name: "precompile",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_precompileInline(handle receiver, handle arg0) returns handle = @java:Method {
    name: "precompileInline",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_prettyPrint(handle receiver) returns boolean = @java:Method {
    name: "prettyPrint",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_prettyPrint2(handle receiver, boolean arg0) returns handle = @java:Method {
    name: "prettyPrint",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["boolean"]
} external;

function com_github_jknack_handlebars_Handlebars_registerDecorator(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "registerDecorator",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String", "com.github.jknack.handlebars.Decorator"]
} external;

function com_github_jknack_handlebars_Handlebars_registerHelper(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "registerHelper",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String", "com.github.jknack.handlebars.Helper"]
} external;

function com_github_jknack_handlebars_Handlebars_registerHelperMissing(handle receiver, handle arg0) returns handle = @java:Method {
    name: "registerHelperMissing",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["com.github.jknack.handlebars.Helper"]
} external;

function com_github_jknack_handlebars_Handlebars_registerHelpers(handle receiver, handle arg0) returns handle = @java:Method {
    name: "registerHelpers",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.Class"]
} external;

function com_github_jknack_handlebars_Handlebars_registerHelpers2(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "registerHelpers",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.io.File"]
} external;

function com_github_jknack_handlebars_Handlebars_registerHelpers3(handle receiver, handle arg0) returns handle = @java:Method {
    name: "registerHelpers",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.Object"]
} external;

function com_github_jknack_handlebars_Handlebars_registerHelpers4(handle receiver, handle arg0, handle arg1) returns handle|error = @java:Method {
    name: "registerHelpers",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String", "java.io.InputStream"]
} external;

function com_github_jknack_handlebars_Handlebars_registerHelpers5(handle receiver, handle arg0, handle arg1) returns handle|error = @java:Method {
    name: "registerHelpers",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String", "java.io.Reader"]
} external;

function com_github_jknack_handlebars_Handlebars_registerHelpers6(handle receiver, handle arg0, handle arg1) returns handle|error = @java:Method {
    name: "registerHelpers",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String", "java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_registerHelpers7(handle receiver, handle arg0) returns handle|error = @java:Method {
    name: "registerHelpers",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.net.URI"]
} external;

function com_github_jknack_handlebars_Handlebars_setCharset(handle receiver, handle arg0) returns handle = @java:Method {
    name: "setCharset",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.nio.charset.Charset"]
} external;

function com_github_jknack_handlebars_Handlebars_setDeletePartialAfterMerge(handle receiver, boolean arg0) = @java:Method {
    name: "setDeletePartialAfterMerge",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["boolean"]
} external;

function com_github_jknack_handlebars_Handlebars_setEndDelimiter(handle receiver, handle arg0) = @java:Method {
    name: "setEndDelimiter",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_setInfiniteLoops(handle receiver, boolean arg0) = @java:Method {
    name: "setInfiniteLoops",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["boolean"]
} external;

function com_github_jknack_handlebars_Handlebars_setParentScopeResolution(handle receiver, boolean arg0) = @java:Method {
    name: "setParentScopeResolution",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["boolean"]
} external;

function com_github_jknack_handlebars_Handlebars_setPreEvaluatePartialBlocks(handle receiver, boolean arg0) = @java:Method {
    name: "setPreEvaluatePartialBlocks",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["boolean"]
} external;

function com_github_jknack_handlebars_Handlebars_setPrettyPrint(handle receiver, boolean arg0) = @java:Method {
    name: "setPrettyPrint",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["boolean"]
} external;

function com_github_jknack_handlebars_Handlebars_setStartDelimiter(handle receiver, handle arg0) = @java:Method {
    name: "setStartDelimiter",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_setStringParams(handle receiver, boolean arg0) = @java:Method {
    name: "setStringParams",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["boolean"]
} external;

function com_github_jknack_handlebars_Handlebars_startDelimiter(handle receiver, handle arg0) returns handle = @java:Method {
    name: "startDelimiter",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_stringParams(handle receiver) returns boolean = @java:Method {
    name: "stringParams",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_stringParams2(handle receiver, boolean arg0) returns handle = @java:Method {
    name: "stringParams",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["boolean"]
} external;

function com_github_jknack_handlebars_Handlebars_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["long"]
} external;

function com_github_jknack_handlebars_Handlebars_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["long", "int"]
} external;

function com_github_jknack_handlebars_Handlebars_warn(handle arg0) = @java:Method {
    name: "warn",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String"]
} external;

function com_github_jknack_handlebars_Handlebars_warn2(handle arg0, handle arg1) = @java:Method {
    name: "warn",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["java.lang.String", "[Ljava.lang.Object;"]
} external;

function com_github_jknack_handlebars_Handlebars_with(handle receiver, handle arg0) returns handle = @java:Method {
    name: "with",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["com.github.jknack.handlebars.EscapingStrategy"]
} external;

function com_github_jknack_handlebars_Handlebars_with2(handle receiver, handle arg0) returns handle = @java:Method {
    name: "with",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["[Lcom.github.jknack.handlebars.EscapingStrategy;"]
} external;

function com_github_jknack_handlebars_Handlebars_with3(handle receiver, handle arg0) returns handle = @java:Method {
    name: "with",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["com.github.jknack.handlebars.Formatter"]
} external;

function com_github_jknack_handlebars_Handlebars_with4(handle receiver, handle arg0) returns handle = @java:Method {
    name: "with",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["com.github.jknack.handlebars.HelperRegistry"]
} external;

function com_github_jknack_handlebars_Handlebars_with5(handle receiver, handle arg0) returns handle = @java:Method {
    name: "with",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["com.github.jknack.handlebars.ParserFactory"]
} external;

function com_github_jknack_handlebars_Handlebars_with6(handle receiver, handle arg0) returns handle = @java:Method {
    name: "with",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["com.github.jknack.handlebars.cache.TemplateCache"]
} external;

function com_github_jknack_handlebars_Handlebars_with7(handle receiver, handle arg0) returns handle = @java:Method {
    name: "with",
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["[Lcom.github.jknack.handlebars.io.TemplateLoader;"]
} external;

function com_github_jknack_handlebars_Handlebars_getDELIM_START() returns handle = @java:FieldGet {
    name: "DELIM_START",
    'class: "com.github.jknack.handlebars.Handlebars"
} external;

function com_github_jknack_handlebars_Handlebars_getDELIM_END() returns handle = @java:FieldGet {
    name: "DELIM_END",
    'class: "com.github.jknack.handlebars.Handlebars"
} external;

function com_github_jknack_handlebars_Handlebars_getHELPER_MISSING() returns handle = @java:FieldGet {
    name: "HELPER_MISSING",
    'class: "com.github.jknack.handlebars.Handlebars"
} external;

function com_github_jknack_handlebars_Handlebars_newHandlebars1() returns handle = @java:Constructor {
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: []
} external;

function com_github_jknack_handlebars_Handlebars_newHandlebars2(handle arg0) returns handle = @java:Constructor {
    'class: "com.github.jknack.handlebars.Handlebars",
    paramTypes: ["com.github.jknack.handlebars.io.TemplateLoader"]
} external;

