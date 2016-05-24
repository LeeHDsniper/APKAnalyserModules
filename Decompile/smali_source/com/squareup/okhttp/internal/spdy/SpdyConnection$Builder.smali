.class public Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;
.super Ljava/lang/Object;
.source "SpdyConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private client:Z

.field private handler:Lcom/squareup/okhttp/internal/spdy/IncomingStreamHandler;

.field private hostName:Ljava/lang/String;

.field private protocol:Lcom/squareup/okhttp/Protocol;

.field private pushObserver:Lcom/squareup/okhttp/internal/spdy/PushObserver;

.field private socket:Ljava/net/Socket;


# direct methods
.method public constructor <init>(Ljava/lang/String;ZLjava/net/Socket;)V
    .registers 5
    .param p1, "hostName"    # Ljava/lang/String;
    .param p2, "client"    # Z
    .param p3, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 529
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 516
    sget-object v0, Lcom/squareup/okhttp/internal/spdy/IncomingStreamHandler;->REFUSE_INCOMING_STREAMS:Lcom/squareup/okhttp/internal/spdy/IncomingStreamHandler;

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;->handler:Lcom/squareup/okhttp/internal/spdy/IncomingStreamHandler;

    .line 517
    sget-object v0, Lcom/squareup/okhttp/Protocol;->SPDY_3:Lcom/squareup/okhttp/Protocol;

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;->protocol:Lcom/squareup/okhttp/Protocol;

    .line 518
    sget-object v0, Lcom/squareup/okhttp/internal/spdy/PushObserver;->CANCEL:Lcom/squareup/okhttp/internal/spdy/PushObserver;

    iput-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;->pushObserver:Lcom/squareup/okhttp/internal/spdy/PushObserver;

    .line 530
    iput-object p1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;->hostName:Ljava/lang/String;

    .line 531
    iput-boolean p2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;->client:Z

    .line 532
    iput-object p3, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;->socket:Ljava/net/Socket;

    .line 533
    return-void
.end method

.method static synthetic access$000(Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;)Lcom/squareup/okhttp/Protocol;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;

    .prologue
    .line 513
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;->protocol:Lcom/squareup/okhttp/Protocol;

    return-object v0
.end method

.method static synthetic access$100(Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;)Lcom/squareup/okhttp/internal/spdy/PushObserver;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;

    .prologue
    .line 513
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;->pushObserver:Lcom/squareup/okhttp/internal/spdy/PushObserver;

    return-object v0
.end method

.method static synthetic access$200(Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;

    .prologue
    .line 513
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;->client:Z

    return v0
.end method

.method static synthetic access$300(Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;)Lcom/squareup/okhttp/internal/spdy/IncomingStreamHandler;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;

    .prologue
    .line 513
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;->handler:Lcom/squareup/okhttp/internal/spdy/IncomingStreamHandler;

    return-object v0
.end method

.method static synthetic access$400(Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;

    .prologue
    .line 513
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;->hostName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;)Ljava/net/Socket;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;

    .prologue
    .line 513
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;->socket:Ljava/net/Socket;

    return-object v0
.end method


# virtual methods
.method public build()Lcom/squareup/okhttp/internal/spdy/SpdyConnection;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 551
    new-instance v0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;-><init>(Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;Lcom/squareup/okhttp/internal/spdy/SpdyConnection$1;)V

    return-object v0
.end method

.method public protocol(Lcom/squareup/okhttp/Protocol;)Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;
    .registers 2
    .param p1, "protocol"    # Lcom/squareup/okhttp/Protocol;

    .prologue
    .line 541
    iput-object p1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Builder;->protocol:Lcom/squareup/okhttp/Protocol;

    .line 542
    return-object p0
.end method
