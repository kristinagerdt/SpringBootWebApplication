<#import "parts/common.ftlh" as common>

<@common.page>
    <div>
        <h2>User editor</h2>
    </div>
    <div>
        <form action="/user" method="post">
            <label><input type="text" name="userName" value="${user.userName}"/></label>
            <#list roles as role>
                <div>
                    <label><input type="checkbox"
                                  name="${role}" ${user.roles?seq_contains(role)?string("checked","")}/>${role}</label>
                </div>
            </#list>
            <input type="hidden" name="id" value="${user.id}"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Save</button>
        </form>
    </div>
</@common.page>