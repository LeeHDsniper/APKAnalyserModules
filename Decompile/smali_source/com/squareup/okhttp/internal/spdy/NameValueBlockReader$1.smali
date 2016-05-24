.class Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader$1;
.super Lokio/ForwardingSource;
.source "NameValueBlockReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;-><init>(Lokio/BufferedSource;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;Lokio/Source;)V
    .registers 3
    .param p2, "x0"    # Lokio/Source;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader$1;->this$0:Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;

    invoke-direct {p0, p2}, Lokio/ForwardingSource;-><init>(Lokio/Source;)V

    return-void
.end method


# virtual methods
.method public read(Lokio/Buffer;J)J
    .registers 10
    .param p1, "sink"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v2, -0x1

    .line 56
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader$1;->this$0:Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;

    # getter for: Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;->compressedLimit:I
    invoke-static {v4}, Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;->access$000(Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;)I

    move-result v4

    if-nez v4, :cond_c

    move-wide v0, v2

    .line 60
    :goto_b
    return-wide v0

    .line 57
    :cond_c
    iget-object v4, p0, Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader$1;->this$0:Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;

    # getter for: Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;->compressedLimit:I
    invoke-static {v4}, Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;->access$000(Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;)I

    move-result v4

    int-to-long v4, v4

    invoke-static {p2, p3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    invoke-super {p0, p1, v4, v5}, Lokio/ForwardingSource;->read(Lokio/Buffer;J)J

    move-result-wide v0

    .line 58
    .local v0, "read":J
    cmp-long v4, v0, v2

    if-nez v4, :cond_21

    move-wide v0, v2

    goto :goto_b

    .line 59
    :cond_21
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader$1;->this$0:Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;

    # -= operator for: Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;->compressedLimit:I
    invoke-static {v2, v0, v1}, Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;->access$022(Lcom/squareup/okhttp/internal/spdy/NameValueBlockReader;J)I

    goto :goto_b
.end method
