.class public final Lcom/squareup/okhttp/Request;
.super Ljava/lang/Object;
.source "Request.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/Request$1;,
        Lcom/squareup/okhttp/Request$Builder;
    }
.end annotation


# instance fields
.field private final body:Lcom/squareup/okhttp/RequestBody;

.field private volatile cacheControl:Lcom/squareup/okhttp/CacheControl;

.field private final headers:Lcom/squareup/okhttp/Headers;

.field private final method:Ljava/lang/String;

.field private final tag:Ljava/lang/Object;

.field private volatile uri:Ljava/net/URI;

.field private volatile url:Ljava/net/URL;

.field private final urlString:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/Request$Builder;)V
    .registers 3
    .param p1, "builder"    # Lcom/squareup/okhttp/Request$Builder;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    # getter for: Lcom/squareup/okhttp/Request$Builder;->urlString:Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/Request$Builder;->access$000(Lcom/squareup/okhttp/Request$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Request;->urlString:Ljava/lang/String;

    .line 45
    # getter for: Lcom/squareup/okhttp/Request$Builder;->method:Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/Request$Builder;->access$100(Lcom/squareup/okhttp/Request$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Request;->method:Ljava/lang/String;

    .line 46
    # getter for: Lcom/squareup/okhttp/Request$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;
    invoke-static {p1}, Lcom/squareup/okhttp/Request$Builder;->access$200(Lcom/squareup/okhttp/Request$Builder;)Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Request;->headers:Lcom/squareup/okhttp/Headers;

    .line 47
    # getter for: Lcom/squareup/okhttp/Request$Builder;->body:Lcom/squareup/okhttp/RequestBody;
    invoke-static {p1}, Lcom/squareup/okhttp/Request$Builder;->access$300(Lcom/squareup/okhttp/Request$Builder;)Lcom/squareup/okhttp/RequestBody;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Request;->body:Lcom/squareup/okhttp/RequestBody;

    .line 48
    # getter for: Lcom/squareup/okhttp/Request$Builder;->tag:Ljava/lang/Object;
    invoke-static {p1}, Lcom/squareup/okhttp/Request$Builder;->access$400(Lcom/squareup/okhttp/Request$Builder;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_32

    # getter for: Lcom/squareup/okhttp/Request$Builder;->tag:Ljava/lang/Object;
    invoke-static {p1}, Lcom/squareup/okhttp/Request$Builder;->access$400(Lcom/squareup/okhttp/Request$Builder;)Ljava/lang/Object;

    move-result-object v0

    :goto_29
    iput-object v0, p0, Lcom/squareup/okhttp/Request;->tag:Ljava/lang/Object;

    .line 49
    # getter for: Lcom/squareup/okhttp/Request$Builder;->url:Ljava/net/URL;
    invoke-static {p1}, Lcom/squareup/okhttp/Request$Builder;->access$500(Lcom/squareup/okhttp/Request$Builder;)Ljava/net/URL;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Request;->url:Ljava/net/URL;

    .line 50
    return-void

    :cond_32
    move-object v0, p0

    .line 48
    goto :goto_29
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/Request$Builder;Lcom/squareup/okhttp/Request$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/squareup/okhttp/Request$Builder;
    .param p2, "x1"    # Lcom/squareup/okhttp/Request$1;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/Request;-><init>(Lcom/squareup/okhttp/Request$Builder;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/RequestBody;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/squareup/okhttp/Request;->body:Lcom/squareup/okhttp/RequestBody;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/squareup/okhttp/Request;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/squareup/okhttp/Request;->tag:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Headers;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/squareup/okhttp/Request;->headers:Lcom/squareup/okhttp/Headers;

    return-object v0
.end method

.method static synthetic access$700(Lcom/squareup/okhttp/Request;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/squareup/okhttp/Request;->urlString:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$800(Lcom/squareup/okhttp/Request;)Ljava/net/URL;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/squareup/okhttp/Request;->url:Ljava/net/URL;

    return-object v0
.end method

.method static synthetic access$900(Lcom/squareup/okhttp/Request;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/squareup/okhttp/Request;->method:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public body()Lcom/squareup/okhttp/RequestBody;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/squareup/okhttp/Request;->body:Lcom/squareup/okhttp/RequestBody;

    return-object v0
.end method

.method public cacheControl()Lcom/squareup/okhttp/CacheControl;
    .registers 3

    .prologue
    .line 107
    iget-object v0, p0, Lcom/squareup/okhttp/Request;->cacheControl:Lcom/squareup/okhttp/CacheControl;

    .line 108
    .local v0, "result":Lcom/squareup/okhttp/CacheControl;
    if-eqz v0, :cond_5

    .end local v0    # "result":Lcom/squareup/okhttp/CacheControl;
    :goto_4
    return-object v0

    .restart local v0    # "result":Lcom/squareup/okhttp/CacheControl;
    :cond_5
    iget-object v1, p0, Lcom/squareup/okhttp/Request;->headers:Lcom/squareup/okhttp/Headers;

    invoke-static {v1}, Lcom/squareup/okhttp/CacheControl;->parse(Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/CacheControl;

    move-result-object v0

    .end local v0    # "result":Lcom/squareup/okhttp/CacheControl;
    iput-object v0, p0, Lcom/squareup/okhttp/Request;->cacheControl:Lcom/squareup/okhttp/CacheControl;

    goto :goto_4
.end method

.method public header(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 83
    iget-object v0, p0, Lcom/squareup/okhttp/Request;->headers:Lcom/squareup/okhttp/Headers;

    invoke-virtual {v0, p1}, Lcom/squareup/okhttp/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public headers()Lcom/squareup/okhttp/Headers;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/squareup/okhttp/Request;->headers:Lcom/squareup/okhttp/Headers;

    return-object v0
.end method

.method public headers(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lcom/squareup/okhttp/Request;->headers:Lcom/squareup/okhttp/Headers;

    invoke-virtual {v0, p1}, Lcom/squareup/okhttp/Headers;->values(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public isHttps()Z
    .registers 3

    .prologue
    .line 112
    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public method()Ljava/lang/String;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/squareup/okhttp/Request;->method:Ljava/lang/String;

    return-object v0
.end method

.method public newBuilder()Lcom/squareup/okhttp/Request$Builder;
    .registers 3

    .prologue
    .line 99
    new-instance v0, Lcom/squareup/okhttp/Request$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/squareup/okhttp/Request$Builder;-><init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Request$1;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Request{method="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/Request;->method:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", url="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/Request;->urlString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", tag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/squareup/okhttp/Request;->tag:Ljava/lang/Object;

    if-eq v0, p0, :cond_38

    iget-object v0, p0, Lcom/squareup/okhttp/Request;->tag:Ljava/lang/Object;

    :goto_29
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_38
    const/4 v0, 0x0

    goto :goto_29
.end method

.method public uri()Ljava/net/URI;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    :try_start_0
    iget-object v1, p0, Lcom/squareup/okhttp/Request;->uri:Ljava/net/URI;

    .line 64
    .local v1, "result":Ljava/net/URI;
    if-eqz v1, :cond_5

    .end local v1    # "result":Ljava/net/URI;
    :goto_4
    return-object v1

    .restart local v1    # "result":Ljava/net/URI;
    :cond_5
    invoke-static {}, Lcom/squareup/okhttp/internal/Platform;->get()Lcom/squareup/okhttp/internal/Platform;

    move-result-object v2

    invoke-virtual {p0}, Lcom/squareup/okhttp/Request;->url()Ljava/net/URL;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/squareup/okhttp/internal/Platform;->toUriLenient(Ljava/net/URL;)Ljava/net/URI;

    move-result-object v1

    .end local v1    # "result":Ljava/net/URI;
    iput-object v1, p0, Lcom/squareup/okhttp/Request;->uri:Ljava/net/URI;
    :try_end_13
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_13} :catch_14

    goto :goto_4

    .line 65
    :catch_14
    move-exception v0

    .line 66
    .local v0, "e":Ljava/net/URISyntaxException;
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/net/URISyntaxException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public url()Ljava/net/URL;
    .registers 6

    .prologue
    .line 54
    :try_start_0
    iget-object v1, p0, Lcom/squareup/okhttp/Request;->url:Ljava/net/URL;

    .line 55
    .local v1, "result":Ljava/net/URL;
    if-eqz v1, :cond_5

    .end local v1    # "result":Ljava/net/URL;
    :goto_4
    return-object v1

    .restart local v1    # "result":Ljava/net/URL;
    :cond_5
    new-instance v1, Ljava/net/URL;

    .end local v1    # "result":Ljava/net/URL;
    iget-object v2, p0, Lcom/squareup/okhttp/Request;->urlString:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/squareup/okhttp/Request;->url:Ljava/net/URL;
    :try_end_e
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_e} :catch_f

    goto :goto_4

    .line 56
    :catch_f
    move-exception v0

    .line 57
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Malformed URL: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/squareup/okhttp/Request;->urlString:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public urlString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/squareup/okhttp/Request;->urlString:Ljava/lang/String;

    return-object v0
.end method
