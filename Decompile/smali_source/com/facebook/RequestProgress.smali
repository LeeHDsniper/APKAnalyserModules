.class Lcom/facebook/RequestProgress;
.super Ljava/lang/Object;
.source "RequestProgress.java"


# instance fields
.field private final callbackHandler:Landroid/os/Handler;

.field private lastReportedProgress:J

.field private maxProgress:J

.field private progress:J

.field private final request:Lcom/facebook/Request;

.field private final threshold:J


# direct methods
.method constructor <init>(Landroid/os/Handler;Lcom/facebook/Request;)V
    .registers 5
    .param p1, "callbackHandler"    # Landroid/os/Handler;
    .param p2, "request"    # Lcom/facebook/Request;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p2, p0, Lcom/facebook/RequestProgress;->request:Lcom/facebook/Request;

    .line 30
    iput-object p1, p0, Lcom/facebook/RequestProgress;->callbackHandler:Landroid/os/Handler;

    .line 32
    invoke-static {}, Lcom/facebook/Settings;->getOnProgressThreshold()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/facebook/RequestProgress;->threshold:J

    .line 33
    return-void
.end method


# virtual methods
.method addProgress(J)V
    .registers 10
    .param p1, "size"    # J

    .prologue
    .line 44
    iget-wide v0, p0, Lcom/facebook/RequestProgress;->progress:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/facebook/RequestProgress;->progress:J

    .line 46
    iget-wide v0, p0, Lcom/facebook/RequestProgress;->progress:J

    iget-wide v2, p0, Lcom/facebook/RequestProgress;->lastReportedProgress:J

    iget-wide v4, p0, Lcom/facebook/RequestProgress;->threshold:J

    add-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-gez v0, :cond_18

    iget-wide v0, p0, Lcom/facebook/RequestProgress;->progress:J

    iget-wide v2, p0, Lcom/facebook/RequestProgress;->maxProgress:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1b

    .line 47
    :cond_18
    invoke-virtual {p0}, Lcom/facebook/RequestProgress;->reportProgress()V

    .line 49
    :cond_1b
    return-void
.end method

.method addToMax(J)V
    .registers 6
    .param p1, "size"    # J

    .prologue
    .line 52
    iget-wide v0, p0, Lcom/facebook/RequestProgress;->maxProgress:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/facebook/RequestProgress;->maxProgress:J

    .line 53
    return-void
.end method

.method reportProgress()V
    .registers 13

    .prologue
    .line 56
    iget-wide v8, p0, Lcom/facebook/RequestProgress;->progress:J

    iget-wide v10, p0, Lcom/facebook/RequestProgress;->lastReportedProgress:J

    cmp-long v1, v8, v10

    if-lez v1, :cond_2c

    .line 57
    iget-object v1, p0, Lcom/facebook/RequestProgress;->request:Lcom/facebook/Request;

    invoke-virtual {v1}, Lcom/facebook/Request;->getCallback()Lcom/facebook/Request$Callback;

    move-result-object v0

    .line 58
    .local v0, "callback":Lcom/facebook/Request$Callback;
    iget-wide v8, p0, Lcom/facebook/RequestProgress;->maxProgress:J

    const-wide/16 v10, 0x0

    cmp-long v1, v8, v10

    if-lez v1, :cond_2c

    instance-of v1, v0, Lcom/facebook/Request$OnProgressCallback;

    if-eqz v1, :cond_2c

    .line 60
    iget-wide v4, p0, Lcom/facebook/RequestProgress;->progress:J

    .line 61
    .local v4, "currentCopy":J
    iget-wide v6, p0, Lcom/facebook/RequestProgress;->maxProgress:J

    .local v6, "maxProgressCopy":J
    move-object v3, v0

    .line 62
    check-cast v3, Lcom/facebook/Request$OnProgressCallback;

    .line 63
    .local v3, "callbackCopy":Lcom/facebook/Request$OnProgressCallback;
    iget-object v1, p0, Lcom/facebook/RequestProgress;->callbackHandler:Landroid/os/Handler;

    if-nez v1, :cond_2d

    .line 64
    invoke-interface {v3, v4, v5, v6, v7}, Lcom/facebook/Request$OnProgressCallback;->onProgress(JJ)V

    .line 74
    :goto_28
    iget-wide v8, p0, Lcom/facebook/RequestProgress;->progress:J

    iput-wide v8, p0, Lcom/facebook/RequestProgress;->lastReportedProgress:J

    .line 77
    .end local v0    # "callback":Lcom/facebook/Request$Callback;
    .end local v3    # "callbackCopy":Lcom/facebook/Request$OnProgressCallback;
    .end local v4    # "currentCopy":J
    .end local v6    # "maxProgressCopy":J
    :cond_2c
    return-void

    .line 67
    .restart local v0    # "callback":Lcom/facebook/Request$Callback;
    .restart local v3    # "callbackCopy":Lcom/facebook/Request$OnProgressCallback;
    .restart local v4    # "currentCopy":J
    .restart local v6    # "maxProgressCopy":J
    :cond_2d
    iget-object v8, p0, Lcom/facebook/RequestProgress;->callbackHandler:Landroid/os/Handler;

    new-instance v1, Lcom/facebook/RequestProgress$1;

    move-object v2, p0

    invoke-direct/range {v1 .. v7}, Lcom/facebook/RequestProgress$1;-><init>(Lcom/facebook/RequestProgress;Lcom/facebook/Request$OnProgressCallback;JJ)V

    invoke-virtual {v8, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_28
.end method
