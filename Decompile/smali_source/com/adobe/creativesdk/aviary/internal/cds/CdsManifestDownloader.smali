.class public Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestDownloader;
.super Ljava/lang/Object;
.source "CdsManifestDownloader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private generateParser(Ljava/io/InputStream;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .registers 5
    .param p1, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 66
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;-><init>()V

    .line 67
    .local v0, "parser":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->parse(Ljava/io/InputStream;)I

    move-result v1

    if-eqz v1, :cond_15

    .line 68
    new-instance v1, Lorg/json/JSONException;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getStatus()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 70
    :cond_15
    return-object v0
.end method

.method private getManifestURLParams(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "versionKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .local v0, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "apiKey"

    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getApiKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "formFactor"

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getFormFactor(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "osVersion"

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "platform"

    const-string v3, "android"

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "resolution"

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getResolution(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "sdkVersion"

    const-string v3, "4.1.1"

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "contentGroup"

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getContentGroup(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->hasCountryParam()Z

    move-result v1

    if-eqz v1, :cond_8d

    .line 91
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "country"

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getCountry()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    :cond_8d
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->hasLanguageParam()Z

    move-result v1

    if-eqz v1, :cond_a9

    .line 95
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "language"

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    :cond_a9
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_b9

    .line 99
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "versionKey"

    invoke-direct {v1, v2, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    :cond_b9
    return-object v0
.end method

.method private throwIfNotWifiConnected(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 61
    new-instance v0, Ljava/io/IOException;

    const-string v1, "NotConnected"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :cond_e
    return-void
.end method


# virtual methods
.method public download(Landroid/content/Context;Ljava/lang/String;Z)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "version"    # Ljava/lang/String;
    .param p3, "wifiOnly"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 35
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v5

    invoke-virtual {v5, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getServerUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/manifest?"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 37
    .local v2, "versionURL":Ljava/lang/String;
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestDownloader;->getManifestURLParams(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 38
    .local v3, "versionURLParams":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getApiSecret(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/utils/CryptoUtils;->addSignature(Ljava/util/List;Ljava/lang/String;)V

    .line 41
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->isDebug(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_3c

    .line 42
    new-instance v4, Lorg/apache/http/message/BasicNameValuePair;

    const-string v5, "staging"

    const-string v6, "2"

    invoke-direct {v4, v5, v6}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    :cond_3c
    if-eqz p3, :cond_41

    .line 46
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestDownloader;->throwIfNotWifiConnected(Landroid/content/Context;)V

    .line 49
    :cond_41
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->download(Ljava/lang/String;Ljava/util/List;)Ljava/io/ByteArrayInputStream;

    move-result-object v1

    .line 52
    .local v1, "stream":Ljava/io/InputStream;
    :try_start_45
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestDownloader;->generateParser(Ljava/io/InputStream;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    :try_end_48
    .catchall {:try_start_45 .. :try_end_48} :catchall_4d

    move-result-object v0

    .line 54
    .local v0, "parser":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 56
    return-object v0

    .line 54
    .end local v0    # "parser":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
    :catchall_4d
    move-exception v4

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    throw v4
.end method
