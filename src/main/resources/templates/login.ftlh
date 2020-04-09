<#import "parts/common.ftlh" as common>
<#import "parts/auth.ftlh" as auth>

<@common.page>
    <h4>Login page</h4>
    <@auth.login "/login" "Sign In" "username" false/>
</@common.page>