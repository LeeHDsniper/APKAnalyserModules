.class Lcom/squareup/okhttp/internal/spdy/SpdyConnection$4;
.super Lcom/squareup/okhttp/internal/NamedRunnable;
.source "SpdyConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->pushRequestLater(ILjava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

.field final synthetic val$requestHeaders:Ljava/util/List;

.field final synthetic val$streamId:I


# direct methods
.method varargs constructor <init>(Lcom/squareup/okhttp/internal/spdy/SpdyConnection;Ljava/lang/String;[Ljava/lang/Object;ILjava/util/List;)V
    .registers 6
    .param p2, "x0"    # Ljava/lang/String;
    .param p3, "x1"    # [Ljava/lang/Object;

    .prologue
    .line 801
    iput-object p1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$4;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    iput p4, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$4;->val$streamId:I

    iput-object p5, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$4;->val$requestHeaders:Ljava/util/List;

    invoke-direct {p0, p2, p3}, Lcom/squareup/okhttp/internal/NamedRunnable;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public execute()V
    .registers 5

    .prologue
    .line 803
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$4;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->pushObserver:Lcom/squareup/okhttp/internal/spdy/PushObserver;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->access$2500(Lcom/squareup/okhttp/internal/spdy/SpdyConnection;)Lcom/squareup/okhttp/internal/spdy/PushObserver;

    move-result-object v1

    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$4;->val$streamId:I

    iget-object v3, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$4;->val$requestHeaders:Ljava/util/List;

    invoke-interface {v1, v2, v3}, Lcom/squareup/okhttp/internal/spdy/PushObserver;->onRequest(ILjava/util/List;)Z

    move-result v0

    .line 805
    .local v0, "cancel":Z
    if-eqz v0, :cond_2e

    .line 806
    :try_start_10
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$4;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    iget-object v1, v1, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->frameWriter:Lcom/squareup/okhttp/internal/spdy/FrameWriter;

    iget v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$4;->val$streamId:I

    sget-object v3, Lcom/squareup/okhttp/internal/spdy/ErrorCode;->CANCEL:Lcom/squareup/okhttp/internal/spdy/ErrorCode;

    invoke-interface {v1, v2, v3}, Lcom/squareup/okhttp/internal/spdy/FrameWriter;->rstStream(ILcom/squareup/okhttp/internal/spdy/ErrorCode;)V

    .line 807
    iget-object v2, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$4;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    monitor-enter v2
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_1e} :catch_32

    .line 808
    :try_start_1e
    iget-object v1, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$4;->this$0:Lcom/squareup/okhttp/internal/spdy/SpdyConnection;

    # getter for: Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->currentPushRequests:Ljava/util/Set;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/spdy/SpdyConnection;->access$2600(Lcom/squareup/okhttp/internal/spdy/SpdyConnection;)Ljava/util/Set;

    move-result-object v1

    iget v3, p0, Lcom/squareup/okhttp/internal/spdy/SpdyConnection$4;->val$streamId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 809
    monitor-exit v2

    .line 813
    :cond_2e
    :goto_2e
    return-void

    .line 809
    :catchall_2f
    move-exception v1

    monitor-exit v2
    :try_end_31
    .catchall {:try_start_1e .. :try_end_31} :catchall_2f

    :try_start_31
    throw v1
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_32} :catch_32

    .line 811
    :catch_32
    move-exception v1

    goto :goto_2e
.end method
