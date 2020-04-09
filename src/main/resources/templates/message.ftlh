<#import "parts/common.ftlh" as common>

<@common.page>
    <div class="mb-3">
        <h2>${welcome}</h2>
    </div>

    <div class="form-row">
        <div class="form-group col-md-6">
            <form action="/message" method="get" class="form-inline">
                <label><input type="text" name="filter" value="${filter}" class="form-control"
                              placeholder="Enter your request"/></label>
                <button type="submit" class="btn btn-primary ml-2">Find</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary mb-3" data-toggle="collapse" href="#collapseMessage" role="button" aria-expanded="false"
       aria-controls="collapseExample">Add new message</a>
    <div class="collapse" id="collapseMessage">
        <form action="/add" method="post" enctype="multipart/form-data">
            <div class="form-row">
                <div class="form-group col-md-7">
                    <input type="text" name="text" class="form-control" placeholder="Enter a message"/>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-3">
                    <input type="text" name="tag" class="form-control" placeholder="Enter a tag"/>
                </div>
                <div class="form-group col-md-3">
                    <div class="custom-file">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                        <input type="file" name="file" id="customFile"/>
                    </div>
                </div>
                <div class="form-group col-md-1">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-primary float-right">Add</button>
                </div>
            </div>
        </form>
    </div>

    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <#if message.fileName??>
                    <img src="/img/${message.fileName}" alt="${message.fileName}" class="card-img-top"/>
                </#if>
                <div class="m-2">
                    <span>${message.text}</span> <!--getText-->
                    [<i>${message.tag}</i>] <!--getTag-->
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}<!--getAuthorName-->
                </div>
            </div>
        <#else>
            <b>No message</b>
        </#list>
    </div>
</@common.page>