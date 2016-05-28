.class public Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;
.super Landroid/os/AsyncTask;
.source "BehanceSDKGetStatesOfCountryAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;",
        "Ljava/lang/Void;",
        "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;",
        ">;>;>;"
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private countryId:Ljava/lang/String;

.field private taskHandler:Lcom/behance/sdk/listeners/IGetStatesOfCountryAsyncTaskListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 31
    const-class v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>(Lcom/behance/sdk/listeners/IGetStatesOfCountryAsyncTaskListener;)V
    .registers 2
    .param p1, "taskHandler"    # Lcom/behance/sdk/listeners/IGetStatesOfCountryAsyncTaskListener;

    .prologue
    .line 37
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->taskHandler:Lcom/behance/sdk/listeners/IGetStatesOfCountryAsyncTaskListener;

    .line 39
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;
    .registers 28
    .param p1, "params"    # [Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;",
            ")",
            "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 44
    new-instance v11, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    invoke-direct {v11}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;-><init>()V

    .line 46
    .local v11, "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;>;>;"
    const/16 v21, 0x0

    aget-object v18, p1, v21

    .line 48
    .local v18, "taskParams":Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v21, v0

    const/16 v22, 0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-eq v0, v1, :cond_2a

    .line 49
    new-instance v21, Ljava/lang/Exception;

    const-string v22, "Missing country ID"

    invoke-direct/range {v21 .. v22}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v11, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V

    .line 50
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    .line 97
    :goto_29
    return-object v11

    .line 55
    :cond_2a
    :try_start_2a
    new-instance v5, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v5}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 57
    .local v5, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    invoke-virtual/range {v18 .. v18}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;->getCountryId()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->countryId:Ljava/lang/String;

    .line 58
    new-instance v20, Ljava/util/HashMap;

    invoke-direct/range {v20 .. v20}, Ljava/util/HashMap;-><init>()V

    .line 59
    .local v20, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v21, "countryId"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->countryId:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-interface/range {v20 .. v22}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    const-string v21, "clientId"

    invoke-virtual/range {v18 .. v18}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;->getClientId()Ljava/lang/String;

    move-result-object v22

    invoke-interface/range {v20 .. v22}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    const-string v21, "{server_root_url}/utilities/location?level=2&country={countryId}&{key_client_id_param}={clientId}"

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v19

    .line 63
    .local v19, "url":Ljava/lang/String;
    sget-object v21, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v22, "Get States of Country URL - %s"

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v19, v23, v24

    invoke-interface/range {v21 .. v23}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 65
    new-instance v6, Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v0, v19

    invoke-direct {v6, v0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 66
    .local v6, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    invoke-virtual {v5, v6}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v7

    .line 68
    .local v7, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v8

    .line 69
    .local v8, "jsonResponseString":Ljava/lang/String;
    sget-object v21, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v22, "Get States of Country [Country id - %s ] response: %s"

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->countryId:Ljava/lang/String;

    move-object/from16 v25, v0

    aput-object v25, v23, v24

    const/16 v24, 0x1

    aput-object v8, v23, v24

    invoke-interface/range {v21 .. v23}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 71
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .local v16, "statesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;>;"
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 74
    .local v12, "rootJsonObject":Lorg/json/JSONObject;
    invoke-virtual {v12}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v10

    .line 75
    .local v10, "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_ad
    :goto_ad
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_10a

    .line 76
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 77
    .local v9, "keyStr":Ljava/lang/String;
    invoke-virtual {v12, v9}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    .line 78
    .local v15, "stateObject":Lorg/json/JSONObject;
    if-eqz v15, :cond_ad

    .line 79
    move-object v0, v15

    check-cast v0, Lorg/json/JSONObject;

    move-object v14, v0

    .line 80
    .local v14, "stateJsonObject":Lorg/json/JSONObject;
    new-instance v13, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    invoke-direct {v13}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;-><init>()V

    .line 81
    .local v13, "stateDTO":Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    const-string v21, "id"

    move-object/from16 v0, v21

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;->setId(Ljava/lang/String;)V

    .line 82
    const-string v21, "n"

    move-object/from16 v0, v21

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;->setDisplayName(Ljava/lang/String;)V

    .line 83
    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_e7
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_e7} :catch_e8
    .catch Ljava/lang/Throwable; {:try_start_2a .. :try_end_e7} :catch_114

    goto :goto_ad

    .line 88
    .end local v5    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v6    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .end local v7    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v8    # "jsonResponseString":Ljava/lang/String;
    .end local v9    # "keyStr":Ljava/lang/String;
    .end local v10    # "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v12    # "rootJsonObject":Lorg/json/JSONObject;
    .end local v13    # "stateDTO":Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    .end local v14    # "stateJsonObject":Lorg/json/JSONObject;
    .end local v15    # "stateObject":Lorg/json/JSONObject;
    .end local v16    # "statesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;>;"
    .end local v19    # "url":Ljava/lang/String;
    .end local v20    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_e8
    move-exception v4

    .line 89
    .local v4, "e":Ljava/lang/Exception;
    sget-object v21, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v22, "Problem getting States of Country from server"

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-interface {v0, v4, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 90
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    .line 91
    invoke-virtual {v11, v4}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V

    goto/16 :goto_29

    .line 86
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v5    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .restart local v6    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .restart local v7    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v8    # "jsonResponseString":Ljava/lang/String;
    .restart local v10    # "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .restart local v12    # "rootJsonObject":Lorg/json/JSONObject;
    .restart local v16    # "statesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;>;"
    .restart local v19    # "url":Ljava/lang/String;
    .restart local v20    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_10a
    :try_start_10a
    invoke-static/range {v16 .. v16}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 87
    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setResult(Ljava/lang/Object;)V
    :try_end_112
    .catch Ljava/lang/Exception; {:try_start_10a .. :try_end_112} :catch_e8
    .catch Ljava/lang/Throwable; {:try_start_10a .. :try_end_112} :catch_114

    goto/16 :goto_29

    .line 92
    .end local v5    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v6    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .end local v7    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v8    # "jsonResponseString":Ljava/lang/String;
    .end local v10    # "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v12    # "rootJsonObject":Lorg/json/JSONObject;
    .end local v16    # "statesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;>;"
    .end local v19    # "url":Ljava/lang/String;
    .end local v20    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_114
    move-exception v17

    .line 93
    .local v17, "t":Ljava/lang/Throwable;
    sget-object v21, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v22, "Problem getting States of Country from server"

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    move-object/from16 v2, v22

    move-object/from16 v3, v23

    invoke-interface {v0, v1, v2, v3}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 94
    new-instance v21, Ljava/lang/Exception;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v11, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V

    .line 95
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v11, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    goto/16 :goto_29
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 29
    check-cast p1, [Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKGetStatesOfCountryAsyncTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 102
    .local p1, "resultWrapper":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;>;>;"
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->isExceptionOccurred()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 103
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->taskHandler:Lcom/behance/sdk/listeners/IGetStatesOfCountryAsyncTaskListener;

    iget-object v1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->countryId:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->getException()Ljava/lang/Exception;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/behance/sdk/listeners/IGetStatesOfCountryAsyncTaskListener;->onGetStatesFailure(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 107
    :goto_11
    return-void

    .line 105
    :cond_12
    iget-object v1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->taskHandler:Lcom/behance/sdk/listeners/IGetStatesOfCountryAsyncTaskListener;

    iget-object v2, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->countryId:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v1, v2, v0}, Lcom/behance/sdk/listeners/IGetStatesOfCountryAsyncTaskListener;->onGetStatesSuccess(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_11
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 29
    check-cast p1, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetStatesOfCountryAsyncTask;->onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;)V

    return-void
.end method
