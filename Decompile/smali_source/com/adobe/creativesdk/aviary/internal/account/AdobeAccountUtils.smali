.class public final Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils;
.super Ljava/lang/Object;
.source "AdobeAccountUtils.java"


# static fields
.field static final LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 31
    const-string v0, "AdobeAccountUtils"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method private static encodeResultMap(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/HashMap;
    .registers 11
    .param p0, "result"    # Ljava/lang/String;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "userId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 87
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "encodeResultMap: %s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p0, v6, v7

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 89
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_58

    .line 90
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 91
    .local v2, "json":Lorg/json/JSONObject;
    const-string v4, "applicationId"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_58

    .line 92
    const-string v4, "content"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 94
    .local v1, "content":Lorg/json/JSONObject;
    const-string v4, "adobeId"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, "adobeId":Ljava/lang/String;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 96
    .local v3, "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    invoke-static {p2, v0}, Lcom/adobe/creativesdk/aviary/internal/utils/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_50

    .line 97
    const-string v4, "effect"

    invoke-static {v3, v1, v4}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils;->populateMap(Ljava/util/HashMap;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 98
    const-string v4, "frame"

    invoke-static {v3, v1, v4}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils;->populateMap(Ljava/util/HashMap;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 99
    const-string v4, "sticker"

    invoke-static {v3, v1, v4}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils;->populateMap(Ljava/util/HashMap;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 100
    const-string v4, "overlay"

    invoke-static {v3, v1, v4}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils;->populateMap(Ljava/util/HashMap;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 107
    .end local v0    # "adobeId":Ljava/lang/String;
    .end local v1    # "content":Lorg/json/JSONObject;
    .end local v2    # "json":Lorg/json/JSONObject;
    .end local v3    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    :goto_4f
    return-object v3

    .line 102
    .restart local v0    # "adobeId":Ljava/lang/String;
    .restart local v1    # "content":Lorg/json/JSONObject;
    .restart local v2    # "json":Lorg/json/JSONObject;
    .restart local v3    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    :cond_50
    sget-object v4, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "userId doesn\'t match!"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_4f

    .line 107
    .end local v0    # "adobeId":Ljava/lang/String;
    .end local v1    # "content":Lorg/json/JSONObject;
    .end local v2    # "json":Lorg/json/JSONObject;
    .end local v3    # "tempMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    :cond_58
    const/4 v3, 0x0

    goto :goto_4f
.end method

.method private static generateJsonRequest(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "userId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 127
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 128
    .local v0, "jsonRootObject":Lorg/json/JSONObject;
    const-string v1, "adobeId"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 129
    const-string v1, "applicationId"

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 130
    const-string v1, "isProduction"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 131
    const-string v1, "content"

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 132
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static populateMap(Ljava/util/HashMap;Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 7
    .param p1, "content"    # Lorg/json/JSONObject;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 112
    .local p0, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 114
    .local v2, "list":Lorg/json/JSONArray;
    if-eqz v2, :cond_c

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-nez v3, :cond_13

    .line 115
    :cond_c
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {p0, p2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    :goto_12
    return-void

    .line 117
    :cond_13
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    new-array v0, v3, [Ljava/lang/String;

    .line 118
    .local v0, "array":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1a
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v1, v3, :cond_29

    .line 119
    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v1

    .line 118
    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    .line 121
    :cond_29
    invoke-virtual {p0, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12
.end method

.method public static queryPurchases(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/util/HashMap;
    .registers 16
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "userId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    .line 43
    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v9, "queryPurchases"

    invoke-interface {v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 45
    if-eqz p0, :cond_18

    invoke-static {p0, v10}, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;->isConnectedOrConnecting(Landroid/content/Context;Z)Z

    move-result v8

    if-nez v8, :cond_18

    .line 46
    new-instance v8, Ljava/io/IOException;

    const-string v9, "Not Connected to internet"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 49
    :cond_18
    invoke-static {p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils;->generateJsonRequest(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 57
    .local v2, "content":Ljava/lang/String;
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 58
    .local v0, "client":Lorg/apache/http/client/HttpClient;
    new-instance v5, Lorg/apache/http/client/methods/HttpPost;

    const-string v8, "http://receipts.aviary.com/v2/content"

    invoke-direct {v5, v8}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 60
    .local v5, "post":Lorg/apache/http/client/methods/HttpPost;
    new-instance v4, Lorg/apache/http/entity/StringEntity;

    invoke-direct {v4, v2}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    .line 61
    .local v4, "entity":Lorg/apache/http/entity/StringEntity;
    const-string v8, "Accept"

    const-string v9, "application/json"

    invoke-virtual {v5, v8, v9}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    const-string v8, "Content-Type"

    const-string v9, "application/json"

    invoke-virtual {v5, v8, v9}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    invoke-virtual {v5, v4}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 66
    :try_start_3e
    invoke-interface {v0, v5}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 67
    .local v6, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    .line 68
    .local v1, "code":I
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v7

    .line 70
    .local v7, "result":Ljava/lang/String;
    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils;->LOGGER:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v9, "code: %d"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-interface {v8, v9, v10}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 71
    const/16 v8, 0xc8

    if-ne v1, v8, :cond_6c

    .line 72
    invoke-static {v7, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeAccountUtils;->encodeResultMap(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v8

    return-object v8

    .line 74
    :cond_6c
    new-instance v8, Ljava/io/IOException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Invalid response. Response code is "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_85
    .catch Ljava/io/IOException; {:try_start_3e .. :try_end_85} :catch_85

    .line 77
    .end local v1    # "code":I
    .end local v6    # "response":Lorg/apache/http/HttpResponse;
    .end local v7    # "result":Ljava/lang/String;
    :catch_85
    move-exception v3

    .line 78
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 79
    invoke-virtual {v5}, Lorg/apache/http/client/methods/HttpPost;->abort()V

    .line 80
    throw v3
.end method
