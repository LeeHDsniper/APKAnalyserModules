.class final Lcom/squareup/okhttp/internal/spdy/IncomingStreamHandler$1;
.super Ljava/lang/Object;
.source "IncomingStreamHandler.java"

# interfaces
.implements Lcom/squareup/okhttp/internal/spdy/IncomingStreamHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/spdy/IncomingStreamHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public receive(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)V
    .registers 3
    .param p1, "stream"    # Lcom/squareup/okhttp/internal/spdy/SpdyStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    sget-object v0, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->REFUSED_STREAM:Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    invoke-virtual {p1, v0}, Lcom/squareup/okhttp/internal/spdy/SpdyStream;->close(Lcom/squareup/okhttp/internal/spdy/ErrorCode;)V

    .line 26
    return-void
.end method
