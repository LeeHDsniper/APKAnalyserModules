.class public Lcom/behance/sdk/asynctasks/BehanceSDKCreateProjectDraftAsyncTask;
.super Landroid/os/AsyncTask;
.source "BehanceSDKCreateProjectDraftAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/behance/sdk/asynctask/params/BehanceSDKCreateProjectDraftTaskParams;",
        "Ljava/lang/Void;",
        "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper",
        "<",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field private listener:Lcom/behance/sdk/IBehanceSDKCreateProjectDraftListener;


# virtual methods
.method protected varargs doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKCreateProjectDraftTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;
    .registers 30
    .param p1, "params"    # [Lcom/behance/sdk/asynctask/params/BehanceSDKCreateProjectDraftTaskParams;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/behance/sdk/asynctask/params/BehanceSDKCreateProjectDraftTaskParams;",
            ")",
            "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 57
    new-instance v19, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    invoke-direct/range {v19 .. v19}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;-><init>()V

    .line 59
    .local v19, "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;
    const/16 v26, 0x0

    :try_start_7
    aget-object v18, p1, v26

    .line 60
    .local v18, "param":Lcom/behance/sdk/asynctask/params/BehanceSDKCreateProjectDraftTaskParams;
    new-instance v24, Ljava/util/HashMap;

    const/16 v26, 0x1

    move-object/from16 v0, v24

    move/from16 v1, v26

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 61
    .local v24, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v26, "clientId"

    invoke-virtual/range {v18 .. v18}, Lcom/behance/sdk/asynctask/params/BehanceSDKCreateProjectDraftTaskParams;->getClientId()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    move-object/from16 v2, v27

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    const-string v26, "{server_root_url}/v2/project/editor?{key_client_id_param}={clientId}"

    move-object/from16 v0, v26

    move-object/from16 v1, v24

    invoke-static {v0, v1}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v10

    .line 64
    .local v10, "createProjectDraftUrl":Ljava/lang/String;
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKUserManager;

    move-result-object v20

    .line 65
    .local v20, "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    invoke-virtual/range {v20 .. v20}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->checkExpiryAndGetAccessToken()Ljava/lang/String;

    move-result-object v25

    .line 66
    .local v25, "userAccessToken":Ljava/lang/String;
    if-eqz v25, :cond_41

    .line 67
    const-string v26, "access_token"

    move-object/from16 v0, v26

    move-object/from16 v1, v25

    invoke-static {v10, v0, v1}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 71
    :cond_41
    invoke-virtual/range {v18 .. v18}, Lcom/behance/sdk/asynctask/params/BehanceSDKCreateProjectDraftTaskParams;->getBehanceSDKProjectDraftOptions()Lcom/behance/sdk/BehanceSDKProjectDraftOptions;

    move-result-object v13

    .line 72
    .local v13, "draftOptions":Lcom/behance/sdk/BehanceSDKProjectDraftOptions;
    new-instance v8, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v8, v10}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 73
    .local v8, "createProjectDraftHttpPost":Lorg/apache/http/client/methods/HttpPost;
    if-eqz v13, :cond_ed

    .line 74
    invoke-static {}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->create()Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    move-result-object v6

    .line 75
    .local v6, "createProjectDraftEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    const-string v26, "text/plain"

    const-string v27, "UTF-8"

    invoke-static/range {v26 .. v27}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/ContentType;

    move-result-object v22

    .line 76
    .local v22, "textContentType":Lorg/apache/http/entity/ContentType;
    invoke-virtual {v13}, Lcom/behance/sdk/BehanceSDKProjectDraftOptions;->getProjectTitle()Ljava/lang/String;

    move-result-object v23

    .line 77
    .local v23, "title":Ljava/lang/String;
    invoke-static/range {v23 .. v23}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v26

    if-nez v26, :cond_6d

    .line 78
    const-string v26, "title"

    move-object/from16 v0, v26

    move-object/from16 v1, v23

    move-object/from16 v2, v22

    invoke-virtual {v6, v0, v1, v2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 81
    :cond_6d
    invoke-virtual {v13}, Lcom/behance/sdk/BehanceSDKProjectDraftOptions;->getProjectDescription()Ljava/lang/String;

    move-result-object v12

    .line 82
    .local v12, "description":Ljava/lang/String;
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v26

    if-nez v26, :cond_80

    .line 83
    const-string v26, "description"

    move-object/from16 v0, v26

    move-object/from16 v1, v22

    invoke-virtual {v6, v0, v12, v1}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 86
    :cond_80
    invoke-virtual {v13}, Lcom/behance/sdk/BehanceSDKProjectDraftOptions;->getProjectTags()Ljava/lang/String;

    move-result-object v21

    .line 87
    .local v21, "tags":Ljava/lang/String;
    invoke-static/range {v21 .. v21}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v26

    if-nez v26, :cond_95

    .line 88
    const-string v26, "tags"

    move-object/from16 v0, v26

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v6, v0, v1, v2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 91
    :cond_95
    invoke-virtual {v13}, Lcom/behance/sdk/BehanceSDKProjectDraftOptions;->getCreativeFields()Ljava/lang/String;

    move-result-object v11

    .line 92
    .local v11, "creativeFields":Ljava/lang/String;
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v26

    if-nez v26, :cond_a8

    .line 93
    const-string v26, "fields"

    move-object/from16 v0, v26

    move-object/from16 v1, v22

    invoke-virtual {v6, v0, v11, v1}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 95
    :cond_a8
    const-string v3, ""

    .line 96
    .local v3, "containsAdultContentStr":Ljava/lang/String;
    invoke-virtual {v13}, Lcom/behance/sdk/BehanceSDKProjectDraftOptions;->isProjectContainsAdultContent()Z

    move-result v26

    if-eqz v26, :cond_117

    .line 97
    const-string v3, "1"

    .line 101
    :goto_b2
    const-string v26, "mature_content"

    move-object/from16 v0, v26

    move-object/from16 v1, v22

    invoke-virtual {v6, v0, v3, v1}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 103
    invoke-virtual {v13}, Lcom/behance/sdk/BehanceSDKProjectDraftOptions;->getProjectCopyrightSettings()Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;

    move-result-object v4

    .line 104
    .local v4, "copyrightSettings":Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    if-eqz v4, :cond_d0

    .line 105
    const-string v26, "license"

    invoke-virtual {v4}, Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;->getValue()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    move-object/from16 v2, v22

    invoke-virtual {v6, v0, v1, v2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/entity/ContentType;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 108
    :cond_d0
    invoke-virtual {v13}, Lcom/behance/sdk/BehanceSDKProjectDraftOptions;->getCoverImage()Ljava/io/File;

    move-result-object v5

    .line 109
    .local v5, "coverImage":Ljava/io/File;
    if-eqz v5, :cond_e6

    .line 110
    const-string v26, "image"

    new-instance v27, Lorg/apache/http/entity/mime/content/FileBody;

    move-object/from16 v0, v27

    invoke-direct {v0, v5}, Lorg/apache/http/entity/mime/content/FileBody;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v6, v0, v1}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 112
    :cond_e6
    invoke-virtual {v6}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->build()Lorg/apache/http/HttpEntity;

    move-result-object v7

    .line 113
    .local v7, "createProjectDraftHttpEntity":Lorg/apache/http/HttpEntity;
    invoke-virtual {v8, v7}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 115
    .end local v3    # "containsAdultContentStr":Ljava/lang/String;
    .end local v4    # "copyrightSettings":Lcom/behance/sdk/enums/BehanceSDKCopyrightOption;
    .end local v5    # "coverImage":Ljava/io/File;
    .end local v6    # "createProjectDraftEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v7    # "createProjectDraftHttpEntity":Lorg/apache/http/HttpEntity;
    .end local v11    # "creativeFields":Ljava/lang/String;
    .end local v12    # "description":Ljava/lang/String;
    .end local v21    # "tags":Ljava/lang/String;
    .end local v22    # "textContentType":Lorg/apache/http/entity/ContentType;
    .end local v23    # "title":Ljava/lang/String;
    :cond_ed
    invoke-static {v8}, Lcom/behance/sdk/util/BehanceSDKHTTPUtils;->doHTTPPost(Lorg/apache/http/client/methods/HttpPost;)Lcom/behance/sdk/util/HTTPResponse;

    move-result-object v9

    .line 116
    .local v9, "createProjectDraftHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    invoke-virtual {v9}, Lcom/behance/sdk/util/HTTPResponse;->getStatusCode()I

    move-result v26

    const/16 v27, 0xc9

    move/from16 v0, v26

    move/from16 v1, v27

    if-eq v0, v1, :cond_11a

    .line 117
    const/16 v26, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    .line 118
    new-instance v26, Lcom/behance/sdk/exception/BehanceSDKException;

    invoke-virtual {v9}, Lcom/behance/sdk/util/HTTPResponse;->getReasonPhrase()Ljava/lang/String;

    move-result-object v27

    invoke-direct/range {v26 .. v27}, Lcom/behance/sdk/exception/BehanceSDKException;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V

    .line 130
    .end local v8    # "createProjectDraftHttpPost":Lorg/apache/http/client/methods/HttpPost;
    .end local v9    # "createProjectDraftHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .end local v10    # "createProjectDraftUrl":Ljava/lang/String;
    .end local v13    # "draftOptions":Lcom/behance/sdk/BehanceSDKProjectDraftOptions;
    .end local v18    # "param":Lcom/behance/sdk/asynctask/params/BehanceSDKCreateProjectDraftTaskParams;
    .end local v20    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .end local v24    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v25    # "userAccessToken":Ljava/lang/String;
    :goto_116
    return-object v19

    .line 99
    .restart local v3    # "containsAdultContentStr":Ljava/lang/String;
    .restart local v6    # "createProjectDraftEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .restart local v8    # "createProjectDraftHttpPost":Lorg/apache/http/client/methods/HttpPost;
    .restart local v10    # "createProjectDraftUrl":Ljava/lang/String;
    .restart local v11    # "creativeFields":Ljava/lang/String;
    .restart local v12    # "description":Ljava/lang/String;
    .restart local v13    # "draftOptions":Lcom/behance/sdk/BehanceSDKProjectDraftOptions;
    .restart local v18    # "param":Lcom/behance/sdk/asynctask/params/BehanceSDKCreateProjectDraftTaskParams;
    .restart local v20    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .restart local v21    # "tags":Ljava/lang/String;
    .restart local v22    # "textContentType":Lorg/apache/http/entity/ContentType;
    .restart local v23    # "title":Ljava/lang/String;
    .restart local v24    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v25    # "userAccessToken":Ljava/lang/String;
    :cond_117
    const-string v3, "0"

    goto :goto_b2

    .line 120
    .end local v3    # "containsAdultContentStr":Ljava/lang/String;
    .end local v6    # "createProjectDraftEntityBuilder":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v11    # "creativeFields":Ljava/lang/String;
    .end local v12    # "description":Ljava/lang/String;
    .end local v21    # "tags":Ljava/lang/String;
    .end local v22    # "textContentType":Lorg/apache/http/entity/ContentType;
    .end local v23    # "title":Ljava/lang/String;
    .restart local v9    # "createProjectDraftHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    :cond_11a
    const/16 v26, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    .line 121
    invoke-virtual {v9}, Lcom/behance/sdk/util/HTTPResponse;->getResponseString()Ljava/lang/String;

    move-result-object v15

    .line 122
    .local v15, "draftProjectResponseJsonString":Ljava/lang/String;
    new-instance v16, Lorg/json/JSONObject;

    move-object/from16 v0, v16

    invoke-direct {v0, v15}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 123
    .local v16, "draftProjectResponseRootJsonObject":Lorg/json/JSONObject;
    const-string v26, "project"

    move-object/from16 v0, v16

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/json/JSONObject;

    .line 124
    .local v14, "draftProjectJsonObject":Lorg/json/JSONObject;
    const-string v26, "id"

    move-object/from16 v0, v26

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setResult(Ljava/lang/Object;)V
    :try_end_149
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_149} :catch_14a

    goto :goto_116

    .line 126
    .end local v8    # "createProjectDraftHttpPost":Lorg/apache/http/client/methods/HttpPost;
    .end local v9    # "createProjectDraftHttpResponse":Lcom/behance/sdk/util/HTTPResponse;
    .end local v10    # "createProjectDraftUrl":Ljava/lang/String;
    .end local v13    # "draftOptions":Lcom/behance/sdk/BehanceSDKProjectDraftOptions;
    .end local v14    # "draftProjectJsonObject":Lorg/json/JSONObject;
    .end local v15    # "draftProjectResponseJsonString":Ljava/lang/String;
    .end local v16    # "draftProjectResponseRootJsonObject":Lorg/json/JSONObject;
    .end local v18    # "param":Lcom/behance/sdk/asynctask/params/BehanceSDKCreateProjectDraftTaskParams;
    .end local v20    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .end local v24    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v25    # "userAccessToken":Ljava/lang/String;
    :catch_14a
    move-exception v17

    .line 127
    .local v17, "ex":Ljava/lang/Throwable;
    const/16 v26, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    .line 128
    new-instance v26, Lcom/behance/sdk/exception/BehanceSDKException;

    move-object/from16 v0, v26

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/behance/sdk/exception/BehanceSDKException;-><init>(Ljava/lang/Throwable;)V

    move-object/from16 v0, v19

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V

    goto :goto_116
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 33
    check-cast p1, [Lcom/behance/sdk/asynctask/params/BehanceSDKCreateProjectDraftTaskParams;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKCreateProjectDraftAsyncTask;->doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKCreateProjectDraftTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

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
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 135
    .local p1, "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKCreateProjectDraftAsyncTask;->listener:Lcom/behance/sdk/IBehanceSDKCreateProjectDraftListener;

    if-eqz v0, :cond_15

    .line 136
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->isExceptionOccurred()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 137
    iget-object v1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKCreateProjectDraftAsyncTask;->listener:Lcom/behance/sdk/IBehanceSDKCreateProjectDraftListener;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->getException()Ljava/lang/Exception;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/exception/BehanceSDKException;

    invoke-interface {v1, v0}, Lcom/behance/sdk/IBehanceSDKCreateProjectDraftListener;->onFailure(Lcom/behance/sdk/exception/BehanceSDKException;)V

    .line 142
    :cond_15
    :goto_15
    return-void

    .line 139
    :cond_16
    iget-object v1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKCreateProjectDraftAsyncTask;->listener:Lcom/behance/sdk/IBehanceSDKCreateProjectDraftListener;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {v1, v0}, Lcom/behance/sdk/IBehanceSDKCreateProjectDraftListener;->onSuccess(Ljava/lang/String;)V

    goto :goto_15
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 33
    check-cast p1, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKCreateProjectDraftAsyncTask;->onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;)V

    return-void
.end method
