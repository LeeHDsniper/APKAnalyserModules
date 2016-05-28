.class public abstract Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;
.super Ljava/lang/Object;
.source "CdsManifestContentDownloader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private final mDebugVersion:Z

.field private final mServerRoot:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    const-string v0, "CdsManifestContentDownloader"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 3
    .param p1, "serverRoot"    # Ljava/lang/String;
    .param p2, "debug"    # Z

    .prologue
    .line 36
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;, "Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;->mServerRoot:Ljava/lang/String;

    .line 38
    iput-boolean p2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;->mDebugVersion:Z

    .line 39
    return-void
.end method

.method private downloadUrl(Landroid/content/Context;ZLjava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "wifiOnly"    # Z
    .param p3, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Z",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;, "Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader<TT;>;"
    const/4 v0, 0x0

    .line 60
    .local v0, "stream":Ljava/io/InputStream;
    if-eqz p2, :cond_11

    .line 61
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/ConnectionUtils;->isWifiConnected(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_11

    .line 62
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Not connected"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 67
    :cond_11
    :try_start_11
    invoke-static {p1, p3}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->hunt(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 68
    if-nez v0, :cond_24

    .line 69
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Invalid Stream"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1f
    .catchall {:try_start_11 .. :try_end_1f} :catchall_1f

    .line 73
    :catchall_1f
    move-exception v1

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    throw v1

    .line 71
    :cond_24
    :try_start_24
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;->parseStream(Ljava/io/InputStream;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;
    :try_end_27
    .catchall {:try_start_24 .. :try_end_27} :catchall_1f

    move-result-object v1

    .line 73
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    return-object v1
.end method

.method private getContentURL(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "identifier"    # Ljava/lang/String;
    .param p3, "formatListId"    # Ljava/lang/String;

    .prologue
    .line 97
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;, "Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader<TT;>;"
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;->getContentURLParams(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 98
    .local v0, "urlParams":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "identifier"

    invoke-direct {v1, v2, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "formatListId"

    invoke-direct {v1, v2, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getApiSecret(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/CryptoUtils;->addSignature(Ljava/util/List;Ljava/lang/String;)V

    .line 102
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;->mDebugVersion:Z

    if-eqz v1, :cond_2f

    .line 103
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "staging"

    const-string v3, "2"

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 105
    :cond_2f
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;->mServerRoot:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/content?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "utf-8"

    invoke-static {v0, v2}, Lorg/apache/http/client/utils/URLEncodedUtils;->format(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method download(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "identifier"    # Ljava/lang/String;
    .param p3, "formatListId"    # Ljava/lang/String;
    .param p4, "wifiOnly"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;, "Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader<TT;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;->getContentURL(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 52
    .local v0, "url":Ljava/lang/String;
    invoke-direct {p0, p1, p4, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;->downloadUrl(Landroid/content/Context;ZLjava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;

    move-result-object v1

    return-object v1
.end method

.method download(Landroid/content/Context;Ljava/lang/String;Z)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "versionKey"    # Ljava/lang/String;
    .param p3, "wifiOnly"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Z)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 44
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;, "Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader<TT;>;"
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;->getContentURL(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "url":Ljava/lang/String;
    invoke-direct {p0, p1, p3, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;->downloadUrl(Landroid/content/Context;ZLjava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;

    move-result-object v1

    return-object v1
.end method

.method protected getContentURL(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "versionKey"    # Ljava/lang/String;

    .prologue
    .line 86
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;, "Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader<TT;>;"
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;->getContentURLParams(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 87
    .local v0, "urlParams":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "versionKey"

    invoke-direct {v1, v2, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getApiSecret(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/CryptoUtils;->addSignature(Ljava/util/List;Ljava/lang/String;)V

    .line 90
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;->mDebugVersion:Z

    if-eqz v1, :cond_25

    .line 91
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "staging"

    const-string v3, "2"

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    :cond_25
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;->mServerRoot:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/content?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "utf-8"

    invoke-static {v0, v2}, Lorg/apache/http/client/utils/URLEncodedUtils;->format(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected getContentURLParams(Landroid/content/Context;)Ljava/util/List;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 114
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader;, "Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestContentDownloader<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 115
    .local v0, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "apiKey"

    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getApiKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->hasCountryParam()Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 118
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "country"

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getCountry()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    :cond_2f
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->hasLanguageParam()Z

    move-result v1

    if-eqz v1, :cond_4b

    .line 122
    new-instance v1, Lorg/apache/http/message/BasicNameValuePair;

    const-string v2, "language"

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtils;->getInstance()Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceParamsUtilsAbstract;->getLanguage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    :cond_4b
    return-object v0
.end method

.method abstract parseStream(Ljava/io/InputStream;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation
.end method
