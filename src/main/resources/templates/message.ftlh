<#import "parts/common.ftlh" as common>
<#import "parts/auth.ftlh" as auth>

<@common.page>
    <div>
        <h2>${welcome}</h2>
        <@auth.logout/>
    </div>
    <div>
        <form method="post" action="add">
            <label><input type="text" name="text" placeholder="Enter a message"/></label>
            <label><input type="text" name="tag" placeholder="Enter a tag"/></label>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Add</button>
        </form>
    </div>
    <div>
        <form method="get" action="message">
            <label><input type="text" name="filter" value="${filter}" placeholder="Enter your request"/></label>
            <button type="submit">Find</button>
        </form>
    </div>
    <div>
        <p style="margin-bottom: 5px; font-size: 18px; font-weight: bold">List of messages:</p>
        <#list messages as message>
            <div>
                <b>${message.id}</b>
                <span>${message.text}</span> <!--getText-->
                [<i>${message.tag}</i>] <!--getTag-->
                <strong>${message.authorName}</strong> <!--getAuthorName-->
            </div>
        <#else>
            <b>No message</b>
        </#list>
    </div>
</@common.page>