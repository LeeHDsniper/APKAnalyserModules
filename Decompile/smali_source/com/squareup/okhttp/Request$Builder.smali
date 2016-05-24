.class public Lcom/squareup/okhttp/Request$Builder;
.super Ljava/lang/Object;
.source "Request.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private body:Lcom/squareup/okhttp/RequestBody;

.field private headers:Lcom/squareup/okhttp/Headers$Builder;

.field private method:Ljava/lang/String;

.field private tag:Ljava/lang/Object;

.field private url:Ljava/net/URL;

.field private urlString:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    const-string v0, "GET"

    iput-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->method:Ljava/lang/String;

    .line 135
    new-instance v0, Lcom/squareup/okhttp/Headers$Builder;

    invoke-direct {v0}, Lcom/squareup/okhttp/Headers$Builder;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;

    .line 136
    return-void
.end method

.method private constructor <init>(Lcom/squareup/okhttp/Request;)V
    .registers 3
    .param p1, "request"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    # getter for: Lcom/squareup/okhttp/Request;->urlString:Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/Request;->access$700(Lcom/squareup/okhttp/Request;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->urlString:Ljava/lang/String;

    .line 140
    # getter for: Lcom/squareup/okhttp/Request;->url:Ljava/net/URL;
    invoke-static {p1}, Lcom/squareup/okhttp/Request;->access$800(Lcom/squareup/okhttp/Request;)Ljava/net/URL;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->url:Ljava/net/URL;

    .line 141
    # getter for: Lcom/squareup/okhttp/Request;->method:Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/Request;->access$900(Lcom/squareup/okhttp/Request;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->method:Ljava/lang/String;

    .line 142
    # getter for: Lcom/squareup/okhttp/Request;->body:Lcom/squareup/okhttp/RequestBody;
    invoke-static {p1}, Lcom/squareup/okhttp/Request;->access$1000(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/RequestBody;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->body:Lcom/squareup/okhttp/RequestBody;

    .line 143
    # getter for: Lcom/squareup/okhttp/Request;->tag:Ljava/lang/Object;
    invoke-static {p1}, Lcom/squareup/okhttp/Request;->access$1100(Lcom/squareup/okhttp/Request;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->tag:Ljava/lang/Object;

    .line 144
    # getter for: Lcom/squareup/okhttp/Request;->headers:Lcom/squareup/okhttp/Headers;
    invoke-static {p1}, Lcom/squareup/okhttp/Request;->access$1200(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Headers;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Headers;->newBuilder()Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;

    .line 145
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/Request;Lcom/squareup/okhttp/Request$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/squareup/okhttp/Request;
    .param p2, "x1"    # Lcom/squareup/okhttp/Request$1;

    .prologue
    .line 125
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/Request$Builder;-><init>(Lcom/squareup/okhttp/Request;)V

    return-void
.end method

.method static synthetic access$000(Lcom/squareup/okhttp/Request$Builder;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Request$Builder;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->urlString:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/squareup/okhttp/Request$Builder;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Request$Builder;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->method:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/squareup/okhttp/Request$Builder;)Lcom/squareup/okhttp/Headers$Builder;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Request$Builder;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;

    return-object v0
.end method

.method static synthetic access$300(Lcom/squareup/okhttp/Request$Builder;)Lcom/squareup/okhttp/RequestBody;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Request$Builder;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->body:Lcom/squareup/okhttp/RequestBody;

    return-object v0
.end method

.method static synthetic access$400(Lcom/squareup/okhttp/Request$Builder;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Request$Builder;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->tag:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$500(Lcom/squareup/okhttp/Request$Builder;)Ljava/net/URL;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Request$Builder;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->url:Ljava/net/URL;

    return-object v0
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 174
    iget-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lcom/squareup/okhttp/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 175
    return-object p0
.end method

.method public build()Lcom/squareup/okhttp/Request;
    .registers 3

    .prologue
    .line 250
    iget-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->urlString:Ljava/lang/String;

    if-nez v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "url == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 251
    :cond_c
    new-instance v0, Lcom/squareup/okhttp/Request;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/squareup/okhttp/Request;-><init>(Lcom/squareup/okhttp/Request$Builder;Lcom/squareup/okhttp/Request$1;)V

    return-object v0
.end method

.method public cacheControl(Lcom/squareup/okhttp/CacheControl;)Lcom/squareup/okhttp/Request$Builder;
    .registers 4
    .param p1, "cacheControl"    # Lcom/squareup/okhttp/CacheControl;

    .prologue
    .line 195
    invoke-virtual {p1}, Lcom/squareup/okhttp/CacheControl;->toString()Ljava/lang/String;

    move-result-object v0

    .line 196
    .local v0, "value":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_11

    const-string v1, "Cache-Control"

    invoke-virtual {p0, v1}, Lcom/squareup/okhttp/Request$Builder;->removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v1

    .line 197
    :goto_10
    return-object v1

    :cond_11
    const-string v1, "Cache-Control"

    invoke-virtual {p0, v1, v0}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v1

    goto :goto_10
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 165
    iget-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lcom/squareup/okhttp/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 166
    return-object p0
.end method

.method public headers(Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/Request$Builder;
    .registers 3
    .param p1, "headers"    # Lcom/squareup/okhttp/Headers;

    .prologue
    .line 185
    invoke-virtual {p1}, Lcom/squareup/okhttp/Headers;->newBuilder()Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;

    .line 186
    return-object p0
.end method

.method public method(Ljava/lang/String;Lcom/squareup/okhttp/RequestBody;)Lcom/squareup/okhttp/Request$Builder;
    .registers 6
    .param p1, "method"    # Ljava/lang/String;
    .param p2, "body"    # Lcom/squareup/okhttp/RequestBody;

    .prologue
    .line 225
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_10

    .line 226
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "method == null || method.length() == 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 228
    :cond_10
    if-eqz p2, :cond_37

    invoke-static {p1}, Lcom/squareup/okhttp/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_37

    .line 229
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "method "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " must not have a request body."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 231
    :cond_37
    if-nez p2, :cond_46

    invoke-static {p1}, Lcom/squareup/okhttp/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_46

    .line 232
    const/4 v0, 0x0

    sget-object v1, Lcom/squareup/okhttp/internal/Util;->EMPTY_BYTE_ARRAY:[B

    invoke-static {v0, v1}, Lcom/squareup/okhttp/RequestBody;->create(Lcom/squareup/okhttp/MediaType;[B)Lcom/squareup/okhttp/RequestBody;

    move-result-object p2

    .line 234
    :cond_46
    iput-object p1, p0, Lcom/squareup/okhttp/Request$Builder;->method:Ljava/lang/String;

    .line 235
    iput-object p2, p0, Lcom/squareup/okhttp/Request$Builder;->body:Lcom/squareup/okhttp/RequestBody;

    .line 236
    return-object p0
.end method

.method public removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 179
    iget-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v0, p1}, Lcom/squareup/okhttp/Headers$Builder;->removeAll(Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 180
    return-object p0
.end method

.method public url(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;
    .registers 4
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 148
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "url == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 149
    :cond_a
    iput-object p1, p0, Lcom/squareup/okhttp/Request$Builder;->urlString:Ljava/lang/String;

    .line 150
    return-object p0
.end method

.method public url(Ljava/net/URL;)Lcom/squareup/okhttp/Request$Builder;
    .registers 4
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 154
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "url == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 155
    :cond_a
    iput-object p1, p0, Lcom/squareup/okhttp/Request$Builder;->url:Ljava/net/URL;

    .line 156
    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Request$Builder;->urlString:Ljava/lang/String;

    .line 157
    return-object p0
.end method
