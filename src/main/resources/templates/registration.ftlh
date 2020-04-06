<#import "parts/common.ftlh" as common>
<#import "parts/auth.ftlh" as auth>

<@common.page>
    <h2>Add new user</h2>
    ${message!""}
    <@auth.registration/>
</@common.page>