<#macro login path label>
    <form action="${path}" method="post">
        <div><label>User Name:<input type="text" name="username"/></label></div>
        <div><label>Password:<input type="password" name="password"/></label></div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div><input type="submit" value="${label}"/></div>
    </form>
</#macro>

<#macro registration>
    <form action="/registration" method="post">
        <div><label>User Name:<input type="text" name="userName"/></label></div>
        <div><label>Password:<input type="password" name="password"/></label></div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div><input type="submit" value="Registration"/></div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <input type="submit" value="Sign Out"/>
    </form>
</#macro>