<#macro login path label name isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label for="inputUsername" class="col-sm-2 col-form-label">User Name</label>
            <div class="col-sm-4">
                <input type="text" name="${name}" id="inputUsername" class="form-control"
                       placeholder="Enter user name"/>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-4">
                <input type="password" name="password" id="inputPassword" class="form-control"
                       placeholder="Enter password"/>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-4">
                    <input type="email" name="email" id="inputEmail" class="form-control"
                           placeholder="Enter email"/>
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="form-group row">
            <div class="col-sm-4">
                <button type="submit" class="btn btn-primary">${label}</button>
            </div>
        </div>
        <#if !isRegisterForm>
            <a href="/registration">Add new user</a>
        </#if>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-primary">Sign Out</button>
    </form>
</#macro>