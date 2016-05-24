.class public final Lcom/squareup/okhttp/Response;
.super Ljava/lang/Object;
.source "Response.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/Response$1;,
        Lcom/squareup/okhttp/Response$Builder;
    }
.end annotation


# instance fields
.field private final body:Lcom/squareup/okhttp/ResponseBody;

.field private volatile cacheControl:Lcom/squareup/okhttp/CacheControl;

.field private cacheResponse:Lcom/squareup/okhttp/Response;

.field private final code:I

.field private final handshake:Lcom/squareup/okhttp/Handshake;

.field private final headers:Lcom/squareup/okhttp/Headers;

.field private final message:Ljava/lang/String;

.field private networkResponse:Lcom/squareup/okhttp/Response;

.field private final priorResponse:Lcom/squareup/okhttp/Response;

.field private final protocol:Lcom/squareup/okhttp/Protocol;

.field private final request:Lcom/squareup/okhttp/Request;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/Response$Builder;)V
    .registers 3
    .param p1, "builder"    # Lcom/squareup/okhttp/Response$Builder;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    # getter for: Lcom/squareup/okhttp/Response$Builder;->request:Lcom/squareup/okhttp/Request;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$000(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Request;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->request:Lcom/squareup/okhttp/Request;

    .line 52
    # getter for: Lcom/squareup/okhttp/Response$Builder;->protocol:Lcom/squareup/okhttp/Protocol;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$100(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Protocol;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->protocol:Lcom/squareup/okhttp/Protocol;

    .line 53
    # getter for: Lcom/squareup/okhttp/Response$Builder;->code:I
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$200(Lcom/squareup/okhttp/Response$Builder;)I

    move-result v0

    iput v0, p0, Lcom/squareup/okhttp/Response;->code:I

    .line 54
    # getter for: Lcom/squareup/okhttp/Response$Builder;->message:Ljava/lang/String;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$300(Lcom/squareup/okhttp/Response$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->message:Ljava/lang/String;

    .line 55
    # getter for: Lcom/squareup/okhttp/Response$Builder;->handshake:Lcom/squareup/okhttp/Handshake;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$400(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Handshake;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->handshake:Lcom/squareup/okhttp/Handshake;

    .line 56
    # getter for: Lcom/squareup/okhttp/Response$Builder;->headers:Lcom/squareup/okhttp/Headers$Builder;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$500(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Headers$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/okhttp/Headers$Builder;->build()Lcom/squareup/okhttp/Headers;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->headers:Lcom/squareup/okhttp/Headers;

    .line 57
    # getter for: Lcom/squareup/okhttp/Response$Builder;->body:Lcom/squareup/okhttp/ResponseBody;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$600(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/ResponseBody;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->body:Lcom/squareup/okhttp/ResponseBody;

    .line 58
    # getter for: Lcom/squareup/okhttp/Response$Builder;->networkResponse:Lcom/squareup/okhttp/Response;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$700(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->networkResponse:Lcom/squareup/okhttp/Response;

    .line 59
    # getter for: Lcom/squareup/okhttp/Response$Builder;->cacheResponse:Lcom/squareup/okhttp/Response;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$800(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->cacheResponse:Lcom/squareup/okhttp/Response;

    .line 60
    # getter for: Lcom/squareup/okhttp/Response$Builder;->priorResponse:Lcom/squareup/okhttp/Response;
    invoke-static {p1}, Lcom/squareup/okhttp/Response$Builder;->access$900(Lcom/squareup/okhttp/Response$Builder;)Lcom/squareup/okhttp/Response;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/okhttp/Response;->priorResponse:Lcom/squareup/okhttp/Response;

    .line 61
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/Response$Builder;Lcom/squareup/okhttp/Response$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/squareup/okhttp/Response$Builder;
    .param p2, "x1"    # Lcom/squareup/okhttp/Response$1;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/Response;-><init>(Lcom/squareup/okhttp/Response$Builder;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Request;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->request:Lcom/squareup/okhttp/Request;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Protocol;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->protocol:Lcom/squareup/okhttp/Protocol;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/squareup/okhttp/Response;)I
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 36
    iget v0, p0, Lcom/squareup/okhttp/Response;->code:I

    return v0
.end method

.method static synthetic access$1400(Lcom/squareup/okhttp/Response;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->message:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Handshake;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->handshake:Lcom/squareup/okhttp/Handshake;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Headers;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->headers:Lcom/squareup/okhttp/Headers;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/ResponseBody;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->body:Lcom/squareup/okhttp/ResponseBody;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->networkResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->cacheResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/squareup/okhttp/Response;)Lcom/squareup/okhttp/Response;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Response;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->priorResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method


# virtual methods
.method public body()Lcom/squareup/okhttp/ResponseBody;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->body:Lcom/squareup/okhttp/ResponseBody;

    return-object v0
.end method

.method public cacheControl()Lcom/squareup/okhttp/CacheControl;
    .registers 3

    .prologue
    .line 205
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->cacheControl:Lcom/squareup/okhttp/CacheControl;

    .line 206
    .local v0, "result":Lcom/squareup/okhttp/CacheControl;
    if-eqz v0, :cond_5

    .end local v0    # "result":Lcom/squareup/okhttp/CacheControl;
    :goto_4
    return-object v0

    .restart local v0    # "result":Lcom/squareup/okhttp/CacheControl;
    :cond_5
    iget-object v1, p0, Lcom/squareup/okhttp/Response;->headers:Lcom/squareup/okhttp/Headers;

    invoke-static {v1}, Lcom/squareup/okhttp/CacheControl;->parse(Lcom/squareup/okhttp/Headers;)Lcom/squareup/okhttp/CacheControl;

    move-result-object v0

    .end local v0    # "result":Lcom/squareup/okhttp/CacheControl;
    iput-object v0, p0, Lcom/squareup/okhttp/Response;->cacheControl:Lcom/squareup/okhttp/CacheControl;

    goto :goto_4
.end method

.method public cacheResponse()Lcom/squareup/okhttp/Response;
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->cacheResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method

.method public challenges()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Challenge;",
            ">;"
        }
    .end annotation

    .prologue
    .line 190
    iget v1, p0, Lcom/squareup/okhttp/Response;->code:I

    const/16 v2, 0x191

    if-ne v1, v2, :cond_11

    .line 191
    const-string v0, "WWW-Authenticate"

    .line 197
    .local v0, "responseField":Ljava/lang/String;
    :goto_8
    invoke-virtual {p0}, Lcom/squareup/okhttp/Response;->headers()Lcom/squareup/okhttp/Headers;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/squareup/okhttp/internal/http/OkHeaders;->parseChallenges(Lcom/squareup/okhttp/Headers;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .end local v0    # "responseField":Ljava/lang/String;
    :goto_10
    return-object v1

    .line 192
    :cond_11
    iget v1, p0, Lcom/squareup/okhttp/Response;->code:I

    const/16 v2, 0x197

    if-ne v1, v2, :cond_1a

    .line 193
    const-string v0, "Proxy-Authenticate"

    .restart local v0    # "responseField":Ljava/lang/String;
    goto :goto_8

    .line 195
    .end local v0    # "responseField":Ljava/lang/String;
    :cond_1a
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    goto :goto_10
.end method

.method public code()I
    .registers 2

    .prologue
    .line 88
    iget v0, p0, Lcom/squareup/okhttp/Response;->code:I

    return v0
.end method

.method public handshake()Lcom/squareup/okhttp/Handshake;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->handshake:Lcom/squareup/okhttp/Handshake;

    return-object v0
.end method

.method public header(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 117
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/squareup/okhttp/Response;->header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 121
    iget-object v1, p0, Lcom/squareup/okhttp/Response;->headers:Lcom/squareup/okhttp/Headers;

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "result":Ljava/lang/String;
    if-eqz v0, :cond_9

    .end local v0    # "result":Ljava/lang/String;
    :goto_8
    return-object v0

    .restart local v0    # "result":Ljava/lang/String;
    :cond_9
    move-object v0, p2

    goto :goto_8
.end method

.method public headers()Lcom/squareup/okhttp/Headers;
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->headers:Lcom/squareup/okhttp/Headers;

    return-object v0
.end method

.method public isRedirect()Z
    .registers 2

    .prologue
    .line 139
    iget v0, p0, Lcom/squareup/okhttp/Response;->code:I

    packed-switch v0, :pswitch_data_a

    .line 148
    :pswitch_5
    const/4 v0, 0x0

    :goto_6
    return v0

    .line 146
    :pswitch_7
    const/4 v0, 0x1

    goto :goto_6

    .line 139
    nop

    :pswitch_data_a
    .packed-switch 0x12c
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_7
        :pswitch_7
    .end packed-switch
.end method

.method public message()Ljava/lang/String;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->message:Ljava/lang/String;

    return-object v0
.end method

.method public networkResponse()Lcom/squareup/okhttp/Response;
    .registers 2

    .prologue
    .line 158
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->networkResponse:Lcom/squareup/okhttp/Response;

    return-object v0
.end method

.method public newBuilder()Lcom/squareup/okhttp/Response$Builder;
    .registers 3

    .prologue
    .line 134
    new-instance v0, Lcom/squareup/okhttp/Response$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/squareup/okhttp/Response$Builder;-><init>(Lcom/squareup/okhttp/Response;Lcom/squareup/okhttp/Response$1;)V

    return-object v0
.end method

.method public protocol()Lcom/squareup/okhttp/Protocol;
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->protocol:Lcom/squareup/okhttp/Protocol;

    return-object v0
.end method

.method public request()Lcom/squareup/okhttp/Request;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/squareup/okhttp/Response;->request:Lcom/squareup/okhttp/Request;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 210
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Response{protocol="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/Response;->protocol:Lcom/squareup/okhttp/Protocol;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", code="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/squareup/okhttp/Response;->code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", message="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/Response;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", url="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/squareup/okhttp/Response;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v1}, Lcom/squareup/okhttp/Request;->urlString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
