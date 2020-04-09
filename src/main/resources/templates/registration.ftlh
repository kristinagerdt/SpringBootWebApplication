<#import "parts/common.ftlh" as common>
<#import "parts/auth.ftlh" as auth>

<@common.page>
    <h4>Add new user</h4>
    ${message!""}
    <@auth.login "/registration" "Registration" "userName" true/>
</@common.page>