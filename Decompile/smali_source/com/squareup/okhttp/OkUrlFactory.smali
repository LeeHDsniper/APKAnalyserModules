.class public final Lcom/squareup/okhttp/OkUrlFactory;
.super Ljava/lang/Object;
.source "OkUrlFactory.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/net/URLStreamHandlerFactory;


# instance fields
.field private final client:Lcom/squareup/okhttp/OkHttpClient;


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/OkHttpClient;)V
    .registers 2
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/squareup/okhttp/OkUrlFactory;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 35
    return-void
.end method


# virtual methods
.method public clone()Lcom/squareup/okhttp/OkUrlFactory;
    .registers 3

    .prologue
    .line 57
    new-instance v0, Lcom/squareup/okhttp/OkUrlFactory;

    iget-object v1, p0, Lcom/squareup/okhttp/OkUrlFactory;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v1}, Lcom/squareup/okhttp/OkHttpClient;->clone()Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/squareup/okhttp/OkUrlFactory;-><init>(Lcom/squareup/okhttp/OkHttpClient;)V

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 30
    invoke-virtual {p0}, Lcom/squareup/okhttp/OkUrlFactory;->clone()Lcom/squareup/okhttp/OkUrlFactory;

    move-result-object v0

    return-object v0
.end method

.method public createURLStreamHandler(Ljava/lang/String;)Ljava/net/URLStreamHandler;
    .registers 3
    .param p1, "protocol"    # Ljava/lang/String;

    .prologue
    .line 85
    const-string v0, "http"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "https"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x0

    .line 87
    :goto_11
    return-object v0

    :cond_12
    new-instance v0, Lcom/squareup/okhttp/OkUrlFactory$1;

    invoke-direct {v0, p0, p1}, Lcom/squareup/okhttp/OkUrlFactory$1;-><init>(Lcom/squareup/okhttp/OkUrlFactory;Ljava/lang/String;)V

    goto :goto_11
.end method

.method public open(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    .registers 3
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/squareup/okhttp/OkUrlFactory;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v0}, Lcom/squareup/okhttp/OkHttpClient;->getProxy()Ljava/net/Proxy;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/squareup/okhttp/OkUrlFactory;->open(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/HttpURLConnection;

    move-result-object v0

    return-object v0
.end method

.method open(Ljava/net/URL;Ljava/net/Proxy;)Ljava/net/HttpURLConnection;
    .registers 8
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "proxy"    # Ljava/net/Proxy;

    .prologue
    .line 65
    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    .line 66
    .local v1, "protocol":Ljava/lang/String;
    iget-object v2, p0, Lcom/squareup/okhttp/OkUrlFactory;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v2}, Lcom/squareup/okhttp/OkHttpClient;->copyWithDefaults()Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v0

    .line 67
    .local v0, "copy":Lcom/squareup/okhttp/OkHttpClient;
    invoke-virtual {v0, p2}, Lcom/squareup/okhttp/OkHttpClient;->setProxy(Ljava/net/Proxy;)Lcom/squareup/okhttp/OkHttpClient;

    .line 69
    const-string v2, "http"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    new-instance v2, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;

    invoke-direct {v2, p1, v0}, Lcom/squareup/okhttp/internal/huc/HttpURLConnectionImpl;-><init>(Ljava/net/URL;Lcom/squareup/okhttp/OkHttpClient;)V

    .line 70
    :goto_1a
    return-object v2

    :cond_1b
    const-string v2, "https"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29

    new-instance v2, Lcom/squareup/okhttp/internal/huc/HttpsURLConnectionImpl;

    invoke-direct {v2, p1, v0}, Lcom/squareup/okhttp/internal/huc/HttpsURLConnectionImpl;-><init>(Ljava/net/URL;Lcom/squareup/okhttp/OkHttpClient;)V

    goto :goto_1a

    .line 71
    :cond_29
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected protocol: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
