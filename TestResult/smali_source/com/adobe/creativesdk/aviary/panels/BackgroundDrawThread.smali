.class final Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;
.super Ljava/lang/Thread;
.source "BackgroundDrawThread.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    }
.end annotation


# static fields
.field static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private brushMultiplier:D

.field private filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

.field private handler:Landroid/os/Handler;

.field private mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;

.field private final mLastPoint:Landroid/graphics/PointF;

.field mPreviewBitmap:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private final mQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;",
            ">;"
        }
    .end annotation
.end field

.field private mRegisterStrokeInitParams:Z

.field mSourceBitmap:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private volatile running:Z

.field private singleTapAllowed:Z

.field private started:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 81
    const-string v0, "BackgroundDrawThread"

    sget-object v1, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;Landroid/os/Handler;D)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "priority"    # I
    .param p3, "filter"    # Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
    .param p4, "handler"    # Landroid/os/Handler;
    .param p5, "brushMultiplier"    # D

    .prologue
    .line 96
    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 97
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    .line 98
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mLastPoint:Landroid/graphics/PointF;

    .line 99
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    .line 100
    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->handler:Landroid/os/Handler;

    .line 101
    iput-wide p5, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->brushMultiplier:D

    .line 102
    invoke-virtual {p0, p2}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->setPriority(I)V

    .line 103
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->init()V

    .line 104
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 5

    .prologue
    .line 231
    sget-object v1, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "clear"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 232
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->running:Z

    if-eqz v1, :cond_2f

    .line 233
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    monitor-enter v2

    .line 234
    :cond_e
    :goto_e
    :try_start_e
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->size()I

    move-result v1

    if-lez v1, :cond_2e

    .line 235
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;

    .line 236
    .local v0, "element":Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    if-eqz v0, :cond_e

    .line 237
    sget-object v1, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "end element..."

    invoke-interface {v1, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 238
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->end()V

    goto :goto_e

    .line 241
    .end local v0    # "element":Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    :catchall_2b
    move-exception v1

    monitor-exit v2
    :try_end_2d
    .catchall {:try_start_e .. :try_end_2d} :catchall_2b

    throw v1

    :cond_2e
    :try_start_2e
    monitor-exit v2
    :try_end_2f
    .catchall {:try_start_2e .. :try_end_2f} :catchall_2b

    .line 243
    :cond_2f
    return-void
.end method

.method public finish()V
    .registers 6

    .prologue
    .line 249
    sget-object v1, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "finish"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 250
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->running:Z

    if-eqz v1, :cond_31

    .line 251
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    monitor-enter v2

    .line 252
    :try_start_e
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_14
    :goto_14
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_30

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;

    .line 253
    .local v0, "element":Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    if-eqz v0, :cond_14

    .line 254
    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "end element..."

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 255
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->end()V

    goto :goto_14

    .line 258
    .end local v0    # "element":Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    :catchall_2d
    move-exception v1

    monitor-exit v2
    :try_end_2f
    .catchall {:try_start_e .. :try_end_2f} :catchall_2d

    throw v1

    :cond_30
    :try_start_30
    monitor-exit v2
    :try_end_31
    .catchall {:try_start_30 .. :try_end_31} :catchall_2d

    .line 260
    :cond_31
    return-void
.end method

.method public getQueueSize()I
    .registers 2

    .prologue
    .line 222
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    return v0
.end method

.method public init()V
    .registers 1

    .prologue
    .line 106
    return-void
.end method

.method public isCompleted()Z
    .registers 2

    .prologue
    .line 218
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isInterrupted()Z
    .registers 2

    .prologue
    .line 264
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->running:Z

    if-nez v0, :cond_6

    .line 265
    const/4 v0, 0x1

    .line 267
    :goto_5
    return v0

    :cond_6
    invoke-super {p0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    goto :goto_5
.end method

.method public lineTo([F)V
    .registers 8
    .param p1, "values"    # [F

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 201
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->running:Z

    if-eqz v1, :cond_a

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;

    if-nez v1, :cond_b

    .line 215
    :cond_a
    :goto_a
    return-void

    .line 207
    :cond_b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mLastPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    aget v2, p1, v4

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mLastPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    aget v3, p1, v5

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-static {v1, v2}, Landroid/graphics/PointF;->length(FF)F

    move-result v0

    .line 209
    .local v0, "length":F
    const/high16 v1, 0x41200000

    cmpl-float v1, v0, v1

    if-lez v1, :cond_3a

    .line 210
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mLastPoint:Landroid/graphics/PointF;

    aget v2, p1, v4

    aget v3, p1, v5

    invoke-virtual {v1, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 211
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->add(Ljava/lang/Object;)Z

    goto :goto_a

    .line 213
    :cond_3a
    sget-object v1, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "skipping point, too close... "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_a
.end method

.method public declared-synchronized pathEnd()V
    .registers 5

    .prologue
    .line 170
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->running:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_35

    if-nez v0, :cond_b

    .line 189
    :cond_9
    :goto_9
    monitor-exit p0

    return-void

    .line 174
    :cond_b
    :try_start_b
    sget-object v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "pathEnd"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 176
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->singleTapAllowed:Z

    if-eqz v0, :cond_38

    .line 177
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mLastPoint:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    aput v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mLastPoint:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    aput v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->add(Ljava/lang/Object;)Z

    .line 187
    :goto_2c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->end()V

    .line 188
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    :try_end_34
    .catchall {:try_start_b .. :try_end_34} :catchall_35

    goto :goto_9

    .line 170
    :catchall_35
    move-exception v0

    monitor-exit p0

    throw v0

    .line 179
    :cond_38
    :try_start_38
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mLastPoint:Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->getOriginalPoint()Landroid/graphics/PointF;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/PointF;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_64

    .line 180
    sget-object v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "adding tail"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 181
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mLastPoint:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    aput v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mLastPoint:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    aput v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->add(Ljava/lang/Object;)Z

    goto :goto_2c

    .line 183
    :cond_64
    sget-object v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "skipping tail"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V
    :try_end_6b
    .catchall {:try_start_38 .. :try_end_6b} :catchall_35

    goto :goto_2c
.end method

.method public declared-synchronized pathStart(F[FLcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;)V
    .registers 8
    .param p1, "radius"    # F
    .param p2, "points"    # [F
    .param p3, "brushType"    # Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    .prologue
    .line 152
    monitor-enter p0

    :try_start_1
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->running:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_32

    if-nez v1, :cond_7

    .line 167
    :goto_5
    monitor-exit p0

    return-void

    .line 155
    :cond_7
    :try_start_7
    sget-object v1, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "pathStart"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 157
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;

    if-eqz v1, :cond_1a

    .line 158
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->end()V

    .line 159
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;

    .line 162
    :cond_1a
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mLastPoint:Landroid/graphics/PointF;

    const/4 v2, 0x0

    aget v2, p2, v2

    const/4 v3, 0x1

    aget v3, p2, v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/PointF;->set(FF)V

    .line 164
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;

    invoke-direct {v0, p3, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;-><init>(Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;F[F)V

    .line 165
    .local v0, "queue":Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 166
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    :try_end_31
    .catchall {:try_start_7 .. :try_end_31} :catchall_32

    goto :goto_5

    .line 152
    .end local v0    # "queue":Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    :catchall_32
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized quit()V
    .registers 3

    .prologue
    .line 144
    monitor-enter p0

    :try_start_1
    sget-object v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "quit"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 145
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->started:Z

    .line 146
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->running:Z

    .line 147
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    .line 148
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->interrupt()V
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    .line 149
    monitor-exit p0

    return-void

    .line 144
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public run()V
    .registers 37

    .prologue
    .line 275
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->started:Z

    if-eqz v3, :cond_0

    .line 280
    const/16 v29, 0x0

    .line 283
    .local v29, "s":Z
    const/16 v25, 0x0

    .line 284
    .local v25, "prevPoints":[F
    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    .line 287
    .local v13, "drawRect":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mRegisterStrokeInitParams:Z

    if-eqz v3, :cond_f0

    .line 288
    new-instance v12, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;

    invoke-direct {v12}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;-><init>()V

    .line 293
    .local v12, "strokeResult":Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;
    :goto_1a
    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "thread.start!"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 295
    const/4 v2, 0x0

    .line 297
    .local v2, "current":Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    if-eqz v3, :cond_9f

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_9f

    .line 298
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mSourceBitmap:Ljava/lang/ref/SoftReference;

    if-eqz v3, :cond_9f

    .line 299
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mSourceBitmap:Ljava/lang/ref/SoftReference;

    invoke-virtual {v3}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Landroid/graphics/Bitmap;

    .line 300
    .local v30, "src":Landroid/graphics/Bitmap;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mPreviewBitmap:Ljava/lang/ref/SoftReference;

    if-eqz v3, :cond_f3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mPreviewBitmap:Ljava/lang/ref/SoftReference;

    invoke-virtual {v3}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/Bitmap;

    move-object v14, v3

    .line 301
    .local v14, "dst":Landroid/graphics/Bitmap;
    :goto_4f
    if-eqz v30, :cond_9f

    .line 302
    invoke-virtual/range {v30 .. v30}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v3

    if-nez v3, :cond_9f

    if-eqz v14, :cond_5f

    invoke-virtual {v14}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v3

    if-nez v3, :cond_9f

    .line 303
    :cond_5f
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    move-object/from16 v0, v30

    invoke-virtual {v3, v0, v14}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->init(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)I

    .line 304
    if-eqz v14, :cond_f6

    .line 305
    move-object v2, v14

    .line 309
    :cond_6b
    :goto_6b
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    if-eqz v3, :cond_7e

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_7e

    .line 310
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->renderPreview()Z

    .line 312
    :cond_7e
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->handler:Landroid/os/Handler;

    if-eqz v3, :cond_9f

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_9f

    .line 313
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/Moa;->notifyPixelsChanged(Landroid/graphics/Bitmap;)V

    .line 314
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->handler:Landroid/os/Handler;

    const/16 v4, 0x3eb

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 315
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->handler:Landroid/os/Handler;

    const/16 v4, 0x3e8

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 322
    .end local v14    # "dst":Landroid/graphics/Bitmap;
    .end local v30    # "src":Landroid/graphics/Bitmap;
    :cond_9f
    :goto_9f
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_b2

    .line 323
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isInterrupted()Z

    move-result v3

    if-eqz v3, :cond_fc

    .line 324
    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "isInterrupted:true"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 484
    :cond_b2
    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "exiting while isInterrupted: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isInterrupted()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 486
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->handler:Landroid/os/Handler;

    if-eqz v3, :cond_e3

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_e3

    .line 487
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->handler:Landroid/os/Handler;

    const/16 v4, 0x3ea

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 490
    :cond_e3
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->handler:Landroid/os/Handler;

    .line 492
    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "exiting thread..."

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 493
    return-void

    .line 290
    .end local v2    # "current":Landroid/graphics/Bitmap;
    .end local v12    # "strokeResult":Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;
    :cond_f0
    const/4 v12, 0x0

    .restart local v12    # "strokeResult":Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;
    goto/16 :goto_1a

    .line 300
    .restart local v2    # "current":Landroid/graphics/Bitmap;
    .restart local v30    # "src":Landroid/graphics/Bitmap;
    :cond_f3
    const/4 v14, 0x0

    goto/16 :goto_4f

    .line 306
    .restart local v14    # "dst":Landroid/graphics/Bitmap;
    :cond_f6
    if-eqz v30, :cond_6b

    .line 307
    move-object/from16 v2, v30

    goto/16 :goto_6b

    .line 327
    .end local v14    # "dst":Landroid/graphics/Bitmap;
    .end local v30    # "src":Landroid/graphics/Bitmap;
    :cond_fc
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->size()I

    move-result v3

    if-lez v3, :cond_45e

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_45e

    .line 328
    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "queue.size: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v5}, Ljava/util/Queue;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 329
    if-nez v29, :cond_13f

    .line 330
    const/16 v29, 0x1

    .line 331
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->handler:Landroid/os/Handler;

    if-eqz v3, :cond_13f

    .line 332
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->handler:Landroid/os/Handler;

    const/16 v4, 0x3e9

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 335
    :cond_13f
    const/16 v16, 0x1

    .line 336
    .local v16, "firstPoint":Z
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->element()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;

    .line 337
    .local v15, "element":Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    if-nez v15, :cond_156

    .line 338
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    goto/16 :goto_9f

    .line 341
    :cond_156
    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->getRadius()F

    move-result v28

    .line 342
    .local v28, "radius":F
    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "radius: %.2f"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static/range {v28 .. v28}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 343
    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->getMode()Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    move-result-object v21

    .line 344
    .local v21, "mode":Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;
    new-instance v31, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;

    move/from16 v0, v28

    float-to-double v4, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;-><init>(Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;D)V

    .line 345
    .local v31, "strokeData":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;
    new-instance v22, Ljava/util/ArrayList;

    invoke-direct/range {v22 .. v22}, Ljava/util/ArrayList;-><init>()V

    .line 346
    .local v22, "path":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    const/4 v8, 0x0

    .line 347
    .local v8, "pathIndex":I
    :cond_181
    :goto_181
    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->size()I

    move-result v3

    if-gtz v3, :cond_18d

    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->isCompleted()Z

    move-result v3

    if-nez v3, :cond_193

    .line 348
    :cond_18d
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isInterrupted()Z

    move-result v3

    if-eqz v3, :cond_1b1

    .line 469
    :cond_193
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    if-eqz v3, :cond_1a8

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_1a8

    .line 470
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    move-object/from16 v0, v31

    invoke-virtual {v3, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->addStrokeData(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;)V

    .line 472
    :cond_1a8
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    goto/16 :goto_9f

    .line 351
    :cond_1b1
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    if-eqz v3, :cond_193

    .line 354
    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->poll()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, [F

    .line 355
    .local v24, "points":[F
    if-eqz v24, :cond_181

    .line 358
    if-eqz v16, :cond_28f

    .line 359
    const/16 v16, 0x0

    .line 360
    const/4 v3, 0x0

    aget v3, v24, v3

    float-to-double v4, v3

    move/from16 v0, v28

    float-to-double v6, v0

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->brushMultiplier:D

    mul-double/2addr v6, v10

    sub-double/2addr v4, v6

    double-to-int v3, v4

    const/4 v4, 0x1

    aget v4, v24, v4

    float-to-double v4, v4

    move/from16 v0, v28

    float-to-double v6, v0

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->brushMultiplier:D

    mul-double/2addr v6, v10

    sub-double/2addr v4, v6

    double-to-int v4, v4

    const/4 v5, 0x0

    aget v5, v24, v5

    float-to-double v6, v5

    move/from16 v0, v28

    float-to-double v10, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->brushMultiplier:D

    move-wide/from16 v34, v0

    mul-double v10, v10, v34

    add-double/2addr v6, v10

    double-to-int v5, v6

    const/4 v6, 0x1

    aget v6, v24, v6

    float-to-double v6, v6

    move/from16 v0, v28

    float-to-double v10, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->brushMultiplier:D

    move-wide/from16 v34, v0

    mul-double v10, v10, v34

    add-double/2addr v6, v10

    double-to-int v6, v6

    invoke-virtual {v13, v3, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 365
    move-object/from16 v0, v31

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->addPoint([F)V

    .line 366
    const/4 v3, 0x0

    aget v3, v24, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    move-object/from16 v0, v22

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 367
    const/4 v3, 0x1

    aget v3, v24, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    move-object/from16 v0, v22

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 368
    const/16 v23, 0x2

    .line 370
    .end local v8    # "pathIndex":I
    .local v23, "pathIndex":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    if-eqz v3, :cond_271

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_271

    .line 371
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->setBrushMode(Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;)Z

    .line 372
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    move/from16 v0, v28

    float-to-double v4, v0

    const-wide/16 v6, 0x0

    invoke-virtual {v13}, Landroid/graphics/Rect;->centerX()I

    move-result v9

    int-to-double v8, v9

    invoke-virtual {v13}, Landroid/graphics/Rect;->centerY()I

    move-result v10

    int-to-double v10, v10

    invoke-virtual/range {v3 .. v12}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->drawStart(DDDDLcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;)Z

    .line 374
    if-eqz v12, :cond_264

    .line 375
    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "strokeResult: %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v12, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 376
    move-object/from16 v0, v31

    invoke-virtual {v0, v12}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->setInitParams(Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;)V

    .line 379
    :cond_264
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    if-eqz v3, :cond_271

    .line 380
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    invoke-virtual {v3, v13}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->renderPreview(Landroid/graphics/Rect;)Z

    .line 384
    :cond_271
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->handler:Landroid/os/Handler;

    if-eqz v3, :cond_479

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_479

    .line 385
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/Moa;->notifyPixelsChanged(Landroid/graphics/Bitmap;)V

    .line 386
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->handler:Landroid/os/Handler;

    const/16 v4, 0x3eb

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    move/from16 v8, v23

    .line 465
    .end local v23    # "pathIndex":I
    .restart local v8    # "pathIndex":I
    :cond_28b
    :goto_28b
    move-object/from16 v25, v24

    goto/16 :goto_181

    .line 391
    :cond_28f
    if-eqz v25, :cond_181

    .line 395
    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "path.size: %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-interface/range {v22 .. v22}, Ljava/util/List;->size()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 396
    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "element.iscompleted: %b"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->isCompleted()Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 397
    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "element.size: %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->size()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 399
    const/16 v17, 0x0

    .line 401
    .local v17, "incrementIndex":I
    invoke-interface/range {v22 .. v22}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_435

    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->isCompleted()Z

    move-result v3

    if-eqz v3, :cond_435

    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->size()I

    move-result v3

    if-nez v3, :cond_435

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->singleTapAllowed:Z

    if-eqz v3, :cond_435

    .line 403
    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "single tap!"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 405
    invoke-interface/range {v22 .. v22}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    move-object/from16 v0, v22

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v26

    .line 406
    .local v26, "px":F
    invoke-interface/range {v22 .. v22}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    move-object/from16 v0, v22

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v27

    .line 408
    .local v27, "py":F
    const/4 v3, 0x0

    aget v3, v24, v3

    cmpl-float v3, v26, v3

    if-nez v3, :cond_324

    const/4 v3, 0x1

    aget v3, v24, v3

    cmpl-float v3, v27, v3

    if-eqz v3, :cond_42c

    .line 409
    :cond_324
    const/4 v3, 0x0

    aget v3, v24, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    move-object/from16 v0, v22

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 410
    const/4 v3, 0x1

    aget v3, v24, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    move-object/from16 v0, v22

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 411
    const/4 v3, 0x0

    aget v3, v24, v3

    const/4 v4, 0x1

    aget v4, v24, v4

    move-object/from16 v0, v31

    invoke-virtual {v0, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->addPoint(FF)V

    .line 412
    const/16 v17, 0x2

    .line 423
    .end local v26    # "px":F
    .end local v27    # "py":F
    :goto_349
    const/4 v3, 0x0

    aget v3, v25, v3

    float-to-int v0, v3

    move/from16 v19, v0

    .line 424
    .local v19, "left1":I
    const/4 v3, 0x0

    aget v3, v24, v3

    float-to-int v0, v3

    move/from16 v20, v0

    .line 426
    .local v20, "left2":I
    const/4 v3, 0x1

    aget v3, v25, v3

    float-to-int v0, v3

    move/from16 v32, v0

    .line 427
    .local v32, "top1":I
    const/4 v3, 0x1

    aget v3, v24, v3

    float-to-int v0, v3

    move/from16 v33, v0

    .line 429
    .local v33, "top2":I
    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-static/range {v32 .. v33}, Ljava/lang/Math;->max(II)I

    move-result v6

    invoke-virtual {v13, v3, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 430
    invoke-virtual {v13}, Landroid/graphics/Rect;->sort()V

    .line 431
    move/from16 v0, v28

    float-to-double v4, v0

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->brushMultiplier:D

    mul-double/2addr v4, v6

    double-to-int v3, v4

    neg-int v3, v3

    move/from16 v0, v28

    float-to-double v4, v0

    move-object/from16 v0, p0

    iget-wide v6, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->brushMultiplier:D

    mul-double/2addr v4, v6

    double-to-int v4, v4

    neg-int v4, v4

    invoke-virtual {v13, v3, v4}, Landroid/graphics/Rect;->inset(II)V

    .line 433
    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->isCompleted()Z

    move-result v3

    if-eqz v3, :cond_3be

    .line 434
    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "size: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", empty: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->isEmpty()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 437
    :cond_3be
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    if-eqz v3, :cond_410

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_410

    .line 439
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    move/from16 v0, v28

    float-to-double v4, v0

    const-wide/16 v6, 0x0

    .line 443
    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->isCompleted()Z

    move-result v9

    if-eqz v9, :cond_45c

    invoke-virtual {v15}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_45c

    const/4 v9, 0x1

    .line 444
    :goto_3e0
    invoke-static/range {v22 .. v22}, Lcom/adobe/creativesdk/aviary/internal/utils/ArrayUtils;->toPrimitive(Ljava/util/List;)[F

    move-result-object v10

    .line 439
    invoke-virtual/range {v3 .. v10}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->draw(DDIZ[F)[F

    move-result-object v18

    .line 446
    .local v18, "invalidationPoints":[F
    if-eqz v18, :cond_403

    move-object/from16 v0, v18

    array-length v3, v0

    const/4 v4, 0x4

    if-ne v3, v4, :cond_403

    .line 447
    const/4 v3, 0x0

    aget v3, v18, v3

    float-to-int v3, v3

    const/4 v4, 0x1

    aget v4, v18, v4

    float-to-int v4, v4

    const/4 v5, 0x2

    aget v5, v18, v5

    float-to-int v5, v5

    const/4 v6, 0x3

    aget v6, v18, v6

    float-to-int v6, v6

    invoke-virtual {v13, v3, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 453
    :cond_403
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    if-eqz v3, :cond_410

    .line 454
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->filter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    invoke-virtual {v3, v13}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->renderPreview(Landroid/graphics/Rect;)Z

    .line 458
    .end local v18    # "invalidationPoints":[F
    :cond_410
    add-int v8, v8, v17

    .line 460
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->handler:Landroid/os/Handler;

    if-eqz v3, :cond_28b

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_28b

    .line 461
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/Moa;->notifyPixelsChanged(Landroid/graphics/Bitmap;)V

    .line 462
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->handler:Landroid/os/Handler;

    const/16 v4, 0x3eb

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto/16 :goto_28b

    .line 414
    .end local v19    # "left1":I
    .end local v20    # "left2":I
    .end local v32    # "top1":I
    .end local v33    # "top2":I
    .restart local v26    # "px":F
    .restart local v27    # "py":F
    :cond_42c
    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "dont add more points.."

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto/16 :goto_349

    .line 417
    .end local v26    # "px":F
    .end local v27    # "py":F
    :cond_435
    const/4 v3, 0x0

    aget v3, v24, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    move-object/from16 v0, v22

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 418
    const/4 v3, 0x1

    aget v3, v24, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    move-object/from16 v0, v22

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 419
    const/4 v3, 0x0

    aget v3, v24, v3

    const/4 v4, 0x1

    aget v4, v24, v4

    move-object/from16 v0, v31

    invoke-virtual {v0, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;->addPoint(FF)V

    .line 420
    const/16 v17, 0x2

    goto/16 :goto_349

    .line 443
    .restart local v19    # "left1":I
    .restart local v20    # "left2":I
    .restart local v32    # "top1":I
    .restart local v33    # "top2":I
    :cond_45c
    const/4 v9, 0x0

    goto :goto_3e0

    .line 475
    .end local v8    # "pathIndex":I
    .end local v15    # "element":Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    .end local v16    # "firstPoint":Z
    .end local v17    # "incrementIndex":I
    .end local v19    # "left1":I
    .end local v20    # "left2":I
    .end local v21    # "mode":Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;
    .end local v22    # "path":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .end local v24    # "points":[F
    .end local v28    # "radius":F
    .end local v31    # "strokeData":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;
    .end local v32    # "top1":I
    .end local v33    # "top2":I
    :cond_45e
    if-eqz v29, :cond_9f

    .line 476
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->handler:Landroid/os/Handler;

    if-eqz v3, :cond_475

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_475

    .line 477
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->handler:Landroid/os/Handler;

    const/16 v4, 0x3ea

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 479
    :cond_475
    const/16 v29, 0x0

    goto/16 :goto_9f

    .restart local v15    # "element":Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread$DrawQueue;
    .restart local v16    # "firstPoint":Z
    .restart local v21    # "mode":Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;
    .restart local v22    # "path":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Float;>;"
    .restart local v23    # "pathIndex":I
    .restart local v24    # "points":[F
    .restart local v28    # "radius":F
    .restart local v31    # "strokeData":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;
    :cond_479
    move/from16 v8, v23

    .end local v23    # "pathIndex":I
    .restart local v8    # "pathIndex":I
    goto/16 :goto_28b
.end method

.method public setRegisterStrokeInitParams(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 117
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mRegisterStrokeInitParams:Z

    .line 118
    return-void
.end method

.method public declared-synchronized setSingleTapAllowed(Z)V
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 109
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->singleTapAllowed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 110
    monitor-exit p0

    return-void

    .line 109
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized start(Landroid/graphics/Bitmap;)V
    .registers 4
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 133
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->started:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_1f

    if-eqz v0, :cond_7

    .line 141
    :goto_5
    monitor-exit p0

    return-void

    .line 136
    :cond_7
    :try_start_7
    sget-object v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "start"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 137
    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mSourceBitmap:Ljava/lang/ref/SoftReference;

    .line 138
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->started:Z

    .line 139
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->running:Z

    .line 140
    invoke-super {p0}, Ljava/lang/Thread;->start()V
    :try_end_1e
    .catchall {:try_start_7 .. :try_end_1e} :catchall_1f

    goto :goto_5

    .line 133
    :catchall_1f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized start(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .registers 5
    .param p1, "src"    # Landroid/graphics/Bitmap;
    .param p2, "preview"    # Landroid/graphics/Bitmap;

    .prologue
    .line 121
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->started:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_26

    if-eqz v0, :cond_7

    .line 130
    :goto_5
    monitor-exit p0

    return-void

    .line 124
    :cond_7
    :try_start_7
    sget-object v0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "start"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 125
    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mSourceBitmap:Ljava/lang/ref/SoftReference;

    .line 126
    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->mPreviewBitmap:Ljava/lang/ref/SoftReference;

    .line 127
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->started:Z

    .line 128
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/BackgroundDrawThread;->running:Z

    .line 129
    invoke-super {p0}, Ljava/lang/Thread;->start()V
    :try_end_25
    .catchall {:try_start_7 .. :try_end_25} :catchall_26

    goto :goto_5

    .line 121
    :catchall_26
    move-exception v0

    monitor-exit p0

    throw v0
.end method
