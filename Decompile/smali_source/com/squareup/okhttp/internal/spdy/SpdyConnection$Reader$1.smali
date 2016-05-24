.class Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Reader$1;
.super Lcom/squareup/okhttp/internal/NamedRunnable;
.source "SpdyConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Reader;->headers(ZZIILjava/util/List;Lcom/squareup/okhttp/internal/spdy/HeadersMode;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Reader;

.field final synthetic val$newStream:Lcom/squareup/okhttp/internal/spdy/SpdyStream;


# direct methods
.method varargs constructor <init>(Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Reader;Ljava/lang/String;[Ljava/lang/Object;Lcom/squareup/okhttp/internal/spdy/SpdyStream;)V
    .registers 5
    .param p2, "x0"    # Ljava/lang/String;
    .param p3, "x1"    # [Ljava/lang/Object;

    .prologue
    .line 639
    iput-object p1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Reader$1;->this$1:Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Reader;

    iput-object p4, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Reader$1;->val$newStream:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-direct {p0, p2, p3}, Lcom/squareup/okhttp/internal/NamedRunnable;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public execute()V
    .registers 4

    .prologue
    .line 642
    :try_start_0
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Reader$1;->this$1:Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Reader;

    iget-object v1, v1, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Reader;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->handler:Lcom/squareup/okhttp/internal/spdy/IncomingStreamHandler;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->access$1800(Lcom/squareup/okhttp/internal/spdy/SpdyConnection;)Lcom/squareup/okhttp/internal/spdy/IncomingStreamHandler;

    move-result-object v1

    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$Reader$1;->val$newStream:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-interface {v1, v2}, Lcom/squareup/okhttp/internal/spdy/IncomingStreamHandler;->receive(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_d} :catch_e

    .line 646
    return-void

    .line 643
    :catch_e
    move-exception v0

    .line 644
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
