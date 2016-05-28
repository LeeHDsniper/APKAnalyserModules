.class public Lcom/squareup/okhttp/Response$Builder;
.super Ljava/lang/Object;
.source "Response.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/Response;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private body:Lcom/squareup/okhttp/ResponseBody;

.field private cacheResponse:Lcom/squareup/okhttp/Response;

.field private code:I

.field private handshake:Lcom/squareup/okhttp/Handshake;

.field private headers:Lcom/squareup/okhttp/Headers$Builder;

.field private message:Ljava/lang/String;

.field private networkResponse:Lcom/squareup/okhttp/Response;

.field private priorResponse:Lcom/squareup/okhttp/Response;

.field private protocol:Lcom/squareup/okhttp/Protocol;

.field private request:Lcom/squareup/okhttp/Request;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 224
    const/4 v0, -0x1

    iput v0, p0, Lcom/squareup/okhttp/Response$Builder;->code:I

    .line 234
    new-instance v0, Lcom/squareup/okhttp/Headers$Builder;

    invoke-direct {v0}, Lcom/squareup/okhttp/Headers$Builder;-><init>()V

    iput-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;

    .line 235
    return-void
.end method

.method private constructor <init>(Lcom/squareup/okhttp/Response;)V
    .registers 3
    .param p1, "response"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 237
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 224
    const/4 v0, -0x1

    iput v0, p0, Lcom/squareup/okhttp/Response$Builder;->code:I

    .line 238
    # getter for: Lcom/squareup/okhttp/Response;->request:Lcom/squareup/okhttp/Request;
    invoke-static {p1}, Lcom/squareup/okhttp/Response;->access$1100(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Request;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->request:Lcom/squareup/okhttp/Request;

    .line 239
    # getter for: Lcom/squareup/okhttp/Response;->protocol:Lcom/squareup/okhttp/Protocol;
    invoke-static {p1}, Lcom/squareup/okhttp/Response;->access$1200(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Protocol;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->protocol:Lcom/squareup/okhttp/Protocol;

    .line 240
    # getter for: Lcom/squareup/okhttp/Response;->code:I
    invoke-static {p1}, Lcom/squareup/okhttp/Response;->access$1300(Lcom/squareup/okhttp/Response;)I

    move-result v0

    iput v0, p0, Lcom/squareup/okhttp/Response$Builder;->code:I

    .line 241
    # getter for: Lcom/squareup/okhttp/Response;->message:Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/Response;->access$1400(Lcom/squareup/okhttp/Response;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->message:Ljava/lang/String;

    .line 242
    # getter for: Lcom/squareup/okhttp/Response;->handshake:Lcom/squareup/okhttp/Handshake;
    invoke-static {p1}, Lcom/squareup/okhttp/Response;->access$1500(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Handshake;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->handshake:Lcom/squareup/okhttp/Handshake;

    .line 243
    # getter for: Lcom/squareup/okhttp/Response;->headers:Lcom/squareup/okhttp/Headers;
    invoke-static {p1}, Lcom/squareup/okhttp/Response;->access$1600(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Headers;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Headers;->newBuilder()Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;

    .line 244
    # getter for: Lcom/squareup/okhttp/Response;->body:Lcom/squareup/okhttp/ResponseBody;
    invoke-static {p1}, Lcom/squareup/okhttp/Response;->access$1700(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/ResponseBody;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->body:Lcom/squareup/okhttp/ResponseBody;

    .line 245
    # getter for: Lcom/squareup/okhttp/Response;->networkResponse:Lcom/squareup/okhttp/Response;
    invoke-static {p1}, Lcom/squareup/okhttp/Response;->access$1800(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->networkResponse:Lcom/squareup/okhttp/Response;

    .line 246
    # getter for: Lcom/squareup/okhttp/Response;->cacheResponse:Lcom/squareup/okhttp/Response;
    invoke-static {p1}, Lcom/squareup/okhttp/Response;->access$1900(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->cacheResponse:Lcom/squareup/okhttp/Response;

    .line 247
    # getter for: Lcom/squareup/okhttp/Response;->priorResponse:Lcom/squareup/okhttp/Response;
    invoke-static {p1}, Lcom/squareup/okhttp/Response;->access$2000(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->priorResponse:Lcom/squareup/okhttp/Response;

    .line 248
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Response$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/squareup/okhttp/Response;
    .param p2, "x1"    # Lcom/squareup/okhttp/Response$1;

    .prologue
    .line 221
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/Response$Builder;-><init>(Lcom/squareup/okhttp/Response;)V

    return-void
.end method

.method static synthetic access$000(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Request;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response$Builder;

    .prologue
    .line 221
    iget-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->request:Lcom/squareup/okhttp/Request;

    return-object v0
.end method

.method static synthetic access$100(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Protocol;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response$Builder;

    .prologue
    .line 221
    iget-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->protocol:Lcom/squareup/okhttp/Protocol;

    return-object v0
.end method

.method static synthetic access$200(Lcom/squareup/okhttp/Response$Builder;)I
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response$Builder;

    .prologue
    .line 221
    iget v0, p0, Lcom/squareup/okhttp/Response$Builder;->code:I

    return v0
.end method

.method static synthetic access$300(Lcom/squareup/okhttp/Response$Builder;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response$Builder;

    .prologue
    .line 221
    iget-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->message:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Handshake;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response$Builder;

    .prologue
    .line 221
    iget-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->handshake:Lcom/squareup/okhttp/Handshake;

    return-object v0
.end method

.method static synthetic access$500(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Headers$Builder;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response$Builder;

    .prologue
    .line 221
    iget-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;

    return-object v0
.end method

.method static synthetic access$600(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/ResponseBody;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response$Builder;

    .prologue
    .line 221
    iget-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->body:Lcom/squareup/okhttp/ResponseBody;

    return-object v0
.end method

.method static synthetic access$700(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Response;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response$Builder;

    .prologue
    .line 221
    iget-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->networkResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method

.method static synthetic access$800(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Response;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response$Builder;

    .prologue
    .line 221
    iget-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->cacheResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method

.method static synthetic access$900(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Response;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response$Builder;

    .prologue
    .line 221
    iget-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->priorResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method

.method private checkPriorResponse(Lcom/squareup/okhttp/Response;)V
    .registers 4
    .param p1, "response"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 340
    # getter for: Lcom/squareup/okhttp/Response;->body:Lcom/squareup/okhttp/ResponseBody;
    invoke-static {p1}, Lcom/squareup/okhttp/Response;->access$1700(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/ResponseBody;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 341
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "priorResponse.body != null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 343
    :cond_e
    return-void
.end method

.method private checkSupportResponse(Ljava/lang/String;Lcom/squareup/okhttp/Response;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "response"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 322
    # getter for: Lcom/squareup/okhttp/Response;->body:Lcom/squareup/okhttp/ResponseBody;
    invoke-static {p2}, Lcom/squareup/okhttp/Response;->access$1700(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/ResponseBody;

    move-result-object v0

    if-eqz v0, :cond_1f

    .line 323
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".body != null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 324
    :cond_1f
    # getter for: Lcom/squareup/okhttp/Response;->networkResponse:Lcom/squareup/okhttp/Response;
    invoke-static {p2}, Lcom/squareup/okhttp/Response;->access$1800(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    if-eqz v0, :cond_3e

    .line 325
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".networkResponse != null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 326
    :cond_3e
    # getter for: Lcom/squareup/okhttp/Response;->cacheResponse:Lcom/squareup/okhttp/Response;
    invoke-static {p2}, Lcom/squareup/okhttp/Response;->access$1900(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    if-eqz v0, :cond_5d

    .line 327
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".cacheResponse != null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 328
    :cond_5d
    # getter for: Lcom/squareup/okhttp/Response;->priorResponse:Lcom/squareup/okhttp/Response;
    invoke-static {p2}, Lcom/squareup/okhttp/Response;->access$2000(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    if-eqz v0, :cond_7c

    .line 329
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".priorResponse != null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 331
    :cond_7c
    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 289
    iget-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lcom/squareup/okhttp/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 290
    return-object p0
.end method

.method public body(Lcom/squareup/okhttp/ResponseBody;)Lcom/squareup/okhttp/Response$Builder;
    .registers 2
    .param p1, "body"    # Lcom/squareup/okhttp/ResponseBody;

    .prologue
    .line 305
    iput-object p1, p0, Lcom/squareup/okhttp/Response$Builder;->body:Lcom/squareup/okhttp/ResponseBody;

    .line 306
    return-object p0
.end method

.method public build()Lcom/squareup/okhttp/Response;
    .registers 4

    .prologue
    .line 346
    iget-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->request:Lcom/squareup/okhttp/Request;

    if-nez v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "request == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 347
    :cond_c
    iget-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->protocol:Lcom/squareup/okhttp/Protocol;

    if-nez v0, :cond_18

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "protocol == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 348
    :cond_18
    iget v0, p0, Lcom/squareup/okhttp/Response$Builder;->code:I

    if-gez v0, :cond_37

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "code < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/squareup/okhttp/Response$Builder;->code:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 349
    :cond_37
    new-instance v0, Lcom/squareup/okhttp/Response;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/squareup/okhttp/Response;-><init>(Lcom/squareup/okhttp/Response$Builder;Lcom/squareup/okhttp/Response$1;)V

    return-object v0
.end method

.method public cacheResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;
    .registers 3
    .param p1, "cacheResponse"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 316
    if-eqz p1, :cond_7

    const-string v0, "cacheResponse"

    invoke-direct {p0, v0, p1}, Lcom/squareup/okhttp/Response$Builder;->checkSupportResponse(Ljava/lang/String;Lcom/squareup/okhttp/Response;)V

    .line 317
    :cond_7
    iput-object p1, p0, Lcom/squareup/okhttp/Response$Builder;->cacheResponse:Lcom/squareup/okhttp/Response;

    .line 318
    return-object p0
.end method

.method public code(I)Lcom/squareup/okhttp/Response$Builder;
    .registers 2
    .param p1, "code"    # I

    .prologue
    .line 261
    iput p1, p0, Lcom/squareup/okhttp/Response$Builder;->code:I

    .line 262
    return-object p0
.end method

.method public handshake(Lcom/squareup/okhttp/Handshake;)Lcom/squareup/okhttp/Response$Builder;
    .registers 2
    .param p1, "handshake"    # Lcom/squareup/okhttp/Handshake;

    .prologue
    .line 271
    iput-object p1, p0, Lcom/squareup/okhttp/Response$Builder;->handshake:Lcom/squareup/okhttp/Handshake;

    .line 272
    return-object p0
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 280
    iget-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lcom/squareup/okhttp/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 281
    return-object p0
.end method

.method public headers(Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/Response$Builder;
    .registers 3
    .param p1, "headers"    # Lcom/squareup/okhttp/Headers;

    .prologue
    .line 300
    invoke-virtual {p1}, Lcom/squareup/okhttp/Headers;->newBuilder()Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;

    .line 301
    return-object p0
.end method

.method public message(Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 266
    iput-object p1, p0, Lcom/squareup/okhttp/Response$Builder;->message:Ljava/lang/String;

    .line 267
    return-object p0
.end method

.method public networkResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;
    .registers 3
    .param p1, "networkResponse"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 310
    if-eqz p1, :cond_7

    const-string v0, "networkResponse"

    invoke-direct {p0, v0, p1}, Lcom/squareup/okhttp/Response$Builder;->checkSupportResponse(Ljava/lang/String;Lcom/squareup/okhttp/Response;)V

    .line 311
    :cond_7
    iput-object p1, p0, Lcom/squareup/okhttp/Response$Builder;->networkResponse:Lcom/squareup/okhttp/Response;

    .line 312
    return-object p0
.end method

.method public priorResponse(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response$Builder;
    .registers 2
    .param p1, "priorResponse"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 334
    if-eqz p1, :cond_5

    invoke-direct {p0, p1}, Lcom/squareup/okhttp/Response$Builder;->checkPriorResponse(Lcom/squareup/okhttp/Response;)V

    .line 335
    :cond_5
    iput-object p1, p0, Lcom/squareup/okhttp/Response$Builder;->priorResponse:Lcom/squareup/okhttp/Response;

    .line 336
    return-object p0
.end method

.method public protocol(Lcom/squareup/okhttp/Protocol;)Lcom/squareup/okhttp/Response$Builder;
    .registers 2
    .param p1, "protocol"    # Lcom/squareup/okhttp/Protocol;

    .prologue
    .line 256
    iput-object p1, p0, Lcom/squareup/okhttp/Response$Builder;->protocol:Lcom/squareup/okhttp/Protocol;

    .line 257
    return-object p0
.end method

.method public removeHeader(Ljava/lang/String;)Lcom/squareup/okhttp/Response$Builder;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 294
    iget-object v0, p0, Lcom/squareup/okhttp/Response$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;

    invoke-virtual {v0, p1}, Lcom/squareup/okhttp/Headers$Builder;->removeAll(Ljava/lang/String;)Lcom/squareup/okhttp/Headers$Builder;

    .line 295
    return-object p0
.end method

.method public request(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Response$Builder;
    .registers 2
    .param p1, "request"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 251
    iput-object p1, p0, Lcom/squareup/okhttp/Response$Builder;->request:Lcom/squareup/okhttp/Request;

    .line 252
    return-object p0
.end method
