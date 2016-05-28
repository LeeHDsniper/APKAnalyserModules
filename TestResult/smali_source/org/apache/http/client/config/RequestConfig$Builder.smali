.class public Lorg/apache/http/client/config/RequestConfig$Builder;
.super Ljava/lang/Object;
.source "RequestConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/client/config/RequestConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private authenticationEnabled:Z

.field private circularRedirectsAllowed:Z

.field private connectTimeout:I

.field private connectionRequestTimeout:I

.field private cookieSpec:Ljava/lang/String;

.field private expectContinueEnabled:Z

.field private localAddress:Ljava/net/InetAddress;

.field private maxRedirects:I

.field private proxy:Lorg/apache/http/HttpHost;

.field private proxyPreferredAuthSchemes:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private redirectsEnabled:Z

.field private relativeRedirectsAllowed:Z

.field private socketTimeout:I

.field private staleConnectionCheckEnabled:Z

.field private targetPreferredAuthSchemes:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, -0x1

    const/4 v1, 0x1

    .line 335
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 336
    iput-boolean v1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->staleConnectionCheckEnabled:Z

    .line 337
    iput-boolean v1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->redirectsEnabled:Z

    .line 338
    const/16 v0, 0x32

    iput v0, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->maxRedirects:I

    .line 339
    iput-boolean v1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->relativeRedirectsAllowed:Z

    .line 340
    iput-boolean v1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->authenticationEnabled:Z

    .line 341
    iput v2, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->connectionRequestTimeout:I

    .line 342
    iput v2, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->connectTimeout:I

    .line 343
    iput v2, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->socketTimeout:I

    .line 344
    return-void
.end method


# virtual methods
.method public build()Lorg/apache/http/client/config/RequestConfig;
    .registers 18

    .prologue
    .line 422
    new-instance v1, Lorg/apache/http/client/config/RequestConfig;

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/http/client/config/RequestConfig$Builder;->expectContinueEnabled:Z

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/http/client/config/RequestConfig$Builder;->proxy:Lorg/apache/http/HttpHost;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/http/client/config/RequestConfig$Builder;->localAddress:Ljava/net/InetAddress;

    move-object/from16 v0, p0

    iget-boolean v5, v0, Lorg/apache/http/client/config/RequestConfig$Builder;->staleConnectionCheckEnabled:Z

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/http/client/config/RequestConfig$Builder;->cookieSpec:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lorg/apache/http/client/config/RequestConfig$Builder;->redirectsEnabled:Z

    move-object/from16 v0, p0

    iget-boolean v8, v0, Lorg/apache/http/client/config/RequestConfig$Builder;->relativeRedirectsAllowed:Z

    move-object/from16 v0, p0

    iget-boolean v9, v0, Lorg/apache/http/client/config/RequestConfig$Builder;->circularRedirectsAllowed:Z

    move-object/from16 v0, p0

    iget v10, v0, Lorg/apache/http/client/config/RequestConfig$Builder;->maxRedirects:I

    move-object/from16 v0, p0

    iget-boolean v11, v0, Lorg/apache/http/client/config/RequestConfig$Builder;->authenticationEnabled:Z

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/http/client/config/RequestConfig$Builder;->targetPreferredAuthSchemes:Ljava/util/Collection;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/apache/http/client/config/RequestConfig$Builder;->proxyPreferredAuthSchemes:Ljava/util/Collection;

    move-object/from16 v0, p0

    iget v14, v0, Lorg/apache/http/client/config/RequestConfig$Builder;->connectionRequestTimeout:I

    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/http/client/config/RequestConfig$Builder;->connectTimeout:I

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/http/client/config/RequestConfig$Builder;->socketTimeout:I

    move/from16 v16, v0

    invoke-direct/range {v1 .. v16}, Lorg/apache/http/client/config/RequestConfig;-><init>(ZLorg/apache/http/HttpHost;Ljava/net/InetAddress;ZLjava/lang/String;ZZZIZLjava/util/Collection;Ljava/util/Collection;III)V

    return-object v1
.end method

.method public setAuthenticationEnabled(Z)Lorg/apache/http/client/config/RequestConfig$Builder;
    .registers 2
    .param p1, "authenticationEnabled"    # Z

    .prologue
    .line 392
    iput-boolean p1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->authenticationEnabled:Z

    .line 393
    return-object p0
.end method

.method public setCircularRedirectsAllowed(Z)Lorg/apache/http/client/config/RequestConfig$Builder;
    .registers 2
    .param p1, "circularRedirectsAllowed"    # Z

    .prologue
    .line 382
    iput-boolean p1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->circularRedirectsAllowed:Z

    .line 383
    return-object p0
.end method

.method public setConnectTimeout(I)Lorg/apache/http/client/config/RequestConfig$Builder;
    .registers 2
    .param p1, "connectTimeout"    # I

    .prologue
    .line 412
    iput p1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->connectTimeout:I

    .line 413
    return-object p0
.end method

.method public setConnectionRequestTimeout(I)Lorg/apache/http/client/config/RequestConfig$Builder;
    .registers 2
    .param p1, "connectionRequestTimeout"    # I

    .prologue
    .line 407
    iput p1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->connectionRequestTimeout:I

    .line 408
    return-object p0
.end method

.method public setCookieSpec(Ljava/lang/String;)Lorg/apache/http/client/config/RequestConfig$Builder;
    .registers 2
    .param p1, "cookieSpec"    # Ljava/lang/String;

    .prologue
    .line 367
    iput-object p1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->cookieSpec:Ljava/lang/String;

    .line 368
    return-object p0
.end method

.method public setExpectContinueEnabled(Z)Lorg/apache/http/client/config/RequestConfig$Builder;
    .registers 2
    .param p1, "expectContinueEnabled"    # Z

    .prologue
    .line 347
    iput-boolean p1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->expectContinueEnabled:Z

    .line 348
    return-object p0
.end method

.method public setLocalAddress(Ljava/net/InetAddress;)Lorg/apache/http/client/config/RequestConfig$Builder;
    .registers 2
    .param p1, "localAddress"    # Ljava/net/InetAddress;

    .prologue
    .line 357
    iput-object p1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->localAddress:Ljava/net/InetAddress;

    .line 358
    return-object p0
.end method

.method public setMaxRedirects(I)Lorg/apache/http/client/config/RequestConfig$Builder;
    .registers 2
    .param p1, "maxRedirects"    # I

    .prologue
    .line 387
    iput p1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->maxRedirects:I

    .line 388
    return-object p0
.end method

.method public setProxy(Lorg/apache/http/HttpHost;)Lorg/apache/http/client/config/RequestConfig$Builder;
    .registers 2
    .param p1, "proxy"    # Lorg/apache/http/HttpHost;

    .prologue
    .line 352
    iput-object p1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->proxy:Lorg/apache/http/HttpHost;

    .line 353
    return-object p0
.end method

.method public setProxyPreferredAuthSchemes(Ljava/util/Collection;)Lorg/apache/http/client/config/RequestConfig$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/apache/http/client/config/RequestConfig$Builder;"
        }
    .end annotation

    .prologue
    .line 402
    .local p1, "proxyPreferredAuthSchemes":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->proxyPreferredAuthSchemes:Ljava/util/Collection;

    .line 403
    return-object p0
.end method

.method public setRedirectsEnabled(Z)Lorg/apache/http/client/config/RequestConfig$Builder;
    .registers 2
    .param p1, "redirectsEnabled"    # Z

    .prologue
    .line 372
    iput-boolean p1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->redirectsEnabled:Z

    .line 373
    return-object p0
.end method

.method public setRelativeRedirectsAllowed(Z)Lorg/apache/http/client/config/RequestConfig$Builder;
    .registers 2
    .param p1, "relativeRedirectsAllowed"    # Z

    .prologue
    .line 377
    iput-boolean p1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->relativeRedirectsAllowed:Z

    .line 378
    return-object p0
.end method

.method public setSocketTimeout(I)Lorg/apache/http/client/config/RequestConfig$Builder;
    .registers 2
    .param p1, "socketTimeout"    # I

    .prologue
    .line 417
    iput p1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->socketTimeout:I

    .line 418
    return-object p0
.end method

.method public setStaleConnectionCheckEnabled(Z)Lorg/apache/http/client/config/RequestConfig$Builder;
    .registers 2
    .param p1, "staleConnectionCheckEnabled"    # Z

    .prologue
    .line 362
    iput-boolean p1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->staleConnectionCheckEnabled:Z

    .line 363
    return-object p0
.end method

.method public setTargetPreferredAuthSchemes(Ljava/util/Collection;)Lorg/apache/http/client/config/RequestConfig$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/apache/http/client/config/RequestConfig$Builder;"
        }
    .end annotation

    .prologue
    .line 397
    .local p1, "targetPreferredAuthSchemes":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/apache/http/client/config/RequestConfig$Builder;->targetPreferredAuthSchemes:Ljava/util/Collection;

    .line 398
    return-object p0
.end method
