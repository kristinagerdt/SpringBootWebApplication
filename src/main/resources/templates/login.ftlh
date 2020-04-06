<#import "parts/common.ftlh" as common>
<#import "parts/auth.ftlh" as auth>

<@common.page>
    <h2>Login page</h2>
    <@auth.login "/login" "Sign In"/>
    <a href="/registration">Add new user</a>
</@common.page>