.class public Lorg/apache/http/protocol/HttpService;
.super Ljava/lang/Object;
.source "HttpService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/protocol/HttpService$HttpRequestHandlerResolverAdapter;
    }
.end annotation

.annotation build Lorg/apache/http/annotation/Immutable;
.end annotation


# instance fields
.field private volatile connStrategy:Lorg/apache/http/ConnectionReuseStrategy;

.field private volatile expectationVerifier:Lorg/apache/http/protocol/HttpExpectationVerifier;

.field private volatile handlerMapper:Lorg/apache/http/protocol/HttpRequestHandlerMapper;

.field private volatile params:Lorg/apache/http/params/HttpParams;

.field private volatile processor:Lorg/apache/http/protocol/HttpProcessor;

.field private volatile responseFactory:Lorg/apache/http/HttpResponseFactory;


# direct methods
.method public constructor <init>(Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/HttpResponseFactory;)V
    .registers 5
    .param p1, "proc"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p2, "connStrategy"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p3, "responseFactory"    # Lorg/apache/http/HttpResponseFactory;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    .line 81
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->processor:Lorg/apache/http/protocol/HttpProcessor;

    .line 82
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->handlerMapper:Lorg/apache/http/protocol/HttpRequestHandlerMapper;

    .line 83
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->connStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 84
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    .line 85
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->expectationVerifier:Lorg/apache/http/protocol/HttpExpectationVerifier;

    .line 161
    invoke-virtual {p0, p1}, Lorg/apache/http/protocol/HttpService;->setHttpProcessor(Lorg/apache/http/protocol/HttpProcessor;)V

    .line 162
    invoke-virtual {p0, p2}, Lorg/apache/http/protocol/HttpService;->setConnReuseStrategy(Lorg/apache/http/ConnectionReuseStrategy;)V

    .line 163
    invoke-virtual {p0, p3}, Lorg/apache/http/protocol/HttpService;->setResponseFactory(Lorg/apache/http/HttpResponseFactory;)V

    .line 164
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/protocol/HttpRequestHandlerMapper;)V
    .registers 11
    .param p1, "processor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p2, "connStrategy"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p3, "responseFactory"    # Lorg/apache/http/HttpResponseFactory;
    .param p4, "handlerMapper"    # Lorg/apache/http/protocol/HttpRequestHandlerMapper;

    .prologue
    .line 212
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/protocol/HttpService;-><init>(Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/protocol/HttpRequestHandlerMapper;Lorg/apache/http/protocol/HttpExpectationVerifier;)V

    .line 213
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/protocol/HttpRequestHandlerMapper;Lorg/apache/http/protocol/HttpExpectationVerifier;)V
    .registers 7
    .param p1, "processor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p2, "connStrategy"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p3, "responseFactory"    # Lorg/apache/http/HttpResponseFactory;
    .param p4, "handlerMapper"    # Lorg/apache/http/protocol/HttpRequestHandlerMapper;
    .param p5, "expectationVerifier"    # Lorg/apache/http/protocol/HttpExpectationVerifier;

    .prologue
    const/4 v0, 0x0

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    .line 81
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->processor:Lorg/apache/http/protocol/HttpProcessor;

    .line 82
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->handlerMapper:Lorg/apache/http/protocol/HttpRequestHandlerMapper;

    .line 83
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->connStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 84
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    .line 85
    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->expectationVerifier:Lorg/apache/http/protocol/HttpExpectationVerifier;

    .line 186
    const-string v0, "HTTP processor"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/protocol/HttpProcessor;

    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->processor:Lorg/apache/http/protocol/HttpProcessor;

    .line 187
    if-eqz p2, :cond_27

    .end local p2    # "connStrategy":Lorg/apache/http/ConnectionReuseStrategy;
    :goto_1c
    iput-object p2, p0, Lorg/apache/http/protocol/HttpService;->connStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 189
    if-eqz p3, :cond_2a

    .end local p3    # "responseFactory":Lorg/apache/http/HttpResponseFactory;
    :goto_20
    iput-object p3, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    .line 191
    iput-object p4, p0, Lorg/apache/http/protocol/HttpService;->handlerMapper:Lorg/apache/http/protocol/HttpRequestHandlerMapper;

    .line 192
    iput-object p5, p0, Lorg/apache/http/protocol/HttpService;->expectationVerifier:Lorg/apache/http/protocol/HttpExpectationVerifier;

    .line 193
    return-void

    .line 187
    .restart local p2    # "connStrategy":Lorg/apache/http/ConnectionReuseStrategy;
    .restart local p3    # "responseFactory":Lorg/apache/http/HttpResponseFactory;
    :cond_27
    sget-object p2, Lorg/apache/http/impl/DefaultConnectionReuseStrategy;->INSTANCE:Lorg/apache/http/impl/DefaultConnectionReuseStrategy;

    goto :goto_1c

    .line 189
    .end local p2    # "connStrategy":Lorg/apache/http/ConnectionReuseStrategy;
    :cond_2a
    sget-object p3, Lorg/apache/http/impl/DefaultHttpResponseFactory;->INSTANCE:Lorg/apache/http/impl/DefaultHttpResponseFactory;

    goto :goto_20
.end method

.method public constructor <init>(Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/protocol/HttpRequestHandlerResolver;Lorg/apache/http/params/HttpParams;)V
    .registers 12
    .param p1, "processor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p2, "connStrategy"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p3, "responseFactory"    # Lorg/apache/http/HttpResponseFactory;
    .param p4, "handlerResolver"    # Lorg/apache/http/protocol/HttpRequestHandlerResolver;
    .param p5, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 137
    new-instance v4, Lorg/apache/http/protocol/HttpService$HttpRequestHandlerResolverAdapter;

    invoke-direct {v4, p4}, Lorg/apache/http/protocol/HttpService$HttpRequestHandlerResolverAdapter;-><init>(Lorg/apache/http/protocol/HttpRequestHandlerResolver;)V

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/protocol/HttpService;-><init>(Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/protocol/HttpRequestHandlerMapper;Lorg/apache/http/protocol/HttpExpectationVerifier;)V

    .line 142
    iput-object p5, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    .line 143
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/protocol/HttpRequestHandlerResolver;Lorg/apache/http/protocol/HttpExpectationVerifier;Lorg/apache/http/params/HttpParams;)V
    .registers 13
    .param p1, "processor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p2, "connStrategy"    # Lorg/apache/http/ConnectionReuseStrategy;
    .param p3, "responseFactory"    # Lorg/apache/http/HttpResponseFactory;
    .param p4, "handlerResolver"    # Lorg/apache/http/protocol/HttpRequestHandlerResolver;
    .param p5, "expectationVerifier"    # Lorg/apache/http/protocol/HttpExpectationVerifier;
    .param p6, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 109
    new-instance v4, Lorg/apache/http/protocol/HttpService$HttpRequestHandlerResolverAdapter;

    invoke-direct {v4, p4}, Lorg/apache/http/protocol/HttpService$HttpRequestHandlerResolverAdapter;-><init>(Lorg/apache/http/protocol/HttpRequestHandlerResolver;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/protocol/HttpService;-><init>(Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/protocol/HttpRequestHandlerMapper;Lorg/apache/http/protocol/HttpExpectationVerifier;)V

    .line 114
    iput-object p6, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    .line 115
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/protocol/HttpRequestHandlerMapper;)V
    .registers 9
    .param p1, "processor"    # Lorg/apache/http/protocol/HttpProcessor;
    .param p2, "handlerMapper"    # Lorg/apache/http/protocol/HttpRequestHandlerMapper;

    .prologue
    const/4 v2, 0x0

    .line 225
    move-object v0, p0

    move-object v1, p1

    move-object v3, v2

    move-object v4, p2

    move-object v5, v2

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/protocol/HttpService;-><init>(Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/HttpResponseFactory;Lorg/apache/http/protocol/HttpRequestHandlerMapper;Lorg/apache/http/protocol/HttpExpectationVerifier;)V

    .line 226
    return-void
.end method


# virtual methods
.method protected doService(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V
    .registers 6
    .param p1, "request"    # Lorg/apache/http/HttpRequest;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;
    .param p3, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 418
    const/4 v0, 0x0

    .line 419
    .local v0, "handler":Lorg/apache/http/protocol/HttpRequestHandler;
    iget-object v1, p0, Lorg/apache/http/protocol/HttpService;->handlerMapper:Lorg/apache/http/protocol/HttpRequestHandlerMapper;

    if-eqz v1, :cond_b

    .line 420
    iget-object v1, p0, Lorg/apache/http/protocol/HttpService;->handlerMapper:Lorg/apache/http/protocol/HttpRequestHandlerMapper;

    invoke-interface {v1, p1}, Lorg/apache/http/protocol/HttpRequestHandlerMapper;->lookup(Lorg/apache/http/HttpRequest;)Lorg/apache/http/protocol/HttpRequestHandler;

    move-result-object v0

    .line 422
    :cond_b
    if-eqz v0, :cond_11

    .line 423
    invoke-interface {v0, p1, p2, p3}, Lorg/apache/http/protocol/HttpRequestHandler;->handle(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V

    .line 427
    :goto_10
    return-void

    .line 425
    :cond_11
    const/16 v1, 0x1f5

    invoke-interface {p2, v1}, Lorg/apache/http/HttpResponse;->setStatusCode(I)V

    goto :goto_10
.end method

.method public getParams()Lorg/apache/http/params/HttpParams;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 284
    iget-object v0, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    return-object v0
.end method

.method protected handleException(Lorg/apache/http/HttpException;Lorg/apache/http/HttpResponse;)V
    .registers 7
    .param p1, "ex"    # Lorg/apache/http/HttpException;
    .param p2, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 378
    instance-of v3, p1, Lorg/apache/http/MethodNotSupportedException;

    if-eqz v3, :cond_25

    .line 379
    const/16 v3, 0x1f5

    invoke-interface {p2, v3}, Lorg/apache/http/HttpResponse;->setStatusCode(I)V

    .line 387
    :goto_9
    invoke-virtual {p1}, Lorg/apache/http/HttpException;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 388
    .local v1, "message":Ljava/lang/String;
    if-nez v1, :cond_13

    .line 389
    invoke-virtual {p1}, Lorg/apache/http/HttpException;->toString()Ljava/lang/String;

    move-result-object v1

    .line 391
    :cond_13
    invoke-static {v1}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v2

    .line 392
    .local v2, "msg":[B
    new-instance v0, Lorg/apache/http/entity/ByteArrayEntity;

    invoke-direct {v0, v2}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    .line 393
    .local v0, "entity":Lorg/apache/http/entity/ByteArrayEntity;
    const-string v3, "text/plain; charset=US-ASCII"

    invoke-virtual {v0, v3}, Lorg/apache/http/entity/ByteArrayEntity;->setContentType(Ljava/lang/String;)V

    .line 394
    invoke-interface {p2, v0}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 395
    return-void

    .line 380
    .end local v0    # "entity":Lorg/apache/http/entity/ByteArrayEntity;
    .end local v1    # "message":Ljava/lang/String;
    .end local v2    # "msg":[B
    :cond_25
    instance-of v3, p1, Lorg/apache/http/UnsupportedHttpVersionException;

    if-eqz v3, :cond_2f

    .line 381
    const/16 v3, 0x1f9

    invoke-interface {p2, v3}, Lorg/apache/http/HttpResponse;->setStatusCode(I)V

    goto :goto_9

    .line 382
    :cond_2f
    instance-of v3, p1, Lorg/apache/http/ProtocolException;

    if-eqz v3, :cond_39

    .line 383
    const/16 v3, 0x190

    invoke-interface {p2, v3}, Lorg/apache/http/HttpResponse;->setStatusCode(I)V

    goto :goto_9

    .line 385
    :cond_39
    const/16 v3, 0x1f4

    invoke-interface {p2, v3}, Lorg/apache/http/HttpResponse;->setStatusCode(I)V

    goto :goto_9
.end method

.method public handleRequest(Lorg/apache/http/HttpServerConnection;Lorg/apache/http/protocol/HttpContext;)V
    .registers 13
    .param p1, "conn"    # Lorg/apache/http/HttpServerConnection;
    .param p2, "context"    # Lorg/apache/http/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x1f4

    const/16 v8, 0xc8

    .line 301
    const-string v5, "http.connection"

    invoke-interface {p2, v5, p1}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 303
    const/4 v4, 0x0

    .line 307
    .local v4, "response":Lorg/apache/http/HttpResponse;
    :try_start_a
    invoke-interface {p1}, Lorg/apache/http/HttpServerConnection;->receiveRequestHeader()Lorg/apache/http/HttpRequest;

    move-result-object v3

    .line 308
    .local v3, "request":Lorg/apache/http/HttpRequest;
    instance-of v5, v3, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v5, :cond_47

    .line 310
    move-object v0, v3

    check-cast v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    move-object v5, v0

    invoke-interface {v5}, Lorg/apache/http/HttpEntityEnclosingRequest;->expectContinue()Z

    move-result v5

    if-eqz v5, :cond_a8

    .line 311
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    sget-object v6, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    const/16 v7, 0x64

    invoke-interface {v5, v6, v7, p2}, Lorg/apache/http/HttpResponseFactory;->newHttpResponse(Lorg/apache/http/ProtocolVersion;ILorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 313
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->expectationVerifier:Lorg/apache/http/protocol/HttpExpectationVerifier;
    :try_end_28
    .catch Lorg/apache/http/HttpException; {:try_start_a .. :try_end_28} :catch_9b

    if-eqz v5, :cond_2f

    .line 315
    :try_start_2a
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->expectationVerifier:Lorg/apache/http/protocol/HttpExpectationVerifier;

    invoke-interface {v5, v3, v4, p2}, Lorg/apache/http/protocol/HttpExpectationVerifier;->verify(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V
    :try_end_2f
    .catch Lorg/apache/http/HttpException; {:try_start_2a .. :try_end_2f} :catch_8c

    .line 322
    :cond_2f
    :goto_2f
    :try_start_2f
    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v5

    invoke-interface {v5}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v5

    if-ge v5, v8, :cond_47

    .line 325
    invoke-interface {p1, v4}, Lorg/apache/http/HttpServerConnection;->sendResponseHeader(Lorg/apache/http/HttpResponse;)V

    .line 326
    invoke-interface {p1}, Lorg/apache/http/HttpServerConnection;->flush()V

    .line 327
    const/4 v4, 0x0

    .line 328
    move-object v0, v3

    check-cast v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    move-object v5, v0

    invoke-interface {p1, v5}, Lorg/apache/http/HttpServerConnection;->receiveRequestEntity(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    .line 335
    :cond_47
    :goto_47
    const-string v5, "http.request"

    invoke-interface {p2, v5, v3}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 337
    if-nez v4, :cond_60

    .line 338
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    sget-object v6, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    const/16 v7, 0xc8

    invoke-interface {v5, v6, v7, p2}, Lorg/apache/http/HttpResponseFactory;->newHttpResponse(Lorg/apache/http/ProtocolVersion;ILorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 340
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->processor:Lorg/apache/http/protocol/HttpProcessor;

    invoke-interface {v5, v3, p2}, Lorg/apache/http/protocol/HttpProcessor;->process(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)V

    .line 341
    invoke-virtual {p0, v3, v4, p2}, Lorg/apache/http/protocol/HttpService;->doService(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V

    .line 345
    :cond_60
    instance-of v5, v3, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v5, :cond_6d

    .line 346
    check-cast v3, Lorg/apache/http/HttpEntityEnclosingRequest;

    .end local v3    # "request":Lorg/apache/http/HttpRequest;
    invoke-interface {v3}, Lorg/apache/http/HttpEntityEnclosingRequest;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    .line 347
    .local v1, "entity":Lorg/apache/http/HttpEntity;
    invoke-static {v1}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V
    :try_end_6d
    .catch Lorg/apache/http/HttpException; {:try_start_2f .. :try_end_6d} :catch_9b

    .line 357
    .end local v1    # "entity":Lorg/apache/http/HttpEntity;
    :cond_6d
    :goto_6d
    const-string v5, "http.response"

    invoke-interface {p2, v5, v4}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 359
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->processor:Lorg/apache/http/protocol/HttpProcessor;

    invoke-interface {v5, v4, p2}, Lorg/apache/http/protocol/HttpProcessor;->process(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)V

    .line 360
    invoke-interface {p1, v4}, Lorg/apache/http/HttpServerConnection;->sendResponseHeader(Lorg/apache/http/HttpResponse;)V

    .line 361
    invoke-interface {p1, v4}, Lorg/apache/http/HttpServerConnection;->sendResponseEntity(Lorg/apache/http/HttpResponse;)V

    .line 362
    invoke-interface {p1}, Lorg/apache/http/HttpServerConnection;->flush()V

    .line 364
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->connStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    invoke-interface {v5, v4, p2}, Lorg/apache/http/ConnectionReuseStrategy;->keepAlive(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v5

    if-nez v5, :cond_8b

    .line 365
    invoke-interface {p1}, Lorg/apache/http/HttpServerConnection;->close()V

    .line 367
    :cond_8b
    return-void

    .line 316
    .restart local v3    # "request":Lorg/apache/http/HttpRequest;
    :catch_8c
    move-exception v2

    .line 317
    .local v2, "ex":Lorg/apache/http/HttpException;
    :try_start_8d
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    sget-object v6, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    const/16 v7, 0x1f4

    invoke-interface {v5, v6, v7, p2}, Lorg/apache/http/HttpResponseFactory;->newHttpResponse(Lorg/apache/http/ProtocolVersion;ILorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 319
    invoke-virtual {p0, v2, v4}, Lorg/apache/http/protocol/HttpService;->handleException(Lorg/apache/http/HttpException;Lorg/apache/http/HttpResponse;)V
    :try_end_9a
    .catch Lorg/apache/http/HttpException; {:try_start_8d .. :try_end_9a} :catch_9b

    goto :goto_2f

    .line 350
    .end local v2    # "ex":Lorg/apache/http/HttpException;
    .end local v3    # "request":Lorg/apache/http/HttpRequest;
    :catch_9b
    move-exception v2

    .line 351
    .restart local v2    # "ex":Lorg/apache/http/HttpException;
    iget-object v5, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    sget-object v6, Lorg/apache/http/HttpVersion;->HTTP_1_0:Lorg/apache/http/HttpVersion;

    invoke-interface {v5, v6, v9, p2}, Lorg/apache/http/HttpResponseFactory;->newHttpResponse(Lorg/apache/http/ProtocolVersion;ILorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v4

    .line 354
    invoke-virtual {p0, v2, v4}, Lorg/apache/http/protocol/HttpService;->handleException(Lorg/apache/http/HttpException;Lorg/apache/http/HttpResponse;)V

    goto :goto_6d

    .line 331
    .end local v2    # "ex":Lorg/apache/http/HttpException;
    .restart local v3    # "request":Lorg/apache/http/HttpRequest;
    :cond_a8
    :try_start_a8
    move-object v0, v3

    check-cast v0, Lorg/apache/http/HttpEntityEnclosingRequest;

    move-object v5, v0

    invoke-interface {p1, v5}, Lorg/apache/http/HttpServerConnection;->receiveRequestEntity(Lorg/apache/http/HttpEntityEnclosingRequest;)V
    :try_end_af
    .catch Lorg/apache/http/HttpException; {:try_start_a8 .. :try_end_af} :catch_9b

    goto :goto_47
.end method

.method public setConnReuseStrategy(Lorg/apache/http/ConnectionReuseStrategy;)V
    .registers 3
    .param p1, "connStrategy"    # Lorg/apache/http/ConnectionReuseStrategy;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 242
    const-string v0, "Connection reuse strategy"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 243
    iput-object p1, p0, Lorg/apache/http/protocol/HttpService;->connStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 244
    return-void
.end method

.method public setExpectationVerifier(Lorg/apache/http/protocol/HttpExpectationVerifier;)V
    .registers 2
    .param p1, "expectationVerifier"    # Lorg/apache/http/protocol/HttpExpectationVerifier;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 276
    iput-object p1, p0, Lorg/apache/http/protocol/HttpService;->expectationVerifier:Lorg/apache/http/protocol/HttpExpectationVerifier;

    .line 277
    return-void
.end method

.method public setHandlerResolver(Lorg/apache/http/protocol/HttpRequestHandlerResolver;)V
    .registers 3
    .param p1, "handlerResolver"    # Lorg/apache/http/protocol/HttpRequestHandlerResolver;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 268
    new-instance v0, Lorg/apache/http/protocol/HttpService$HttpRequestHandlerResolverAdapter;

    invoke-direct {v0, p1}, Lorg/apache/http/protocol/HttpService$HttpRequestHandlerResolverAdapter;-><init>(Lorg/apache/http/protocol/HttpRequestHandlerResolver;)V

    iput-object v0, p0, Lorg/apache/http/protocol/HttpService;->handlerMapper:Lorg/apache/http/protocol/HttpRequestHandlerMapper;

    .line 269
    return-void
.end method

.method public setHttpProcessor(Lorg/apache/http/protocol/HttpProcessor;)V
    .registers 3
    .param p1, "processor"    # Lorg/apache/http/protocol/HttpProcessor;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 233
    const-string v0, "HTTP processor"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 234
    iput-object p1, p0, Lorg/apache/http/protocol/HttpService;->processor:Lorg/apache/http/protocol/HttpProcessor;

    .line 235
    return-void
.end method

.method public setParams(Lorg/apache/http/params/HttpParams;)V
    .registers 2
    .param p1, "params"    # Lorg/apache/http/params/HttpParams;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 260
    iput-object p1, p0, Lorg/apache/http/protocol/HttpService;->params:Lorg/apache/http/params/HttpParams;

    .line 261
    return-void
.end method

.method public setResponseFactory(Lorg/apache/http/HttpResponseFactory;)V
    .registers 3
    .param p1, "responseFactory"    # Lorg/apache/http/HttpResponseFactory;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 251
    const-string v0, "Response factory"

    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 252
    iput-object p1, p0, Lorg/apache/http/protocol/HttpService;->responseFactory:Lorg/apache/http/HttpResponseFactory;

    .line 253
    return-void
.end method
