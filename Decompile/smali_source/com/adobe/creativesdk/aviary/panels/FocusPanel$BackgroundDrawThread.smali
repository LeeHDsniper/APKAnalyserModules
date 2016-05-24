.class Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;
.super Ljava/lang/Thread;
.source "FocusPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/FocusPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BackgroundDrawThread"
.end annotation


# instance fields
.field mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;

.field final mQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;",
            ">;"
        }
    .end annotation
.end field

.field volatile running:Z

.field started:Z

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;Ljava/lang/String;I)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/panels/FocusPanel;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "priority"    # I

    .prologue
    .line 303
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    .line 304
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 305
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    .line 306
    invoke-virtual {p0, p3}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->setPriority(I)V

    .line 307
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->init()V

    .line 308
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 5

    .prologue
    .line 371
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->running:Z

    if-eqz v1, :cond_2e

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    if-eqz v1, :cond_2e

    .line 373
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    monitor-enter v2

    .line 374
    :cond_b
    :goto_b
    :try_start_b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->size()I

    move-result v1

    if-lez v1, :cond_2d

    .line 375
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;

    .line 376
    .local v0, "element":Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
    if-eqz v0, :cond_b

    .line 377
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "end element..."

    invoke-interface {v1, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 378
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->end()V

    goto :goto_b

    .line 381
    .end local v0    # "element":Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
    :catchall_2a
    move-exception v1

    monitor-exit v2
    :try_end_2c
    .catchall {:try_start_b .. :try_end_2c} :catchall_2a

    throw v1

    :cond_2d
    :try_start_2d
    monitor-exit v2
    :try_end_2e
    .catchall {:try_start_2d .. :try_end_2e} :catchall_2a

    .line 383
    :cond_2e
    return-void
.end method

.method public declared-synchronized draw([FFFFFFF)V
    .registers 12
    .param p1, "points"    # [F
    .param p2, "radius"    # F
    .param p3, "angle"    # F
    .param p4, "left"    # F
    .param p5, "top"    # F
    .param p6, "right"    # F
    .param p7, "bottom"    # F

    .prologue
    .line 346
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->running:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_38

    if-nez v0, :cond_b

    .line 351
    :cond_9
    :goto_9
    monitor-exit p0

    return-void

    .line 349
    :cond_b
    :try_start_b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->clear()V

    .line 350
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;

    const/16 v1, 0x8

    new-array v1, v1, [F

    const/4 v2, 0x0

    const/4 v3, 0x0

    aget v3, p1, v3

    aput v3, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x1

    aget v3, p1, v3

    aput v3, v1, v2

    const/4 v2, 0x2

    aput p2, v1, v2

    const/4 v2, 0x3

    aput p3, v1, v2

    const/4 v2, 0x4

    aput p4, v1, v2

    const/4 v2, 0x5

    aput p5, v1, v2

    const/4 v2, 0x6

    aput p6, v1, v2

    const/4 v2, 0x7

    aput p7, v1, v2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->add(Ljava/lang/Object;)Z
    :try_end_37
    .catchall {:try_start_b .. :try_end_37} :catchall_38

    goto :goto_9

    .line 346
    :catchall_38
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized drawStart([FLcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;FFFFFF)V
    .registers 13
    .param p1, "points"    # [F
    .param p2, "type"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;
    .param p3, "radius"    # F
    .param p4, "angle"    # F
    .param p5, "left"    # F
    .param p6, "top"    # F
    .param p7, "right"    # F
    .param p8, "bottom"    # F

    .prologue
    .line 327
    monitor-enter p0

    :try_start_1
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->running:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_58

    if-nez v1, :cond_7

    .line 343
    :goto_5
    monitor-exit p0

    return-void

    .line 331
    :cond_7
    :try_start_7
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;

    if-eqz v1, :cond_13

    .line 332
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->end()V

    .line 333
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;

    .line 336
    :cond_13
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->Radial:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    if-ne p2, v1, :cond_5b

    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->Radial:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    :goto_1b
    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;-><init>(Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;)V

    .line 337
    .local v0, "queue":Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
    const/16 v1, 0x8

    new-array v1, v1, [F

    const/4 v2, 0x0

    const/4 v3, 0x0

    aget v3, p1, v3

    aput v3, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x1

    aget v3, p1, v3

    aput v3, v1, v2

    const/4 v2, 0x2

    aput p3, v1, v2

    const/4 v2, 0x3

    aput p4, v1, v2

    const/4 v2, 0x4

    aput p5, v1, v2

    const/4 v2, 0x5

    aput p6, v1, v2

    const/4 v2, 0x6

    aput p7, v1, v2

    const/4 v2, 0x7

    aput p8, v1, v2

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->add(Ljava/lang/Object;)Z

    .line 339
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v2, v1, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;->Radial:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$TiltShiftDrawMode;

    if-ne p2, v1, :cond_5e

    const-string v1, "circle"

    :goto_4d
    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->setValue(Ljava/lang/Object;)V

    .line 341
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v1, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 342
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
    :try_end_57
    .catchall {:try_start_7 .. :try_end_57} :catchall_58

    goto :goto_5

    .line 327
    .end local v0    # "queue":Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
    :catchall_58
    move-exception v1

    monitor-exit p0

    throw v1

    .line 336
    :cond_5b
    :try_start_5b
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->Linear:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    goto :goto_1b

    .line 339
    .restart local v0    # "queue":Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
    :cond_5e
    const-string v1, "rectangle"
    :try_end_60
    .catchall {:try_start_5b .. :try_end_60} :catchall_58

    goto :goto_4d
.end method

.method public finish()V
    .registers 6

    .prologue
    .line 390
    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->running:Z

    if-eqz v2, :cond_30

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    if-eqz v2, :cond_30

    .line 391
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    monitor-enter v3

    .line 392
    :try_start_b
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 393
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;>;"
    :cond_11
    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 394
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;

    .line 395
    .local v0, "element":Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
    if-eqz v0, :cond_11

    .line 396
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "end element..."

    invoke-interface {v2, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 397
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->end()V

    goto :goto_11

    .line 400
    .end local v0    # "element":Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;>;"
    :catchall_2c
    move-exception v2

    monitor-exit v3
    :try_end_2e
    .catchall {:try_start_b .. :try_end_2e} :catchall_2c

    throw v2

    .restart local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;>;"
    :cond_2f
    :try_start_2f
    monitor-exit v3
    :try_end_30
    .catchall {:try_start_2f .. :try_end_30} :catchall_2c

    .line 402
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;>;"
    :cond_30
    return-void
.end method

.method public getQueueSize()I
    .registers 2

    .prologue
    .line 366
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    return v0
.end method

.method init()V
    .registers 1

    .prologue
    .line 310
    return-void
.end method

.method public isCompleted()Z
    .registers 2

    .prologue
    .line 362
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

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

.method public declared-synchronized pathEnd()V
    .registers 2

    .prologue
    .line 354
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->running:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_14

    if-nez v0, :cond_b

    .line 359
    :cond_9
    :goto_9
    monitor-exit p0

    return-void

    .line 357
    :cond_b
    :try_start_b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->end()V

    .line 358
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mCurrentQueue:Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
    :try_end_13
    .catchall {:try_start_b .. :try_end_13} :catchall_14

    goto :goto_9

    .line 354
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized quit()V
    .registers 2

    .prologue
    .line 320
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->started:Z

    .line 321
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->running:Z

    .line 322
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->interrupt()V
    :try_end_a
    .catchall {:try_start_2 .. :try_end_a} :catchall_c

    .line 323
    monitor-exit p0

    return-void

    .line 320
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public run()V
    .registers 28

    .prologue
    .line 407
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->started:Z

    if-eqz v5, :cond_0

    .line 411
    const/16 v21, 0x0

    .line 417
    .local v21, "s":Z
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "thread.start!"

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 418
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "filter.init"

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 420
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v6, v6, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v7, v7, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v5, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->init(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)I

    .line 422
    new-instance v15, Landroid/graphics/RectF;

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v7, v7, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    int-to-float v7, v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v8, v8, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v8}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    int-to-float v8, v8

    invoke-direct {v15, v5, v6, v7, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 423
    .local v15, "invalidateRect":Landroid/graphics/RectF;
    new-instance v22, Landroid/graphics/RectF;

    invoke-direct/range {v22 .. v22}, Landroid/graphics/RectF;-><init>()V

    .line 425
    .local v22, "tempRect":Landroid/graphics/RectF;
    :cond_57
    :goto_57
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->running:Z

    if-eqz v5, :cond_156

    .line 427
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v5}, Ljava/util/Queue;->size()I

    move-result v5

    if-lez v5, :cond_149

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->isInterrupted()Z

    move-result v5

    if-nez v5, :cond_149

    .line 429
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "queue.size: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v7}, Ljava/util/Queue;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 431
    if-nez v21, :cond_9c

    .line 432
    const/16 v21, 0x1

    .line 433
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->onProgressStart()V

    .line 436
    :cond_9c
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v5}, Ljava/util/Queue;->element()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;

    .line 438
    .local v14, "element":Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
    if-nez v14, :cond_b0

    .line 439
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v5}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    goto :goto_57

    .line 443
    :cond_b0
    # getter for: Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->tiltShiftMode:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;
    invoke-static {v14}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->access$300(Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    move-result-object v17

    .line 444
    .local v17, "mode":Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    move-result-object v5

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->setTiltShiftMode(Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;)Z

    .line 446
    :cond_c1
    :goto_c1
    invoke-virtual {v14}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->size()I

    move-result v5

    if-gtz v5, :cond_cd

    invoke-virtual {v14}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->isCompleted()Z

    move-result v5

    if-nez v5, :cond_d9

    .line 447
    :cond_cd
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->running:Z

    if-eqz v5, :cond_d9

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->isInterrupted()Z

    move-result v5

    if-eqz v5, :cond_e2

    .line 481
    :cond_d9
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->mQueue:Ljava/util/Queue;

    invoke-interface {v5}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    goto/16 :goto_57

    .line 451
    :cond_e2
    invoke-virtual {v14}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;->poll()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, [F

    .line 452
    .local v18, "points":[F
    if-eqz v18, :cond_c1

    .line 456
    const/4 v5, 0x0

    aget v24, v18, v5

    .line 457
    .local v24, "x":F
    const/4 v5, 0x1

    aget v25, v18, v5

    .line 458
    .local v25, "y":F
    const/4 v5, 0x2

    aget v19, v18, v5

    .line 459
    .local v19, "radius":F
    const/4 v5, 0x3

    aget v4, v18, v5

    .line 461
    .local v4, "angle":F
    const/4 v5, 0x4

    aget v16, v18, v5

    .line 462
    .local v16, "left":F
    const/4 v5, 0x5

    aget v23, v18, v5

    .line 463
    .local v23, "top":F
    const/4 v5, 0x6

    aget v20, v18, v5

    .line 464
    .local v20, "right":F
    const/4 v5, 0x7

    aget v13, v18, v5

    .line 466
    .local v13, "bottom":F
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    move-result-object v5

    move/from16 v0, v19

    float-to-double v6, v0

    float-to-double v8, v4

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x2

    new-array v12, v12, [F

    const/16 v26, 0x0

    aput v24, v12, v26

    const/16 v26, 0x1

    aput v25, v12, v26

    invoke-virtual/range {v5 .. v12}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->draw(DDIZ[F)[F

    .line 468
    move-object/from16 v0, v22

    move/from16 v1, v16

    move/from16 v2, v23

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3, v13}, Landroid/graphics/RectF;->set(FFFF)V

    .line 470
    move-object/from16 v0, v22

    invoke-virtual {v15, v0}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    .line 472
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    # getter for: Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mFilter:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->access$200(Lcom/adobe/creativesdk/aviary/panels/FocusPanel;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    move-result-object v5

    invoke-virtual {v5, v15}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->renderPreview(Landroid/graphics/RectF;)Z

    .line 474
    move-object/from16 v0, v22

    invoke-virtual {v15, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 476
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/Moa;->notifyPixelsChanged(Landroid/graphics/Bitmap;)V

    goto/16 :goto_c1

    .line 484
    .end local v4    # "angle":F
    .end local v13    # "bottom":F
    .end local v14    # "element":Lcom/adobe/creativesdk/aviary/panels/FocusPanel$DrawQueue;
    .end local v16    # "left":F
    .end local v17    # "mode":Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;
    .end local v18    # "points":[F
    .end local v19    # "radius":F
    .end local v20    # "right":F
    .end local v23    # "top":F
    .end local v24    # "x":F
    .end local v25    # "y":F
    :cond_149
    if-eqz v21, :cond_57

    .line 485
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->onProgressEnd()V

    .line 486
    const/16 v21, 0x0

    goto/16 :goto_57

    .line 491
    :cond_156
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->onProgressEnd()V

    .line 492
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->this$0:Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "thread.end"

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 493
    return-void
.end method

.method public declared-synchronized start()V
    .registers 2

    .prologue
    .line 314
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->started:Z

    .line 315
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/FocusPanel$BackgroundDrawThread;->running:Z

    .line 316
    invoke-super {p0}, Ljava/lang/Thread;->start()V
    :try_end_a
    .catchall {:try_start_2 .. :try_end_a} :catchall_c

    .line 317
    monitor-exit p0

    return-void

    .line 314
    :catchall_c
    move-exception v0

    monitor-exit p0

    throw v0
.end method
