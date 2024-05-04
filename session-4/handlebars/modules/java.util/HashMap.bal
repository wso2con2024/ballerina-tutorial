import templates.java.lang as javalang;
import templates.java.util.'function as javautilfunction;

import ballerina/jballerina.java;

# Ballerina class mapping for the Java `java.util.HashMap` class.
@java:Binding {'class: "java.util.HashMap"}
public distinct class HashMap {

    *java:JObject;
    *AbstractMap;

    # The `handle` field that stores the reference to the `java.util.HashMap` object.
    public handle jObj;

    # The init function of the Ballerina class mapping the `java.util.HashMap` Java class.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string representation of the Ballerina class mapping the `java.util.HashMap` Java class.
    #
    # + return - The `string` form of the Java object instance.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # The function that maps to the `clear` method of `java.util.HashMap`.
    public function clear() {
        java_util_HashMap_clear(self.jObj);
    }

    # The function that maps to the `clone` method of `java.util.HashMap`.
    #
    # + return - The `javalang:Object` value returning from the Java mapping.
    public function clone() returns javalang:Object {
        handle externalObj = java_util_HashMap_clone(self.jObj);
        javalang:Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `compute` method of `java.util.HashMap`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + arg1 - The `javautilfunction:BiFunction` value required to map with the Java method parameter.
    # + return - The `javalang:Object` value returning from the Java mapping.
    public function compute(javalang:Object arg0, javautilfunction:BiFunction arg1) returns javalang:Object {
        handle externalObj = java_util_HashMap_compute(self.jObj, arg0.jObj, arg1.jObj);
        javalang:Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `computeIfAbsent` method of `java.util.HashMap`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + arg1 - The `javautilfunction:Function` value required to map with the Java method parameter.
    # + return - The `javalang:Object` value returning from the Java mapping.
    public function computeIfAbsent(javalang:Object arg0, javautilfunction:Function arg1) returns javalang:Object {
        handle externalObj = java_util_HashMap_computeIfAbsent(self.jObj, arg0.jObj, arg1.jObj);
        javalang:Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `computeIfPresent` method of `java.util.HashMap`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + arg1 - The `javautilfunction:BiFunction` value required to map with the Java method parameter.
    # + return - The `javalang:Object` value returning from the Java mapping.
    public function computeIfPresent(javalang:Object arg0, javautilfunction:BiFunction arg1) returns javalang:Object {
        handle externalObj = java_util_HashMap_computeIfPresent(self.jObj, arg0.jObj, arg1.jObj);
        javalang:Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `containsKey` method of `java.util.HashMap`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function containsKey(javalang:Object arg0) returns boolean {
        return java_util_HashMap_containsKey(self.jObj, arg0.jObj);
    }

    # The function that maps to the `containsValue` method of `java.util.HashMap`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function containsValue(javalang:Object arg0) returns boolean {
        return java_util_HashMap_containsValue(self.jObj, arg0.jObj);
    }

    # The function that maps to the `entrySet` method of `java.util.HashMap`.
    #
    # + return - The `Set` value returning from the Java mapping.
    public function entrySet() returns Set {
        handle externalObj = java_util_HashMap_entrySet(self.jObj);
        Set newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `equals` method of `java.util.HashMap`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function 'equals(javalang:Object arg0) returns boolean {
        return java_util_HashMap_equals(self.jObj, arg0.jObj);
    }

    # The function that maps to the `forEach` method of `java.util.HashMap`.
    #
    # + arg0 - The `javautilfunction:BiConsumer` value required to map with the Java method parameter.
    public function forEach(javautilfunction:BiConsumer arg0) {
        java_util_HashMap_forEach(self.jObj, arg0.jObj);
    }

    # The function that maps to the `get` method of `java.util.HashMap`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `javalang:Object` value returning from the Java mapping.
    public function get(javalang:Object arg0) returns javalang:Object {
        handle externalObj = java_util_HashMap_get(self.jObj, arg0.jObj);
        javalang:Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getClass` method of `java.util.HashMap`.
    #
    # + return - The `javalang:Class` value returning from the Java mapping.
    public function getClass() returns javalang:Class {
        handle externalObj = java_util_HashMap_getClass(self.jObj);
        javalang:Class newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `getOrDefault` method of `java.util.HashMap`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + arg1 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `javalang:Object` value returning from the Java mapping.
    public function getOrDefault(javalang:Object arg0, javalang:Object arg1) returns javalang:Object {
        handle externalObj = java_util_HashMap_getOrDefault(self.jObj, arg0.jObj, arg1.jObj);
        javalang:Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `hashCode` method of `java.util.HashMap`.
    #
    # + return - The `int` value returning from the Java mapping.
    public function hashCode() returns int {
        return java_util_HashMap_hashCode(self.jObj);
    }

    # The function that maps to the `isEmpty` method of `java.util.HashMap`.
    #
    # + return - The `boolean` value returning from the Java mapping.
    public function isEmpty() returns boolean {
        return java_util_HashMap_isEmpty(self.jObj);
    }

    # The function that maps to the `keySet` method of `java.util.HashMap`.
    #
    # + return - The `Set` value returning from the Java mapping.
    public function keySet() returns Set {
        handle externalObj = java_util_HashMap_keySet(self.jObj);
        Set newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `merge` method of `java.util.HashMap`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + arg1 - The `javalang:Object` value required to map with the Java method parameter.
    # + arg2 - The `javautilfunction:BiFunction` value required to map with the Java method parameter.
    # + return - The `javalang:Object` value returning from the Java mapping.
    public function merge(javalang:Object arg0, javalang:Object arg1, javautilfunction:BiFunction arg2) returns javalang:Object {
        handle externalObj = java_util_HashMap_merge(self.jObj, arg0.jObj, arg1.jObj, arg2.jObj);
        javalang:Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `notify` method of `java.util.HashMap`.
    public function notify() {
        java_util_HashMap_notify(self.jObj);
    }

    # The function that maps to the `notifyAll` method of `java.util.HashMap`.
    public function notifyAll() {
        java_util_HashMap_notifyAll(self.jObj);
    }

    # The function that maps to the `put` method of `java.util.HashMap`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + arg1 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `javalang:Object` value returning from the Java mapping.
    public function put(javalang:Object arg0, javalang:Object arg1) returns javalang:Object {
        handle externalObj = java_util_HashMap_put(self.jObj, arg0.jObj, arg1.jObj);
        javalang:Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `putAll` method of `java.util.HashMap`.
    #
    # + arg0 - The `Map` value required to map with the Java method parameter.
    public function putAll(Map arg0) {
        java_util_HashMap_putAll(self.jObj, arg0.jObj);
    }

    # The function that maps to the `putIfAbsent` method of `java.util.HashMap`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + arg1 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `javalang:Object` value returning from the Java mapping.
    public function putIfAbsent(javalang:Object arg0, javalang:Object arg1) returns javalang:Object {
        handle externalObj = java_util_HashMap_putIfAbsent(self.jObj, arg0.jObj, arg1.jObj);
        javalang:Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `remove` method of `java.util.HashMap`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `javalang:Object` value returning from the Java mapping.
    public function remove(javalang:Object arg0) returns javalang:Object {
        handle externalObj = java_util_HashMap_remove(self.jObj, arg0.jObj);
        javalang:Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `remove` method of `java.util.HashMap`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + arg1 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function remove2(javalang:Object arg0, javalang:Object arg1) returns boolean {
        return java_util_HashMap_remove2(self.jObj, arg0.jObj, arg1.jObj);
    }

    # The function that maps to the `replace` method of `java.util.HashMap`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + arg1 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `javalang:Object` value returning from the Java mapping.
    public function replace(javalang:Object arg0, javalang:Object arg1) returns javalang:Object {
        handle externalObj = java_util_HashMap_replace(self.jObj, arg0.jObj, arg1.jObj);
        javalang:Object newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `replace` method of `java.util.HashMap`.
    #
    # + arg0 - The `javalang:Object` value required to map with the Java method parameter.
    # + arg1 - The `javalang:Object` value required to map with the Java method parameter.
    # + arg2 - The `javalang:Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function replace2(javalang:Object arg0, javalang:Object arg1, javalang:Object arg2) returns boolean {
        return java_util_HashMap_replace2(self.jObj, arg0.jObj, arg1.jObj, arg2.jObj);
    }

    # The function that maps to the `replaceAll` method of `java.util.HashMap`.
    #
    # + arg0 - The `javautilfunction:BiFunction` value required to map with the Java method parameter.
    public function replaceAll(javautilfunction:BiFunction arg0) {
        java_util_HashMap_replaceAll(self.jObj, arg0.jObj);
    }

    # The function that maps to the `size` method of `java.util.HashMap`.
    #
    # + return - The `int` value returning from the Java mapping.
    public function size() returns int {
        return java_util_HashMap_size(self.jObj);
    }

    # The function that maps to the `values` method of `java.util.HashMap`.
    #
    # + return - The `Collection` value returning from the Java mapping.
    public function values() returns Collection {
        handle externalObj = java_util_HashMap_values(self.jObj);
        Collection newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `wait` method of `java.util.HashMap`.
    #
    # + return - The `javalang:InterruptedException` value returning from the Java mapping.
    public function 'wait() returns javalang:InterruptedException? {
        error|() externalObj = java_util_HashMap_wait(self.jObj);
        if (externalObj is error) {
            javalang:InterruptedException e = error javalang:InterruptedException(javalang:INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `java.util.HashMap`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `javalang:InterruptedException` value returning from the Java mapping.
    public function wait2(int arg0) returns javalang:InterruptedException? {
        error|() externalObj = java_util_HashMap_wait2(self.jObj, arg0);
        if (externalObj is error) {
            javalang:InterruptedException e = error javalang:InterruptedException(javalang:INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `java.util.HashMap`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `javalang:InterruptedException` value returning from the Java mapping.
    public function wait3(int arg0, int arg1) returns javalang:InterruptedException? {
        error|() externalObj = java_util_HashMap_wait3(self.jObj, arg0, arg1);
        if (externalObj is error) {
            javalang:InterruptedException e = error javalang:InterruptedException(javalang:INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

}

# The constructor function to generate an object of `java.util.HashMap`.
#
# + return - The new `HashMap` class generated.
public function newHashMap1() returns HashMap {
    handle externalObj = java_util_HashMap_newHashMap1();
    HashMap newObj = new (externalObj);
    return newObj;
}

# The constructor function to generate an object of `java.util.HashMap`.
#
# + arg0 - The `int` value required to map with the Java constructor parameter.
# + return - The new `HashMap` class generated.
public function newHashMap2(int arg0) returns HashMap {
    handle externalObj = java_util_HashMap_newHashMap2(arg0);
    HashMap newObj = new (externalObj);
    return newObj;
}

# The constructor function to generate an object of `java.util.HashMap`.
#
# + arg0 - The `int` value required to map with the Java constructor parameter.
# + arg1 - The `float` value required to map with the Java constructor parameter.
# + return - The new `HashMap` class generated.
public function newHashMap3(int arg0, float arg1) returns HashMap {
    handle externalObj = java_util_HashMap_newHashMap3(arg0, arg1);
    HashMap newObj = new (externalObj);
    return newObj;
}

# The constructor function to generate an object of `java.util.HashMap`.
#
# + arg0 - The `Map` value required to map with the Java constructor parameter.
# + return - The new `HashMap` class generated.
public function newHashMap4(Map arg0) returns HashMap {
    handle externalObj = java_util_HashMap_newHashMap4(arg0.jObj);
    HashMap newObj = new (externalObj);
    return newObj;
}

function java_util_HashMap_clear(handle receiver) = @java:Method {
    name: "clear",
    'class: "java.util.HashMap",
    paramTypes: []
} external;

function java_util_HashMap_clone(handle receiver) returns handle = @java:Method {
    name: "clone",
    'class: "java.util.HashMap",
    paramTypes: []
} external;

function java_util_HashMap_compute(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "compute",
    'class: "java.util.HashMap",
    paramTypes: ["java.lang.Object", "java.util.function.BiFunction"]
} external;

function java_util_HashMap_computeIfAbsent(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "computeIfAbsent",
    'class: "java.util.HashMap",
    paramTypes: ["java.lang.Object", "java.util.function.Function"]
} external;

function java_util_HashMap_computeIfPresent(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "computeIfPresent",
    'class: "java.util.HashMap",
    paramTypes: ["java.lang.Object", "java.util.function.BiFunction"]
} external;

function java_util_HashMap_containsKey(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "containsKey",
    'class: "java.util.HashMap",
    paramTypes: ["java.lang.Object"]
} external;

function java_util_HashMap_containsValue(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "containsValue",
    'class: "java.util.HashMap",
    paramTypes: ["java.lang.Object"]
} external;

function java_util_HashMap_entrySet(handle receiver) returns handle = @java:Method {
    name: "entrySet",
    'class: "java.util.HashMap",
    paramTypes: []
} external;

function java_util_HashMap_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "java.util.HashMap",
    paramTypes: ["java.lang.Object"]
} external;

function java_util_HashMap_forEach(handle receiver, handle arg0) = @java:Method {
    name: "forEach",
    'class: "java.util.HashMap",
    paramTypes: ["java.util.function.BiConsumer"]
} external;

function java_util_HashMap_get(handle receiver, handle arg0) returns handle = @java:Method {
    name: "get",
    'class: "java.util.HashMap",
    paramTypes: ["java.lang.Object"]
} external;

function java_util_HashMap_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "java.util.HashMap",
    paramTypes: []
} external;

function java_util_HashMap_getOrDefault(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "getOrDefault",
    'class: "java.util.HashMap",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function java_util_HashMap_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "java.util.HashMap",
    paramTypes: []
} external;

function java_util_HashMap_isEmpty(handle receiver) returns boolean = @java:Method {
    name: "isEmpty",
    'class: "java.util.HashMap",
    paramTypes: []
} external;

function java_util_HashMap_keySet(handle receiver) returns handle = @java:Method {
    name: "keySet",
    'class: "java.util.HashMap",
    paramTypes: []
} external;

function java_util_HashMap_merge(handle receiver, handle arg0, handle arg1, handle arg2) returns handle = @java:Method {
    name: "merge",
    'class: "java.util.HashMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "java.util.function.BiFunction"]
} external;

function java_util_HashMap_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "java.util.HashMap",
    paramTypes: []
} external;

function java_util_HashMap_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "java.util.HashMap",
    paramTypes: []
} external;

function java_util_HashMap_put(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "put",
    'class: "java.util.HashMap",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function java_util_HashMap_putAll(handle receiver, handle arg0) = @java:Method {
    name: "putAll",
    'class: "java.util.HashMap",
    paramTypes: ["java.util.Map"]
} external;

function java_util_HashMap_putIfAbsent(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "putIfAbsent",
    'class: "java.util.HashMap",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function java_util_HashMap_remove(handle receiver, handle arg0) returns handle = @java:Method {
    name: "remove",
    'class: "java.util.HashMap",
    paramTypes: ["java.lang.Object"]
} external;

function java_util_HashMap_remove2(handle receiver, handle arg0, handle arg1) returns boolean = @java:Method {
    name: "remove",
    'class: "java.util.HashMap",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function java_util_HashMap_replace(handle receiver, handle arg0, handle arg1) returns handle = @java:Method {
    name: "replace",
    'class: "java.util.HashMap",
    paramTypes: ["java.lang.Object", "java.lang.Object"]
} external;

function java_util_HashMap_replace2(handle receiver, handle arg0, handle arg1, handle arg2) returns boolean = @java:Method {
    name: "replace",
    'class: "java.util.HashMap",
    paramTypes: ["java.lang.Object", "java.lang.Object", "java.lang.Object"]
} external;

function java_util_HashMap_replaceAll(handle receiver, handle arg0) = @java:Method {
    name: "replaceAll",
    'class: "java.util.HashMap",
    paramTypes: ["java.util.function.BiFunction"]
} external;

function java_util_HashMap_size(handle receiver) returns int = @java:Method {
    name: "size",
    'class: "java.util.HashMap",
    paramTypes: []
} external;

function java_util_HashMap_values(handle receiver) returns handle = @java:Method {
    name: "values",
    'class: "java.util.HashMap",
    paramTypes: []
} external;

function java_util_HashMap_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "java.util.HashMap",
    paramTypes: []
} external;

function java_util_HashMap_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "java.util.HashMap",
    paramTypes: ["long"]
} external;

function java_util_HashMap_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "java.util.HashMap",
    paramTypes: ["long", "int"]
} external;

function java_util_HashMap_newHashMap1() returns handle = @java:Constructor {
    'class: "java.util.HashMap",
    paramTypes: []
} external;

function java_util_HashMap_newHashMap2(int arg0) returns handle = @java:Constructor {
    'class: "java.util.HashMap",
    paramTypes: ["int"]
} external;

function java_util_HashMap_newHashMap3(int arg0, float arg1) returns handle = @java:Constructor {
    'class: "java.util.HashMap",
    paramTypes: ["int", "float"]
} external;

function java_util_HashMap_newHashMap4(handle arg0) returns handle = @java:Constructor {
    'class: "java.util.HashMap",
    paramTypes: ["java.util.Map"]
} external;

