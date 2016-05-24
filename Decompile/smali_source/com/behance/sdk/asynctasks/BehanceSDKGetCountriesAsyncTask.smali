.class public Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;
.super Landroid/os/AsyncTask;
.source "BehanceSDKGetCountriesAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;",
        "Ljava/lang/Void;",
        "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;",
        ">;>;>;"
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private taskHandler:Lcom/behance/sdk/listeners/IGetCountriesAsyncTaskListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 31
    const-class v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>(Lcom/behance/sdk/listeners/IGetCountriesAsyncTaskListener;)V
    .registers 2
    .param p1, "taskHandler"    # Lcom/behance/sdk/listeners/IGetCountriesAsyncTaskListener;

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;->taskHandler:Lcom/behance/sdk/listeners/IGetCountriesAsyncTaskListener;

    .line 37
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;
    .registers 27
    .param p1, "params"    # [Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;",
            ")",
            "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 42
    new-instance v15, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    invoke-direct {v15}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;-><init>()V

    .line 44
    .local v15, "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;>;>;"
    const/16 v21, 0x0

    aget-object v18, p1, v21

    .line 47
    .local v18, "taskParams":Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;
    :try_start_9
    new-instance v9, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v9}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 49
    .local v9, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    new-instance v20, Ljava/util/HashMap;

    invoke-direct/range {v20 .. v20}, Ljava/util/HashMap;-><init>()V

    .line 50
    .local v20, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v21, "clientId"

    invoke-virtual/range {v18 .. v18}, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;->getClientId()Ljava/lang/String;

    move-result-object v22

    invoke-interface/range {v20 .. v22}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    const-string v21, "{server_root_url}/utilities/location?level=1&{key_client_id_param}={clientId}"

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v19

    .line 53
    .local v19, "url":Ljava/lang/String;
    new-instance v10, Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v0, v19

    invoke-direct {v10, v0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 54
    .local v10, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    invoke-virtual {v9, v10}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v11

    .line 56
    .local v11, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v11}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v12

    .line 57
    .local v12, "jsonResponseString":Ljava/lang/String;
    sget-object v21, Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v22, "Get Countries response: %s"

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-object v12, v23, v24

    invoke-interface/range {v21 .. v23}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 59
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .local v4, "countriesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;>;"
    new-instance v16, Lorg/json/JSONObject;

    move-object/from16 v0, v16

    invoke-direct {v0, v12}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 62
    .local v16, "rootJsonObject":Lorg/json/JSONObject;
    invoke-virtual/range {v16 .. v16}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v14

    .line 63
    .local v14, "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_5c
    :goto_5c
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_b8

    .line 64
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 65
    .local v13, "keyStr":Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 66
    .local v7, "countryObject":Lorg/json/JSONObject;
    if-eqz v7, :cond_5c

    .line 67
    move-object v0, v7

    check-cast v0, Lorg/json/JSONObject;

    move-object v6, v0

    .line 68
    .local v6, "countryJsonObject":Lorg/json/JSONObject;
    new-instance v5, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    invoke-direct {v5}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;-><init>()V

    .line 69
    .local v5, "countryDTO":Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    const-string v21, "id"

    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->setId(Ljava/lang/String;)V

    .line 70
    const-string v21, "n"

    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->setDisplayName(Ljava/lang/String;)V

    .line 71
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_96
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_96} :catch_97
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_96} :catch_bf

    goto :goto_5c

    .line 76
    .end local v4    # "countriesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;>;"
    .end local v5    # "countryDTO":Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    .end local v6    # "countryJsonObject":Lorg/json/JSONObject;
    .end local v7    # "countryObject":Lorg/json/JSONObject;
    .end local v9    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v10    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .end local v11    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v12    # "jsonResponseString":Ljava/lang/String;
    .end local v13    # "keyStr":Ljava/lang/String;
    .end local v14    # "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v16    # "rootJsonObject":Lorg/json/JSONObject;
    .end local v19    # "url":Ljava/lang/String;
    .end local v20    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_97
    move-exception v8

    .line 77
    .local v8, "e":Ljava/lang/Exception;
    sget-object v21, Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v22, "Problem getting Countries from server"

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    move-object/from16 v2, v23

    invoke-interface {v0, v8, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 78
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v15, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    .line 79
    invoke-virtual {v15, v8}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V

    .line 85
    .end local v8    # "e":Ljava/lang/Exception;
    :goto_b7
    return-object v15

    .line 74
    .restart local v4    # "countriesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;>;"
    .restart local v9    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .restart local v10    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .restart local v11    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v12    # "jsonResponseString":Ljava/lang/String;
    .restart local v14    # "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .restart local v16    # "rootJsonObject":Lorg/json/JSONObject;
    .restart local v19    # "url":Ljava/lang/String;
    .restart local v20    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_b8
    :try_start_b8
    invoke-static {v4}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 75
    invoke-virtual {v15, v4}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setResult(Ljava/lang/Object;)V
    :try_end_be
    .catch Ljava/lang/Exception; {:try_start_b8 .. :try_end_be} :catch_97
    .catch Ljava/lang/Throwable; {:try_start_b8 .. :try_end_be} :catch_bf

    goto :goto_b7

    .line 80
    .end local v4    # "countriesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;>;"
    .end local v9    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v10    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .end local v11    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v12    # "jsonResponseString":Ljava/lang/String;
    .end local v14    # "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v16    # "rootJsonObject":Lorg/json/JSONObject;
    .end local v19    # "url":Ljava/lang/String;
    .end local v20    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_bf
    move-exception v17

    .line 81
    .local v17, "t":Ljava/lang/Throwable;
    sget-object v21, Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v22, "Problem getting Countries from server"

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    move-object/from16 v2, v22

    move-object/from16 v3, v23

    invoke-interface {v0, v1, v2, v3}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 82
    new-instance v21, Ljava/lang/Exception;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V

    .line 83
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v15, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    goto :goto_b7
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 29
    check-cast p1, [Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;->doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

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
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 90
    .local p1, "resultWrapper":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;>;>;"
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->isExceptionOccurred()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 91
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;->taskHandler:Lcom/behance/sdk/listeners/IGetCountriesAsyncTaskListener;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->getException()Ljava/lang/Exception;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/behance/sdk/listeners/IGetCountriesAsyncTaskListener;->onGetCountriesFailure(Ljava/lang/Exception;)V

    .line 95
    :goto_f
    return-void

    .line 93
    :cond_10
    iget-object v1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;->taskHandler:Lcom/behance/sdk/listeners/IGetCountriesAsyncTaskListener;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v1, v0}, Lcom/behance/sdk/listeners/IGetCountriesAsyncTaskListener;->onGetCountriesSuccess(Ljava/util/List;)V

    goto :goto_f
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 29
    check-cast p1, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetCountriesAsyncTask;->onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;)V

    return-void
.end method
