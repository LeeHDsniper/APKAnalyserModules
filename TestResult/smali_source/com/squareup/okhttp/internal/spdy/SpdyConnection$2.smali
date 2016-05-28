.class Lcom/squareup/okhttp/internal/spdy/SpdyConnection$2;
.super Lcom/squareup/okhttp/internal/NamedRunnable;
.source "SpdyConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->writeWindowUpdateLater(IJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

.field final synthetic val$streamId:I

.field final synthetic val$unacknowledgedBytesRead:J


# direct methods
.method varargs constructor <init>(Lcom/squareup/okhttp/internal/spdy/SpdyConnection;Ljava/lang/String;[Ljava/lang/Object;IJ)V
    .registers 8
    .param p2, "x0"    # Ljava/lang/String;
    .param p3, "x1"    # [Ljava/lang/Object;

    .prologue
    .line 355
    iput-object p1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$2;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    iput p4, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$2;->val$streamId:I

    iput-wide p5, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$2;->val$unacknowledgedBytesRead:J

    invoke-direct {p0, p2, p3}, Lcom/squareup/okhttp/internal/NamedRunnable;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public execute()V
    .registers 5

    .prologue
    .line 358
    :try_start_0
    iget-object v0, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$2;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    iget-object v0, v0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->frameWriter:Lcom/squareup/okhttp/internal/spdy/FrameWriter;

    iget v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$2;->val$streamId:I

    iget-wide v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$2;->val$unacknowledgedBytesRead:J

    invoke-interface {v0, v1, v2, v3}, Lcom/squareup/okhttp/internal/spdy/FrameWriter;->windowUpdate(IJ)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_b} :catch_c

    .line 361
    :goto_b
    return-void

    .line 359
    :catch_c
    move-exception v0

    goto :goto_b
.end method
