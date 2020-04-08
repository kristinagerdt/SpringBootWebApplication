<#import "parts/common.ftlh" as common>
<#import "parts/auth.ftlh" as auth>

<@common.page>
    <div>
        <h2>${welcome}</h2>
        <@auth.logout/>
        <p style="margin: -20px 0 10px 80px"><a href="/user">User list</a></p>
    </div>
    <div>
        <form action="/add" method="post" enctype="multipart/form-data">
            <label><input type="text" name="text" placeholder="Enter a message"/></label>
            <label><input type="text" name="tag" placeholder="Enter a tag"/></label>
            <label><input type="file" name="file"/></label>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Add</button>
        </form>
    </div>
    <div>
        <form action="/message" method="get">
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
                <div>
                    <#if message.fileName??>
                        <img src="/img/${message.fileName}" alt="${message.fileName}"/>
                    </#if>
                </div>
            </div>
        <#else>
            <b>No message</b>
        </#list>
    </div>
</@common.page>