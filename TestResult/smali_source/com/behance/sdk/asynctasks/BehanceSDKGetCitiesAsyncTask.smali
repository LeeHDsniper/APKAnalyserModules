.class public Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;
.super Landroid/os/AsyncTask;
.source "BehanceSDKGetCitiesAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;",
        "Ljava/lang/Void;",
        "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;",
        ">;>;>;"
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private taskHandler:Lcom/behance/sdk/listeners/IGetCitiesAsyncTaskListener;

.field private taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 31
    const-class v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>(Lcom/behance/sdk/listeners/IGetCitiesAsyncTaskListener;)V
    .registers 2
    .param p1, "taskHandler"    # Lcom/behance/sdk/listeners/IGetCitiesAsyncTaskListener;

    .prologue
    .line 37
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskHandler:Lcom/behance/sdk/listeners/IGetCitiesAsyncTaskListener;

    .line 39
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;
    .registers 24
    .param p1, "params"    # [Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;",
            ")",
            "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 44
    new-instance v12, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    invoke-direct {v12}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;-><init>()V

    .line 47
    .local v12, "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;>;>;"
    :try_start_5
    new-instance v8, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v8}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 49
    .local v8, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    const/16 v18, 0x0

    aget-object v18, p1, v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    .line 51
    new-instance v17, Ljava/util/HashMap;

    invoke-direct/range {v17 .. v17}, Ljava/util/HashMap;-><init>()V

    .line 52
    .local v17, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v18, "clientId"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getClientId()Ljava/lang/String;

    move-result-object v19

    invoke-interface/range {v17 .. v19}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    const-string v18, "{server_root_url}/utilities/location?level=3&{key_client_id_param}={clientId}"

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v16

    .line 55
    .local v16, "url":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCountryId()Ljava/lang/String;

    move-result-object v18

    if-eqz v18, :cond_64

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCountryId()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v18

    if-lez v18, :cond_64

    .line 56
    const-string v18, "country"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCountryId()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    .line 59
    :cond_64
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getStateId()Ljava/lang/String;

    move-result-object v18

    if-eqz v18, :cond_96

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getStateId()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v18

    if-lez v18, :cond_96

    .line 60
    const-string v18, "stateprov"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getStateId()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    .line 63
    :cond_96
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCitySearchStr()Ljava/lang/String;

    move-result-object v18

    if-eqz v18, :cond_c8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCitySearchStr()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v18

    if-lez v18, :cond_c8

    .line 64
    const-string v18, "city"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;->getCitySearchStr()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    .line 67
    :cond_c8
    sget-object v18, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v19, "Get Cities URL - %s"

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput-object v16, v20, v21

    invoke-interface/range {v18 .. v20}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 69
    new-instance v9, Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v0, v16

    invoke-direct {v9, v0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 70
    .local v9, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    invoke-virtual {v8, v9}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v10

    .line 72
    .local v10, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v10}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v11

    .line 73
    .local v11, "jsonResponseString":Ljava/lang/String;
    sget-object v18, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v19, "Get cities response: %s"

    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    const/16 v21, 0x0

    aput-object v11, v20, v21

    invoke-interface/range {v18 .. v20}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 75
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .local v14, "statesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;>;"
    new-instance v13, Lorg/json/JSONArray;

    invoke-direct {v13, v11}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 78
    .local v13, "rootJsonArray":Lorg/json/JSONArray;
    const/4 v6, 0x0

    .local v6, "counter":I
    :goto_10c
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v18

    move/from16 v0, v18

    if-ge v6, v0, :cond_143

    .line 79
    invoke-virtual {v13, v6}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v5

    .line 80
    .local v5, "cityObject":Ljava/lang/Object;
    if-eqz v5, :cond_140

    .line 81
    move-object v0, v5

    check-cast v0, Lorg/json/JSONObject;

    move-object v4, v0

    .line 82
    .local v4, "cityJsonObject":Lorg/json/JSONObject;
    new-instance v3, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    invoke-direct {v3}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;-><init>()V

    .line 83
    .local v3, "CityDTO":Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;
    const-string v18, "id"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->setId(Ljava/lang/String;)V

    .line 84
    const-string v18, "n"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->setDisplayName(Ljava/lang/String;)V

    .line 85
    invoke-virtual {v14, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    .end local v3    # "CityDTO":Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;
    .end local v4    # "cityJsonObject":Lorg/json/JSONObject;
    :cond_140
    add-int/lit8 v6, v6, 0x1

    goto :goto_10c

    .line 88
    .end local v5    # "cityObject":Ljava/lang/Object;
    :cond_143
    invoke-static {v14}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 89
    invoke-virtual {v12, v14}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setResult(Ljava/lang/Object;)V
    :try_end_149
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_149} :catch_14a
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_149} :catch_16b

    .line 99
    .end local v6    # "counter":I
    .end local v8    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v9    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .end local v10    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v11    # "jsonResponseString":Ljava/lang/String;
    .end local v13    # "rootJsonArray":Lorg/json/JSONArray;
    .end local v14    # "statesList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;>;"
    .end local v16    # "url":Ljava/lang/String;
    .end local v17    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_149
    return-object v12

    .line 90
    :catch_14a
    move-exception v7

    .line 91
    .local v7, "e":Ljava/lang/Exception;
    sget-object v18, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v19, "Problem getting Cities from server"

    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v7, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 92
    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-virtual {v12, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    .line 93
    invoke-virtual {v12, v7}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V

    goto :goto_149

    .line 94
    .end local v7    # "e":Ljava/lang/Exception;
    :catch_16b
    move-exception v15

    .line 95
    .local v15, "t":Ljava/lang/Throwable;
    sget-object v18, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v19, "Problem getting Cities from server"

    const/16 v20, 0x0

    move/from16 v0, v20

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v20, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v15, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 96
    new-instance v18, Ljava/lang/Exception;

    invoke-virtual {v15}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setException(Ljava/lang/Exception;)V

    .line 97
    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-virtual {v12, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->setExceptionOccurred(Z)V

    goto :goto_149
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 29
    check-cast p1, [Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

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
            "Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 104
    .local p1, "resultWrapper":Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper<Ljava/util/List<Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;>;>;"
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->isExceptionOccurred()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 105
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskHandler:Lcom/behance/sdk/listeners/IGetCitiesAsyncTaskListener;

    iget-object v1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->getException()Ljava/lang/Exception;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/behance/sdk/listeners/IGetCitiesAsyncTaskListener;->onGetCitiesFailure(Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;Ljava/lang/Exception;)V

    .line 109
    :goto_11
    return-void

    .line 107
    :cond_12
    iget-object v1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskHandler:Lcom/behance/sdk/listeners/IGetCitiesAsyncTaskListener;

    iget-object v2, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->taskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v1, v2, v0}, Lcom/behance/sdk/listeners/IGetCitiesAsyncTaskListener;->onGetCitiesSuccess(Lcom/behance/sdk/asynctask/params/BehanceSDKGetCitiesAsyncTaskParams;Ljava/util/List;)V

    goto :goto_11
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 29
    check-cast p1, Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetCitiesAsyncTask;->onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKAsyncTaskResultWrapper;)V

    return-void
.end method
