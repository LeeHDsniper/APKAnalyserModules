.class Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;
.super Ljava/io/FilterOutputStream;
.source "CustomHttpEntityWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/util/CustomHttpEntityWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CustomFilterOutputStream"
.end annotation


# instance fields
.field private final customHttpEntityWrapperCallback:Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;

.field final synthetic this$0:Lcom/behance/sdk/util/CustomHttpEntityWrapper;

.field private totalBytesLength:J

.field private transferredBytesLength:J


# direct methods
.method constructor <init>(Lcom/behance/sdk/util/CustomHttpEntityWrapper;Ljava/io/OutputStream;Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;J)V
    .registers 8
    .param p2, "out"    # Ljava/io/OutputStream;
    .param p3, "customHttpEntityWrapperCallback"    # Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;
    .param p4, "totalBytesLength"    # J

    .prologue
    .line 40
    iput-object p1, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;->this$0:Lcom/behance/sdk/util/CustomHttpEntityWrapper;

    .line 41
    invoke-direct {p0, p2}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 42
    iput-object p3, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;->customHttpEntityWrapperCallback:Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;

    .line 43
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;->transferredBytesLength:J

    .line 44
    iput-wide p4, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;->totalBytesLength:J

    .line 45
    return-void
.end method

.method private notifyUploadProgress()V
    .registers 5

    .prologue
    .line 62
    iget-wide v2, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;->transferredBytesLength:J

    long-to-float v1, v2

    iget-wide v2, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;->totalBytesLength:J

    long-to-float v2, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x42c80000

    mul-float v0, v1, v2

    .line 63
    .local v0, "progressPercentage":F
    iget-object v1, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;->customHttpEntityWrapperCallback:Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;

    if-eqz v1, :cond_14

    .line 64
    iget-object v1, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;->customHttpEntityWrapperCallback:Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;

    invoke-interface {v1, v0}, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;->onUploadProgressUpdate(F)V

    .line 66
    :cond_14
    return-void
.end method


# virtual methods
.method public write(I)V
    .registers 6
    .param p1, "oneByte"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    invoke-super {p0, p1}, Ljava/io/FilterOutputStream;->write(I)V

    .line 57
    iget-wide v0, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;->transferredBytesLength:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;->transferredBytesLength:J

    .line 58
    invoke-direct {p0}, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;->notifyUploadProgress()V

    .line 59
    return-void
.end method

.method public write([BII)V
    .registers 8
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    invoke-super {p0, p1, p2, p3}, Ljava/io/FilterOutputStream;->write([BII)V

    .line 50
    iget-wide v0, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;->transferredBytesLength:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;->transferredBytesLength:J

    .line 51
    invoke-direct {p0}, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;->notifyUploadProgress()V

    .line 52
    return-void
.end method
