.class public Lcom/behance/sdk/asynctasks/BehanceSDKPublishProjectAsyncTask;
.super Landroid/os/AsyncTask;
.source "BehanceSDKPublishProjectAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/behance/sdk/asynctask/params/BehanceSDKPublishProjectTaskParams;",
        "Ljava/lang/Void;",
        "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper",
        "<",
        "Ljava/lang/Boolean;",
        ">;>;"
    }
.end annotation


# instance fields
.field private listener:Lcom/behance/sdk/IBehanceSDKProjectPublishListener;


# virtual methods
.method protected varargs doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKPublishProjectTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;
    .registers 16
    .param p1, "params"    # [Lcom/behance/sdk/asynctask/params/BehanceSDKPublishProjectTaskParams;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/behance/sdk/asynctask/params/BehanceSDKPublishProjectTaskParams;",
            ")",
            "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 44
    new-instance v6, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    invoke-direct {v6}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;-><init>()V

    .line 45
    .local v6, "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<Ljava/lang/Boolean;>;"
    const/4 v12, 0x0

    aget-object v8, p1, v12

    .line 48
    .local v8, "serviceParams":Lcom/behance/sdk/asynctask/params/BehanceSDKPublishProjectTaskParams;
    :try_start_8
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 49
    .local v10, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v12, "clientId"

    invoke-virtual {v8}, Lcom/behance/sdk/asynctask/params/BehanceSDKPublishProjectTaskParams;->getClientId()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v10, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    const-string v12, "{server_root_url}/v2/project/editor/{PROJECTID}?{key_client_id_param}={clientId}"

    invoke-static {v12, v10}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    .line 52
    .local v1, "finalPublishUrl":Ljava/lang/String;
    const-string v12, "{PROJECTID}"

    invoke-virtual {v8}, Lcom/behance/sdk/asynctask/params/BehanceSDKPublishProjectTaskParams;->getProjectId()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1, v12, v13}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 53
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKUserManager;

    move-result-object v7

    .line 54
    .local v7, "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    invoke-virtual {v7}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->checkExpiryAndGetAccessToken()Ljava/lang/String;

    move-result-object v11

    .line 55
    .local v11, "userAccessToken":Ljava/lang/String;
    if-eqz v11, :cond_36

    .line 56
    const-string v12, "access_token"

    .line 57
    invoke-static {v1, v12, v11}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 59
    :cond_36
    new-instance v5, Lorg/apache/http/client/methods/HttpPut;

    invoke-direct {v5, v1}, Lorg/apache/http/client/methods/HttpPut;-><init>(Ljava/lang/String;)V

    .line 60
    .local v5, "publishProjectHttpPut":Lorg/apache/http/client/methods/HttpPut;
    invoke-static {}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->create()Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    move-result-object v3

    .line 61
    .local v3, "publishProjectEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    sget-object v12, Lorg/apache/http/entity/mime/HttpMultipartMode;->BROWSER_COMPATIBLE:Lorg/apache/http/entity/mime/HttpMultipartMode;

    invoke-virtual {v3, v12}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->setMode(Lorg/apache/http/entity/mime/HttpMultipartMode;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 62
    const-string v12, "text/plain"

    const-string v13, "UTF-8"

    invoke-static {v12, v13}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/ContentType;

    move-result-object v9

    .line 63
    .local v9, "textContentType":Lorg/apache/http/entity/ContentType;
    const-string v12, "published"

    const-string v13, "1"

    invoke-virtual {v3, v12, v13, v9}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 64
    invoke-virtual {v3}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->build()Lorg/apache/http/HttpEntity;

    move-result-object v4

    .line 65
    .local v4, "publishProjectHttpEntity":Lorg/apache/http/HttpEntity;
    invoke-virtual {v5, v4}, Lorg/apache/http/client/methods/HttpPut;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 66
    invoke-static {v5}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->doHTTPPut(Lorg/apache/http/client/methods/HttpPut;)Lcom/behance/sdk/util/HTTPResponse;

    move-result-object v2

    .line 67
    .local v2, "publishProjectDetailsHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    invoke-virtual {v2}, Lcom/behance/sdk/util/HTTPResponse;->getStatusCode()I

    move-result v12

    const/16 v13, 0xc8

    if-ne v12, v13, :cond_6b

    .line 68
    const/4 v12, 0x0

    invoke-virtual {v6, v12}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    .line 78
    .end local v1    # "finalPublishUrl":Ljava/lang/String;
    .end local v2    # "publishProjectDetailsHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .end local v3    # "publishProjectEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v4    # "publishProjectHttpEntity":Lorg/apache/http/HttpEntity;
    .end local v5    # "publishProjectHttpPut":Lorg/apache/http/client/methods/HttpPut;
    .end local v7    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .end local v9    # "textContentType":Lorg/apache/http/entity/ContentType;
    .end local v10    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v11    # "userAccessToken":Ljava/lang/String;
    :goto_6a
    return-object v6

    .line 70
    .restart local v1    # "finalPublishUrl":Ljava/lang/String;
    .restart local v2    # "publishProjectDetailsHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .restart local v3    # "publishProjectEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .restart local v4    # "publishProjectHttpEntity":Lorg/apache/http/HttpEntity;
    .restart local v5    # "publishProjectHttpPut":Lorg/apache/http/client/methods/HttpPut;
    .restart local v7    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .restart local v9    # "textContentType":Lorg/apache/http/entity/ContentType;
    .restart local v10    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v11    # "userAccessToken":Ljava/lang/String;
    :cond_6b
    const/4 v12, 0x1

    invoke-virtual {v6, v12}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    .line 71
    new-instance v12, Lcom/behance/sdk/exception/BehanceSDKException;

    invoke-virtual {v2}, Lcom/behance/sdk/util/HTTPResponse;->getReasonPhrase()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lcom/behance/sdk/exception/BehanceSDKException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v12}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V
    :try_end_7b
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_7b} :catch_7c

    goto :goto_6a

    .line 73
    .end local v1    # "finalPublishUrl":Ljava/lang/String;
    .end local v2    # "publishProjectDetailsHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .end local v3    # "publishProjectEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v4    # "publishProjectHttpEntity":Lorg/apache/http/HttpEntity;
    .end local v5    # "publishProjectHttpPut":Lorg/apache/http/client/methods/HttpPut;
    .end local v7    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .end local v9    # "textContentType":Lorg/apache/http/entity/ContentType;
    .end local v10    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v11    # "userAccessToken":Ljava/lang/String;
    :catch_7c
    move-exception v0

    .line 74
    .local v0, "ex":Ljava/lang/Throwable;
    const/4 v12, 0x1

    invoke-virtual {v6, v12}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    .line 75
    new-instance v12, Lcom/behance/sdk/exception/BehanceSDKException;

    invoke-direct {v12, v0}, Lcom/behance/sdk/exception/BehanceSDKException;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v6, v12}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V

    goto :goto_6a
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 28
    check-cast p1, [Lcom/behance/sdk/asynctask/params/BehanceSDKPublishProjectTaskParams;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishProjectAsyncTask;->doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKPublishProjectTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper",
            "<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p1, "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<Ljava/lang/Boolean;>;"
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishProjectAsyncTask;->listener:Lcom/behance/sdk/IBehanceSDKProjectPublishListener;

    if-eqz v0, :cond_15

    .line 85
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->isExceptionOccurred()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 86
    iget-object v1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishProjectAsyncTask;->listener:Lcom/behance/sdk/IBehanceSDKProjectPublishListener;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->getException()Ljava/lang/Exception;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/exception/BehanceSDKException;

    invoke-interface {v1, v0}, Lcom/behance/sdk/IBehanceSDKProjectPublishListener;->onFailure(Lcom/behance/sdk/exception/BehanceSDKException;)V

    .line 91
    :cond_15
    :goto_15
    return-void

    .line 88
    :cond_16
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKPublishProjectAsyncTask;->listener:Lcom/behance/sdk/IBehanceSDKProjectPublishListener;

    invoke-interface {v0}, Lcom/behance/sdk/IBehanceSDKProjectPublishListener;->onSuccess()V

    goto :goto_15
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 28
    check-cast p1, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKPublishProjectAsyncTask;->onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;)V

    return-void
.end method
