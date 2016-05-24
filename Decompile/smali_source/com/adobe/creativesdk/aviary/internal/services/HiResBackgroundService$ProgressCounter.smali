.class Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;
.super Ljava/lang/Object;
.source "HiResBackgroundService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ProgressCounter"
.end annotation


# instance fields
.field private id:J

.field index:I

.field total:I


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->id:J

    .line 55
    iput v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->index:I

    .line 56
    iput v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->total:I

    .line 57
    return-void
.end method


# virtual methods
.method public getId()J
    .registers 3

    .prologue
    .line 68
    monitor-enter p0

    .line 69
    :try_start_1
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->id:J

    monitor-exit p0

    return-wide v0

    .line 70
    :catchall_5
    move-exception v0

    monitor-exit p0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_5

    throw v0
.end method

.method public reset()V
    .registers 5

    .prologue
    .line 60
    monitor-enter p0

    .line 61
    :try_start_1
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->id:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->id:J

    .line 62
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->index:I

    .line 63
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->total:I

    .line 64
    monitor-exit p0

    .line 65
    return-void

    .line 64
    :catchall_10
    move-exception v0

    monitor-exit p0
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_10

    throw v0
.end method

.method toBundle(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "out"    # Landroid/os/Bundle;

    .prologue
    .line 74
    const-string v0, "counter_id"

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->id:J

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 75
    const-string v0, "counter_index"

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->index:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 76
    const-string v0, "counter_total"

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->total:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 77
    return-void
.end method
