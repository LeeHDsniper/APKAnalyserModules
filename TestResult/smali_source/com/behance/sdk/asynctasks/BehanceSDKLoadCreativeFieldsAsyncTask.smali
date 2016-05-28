.class public Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;
.super Landroid/os/AsyncTask;
.source "BehanceSDKLoadCreativeFieldsAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
        ">;>;>;"
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private iUserCredentials:Lcom/behance/sdk/IBehanceSDKUserCredentials;

.field private taskHandler:Lcom/behance/sdk/datamanager/listeners/interfaces/IGetCreativeFieldsAsyncTaskListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 60
    const-class v0, Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>(Lcom/behance/sdk/datamanager/listeners/interfaces/IGetCreativeFieldsAsyncTaskListener;)V
    .registers 2
    .param p1, "taskHandler"    # Lcom/behance/sdk/datamanager/listeners/interfaces/IGetCreativeFieldsAsyncTaskListener;

    .prologue
    .line 66
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 67
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;->taskHandler:Lcom/behance/sdk/datamanager/listeners/interfaces/IGetCreativeFieldsAsyncTaskListener;

    .line 68
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult;
    .registers 26
    .param p1, "params"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 73
    new-instance v16, Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult;

    invoke-direct/range {v16 .. v16}, Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult;-><init>()V

    .line 76
    .local v16, "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult<Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;>;"
    :try_start_5
    new-instance v19, Ljava/util/HashMap;

    invoke-direct/range {v19 .. v19}, Ljava/util/HashMap;-><init>()V

    .line 77
    .local v19, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v20, "clientId"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;->iUserCredentials:Lcom/behance/sdk/IBehanceSDKUserCredentials;

    move-object/from16 v21, v0

    invoke-interface/range {v21 .. v21}, Lcom/behance/sdk/IBehanceSDKUserCredentials;->getClientId()Ljava/lang/String;

    move-result-object v21

    invoke-interface/range {v19 .. v21}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    const-string v20, "{server_root_url}/v2/fields?{key_client_id_param}={clientId}"

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v18

    .line 79
    .local v18, "url":Ljava/lang/String;
    new-instance v8, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v8}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 80
    .local v8, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    new-instance v9, Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v0, v18

    invoke-direct {v9, v0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 81
    .local v9, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    invoke-virtual {v8, v9}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v10

    .line 83
    .local v10, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v10}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v20

    invoke-static/range {v20 .. v20}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v13

    .line 84
    .local v13, "jsonResponseString":Ljava/lang/String;
    sget-object v20, Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v21, "Get creative fields response: %s"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    aput-object v13, v22, v23

    invoke-interface/range {v20 .. v22}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 86
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .local v3, "creativeFields":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    new-instance v15, Ljava/util/HashMap;

    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    .line 89
    .local v15, "popularcreativeFields":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    new-instance v17, Lorg/json/JSONObject;

    move-object/from16 v0, v17

    invoke-direct {v0, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 90
    .local v17, "rootJsonObject":Lorg/json/JSONObject;
    const-string v20, "popular"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v14

    .line 91
    .local v14, "popular":Lorg/json/JSONArray;
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_6a
    invoke-virtual {v14}, Lorg/json/JSONArray;->length()I

    move-result v20

    move/from16 v0, v20

    if-ge v11, v0, :cond_a0

    .line 92
    invoke-virtual {v14, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 93
    .local v5, "field":Lorg/json/JSONObject;
    new-instance v2, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;

    invoke-direct {v2}, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;-><init>()V

    .line 94
    .local v2, "creativeFieldDTO":Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    const-string v20, "id"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 95
    .local v12, "id":Ljava/lang/String;
    invoke-virtual {v2, v12}, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->setId(Ljava/lang/String;)V

    .line 96
    const-string v20, "name"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v2, v0}, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->setName(Ljava/lang/String;)V

    .line 97
    sget-object v20, Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;->POPULAR:Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;

    move-object/from16 v0, v20

    invoke-virtual {v2, v0}, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->setCategory(Lcom/behance/sdk/enums/BehanceSDKCreativeFieldCategory;)V

    .line 98
    invoke-interface {v15, v12, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    add-int/lit8 v11, v11, 0x1

    goto :goto_6a

    .line 100
    .end local v2    # "creativeFieldDTO":Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    .end local v5    # "field":Lorg/json/JSONObject;
    .end local v12    # "id":Ljava/lang/String;
    :cond_a0
    const-string v20, "fields"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    .line 101
    .local v7, "fields":Lorg/json/JSONArray;
    const/4 v11, 0x0

    :goto_ab
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v20

    move/from16 v0, v20

    if-ge v11, v0, :cond_f7

    .line 102
    invoke-virtual {v7, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 103
    .restart local v5    # "field":Lorg/json/JSONObject;
    const-string v20, "id"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 105
    .local v6, "fieldID":Ljava/lang/String;
    invoke-interface {v15, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_d1

    .line 106
    invoke-interface {v15, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;

    .line 112
    .restart local v2    # "creativeFieldDTO":Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    :goto_cb
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    add-int/lit8 v11, v11, 0x1

    goto :goto_ab

    .line 108
    .end local v2    # "creativeFieldDTO":Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    :cond_d1
    new-instance v2, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;

    invoke-direct {v2}, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;-><init>()V

    .line 109
    .restart local v2    # "creativeFieldDTO":Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    invoke-virtual {v2, v6}, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->setId(Ljava/lang/String;)V

    .line 110
    const-string v20, "name"

    move-object/from16 v0, v20

    invoke-virtual {v5, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v2, v0}, Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;->setName(Ljava/lang/String;)V
    :try_end_e6
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_e6} :catch_e7

    goto :goto_cb

    .line 115
    .end local v2    # "creativeFieldDTO":Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;
    .end local v3    # "creativeFields":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    .end local v5    # "field":Lorg/json/JSONObject;
    .end local v6    # "fieldID":Ljava/lang/String;
    .end local v7    # "fields":Lorg/json/JSONArray;
    .end local v8    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v9    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .end local v10    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v11    # "i":I
    .end local v13    # "jsonResponseString":Ljava/lang/String;
    .end local v14    # "popular":Lorg/json/JSONArray;
    .end local v15    # "popularcreativeFields":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    .end local v17    # "rootJsonObject":Lorg/json/JSONObject;
    .end local v18    # "url":Ljava/lang/String;
    .end local v19    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_e7
    move-exception v4

    .line 116
    .local v4, "e":Ljava/lang/Exception;
    const/16 v20, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult;->setExceptionOccurred(Z)V

    .line 117
    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult;->setException(Ljava/lang/Exception;)V

    .line 119
    .end local v4    # "e":Ljava/lang/Exception;
    :goto_f6
    return-object v16

    .line 114
    .restart local v3    # "creativeFields":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    .restart local v7    # "fields":Lorg/json/JSONArray;
    .restart local v8    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .restart local v9    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .restart local v10    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v11    # "i":I
    .restart local v13    # "jsonResponseString":Ljava/lang/String;
    .restart local v14    # "popular":Lorg/json/JSONArray;
    .restart local v15    # "popularcreativeFields":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;"
    .restart local v17    # "rootJsonObject":Lorg/json/JSONObject;
    .restart local v18    # "url":Ljava/lang/String;
    .restart local v19    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_f7
    :try_start_f7
    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult;->setResult(Ljava/lang/Object;)V
    :try_end_fc
    .catch Ljava/lang/Exception; {:try_start_f7 .. :try_end_fc} :catch_e7

    goto :goto_f6
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 47
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;->doInBackground([Ljava/lang/Void;)Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult",
            "<",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 124
    .local p1, "resultWrapper":Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult;, "Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult<Ljava/util/List<Lcom/behance/sdk/dto/BehanceSDKCreativeFieldDTO;>;>;"
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult;->isExceptionOccurred()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 125
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;->taskHandler:Lcom/behance/sdk/datamanager/listeners/interfaces/IGetCreativeFieldsAsyncTaskListener;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult;->getException()Ljava/lang/Exception;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/behance/sdk/datamanager/listeners/interfaces/IGetCreativeFieldsAsyncTaskListener;->onLoadCreativeFieldsFailure(Ljava/lang/Exception;)V

    .line 129
    :goto_f
    return-void

    .line 127
    :cond_10
    iget-object v1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;->taskHandler:Lcom/behance/sdk/datamanager/listeners/interfaces/IGetCreativeFieldsAsyncTaskListener;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v1, v0}, Lcom/behance/sdk/datamanager/listeners/interfaces/IGetCreativeFieldsAsyncTaskListener;->onLoadCreativeFieldsSuccess(Ljava/util/List;)V

    goto :goto_f
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 47
    check-cast p1, Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;->onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKCreativeFieldsTaskResult;)V

    return-void
.end method

.method public setUserCredentials(Lcom/behance/sdk/IBehanceSDKUserCredentials;)V
    .registers 2
    .param p1, "iUserCredentials"    # Lcom/behance/sdk/IBehanceSDKUserCredentials;

    .prologue
    .line 135
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKLoadCreativeFieldsAsyncTask;->iUserCredentials:Lcom/behance/sdk/IBehanceSDKUserCredentials;

    .line 137
    return-void
.end method
