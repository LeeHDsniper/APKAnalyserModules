.class final Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;
.super Ljava/lang/Object;
.source "ReceiptUtils.java"


# static fields
.field private static sLocale:Ljava/util/Locale;


# direct methods
.method static clamp(III)I
    .registers 4
    .param p0, "value"    # I
    .param p1, "min"    # I
    .param p2, "max"    # I

    .prologue
    .line 86
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method static generateSignedUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "apiKey"    # Ljava/lang/String;
    .param p1, "apiSecret"    # Ljava/lang/String;

    .prologue
    .line 124
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .local v0, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "apiKey"

    invoke-direct {v1, v2, p0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/utils/CryptoUtils;->addSignature(Ljava/util/List;Ljava/lang/String;)V

    .line 128
    const-string v1, "utf-8"

    invoke-static {v0, v1}, Lorg/apache/http/client/utils/URLEncodedUtils;->format(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getBinaryVersion(Landroid/content/Context;)I
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 61
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getPackageInfo(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 62
    .local v0, "info":Landroid/content/pm/PackageInfo;
    if-eqz v0, :cond_9

    .line 63
    iget v1, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 65
    :goto_8
    return v1

    :cond_9
    const/4 v1, 0x0

    goto :goto_8
.end method

.method public static getCountry()Ljava/lang/String;
    .registers 1

    .prologue
    .line 40
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->getLocale()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getHandlerThread(Ljava/lang/String;)Landroid/os/HandlerThread;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 80
    new-instance v0, Landroid/os/HandlerThread;

    const/16 v1, 0x13

    invoke-direct {v0, p0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 81
    .local v0, "thread":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 82
    return-object v0
.end method

.method public static getLanguage()Ljava/lang/String;
    .registers 1

    .prologue
    .line 44
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->getLocale()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getLocale()Ljava/util/Locale;
    .registers 1

    .prologue
    .line 48
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->sLocale:Ljava/util/Locale;

    if-nez v0, :cond_a

    .line 49
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->sLocale:Ljava/util/Locale;

    .line 51
    :cond_a
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->sLocale:Ljava/util/Locale;

    return-object v0
.end method

.method public static getUserUUID(Landroid/content/Context;)Ljava/lang/String;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 76
    invoke-static {p0}, Lit/sephiroth/android/library/ab/AB;->getInstance(Landroid/content/Context;)Lit/sephiroth/android/library/ab/AB;

    move-result-object v0

    invoke-virtual {v0}, Lit/sephiroth/android/library/ab/AB;->getUUID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static upload(Ljava/lang/String;Ljava/lang/String;)I
    .registers 12
    .param p0, "urlname"    # Ljava/lang/String;
    .param p1, "param"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 145
    .local v0, "client":Lorg/apache/http/client/HttpClient;
    new-instance v4, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v4, p0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 147
    .local v4, "post":Lorg/apache/http/client/methods/HttpPost;
    new-instance v3, Lorg/apache/http/entity/StringEntity;

    invoke-direct {v3, p1}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    .line 148
    .local v3, "entity":Lorg/apache/http/entity/StringEntity;
    const-string v7, "Accept"

    const-string v8, "application/json"

    invoke-virtual {v4, v7, v8}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    const-string v7, "Content-Type"

    const-string v8, "application/json"

    invoke-virtual {v4, v7, v8}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    invoke-virtual {v4, v3}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 153
    :try_start_20
    invoke-interface {v0, v4}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    .line 155
    .local v6, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    .line 156
    .local v1, "code":I
    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v5

    .line 158
    .local v5, "reason":Ljava/lang/String;
    const-string v7, "ReceiptsUtils"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "code: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4c
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_4c} :catch_4d

    .line 165
    return v1

    .line 166
    .end local v1    # "code":I
    .end local v5    # "reason":Ljava/lang/String;
    .end local v6    # "response":Lorg/apache/http/HttpResponse;
    :catch_4d
    move-exception v2

    .line 167
    .local v2, "e":Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 168
    invoke-virtual {v4}, Lorg/apache/http/client/methods/HttpPost;->abort()V

    .line 169
    throw v2
.end method

.method static upload(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "urlname"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 90
    invoke-static {p0, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;->isConnectedOrConnecting(Landroid/content/Context;Z)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 93
    move-object v1, p1

    .line 94
    .local v1, "finalUrl":Ljava/lang/String;
    :try_start_8
    invoke-static {v1, p2}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->upload(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_b} :catch_12

    move-result v2

    .line 100
    .local v2, "status":I
    const/16 v4, 0xc8

    if-ne v2, v4, :cond_11

    const/4 v3, 0x1

    .line 102
    .end local v1    # "finalUrl":Ljava/lang/String;
    .end local v2    # "status":I
    :cond_11
    :goto_11
    return v3

    .line 95
    .restart local v1    # "finalUrl":Ljava/lang/String;
    :catch_12
    move-exception v0

    .line 96
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "ReceiptsUtils"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "failed to upload content to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    const-string v4, "ReceiptsUtils"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "error: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_11
.end method

.method static upload(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "urlname"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;
    .param p3, "apiKey"    # Ljava/lang/String;
    .param p4, "apiSecret"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 108
    invoke-static {p0, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;->isConnectedOrConnecting(Landroid/content/Context;Z)Z

    move-result v4

    if-eqz v4, :cond_2b

    .line 111
    :try_start_7
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "?"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {p3, p4}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->generateSignedUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 112
    .local v1, "finalUrl":Ljava/lang/String;
    invoke-static {v1, p2}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptUtils;->upload(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_25} :catch_2c

    move-result v2

    .line 118
    .local v2, "status":I
    const/16 v4, 0xc8

    if-ne v2, v4, :cond_2b

    const/4 v3, 0x1

    .line 120
    .end local v1    # "finalUrl":Ljava/lang/String;
    .end local v2    # "status":I
    :cond_2b
    :goto_2b
    return v3

    .line 113
    :catch_2c
    move-exception v0

    .line 114
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "ReceiptsUtils"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "failed to upload content to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    const-string v4, "ReceiptsUtils"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "error: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2b
.end method
