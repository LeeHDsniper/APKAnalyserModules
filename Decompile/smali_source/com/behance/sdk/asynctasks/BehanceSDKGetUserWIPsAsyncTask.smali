.class public Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;
.super Landroid/os/AsyncTask;
.source "BehanceSDKGetUserWIPsAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;",
        "Ljava/lang/Void;",
        "Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserWIPsTaskListener;

.field private taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 55
    const-class v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>(Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserWIPsTaskListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserWIPsTaskListener;

    .prologue
    .line 62
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserWIPsTaskListener;

    .line 64
    return-void
.end method

.method private getUserWips(Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;ILorg/apache/http/impl/client/DefaultHttpClient;Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;)Ljava/util/List;
    .registers 38
    .param p1, "taskParams"    # Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;
    .param p2, "pageNumber"    # I
    .param p3, "httpClient"    # Lorg/apache/http/impl/client/DefaultHttpClient;
    .param p4, "result"    # Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;",
            "I",
            "Lorg/apache/http/impl/client/DefaultHttpClient;",
            "Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKWIPDTO;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/client/ClientProtocolException;,
            Lorg/json/JSONException;,
            Lcom/behance/sdk/exception/BehanceSDKUserNotAuthenticatedException;
        }
    .end annotation

    .prologue
    .line 103
    new-instance v23, Ljava/util/HashMap;

    invoke-direct/range {v23 .. v23}, Ljava/util/HashMap;-><init>()V

    .line 104
    .local v23, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v28, "clientId"

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;->getClientId()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, v23

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    const-string v28, "user_id"

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;->getUserId()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, v23

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    const-string v28, "{server_root_url}/v2/users/{user_id}/wips?{key_client_id_param}={clientId}"

    move-object/from16 v0, v28

    move-object/from16 v1, v23

    invoke-static {v0, v1}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v22

    .line 108
    .local v22, "url":Ljava/lang/String;
    const-string v28, "page"

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    move-object/from16 v0, v22

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 109
    const-string v28, "per_page"

    const/16 v29, 0x18

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    move-object/from16 v0, v22

    move-object/from16 v1, v28

    move-object/from16 v2, v29

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 111
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKUserManager;

    move-result-object v21

    .line 112
    .local v21, "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    invoke-virtual/range {v21 .. v21}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->checkExpiryAndGetAccessToken()Ljava/lang/String;

    move-result-object v24

    .line 113
    .local v24, "userAccessToken":Ljava/lang/String;
    if-eqz v24, :cond_65

    .line 114
    const-string v28, "access_token"

    move-object/from16 v0, v22

    move-object/from16 v1, v28

    move-object/from16 v2, v24

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    .line 117
    :cond_65
    new-instance v7, Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v0, v22

    invoke-direct {v7, v0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 118
    .local v7, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    move-object/from16 v0, p3

    invoke-virtual {v0, v7}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v8

    .line 119
    .local v8, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v8}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v28

    invoke-static/range {v28 .. v28}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v16

    .line 120
    .local v16, "jsonResponseString":Ljava/lang/String;
    sget-object v28, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v29, "Get user WIPs response: %s"

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    aput-object v16, v30, v31

    invoke-interface/range {v28 .. v30}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 121
    new-instance v15, Lorg/json/JSONObject;

    invoke-direct/range {v15 .. v16}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 122
    .local v15, "jsonObject":Lorg/json/JSONObject;
    const-string v28, "http_code"

    move-object/from16 v0, v28

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v9

    .line 124
    .local v9, "httpResponseCode":I
    const/16 v28, 0xc8

    move/from16 v0, v28

    if-ne v9, v0, :cond_216

    .line 125
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 127
    .local v17, "response":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    :try_start_a5
    const-string v28, "wips"

    move-object/from16 v0, v28

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v27

    .line 128
    .local v27, "wipsJsonArray":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "counter":I
    :goto_ae
    invoke-virtual/range {v27 .. v27}, Lorg/json/JSONArray;->length()I

    move-result v28

    move/from16 v0, v28

    if-ge v3, v0, :cond_261

    .line 129
    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v26

    .line 131
    .local v26, "wipJsonObject":Lorg/json/JSONObject;
    new-instance v25, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;

    invoke-direct/range {v25 .. v25}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;-><init>()V

    .line 132
    .local v25, "wipDTO":Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    const-string v28, "id"

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v28

    move-object/from16 v0, v25

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->setId(I)V

    .line 133
    const-string v28, "title"

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v25

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->setTitle(Ljava/lang/String;)V

    .line 136
    const-string v28, "revisions"

    move-object/from16 v0, v26

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v20

    .line 137
    .local v20, "revisionsJsonObject":Lorg/json/JSONObject;
    if-eqz v20, :cond_20b

    .line 138
    invoke-virtual/range {v20 .. v20}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v18

    .line 139
    .local v18, "revisionIDsJsonArray":Lorg/json/JSONArray;
    if-eqz v18, :cond_20b

    .line 140
    const/4 v4, 0x0

    .local v4, "counter2":I
    :goto_f6
    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONArray;->length()I

    move-result v28

    move/from16 v0, v28

    if-ge v4, v0, :cond_20b

    .line 141
    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v28

    move-object/from16 v0, v20

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v19

    .line 142
    .local v19, "revisionJsonObject":Lorg/json/JSONObject;
    if-eqz v19, :cond_207

    .line 143
    const-string v28, "images"

    move-object/from16 v0, v19

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v14

    .line 144
    .local v14, "imagesJSONObject":Lorg/json/JSONObject;
    if-eqz v14, :cond_207

    .line 145
    invoke-virtual {v14}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v12

    .line 146
    .local v12, "imageTypesJsonArray":Lorg/json/JSONArray;
    const/4 v5, 0x0

    .local v5, "counter3":I
    :goto_11f
    invoke-virtual {v12}, Lorg/json/JSONArray;->length()I

    move-result v28

    move/from16 v0, v28

    if-ge v5, v0, :cond_20b

    .line 147
    invoke-virtual {v12, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 148
    .local v11, "imageType":Ljava/lang/String;
    invoke-virtual {v14, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 149
    .local v10, "imageJsonObject":Lorg/json/JSONObject;
    const-string v28, "url"

    move-object/from16 v0, v28

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 150
    .local v13, "imageUrl":Ljava/lang/String;
    const-string v28, "thumbnail_sm"

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_14d

    .line 151
    sget-object v28, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMBNAIL_SM:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    move-object/from16 v0, v25

    move-object/from16 v1, v28

    invoke-virtual {v0, v1, v13}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->setLatestRevisionImageUrl(Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;Ljava/lang/String;)V

    .line 146
    :cond_14a
    :goto_14a
    add-int/lit8 v5, v5, 0x1

    goto :goto_11f

    .line 152
    :cond_14d
    const-string v28, "thumbnail"

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_178

    .line 153
    sget-object v28, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMBNAIL:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    move-object/from16 v0, v25

    move-object/from16 v1, v28

    invoke-virtual {v0, v1, v13}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->setLatestRevisionImageUrl(Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;Ljava/lang/String;)V
    :try_end_160
    .catch Lorg/json/JSONException; {:try_start_a5 .. :try_end_160} :catch_161

    goto :goto_14a

    .line 179
    .end local v3    # "counter":I
    .end local v4    # "counter2":I
    .end local v5    # "counter3":I
    .end local v10    # "imageJsonObject":Lorg/json/JSONObject;
    .end local v11    # "imageType":Ljava/lang/String;
    .end local v12    # "imageTypesJsonArray":Lorg/json/JSONArray;
    .end local v13    # "imageUrl":Ljava/lang/String;
    .end local v14    # "imagesJSONObject":Lorg/json/JSONObject;
    .end local v18    # "revisionIDsJsonArray":Lorg/json/JSONArray;
    .end local v19    # "revisionJsonObject":Lorg/json/JSONObject;
    .end local v20    # "revisionsJsonObject":Lorg/json/JSONObject;
    .end local v25    # "wipDTO":Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    .end local v26    # "wipJsonObject":Lorg/json/JSONObject;
    .end local v27    # "wipsJsonArray":Lorg/json/JSONArray;
    :catch_161
    move-exception v6

    .line 180
    .local v6, "e":Lorg/json/JSONException;
    sget-object v28, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v29, "Problem parsing WIP JSON response"

    const/16 v30, 0x0

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    move-object/from16 v2, v30

    invoke-interface {v0, v6, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 181
    throw v6

    .line 154
    .end local v6    # "e":Lorg/json/JSONException;
    .restart local v3    # "counter":I
    .restart local v4    # "counter2":I
    .restart local v5    # "counter3":I
    .restart local v10    # "imageJsonObject":Lorg/json/JSONObject;
    .restart local v11    # "imageType":Ljava/lang/String;
    .restart local v12    # "imageTypesJsonArray":Lorg/json/JSONArray;
    .restart local v13    # "imageUrl":Ljava/lang/String;
    .restart local v14    # "imagesJSONObject":Lorg/json/JSONObject;
    .restart local v18    # "revisionIDsJsonArray":Lorg/json/JSONArray;
    .restart local v19    # "revisionJsonObject":Lorg/json/JSONObject;
    .restart local v20    # "revisionsJsonObject":Lorg/json/JSONObject;
    .restart local v25    # "wipDTO":Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    .restart local v26    # "wipJsonObject":Lorg/json/JSONObject;
    .restart local v27    # "wipsJsonArray":Lorg/json/JSONArray;
    :cond_178
    :try_start_178
    const-string v28, "normal_resolution"

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_18c

    .line 155
    sget-object v28, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->NORMAL_RESOLUTION:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    move-object/from16 v0, v25

    move-object/from16 v1, v28

    invoke-virtual {v0, v1, v13}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->setLatestRevisionImageUrl(Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;Ljava/lang/String;)V

    goto :goto_14a

    .line 156
    :cond_18c
    const-string v28, "high_definition"

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_1a0

    .line 157
    sget-object v28, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->HIGH_DEFINITION:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    move-object/from16 v0, v25

    move-object/from16 v1, v28

    invoke-virtual {v0, v1, v13}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->setLatestRevisionImageUrl(Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;Ljava/lang/String;)V

    goto :goto_14a

    .line 158
    :cond_1a0
    const-string v28, "thumb_40"

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_1b4

    .line 159
    sget-object v28, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMB_40:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    move-object/from16 v0, v25

    move-object/from16 v1, v28

    invoke-virtual {v0, v1, v13}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->setLatestRevisionImageUrl(Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;Ljava/lang/String;)V

    goto :goto_14a

    .line 160
    :cond_1b4
    const-string v28, "thumb_80"

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_1c8

    .line 161
    sget-object v28, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMB_80:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    move-object/from16 v0, v25

    move-object/from16 v1, v28

    invoke-virtual {v0, v1, v13}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->setLatestRevisionImageUrl(Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;Ljava/lang/String;)V

    goto :goto_14a

    .line 162
    :cond_1c8
    const-string v28, "thumb_120"

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_1dd

    .line 163
    sget-object v28, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMB_120:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    move-object/from16 v0, v25

    move-object/from16 v1, v28

    invoke-virtual {v0, v1, v13}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->setLatestRevisionImageUrl(Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;Ljava/lang/String;)V

    goto/16 :goto_14a

    .line 164
    :cond_1dd
    const-string v28, "thumb_240"

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_1f2

    .line 165
    sget-object v28, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMB_240:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    move-object/from16 v0, v25

    move-object/from16 v1, v28

    invoke-virtual {v0, v1, v13}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->setLatestRevisionImageUrl(Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;Ljava/lang/String;)V

    goto/16 :goto_14a

    .line 166
    :cond_1f2
    const-string v28, "limit_320"

    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v28

    if-eqz v28, :cond_14a

    .line 167
    sget-object v28, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->LIMIT_320:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    move-object/from16 v0, v25

    move-object/from16 v1, v28

    invoke-virtual {v0, v1, v13}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO;->setLatestRevisionImageUrl(Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;Ljava/lang/String;)V

    goto/16 :goto_14a

    .line 140
    .end local v5    # "counter3":I
    .end local v10    # "imageJsonObject":Lorg/json/JSONObject;
    .end local v11    # "imageType":Ljava/lang/String;
    .end local v12    # "imageTypesJsonArray":Lorg/json/JSONArray;
    .end local v13    # "imageUrl":Ljava/lang/String;
    .end local v14    # "imagesJSONObject":Lorg/json/JSONObject;
    :cond_207
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_f6

    .line 177
    .end local v4    # "counter2":I
    .end local v18    # "revisionIDsJsonArray":Lorg/json/JSONArray;
    .end local v19    # "revisionJsonObject":Lorg/json/JSONObject;
    :cond_20b
    move-object/from16 v0, v17

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_212
    .catch Lorg/json/JSONException; {:try_start_178 .. :try_end_212} :catch_161

    .line 128
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_ae

    .line 185
    .end local v3    # "counter":I
    .end local v17    # "response":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    .end local v20    # "revisionsJsonObject":Lorg/json/JSONObject;
    .end local v25    # "wipDTO":Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
    .end local v26    # "wipJsonObject":Lorg/json/JSONObject;
    .end local v27    # "wipsJsonArray":Lorg/json/JSONArray;
    :cond_216
    sget-object v28, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v29, "Unexpected HTTP Response code when trying to fetch User WIPs. [User ID - %s] [Response code - %d]"

    const/16 v30, 0x2

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;->getUserId()Ljava/lang/String;

    move-result-object v32

    aput-object v32, v30, v31

    const/16 v31, 0x1

    .line 186
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    aput-object v32, v30, v31

    .line 185
    invoke-interface/range {v28 .. v30}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 187
    new-instance v28, Ljava/lang/Exception;

    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    const-string v30, "Invalid server response code "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p4

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->setException(Ljava/lang/Exception;)V

    .line 188
    const/16 v28, 0x1

    move-object/from16 v0, p4

    move/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->setExceptionOccurred(Z)V

    .line 190
    const/16 v17, 0x0

    :cond_261
    return-object v17
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;)Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;
    .registers 12
    .param p1, "arg0"    # [Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 68
    new-instance v2, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;

    invoke-direct {v2}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;-><init>()V

    .line 70
    .local v2, "result":Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;
    const/4 v6, 0x0

    :try_start_8
    aget-object v6, p1, v6

    iput-object v6, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;

    .line 72
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 74
    .local v1, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    const/4 v5, 0x1

    .line 75
    .local v5, "wipsPageNumber":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .local v3, "totalUserWIPsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    :goto_17
    iget-object v6, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;

    invoke-direct {p0, v6, v5, v1, v2}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->getUserWips(Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;ILorg/apache/http/impl/client/DefaultHttpClient;Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;)Ljava/util/List;

    move-result-object v4

    .line 78
    .local v4, "wipsFromServer":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    if-eqz v4, :cond_22

    .line 79
    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 82
    :cond_22
    if-eqz v4, :cond_32

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    const/16 v7, 0x18

    if-lt v6, v7, :cond_32

    invoke-virtual {v2}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->isExceptionOccurred()Z

    move-result v6

    if-eqz v6, :cond_36

    .line 87
    :cond_32
    invoke-virtual {v2, v3}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->setWipsList(Ljava/util/List;)V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_35} :catch_39
    .catch Ljava/lang/Error; {:try_start_8 .. :try_end_35} :catch_4a

    .line 98
    .end local v1    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v3    # "totalUserWIPsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    .end local v4    # "wipsFromServer":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    .end local v5    # "wipsPageNumber":I
    :goto_35
    return-object v2

    .line 85
    .restart local v1    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .restart local v3    # "totalUserWIPsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    .restart local v4    # "wipsFromServer":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    .restart local v5    # "wipsPageNumber":I
    :cond_36
    add-int/lit8 v5, v5, 0x1

    .line 86
    goto :goto_17

    .line 89
    .end local v1    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v3    # "totalUserWIPsList":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    .end local v4    # "wipsFromServer":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKWIPDTO;>;"
    .end local v5    # "wipsPageNumber":I
    :catch_39
    move-exception v0

    .line 90
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v2, v9}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->setExceptionOccurred(Z)V

    .line 91
    invoke-virtual {v2, v0}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->setException(Ljava/lang/Exception;)V

    .line 92
    sget-object v6, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v7, "Problem Getting user WIPs"

    new-array v8, v8, [Ljava/lang/Object;

    invoke-interface {v6, v0, v7, v8}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_35

    .line 93
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_4a
    move-exception v0

    .line 94
    .local v0, "e":Ljava/lang/Error;
    invoke-virtual {v2, v9}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->setExceptionOccurred(Z)V

    .line 95
    new-instance v6, Ljava/lang/Exception;

    invoke-direct {v6, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v2, v6}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->setException(Ljava/lang/Exception;)V

    .line 96
    sget-object v6, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v7, "Problem Getting user WIPs"

    new-array v8, v8, [Ljava/lang/Object;

    invoke-interface {v6, v0, v7, v8}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_35
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 53
    check-cast p1, [Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;)Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;)V
    .registers 5
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;

    .prologue
    .line 195
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->isExceptionOccurred()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 196
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserWIPsTaskListener;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->getException()Ljava/lang/Exception;

    move-result-object v1

    iget-object v2, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;

    invoke-interface {v0, v1, v2}, Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserWIPsTaskListener;->onGetUserWIPsTaskFailure(Ljava/lang/Exception;Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;)V

    .line 200
    :goto_11
    return-void

    .line 198
    :cond_12
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserWIPsTaskListener;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;->getWipsList()Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;

    invoke-interface {v0, v1, v2}, Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserWIPsTaskListener;->onGetUserWIPsTaskSuccess(Ljava/util/List;Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserWIPsTaskParams;)V

    goto :goto_11
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 53
    check-cast p1, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsAsyncTask;->onPostExecute(Lcom/behance/sdk/asynctasks/BehanceSDKGetUserWIPsTaskResult;)V

    return-void
.end method
