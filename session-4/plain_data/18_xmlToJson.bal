public function main() returns error? {
    // Replace Person with Person2 or Person3 to see the difference
    xml x = xml `<p:person xmlns:p="www.example.org/personData" age="30">
    <p:name>John</p:name>
    <a:address xmlns:a="www.example.org/personAddress">
        <a:city>Hollywood</a:city>
        <a:state>FL</a:state>
        <a:country>USA</a:country>
    </a:address>
</p:person>`;

}

// Generated from the XML value above.

