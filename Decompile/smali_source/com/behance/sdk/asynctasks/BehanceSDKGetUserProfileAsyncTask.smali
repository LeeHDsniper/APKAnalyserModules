.class public Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;
.super Landroid/os/AsyncTask;
.source "BehanceSDKGetUserProfileAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;",
        "Ljava/lang/Void;",
        "Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private getUserProfileTaskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;

.field private listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserProfileAsyncTaskListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 37
    const-class v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>(Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserProfileAsyncTaskListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserProfileAsyncTaskListener;

    .prologue
    .line 43
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserProfileAsyncTaskListener;

    .line 45
    return-void
.end method

.method private getCityDTO(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;
    .registers 23
    .param p1, "city"    # Ljava/lang/String;
    .param p2, "countryId"    # Ljava/lang/String;
    .param p3, "stateID"    # Ljava/lang/String;
    .param p4, "clientId"    # Ljava/lang/String;

    .prologue
    .line 133
    :try_start_0
    new-instance v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v6}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 135
    .local v6, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 136
    .local v13, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v14, "clientId"

    move-object/from16 v0, p4

    invoke-interface {v13, v14, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    const-string v14, "{server_root_url}/utilities/location?level=3&{key_client_id_param}={clientId}"

    invoke-static {v14, v13}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v12

    .line 139
    .local v12, "url":Ljava/lang/String;
    invoke-static/range {p2 .. p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_25

    .line 140
    const-string v14, "country"

    move-object/from16 v0, p2

    invoke-static {v12, v14, v0}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 143
    :cond_25
    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_33

    .line 144
    const-string v14, "stateprov"

    move-object/from16 v0, p3

    invoke-static {v12, v14, v0}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 147
    :cond_33
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v14

    if-nez v14, :cond_41

    .line 148
    const-string v14, "city"

    move-object/from16 v0, p1

    invoke-static {v12, v14, v0}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 151
    :cond_41
    sget-object v14, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v15, "Get Cities URL - %s"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v12, v16, v17

    invoke-interface/range {v14 .. v16}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 153
    new-instance v7, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v7, v12}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 154
    .local v7, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    invoke-virtual {v6, v7}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v8

    .line 156
    .local v8, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v8}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v14

    invoke-static {v14}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v9

    .line 157
    .local v9, "jsonResponseString":Ljava/lang/String;
    sget-object v14, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v15, "Get cities response: %s"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v9, v16, v17

    invoke-interface/range {v14 .. v16}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 158
    new-instance v10, Lorg/json/JSONArray;

    invoke-direct {v10, v9}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 159
    .local v10, "rootJsonArray":Lorg/json/JSONArray;
    const/4 v4, 0x0

    .local v4, "counter":I
    :goto_7e
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v4, v14, :cond_c5

    .line 160
    invoke-virtual {v10, v4}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v3

    .line 161
    .local v3, "cityObject":Ljava/lang/Object;
    if-eqz v3, :cond_b0

    .line 162
    move-object v0, v3

    check-cast v0, Lorg/json/JSONObject;

    move-object v2, v0

    .line 163
    .local v2, "cityJsonObject":Lorg/json/JSONObject;
    const-string v14, "n"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_b0

    .line 164
    new-instance v1, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    invoke-direct {v1}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;-><init>()V

    .line 165
    .local v1, "cityDTO":Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;
    const-string v14, "id"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1, v14}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->setId(Ljava/lang/String;)V

    .line 166
    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->setDisplayName(Ljava/lang/String;)V
    :try_end_af
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_af} :catch_b3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_af} :catch_c7

    .line 179
    .end local v1    # "cityDTO":Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;
    .end local v2    # "cityJsonObject":Lorg/json/JSONObject;
    .end local v3    # "cityObject":Ljava/lang/Object;
    .end local v4    # "counter":I
    .end local v6    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v7    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .end local v8    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v9    # "jsonResponseString":Ljava/lang/String;
    .end local v10    # "rootJsonArray":Lorg/json/JSONArray;
    .end local v12    # "url":Ljava/lang/String;
    .end local v13    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_af
    return-object v1

    .line 159
    .restart local v3    # "cityObject":Ljava/lang/Object;
    .restart local v4    # "counter":I
    .restart local v6    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .restart local v7    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .restart local v8    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v9    # "jsonResponseString":Ljava/lang/String;
    .restart local v10    # "rootJsonArray":Lorg/json/JSONArray;
    .restart local v12    # "url":Ljava/lang/String;
    .restart local v13    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_b0
    add-int/lit8 v4, v4, 0x1

    goto :goto_7e

    .line 172
    .end local v3    # "cityObject":Ljava/lang/Object;
    .end local v4    # "counter":I
    .end local v6    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v7    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .end local v8    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v9    # "jsonResponseString":Ljava/lang/String;
    .end local v10    # "rootJsonArray":Lorg/json/JSONArray;
    .end local v12    # "url":Ljava/lang/String;
    .end local v13    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_b3
    move-exception v5

    .line 173
    .local v5, "e":Ljava/lang/Exception;
    sget-object v14, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v15, "Problem getting Cities from server"

    const/16 v16, 0x0

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v14, v5, v15, v0}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 179
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_c5
    :goto_c5
    const/4 v1, 0x0

    goto :goto_af

    .line 175
    :catch_c7
    move-exception v11

    .line 176
    .local v11, "t":Ljava/lang/Throwable;
    sget-object v14, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v15, "Problem getting Cities from server"

    const/16 v16, 0x0

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-interface {v14, v11, v15, v0}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_c5
.end method

.method private getCountryDTO(Ljava/lang/String;Ljava/lang/String;)Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    .registers 21
    .param p1, "country"    # Ljava/lang/String;
    .param p2, "clientId"    # Ljava/lang/String;

    .prologue
    .line 224
    new-instance v1, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    invoke-direct {v1}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;-><init>()V

    .line 225
    .local v1, "countryDTO":Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->setDisplayName(Ljava/lang/String;)V

    .line 228
    :try_start_a
    new-instance v5, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v5}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 230
    .local v5, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    new-instance v13, Ljava/util/HashMap;

    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 231
    .local v13, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v14, "clientId"

    move-object/from16 v0, p2

    invoke-interface {v13, v14, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    const-string v14, "{server_root_url}/utilities/location?level=1&{key_client_id_param}={clientId}"

    invoke-static {v14, v13}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v12

    .line 234
    .local v12, "url":Ljava/lang/String;
    new-instance v6, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v6, v12}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 235
    .local v6, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    invoke-virtual {v5, v6}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v7

    .line 237
    .local v7, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v14

    invoke-static {v14}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v8

    .line 238
    .local v8, "jsonResponseString":Ljava/lang/String;
    sget-object v14, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v15, "Get Countries response: %s"

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v8, v16, v17

    invoke-interface/range {v14 .. v16}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 240
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 241
    .local v11, "rootJsonObject":Lorg/json/JSONObject;
    invoke-virtual {v11}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v10

    .line 242
    .local v10, "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_4e
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_82

    .line 243
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 244
    .local v9, "keyStr":Ljava/lang/String;
    invoke-virtual {v11, v9}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 245
    .local v3, "countryObject":Lorg/json/JSONObject;
    if-eqz v3, :cond_4e

    .line 246
    move-object v0, v3

    check-cast v0, Lorg/json/JSONObject;

    move-object v2, v0

    .line 247
    .local v2, "countryJsonObject":Lorg/json/JSONObject;
    const-string v14, "n"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_4e

    .line 248
    const-string v14, "id"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1, v14}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->setId(Ljava/lang/String;)V
    :try_end_7b
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_7b} :catch_7c
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_7b} :catch_84

    .line 259
    .end local v1    # "countryDTO":Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    .end local v2    # "countryJsonObject":Lorg/json/JSONObject;
    .end local v3    # "countryObject":Lorg/json/JSONObject;
    .end local v5    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v6    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .end local v7    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v8    # "jsonResponseString":Ljava/lang/String;
    .end local v9    # "keyStr":Ljava/lang/String;
    .end local v10    # "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v11    # "rootJsonObject":Lorg/json/JSONObject;
    .end local v12    # "url":Ljava/lang/String;
    .end local v13    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_7b
    return-object v1

    .line 254
    .restart local v1    # "countryDTO":Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    :catch_7c
    move-exception v4

    .line 255
    .local v4, "e":Ljava/io/IOException;
    sget-object v14, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    invoke-interface {v14, v4}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;)V

    .line 259
    .end local v4    # "e":Ljava/io/IOException;
    :cond_82
    :goto_82
    const/4 v1, 0x0

    goto :goto_7b

    .line 256
    :catch_84
    move-exception v4

    .line 257
    .local v4, "e":Lorg/json/JSONException;
    sget-object v14, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    invoke-interface {v14, v4}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;)V

    goto :goto_82
.end method

.method private getProfileImage(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 4
    .param p1, "images"    # Lorg/json/JSONObject;

    .prologue
    .line 265
    :try_start_0
    const-string v1, "276"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 266
    const-string v1, "276"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 282
    :goto_e
    return-object v1

    .line 267
    :cond_f
    const-string v1, "138"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 268
    const-string v1, "138"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 269
    :cond_1e
    const-string v1, "129"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 270
    const-string v1, "129"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 271
    :cond_2d
    const-string v1, "115"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3c

    .line 272
    const-string v1, "115"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 273
    :cond_3c
    const-string v1, "78"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4b

    .line 274
    const-string v1, "78"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 275
    :cond_4b
    const-string v1, "50"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5a

    .line 276
    const-string v1, "50"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_e

    .line 277
    :cond_5a
    const-string v1, "32"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6f

    .line 278
    const-string v1, "32"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_67
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_67} :catch_69

    move-result-object v1

    goto :goto_e

    .line 279
    :catch_69
    move-exception v0

    .line 280
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    invoke-interface {v1, v0}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;)V

    .line 282
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_6f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method private getStateDTO(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    .registers 23
    .param p1, "state"    # Ljava/lang/String;
    .param p2, "countryId"    # Ljava/lang/String;
    .param p3, "clientId"    # Ljava/lang/String;

    .prologue
    .line 184
    new-instance v9, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    invoke-direct {v9}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;-><init>()V

    .line 185
    .local v9, "stateDTO":Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;->setDisplayName(Ljava/lang/String;)V

    .line 187
    :try_start_a
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 189
    .local v2, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    new-instance v14, Ljava/util/HashMap;

    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    .line 190
    .local v14, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v15, "countryId"

    move-object/from16 v0, p2

    invoke-interface {v14, v15, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    const-string v15, "clientId"

    move-object/from16 v0, p3

    invoke-interface {v14, v15, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    const-string v15, "{server_root_url}/utilities/location?level=2&country={countryId}&{key_client_id_param}={clientId}"

    invoke-static {v15, v14}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v13

    .line 194
    .local v13, "url":Ljava/lang/String;
    sget-object v15, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v16, "Get States of Country URL - %s"

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object v13, v17, v18

    invoke-interface/range {v15 .. v17}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 196
    new-instance v3, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v3, v13}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 197
    .local v3, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    invoke-virtual {v2, v3}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 199
    .local v4, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v15

    invoke-static {v15}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v5

    .line 200
    .local v5, "jsonResponseString":Ljava/lang/String;
    sget-object v15, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v16, "Get States of Country [Country id - %s ] response: %s"

    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aput-object p2, v17, v18

    const/16 v18, 0x1

    aput-object v5, v17, v18

    invoke-interface/range {v15 .. v17}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 202
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 203
    .local v8, "rootJsonObject":Lorg/json/JSONObject;
    invoke-virtual {v8}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v7

    .line 204
    .local v7, "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_6c
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_a0

    .line 205
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 206
    .local v6, "keyStr":Ljava/lang/String;
    invoke-virtual {v8, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    .line 207
    .local v11, "stateObject":Lorg/json/JSONObject;
    if-eqz v11, :cond_6c

    .line 208
    move-object v0, v11

    check-cast v0, Lorg/json/JSONObject;

    move-object v10, v0

    .line 209
    .local v10, "stateJsonObject":Lorg/json/JSONObject;
    const-string v15, "n"

    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_6c

    .line 210
    const-string v15, "id"

    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v9, v15}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;->setId(Ljava/lang/String;)V
    :try_end_99
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_99} :catch_9a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_99} :catch_a2

    .line 220
    .end local v2    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v3    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .end local v4    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v5    # "jsonResponseString":Ljava/lang/String;
    .end local v6    # "keyStr":Ljava/lang/String;
    .end local v7    # "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v8    # "rootJsonObject":Lorg/json/JSONObject;
    .end local v9    # "stateDTO":Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    .end local v10    # "stateJsonObject":Lorg/json/JSONObject;
    .end local v11    # "stateObject":Lorg/json/JSONObject;
    .end local v13    # "url":Ljava/lang/String;
    .end local v14    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_99
    return-object v9

    .line 215
    .restart local v9    # "stateDTO":Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    :catch_9a
    move-exception v1

    .line 216
    .local v1, "e":Ljava/lang/Exception;
    sget-object v15, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    invoke-interface {v15, v1}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/Throwable;)V

    .line 220
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_a0
    :goto_a0
    const/4 v9, 0x0

    goto :goto_99

    .line 217
    :catch_a2
    move-exception v12

    .line 218
    .local v12, "t":Ljava/lang/Throwable;
    sget-object v15, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    invoke-interface {v15, v12}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/Throwable;)V

    goto :goto_a0
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;
    .registers 33
    .param p1, "params"    # [Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;

    .prologue
    .line 49
    new-instance v14, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;

    invoke-direct {v14}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;-><init>()V

    .line 50
    .local v14, "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v26, v0

    const/16 v27, 0x1

    move/from16 v0, v26

    move/from16 v1, v27

    if-eq v0, v1, :cond_1a

    .line 51
    const/16 v26, 0x1

    move/from16 v0, v26

    invoke-virtual {v14, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->setExceptionOccurred(Z)V

    .line 127
    :cond_19
    :goto_19
    return-object v14

    .line 55
    :cond_1a
    const/16 v26, 0x0

    aget-object v26, p1, v26

    move-object/from16 v0, v26

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->getUserProfileTaskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;

    .line 56
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->getUserProfileTaskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;->getUserId()Ljava/lang/String;

    move-result-object v26

    invoke-static/range {v26 .. v26}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    .line 59
    .local v23, "userId":Ljava/lang/String;
    :try_start_32
    new-instance v8, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v8}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 60
    .local v8, "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->getUserProfileTaskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;->getClientId()Ljava/lang/String;

    move-result-object v5

    .line 61
    .local v5, "clientID":Ljava/lang/String;
    new-instance v21, Ljava/util/HashMap;

    invoke-direct/range {v21 .. v21}, Ljava/util/HashMap;-><init>()V

    .line 62
    .local v21, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v26, "clientId"

    move-object/from16 v0, v21

    move-object/from16 v1, v26

    invoke-interface {v0, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    const-string v26, "user_id"

    move-object/from16 v0, v21

    move-object/from16 v1, v26

    move-object/from16 v2, v23

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    const-string v26, "{server_root_url}/v2/users/{user_id}?{key_client_id_param}={clientId}"

    move-object/from16 v0, v26

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v20

    .line 66
    .local v20, "url":Ljava/lang/String;
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKUserManager;

    move-result-object v16

    .line 67
    .local v16, "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    invoke-virtual/range {v16 .. v16}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->checkExpiryAndGetAccessToken()Ljava/lang/String;

    move-result-object v22

    .line 68
    .local v22, "userAccessToken":Ljava/lang/String;
    if-eqz v22, :cond_7a

    .line 69
    const-string v26, "access_token"

    move-object/from16 v0, v20

    move-object/from16 v1, v26

    move-object/from16 v2, v22

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    .line 72
    :cond_7a
    new-instance v9, Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v0, v20

    invoke-direct {v9, v0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 73
    .local v9, "httpGet":Lorg/apache/http/client/methods/HttpGet;
    sget-object v26, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v27, "Get user details URL: %s"

    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    aput-object v20, v28, v29

    invoke-interface/range {v26 .. v28}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 74
    invoke-virtual {v8, v9}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v10

    .line 75
    .local v10, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface {v10}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v26

    invoke-static/range {v26 .. v26}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v13

    .line 76
    .local v13, "jsonResponseString":Ljava/lang/String;
    sget-object v26, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v27, "Get user details response: %s"

    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    aput-object v13, v28, v29

    invoke-interface/range {v26 .. v28}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 77
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 78
    .local v12, "jsonObject":Lorg/json/JSONObject;
    const-string v26, "http_code"

    move-object/from16 v0, v26

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    .line 80
    .local v11, "httpResponseCode":I
    const/16 v26, 0xc8

    move/from16 v0, v26

    if-ne v11, v0, :cond_1c6

    .line 81
    new-instance v15, Lorg/json/JSONObject;

    invoke-direct {v15, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 82
    .local v15, "rootJsonObject":Lorg/json/JSONObject;
    const-string v26, "user"

    move-object/from16 v0, v26

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v24

    .line 83
    .local v24, "userJsonObject":Lorg/json/JSONObject;
    if-eqz v24, :cond_19

    .line 84
    new-instance v25, Lcom/behance/sdk/BehanceSDKUserProfile;

    invoke-direct/range {v25 .. v25}, Lcom/behance/sdk/BehanceSDKUserProfile;-><init>()V

    .line 85
    .local v25, "userProfile":Lcom/behance/sdk/BehanceSDKUserProfile;
    const-string v26, "first_name"

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/behance/sdk/BehanceSDKUserProfile;->setFirstName(Ljava/lang/String;)V

    .line 86
    const-string v26, "last_name"

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/behance/sdk/BehanceSDKUserProfile;->setLastName(Ljava/lang/String;)V

    .line 87
    const-string v26, "company"

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/behance/sdk/BehanceSDKUserProfile;->setCompany(Ljava/lang/String;)V

    .line 88
    const-string v26, "occupation"

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/behance/sdk/BehanceSDKUserProfile;->setOccupation(Ljava/lang/String;)V

    .line 89
    const-string v26, "website"

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/behance/sdk/BehanceSDKUserProfile;->setWebsite(Ljava/lang/String;)V

    .line 91
    const-string v26, "country"

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1, v5}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->getCountryDTO(Ljava/lang/String;Ljava/lang/String;)Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    move-result-object v6

    .line 92
    .local v6, "countryDTO":Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Lcom/behance/sdk/BehanceSDKUserProfile;->setCountry(Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;)V

    .line 93
    const/16 v18, 0x0

    .line 94
    .local v18, "stateID":Ljava/lang/String;
    sget-object v26, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->COUNTRY_CODES_FOR_LOAD_STATES:Ljava/util/List;

    invoke-virtual {v6}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getId()Ljava/lang/String;

    move-result-object v27

    invoke-interface/range {v26 .. v27}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v26

    if-eqz v26, :cond_165

    .line 95
    const-string v26, "state"

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual {v6}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getId()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v27

    invoke-direct {v0, v1, v2, v5}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->getStateDTO(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    move-result-object v17

    .line 96
    .local v17, "stateDTO":Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    move-object/from16 v0, v25

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/behance/sdk/BehanceSDKUserProfile;->setState(Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;)V

    .line 97
    if-eqz v17, :cond_165

    .line 98
    invoke-virtual/range {v17 .. v17}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;->getId()Ljava/lang/String;

    move-result-object v18

    .line 101
    .end local v17    # "stateDTO":Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    :cond_165
    const-string v26, "city"

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual {v6}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getId()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    move-object/from16 v2, v27

    move-object/from16 v3, v18

    invoke-direct {v0, v1, v2, v3, v5}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->getCityDTO(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    move-result-object v4

    .line 102
    .local v4, "cityDTO":Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;
    move-object/from16 v0, v25

    invoke-virtual {v0, v4}, Lcom/behance/sdk/BehanceSDKUserProfile;->setCity(Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;)V

    .line 104
    const-string v26, "images"

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v26

    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->getProfileImage(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/behance/sdk/BehanceSDKUserProfile;->setProfileImageUrl(Ljava/lang/String;)V

    .line 105
    move-object/from16 v0, v25

    invoke-virtual {v14, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->setBehanceUserProfile(Lcom/behance/sdk/BehanceSDKUserProfile;)V
    :try_end_19e
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_19e} :catch_1a0
    .catch Ljava/lang/Throwable; {:try_start_32 .. :try_end_19e} :catch_1f4

    goto/16 :goto_19

    .line 118
    .end local v4    # "cityDTO":Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;
    .end local v5    # "clientID":Ljava/lang/String;
    .end local v6    # "countryDTO":Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    .end local v8    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v9    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .end local v10    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v11    # "httpResponseCode":I
    .end local v12    # "jsonObject":Lorg/json/JSONObject;
    .end local v13    # "jsonResponseString":Ljava/lang/String;
    .end local v15    # "rootJsonObject":Lorg/json/JSONObject;
    .end local v16    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .end local v18    # "stateID":Ljava/lang/String;
    .end local v20    # "url":Ljava/lang/String;
    .end local v21    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v22    # "userAccessToken":Ljava/lang/String;
    .end local v24    # "userJsonObject":Lorg/json/JSONObject;
    .end local v25    # "userProfile":Lcom/behance/sdk/BehanceSDKUserProfile;
    :catch_1a0
    move-exception v7

    .line 119
    .local v7, "e":Ljava/lang/Exception;
    sget-object v26, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v27, "Unknown problem fetching User details [User ID - %s]"

    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    aput-object v23, v28, v29

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    move-object/from16 v2, v28

    invoke-interface {v0, v7, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 120
    const/16 v26, 0x1

    move/from16 v0, v26

    invoke-virtual {v14, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->setExceptionOccurred(Z)V

    .line 121
    invoke-virtual {v14, v7}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->setException(Ljava/lang/Exception;)V

    goto/16 :goto_19

    .line 107
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v5    # "clientID":Ljava/lang/String;
    .restart local v8    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .restart local v9    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .restart local v10    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v11    # "httpResponseCode":I
    .restart local v12    # "jsonObject":Lorg/json/JSONObject;
    .restart local v13    # "jsonResponseString":Ljava/lang/String;
    .restart local v16    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .restart local v20    # "url":Ljava/lang/String;
    .restart local v21    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v22    # "userAccessToken":Ljava/lang/String;
    :cond_1c6
    const/16 v26, 0x194

    move/from16 v0, v26

    if-ne v11, v0, :cond_227

    .line 108
    :try_start_1cc
    sget-object v26, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v27, "HTTP Response code 404 when trying to fetch User details. [User ID - %s]"

    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    aput-object v23, v28, v29

    invoke-interface/range {v26 .. v28}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 109
    new-instance v26, Ljava/lang/Exception;

    const-string v27, "User not found"

    invoke-direct/range {v26 .. v27}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v26

    invoke-virtual {v14, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->setException(Ljava/lang/Exception;)V

    .line 110
    const/16 v26, 0x1

    move/from16 v0, v26

    invoke-virtual {v14, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->setExceptionOccurred(Z)V
    :try_end_1f2
    .catch Ljava/lang/Exception; {:try_start_1cc .. :try_end_1f2} :catch_1a0
    .catch Ljava/lang/Throwable; {:try_start_1cc .. :try_end_1f2} :catch_1f4

    goto/16 :goto_19

    .line 122
    .end local v5    # "clientID":Ljava/lang/String;
    .end local v8    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v9    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .end local v10    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v11    # "httpResponseCode":I
    .end local v12    # "jsonObject":Lorg/json/JSONObject;
    .end local v13    # "jsonResponseString":Ljava/lang/String;
    .end local v16    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .end local v20    # "url":Ljava/lang/String;
    .end local v21    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v22    # "userAccessToken":Ljava/lang/String;
    :catch_1f4
    move-exception v19

    .line 123
    .local v19, "t":Ljava/lang/Throwable;
    sget-object v26, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v27, "Unknown problem fetching User details [User ID - %s]"

    const/16 v28, 0x1

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    aput-object v23, v28, v29

    move-object/from16 v0, v26

    move-object/from16 v1, v19

    move-object/from16 v2, v27

    move-object/from16 v3, v28

    invoke-interface {v0, v1, v2, v3}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 124
    new-instance v26, Ljava/lang/Exception;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v27

    invoke-direct/range {v26 .. v27}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v26

    invoke-virtual {v14, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->setException(Ljava/lang/Exception;)V

    .line 125
    const/16 v26, 0x1

    move/from16 v0, v26

    invoke-virtual {v14, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->setExceptionOccurred(Z)V

    goto/16 :goto_19

    .line 112
    .end local v19    # "t":Ljava/lang/Throwable;
    .restart local v5    # "clientID":Ljava/lang/String;
    .restart local v8    # "httpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .restart local v9    # "httpGet":Lorg/apache/http/client/methods/HttpGet;
    .restart local v10    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v11    # "httpResponseCode":I
    .restart local v12    # "jsonObject":Lorg/json/JSONObject;
    .restart local v13    # "jsonResponseString":Ljava/lang/String;
    .restart local v16    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .restart local v20    # "url":Ljava/lang/String;
    .restart local v21    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v22    # "userAccessToken":Ljava/lang/String;
    :cond_227
    :try_start_227
    sget-object v26, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v27, "Unexpected HTTP Response code when trying to fetch User details. [User ID - %s] [Response code - %d]"

    const/16 v28, 0x2

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    const/16 v29, 0x0

    aput-object v23, v28, v29

    const/16 v29, 0x1

    .line 113
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v30

    aput-object v30, v28, v29

    .line 112
    invoke-interface/range {v26 .. v28}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 114
    new-instance v26, Ljava/lang/Exception;

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "Invalid server response code "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-direct/range {v26 .. v27}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v26

    invoke-virtual {v14, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->setException(Ljava/lang/Exception;)V

    .line 115
    const/16 v26, 0x1

    move/from16 v0, v26

    invoke-virtual {v14, v0}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->setExceptionOccurred(Z)V
    :try_end_268
    .catch Ljava/lang/Exception; {:try_start_227 .. :try_end_268} :catch_1a0
    .catch Ljava/lang/Throwable; {:try_start_227 .. :try_end_268} :catch_1f4

    goto/16 :goto_19
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 35
    check-cast p1, [Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;)V
    .registers 5
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;

    .prologue
    .line 287
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->isExceptionOccurred()Z

    move-result v0

    if-eqz v0, :cond_12

    .line 288
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserProfileAsyncTaskListener;

    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->getException()Ljava/lang/Exception;

    move-result-object v1

    iget-object v2, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->getUserProfileTaskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;

    invoke-interface {v0, v1, v2}, Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserProfileAsyncTaskListener;->onGetUserProfileFailure(Ljava/lang/Exception;Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;)V

    .line 292
    :goto_11
    return-void

    .line 290
    :cond_12
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->listener:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserProfileAsyncTaskListener;

    iget-object v1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->getUserProfileTaskParams:Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;

    invoke-interface {v0, p1, v1}, Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserProfileAsyncTaskListener;->onGetUserProfileSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;)V

    goto :goto_11
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 35
    check-cast p1, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;)V

    return-void
.end method
