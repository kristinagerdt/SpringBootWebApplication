<#import "parts/common.ftlh" as common>
<#import "parts/auth.ftlh" as auth>

<@common.page>
    <h2>Login page</h2>
    <@auth.login "/login" "Sign In"/>
    <p style="margin: -20px 0 10px 80px"><a href="/registration">Add new user</a></p>
</@common.page>