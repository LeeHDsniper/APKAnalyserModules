.class public Lcom/behance/sdk/asynctasks/BehanceSDKAddProjectModuleAsyncTask;
.super Landroid/os/AsyncTask;
.source "BehanceSDKAddProjectModuleAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/behance/sdk/asynctask/params/BehanceSDKAddProjectModuleTaskParams;",
        "Ljava/lang/Void;",
        "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;",
        ">;"
    }
.end annotation


# instance fields
.field private listener:Lcom/behance/sdk/IBehanceSDKADDProjectModuleListener;


# virtual methods
.method protected varargs doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKAddProjectModuleTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;
    .registers 16
    .param p1, "params"    # [Lcom/behance/sdk/asynctask/params/BehanceSDKAddProjectModuleTaskParams;

    .prologue
    .line 42
    const/4 v11, 0x0

    aget-object v3, p1, v11

    .line 43
    .local v3, "serviceParams":Lcom/behance/sdk/asynctask/params/BehanceSDKAddProjectModuleTaskParams;
    new-instance v1, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    invoke-direct {v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;-><init>()V

    .line 45
    .local v1, "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;
    :try_start_8
    new-instance v9, Ljava/util/HashMap;

    const/4 v11, 0x1

    invoke-direct {v9, v11}, Ljava/util/HashMap;-><init>(I)V

    .line 46
    .local v9, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v11, "clientId"

    invoke-virtual {v3}, Lcom/behance/sdk/asynctask/params/BehanceSDKAddProjectModuleTaskParams;->getClientId()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v9, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    const-string v11, "{server_root_url}/v2/project/editor/{PROJECTID}/modules?{key_client_id_param}={clientId}"

    invoke-static {v11, v9}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "finalAddModuleUrl":Ljava/lang/String;
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKUserManager;

    move-result-object v2

    .line 49
    .local v2, "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    invoke-virtual {v2}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->checkExpiryAndGetAccessToken()Ljava/lang/String;

    move-result-object v10

    .line 50
    .local v10, "userAccessToken":Ljava/lang/String;
    if-eqz v10, :cond_2d

    .line 51
    const-string v11, "access_token"

    invoke-static {v0, v11, v10}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 54
    :cond_2d
    const-string v11, "{PROJECTID}"

    invoke-virtual {v3}, Lcom/behance/sdk/asynctask/params/BehanceSDKAddProjectModuleTaskParams;->getProjectId()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0, v11, v12}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 56
    invoke-static {}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->create()Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    move-result-object v5

    .line 57
    .local v5, "uploadModuleEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    const-string v11, "type"

    const-string v12, "image"

    invoke-virtual {v5, v11, v12}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 58
    const-string v11, "image"

    new-instance v12, Lorg/apache/http/entity/mime/content/FileBody;

    invoke-virtual {v3}, Lcom/behance/sdk/asynctask/params/BehanceSDKAddProjectModuleTaskParams;->getImage()Ljava/io/File;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/apache/http/entity/mime/content/FileBody;-><init>(Ljava/io/File;)V

    invoke-virtual {v5, v11, v12}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 59
    invoke-virtual {v5}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->build()Lorg/apache/http/HttpEntity;

    move-result-object v6

    .line 60
    .local v6, "uploadModuleHttpEntity":Lorg/apache/http/HttpEntity;
    new-instance v7, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v7, v0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 61
    .local v7, "uploadModuleHttpPost":Lorg/apache/http/client/methods/HttpPost;
    invoke-virtual {v7, v6}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 62
    invoke-static {v7}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->doHTTPPost(Lorg/apache/http/client/methods/HttpPost;)Lcom/behance/sdk/util/HTTPResponse;

    move-result-object v8

    .line 63
    .local v8, "uploadModuleHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    invoke-virtual {v8}, Lcom/behance/sdk/util/HTTPResponse;->getStatusCode()I

    move-result v11

    const/16 v12, 0xc9

    if-eq v11, v12, :cond_79

    .line 64
    const/4 v11, 0x1

    invoke-virtual {v1, v11}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    .line 65
    new-instance v11, Lcom/behance/sdk/exception/BehanceSDKException;

    invoke-virtual {v8}, Lcom/behance/sdk/util/HTTPResponse;->getReasonPhrase()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lcom/behance/sdk/exception/BehanceSDKException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v11}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V

    .line 74
    .end local v0    # "finalAddModuleUrl":Ljava/lang/String;
    .end local v2    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .end local v5    # "uploadModuleEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v6    # "uploadModuleHttpEntity":Lorg/apache/http/HttpEntity;
    .end local v7    # "uploadModuleHttpPost":Lorg/apache/http/client/methods/HttpPost;
    .end local v8    # "uploadModuleHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .end local v9    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v10    # "userAccessToken":Ljava/lang/String;
    :goto_78
    return-object v1

    .line 67
    .restart local v0    # "finalAddModuleUrl":Ljava/lang/String;
    .restart local v2    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .restart local v5    # "uploadModuleEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .restart local v6    # "uploadModuleHttpEntity":Lorg/apache/http/HttpEntity;
    .restart local v7    # "uploadModuleHttpPost":Lorg/apache/http/client/methods/HttpPost;
    .restart local v8    # "uploadModuleHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .restart local v9    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v10    # "userAccessToken":Ljava/lang/String;
    :cond_79
    const/4 v11, 0x0

    invoke-virtual {v1, v11}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V
    :try_end_7d
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_7d} :catch_7e

    goto :goto_78

    .line 70
    .end local v0    # "finalAddModuleUrl":Ljava/lang/String;
    .end local v2    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .end local v5    # "uploadModuleEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v6    # "uploadModuleHttpEntity":Lorg/apache/http/HttpEntity;
    .end local v7    # "uploadModuleHttpPost":Lorg/apache/http/client/methods/HttpPost;
    .end local v8    # "uploadModuleHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .end local v9    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v10    # "userAccessToken":Ljava/lang/String;
    :catch_7e
    move-exception v4

    .line 71
    .local v4, "throwable":Ljava/lang/Throwable;
    const/4 v11, 0x1

    invoke-virtual {v1, v11}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    .line 72
    new-instance v11, Lcom/behance/sdk/exception/BehanceSDKException;

    invoke-direct {v11, v4}, Lcom/behance/sdk/exception/BehanceSDKException;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v1, v11}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V

    goto :goto_78
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 26
    check-cast p1, [Lcom/behance/sdk/asynctask/params/BehanceSDKAddProjectModuleTaskParams;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKAddProjectModuleAsyncTask;->doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKAddProjectModuleTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;)V
    .registers 4
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKAddProjectModuleAsyncTask;->listener:Lcom/behance/sdk/IBehanceSDKADDProjectModuleListener;

    if-eqz v0, :cond_15

    .line 80
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->isExceptionOccurred()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 81
    iget-object v1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKAddProjectModuleAsyncTask;->listener:Lcom/behance/sdk/IBehanceSDKADDProjectModuleListener;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->getException()Ljava/lang/Exception;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/exception/BehanceSDKException;

    invoke-interface {v1, v0}, Lcom/behance/sdk/IBehanceSDKADDProjectModuleListener;->onFailure(Lcom/behance/sdk/exception/BehanceSDKException;)V

    .line 87
    :cond_15
    :goto_15
    return-void

    .line 83
    :cond_16
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKAddProjectModuleAsyncTask;->listener:Lcom/behance/sdk/IBehanceSDKADDProjectModuleListener;

    invoke-interface {v0}, Lcom/behance/sdk/IBehanceSDKADDProjectModuleListener;->onSuccess()V

    goto :goto_15
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 26
    check-cast p1, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKAddProjectModuleAsyncTask;->onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;)V

    return-void
.end method
