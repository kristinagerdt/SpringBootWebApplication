<#import "parts/common.ftlh" as common>

<@common.page>
    <div>
        <p style="margin-bottom: 5px; font-size: 18px; font-weight: bold">List of messages:</p>
    </div>
    <div>
        <table>
            <thead>
            <tr>
                <th>Name</th>
                <th>Role</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <#list users as user>
                <tr>
                    <td>${user.userName}</td>
                    <td><#list user.roles as role>${role}<#sep>, </#list></td>
                    <td><a href="/user/${user.id}">edit</a></td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</@common.page>