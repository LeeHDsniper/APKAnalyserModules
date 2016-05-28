.class Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;
.super Lokio/AsyncTimeout;
.source "SpdyStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/spdy/SpdyStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SpdyTimeout"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)V
    .registers 2

    .prologue
    .line 567
    iput-object p1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    invoke-direct {p0}, Lokio/AsyncTimeout;-><init>()V

    return-void
.end method


# virtual methods
.method public exitAndThrowIfTimedOut()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InterruptedIOException;
        }
    .end annotation

    .prologue
    .line 573
    invoke-virtual {p0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;->exit()Z

    move-result v0

    if-eqz v0, :cond_e

    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v1, "timeout"

    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 574
    :cond_e
    return-void
.end method

.method protected timedOut()V
    .registers 3

    .prologue
    .line 569
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyStream;

    sget-object v1, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->CANCEL:Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->closeLater(Lcom/squareup/okhttp/internal/spdy/ErrorCode;)V

    .line 570
    return-void
.end method
