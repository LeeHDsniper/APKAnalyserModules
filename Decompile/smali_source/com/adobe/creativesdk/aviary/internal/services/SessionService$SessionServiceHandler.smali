.class final Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;
.super Landroid/os/Handler;
.source "SessionService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/services/SessionService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SessionServiceHandler"
.end annotation


# instance fields
.field final logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

.field private mCurrentActionId:J

.field private mLastActionId:J

.field private mSessionId:J

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/services/SessionService;Landroid/os/Looper;)V
    .registers 7
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    const-wide/16 v2, -0x1

    .line 307
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    .line 308
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 302
    const-string v0, "SessionService-Handler"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    .line 309
    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    .line 310
    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    .line 311
    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mCurrentActionId:J

    .line 312
    return-void
.end method

.method private handleLoad(Landroid/os/Message;)V
    .registers 14
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const-wide/16 v10, -0x1

    .line 521
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "handleLoad"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 523
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    cmp-long v1, v2, v10

    if-lez v1, :cond_1e

    .line 524
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mDatabase:Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->deleteSession(J)I

    .line 525
    iput-wide v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    .line 526
    iput-wide v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    .line 527
    iput-wide v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mCurrentActionId:J

    .line 530
    :cond_1e
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 531
    .local v0, "data":Landroid/os/Bundle;
    if-eqz v0, :cond_71

    .line 532
    const-string v1, "ptr"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 533
    .local v4, "ptr":J
    const-string v1, "bundle-megapixels"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v8

    .line 534
    .local v8, "megapixels":I
    const-string v1, "bundle-image-info"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    .line 535
    .local v7, "imageInfo":Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mDatabase:Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getOrientation()I

    move-result v3

    invoke-virtual {v1, v2, v8, v3}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->load(Ljava/lang/String;II)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    .line 536
    iput-wide v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    .line 537
    iput-wide v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mCurrentActionId:J

    .line 539
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    cmp-long v1, v2, v10

    if-lez v1, :cond_69

    .line 541
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mDatabase:Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->push(JJLcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    .line 542
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mCurrentActionId:J

    .line 546
    :cond_69
    invoke-virtual {p0, v7, v8}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hiResLoad(Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;I)V

    .line 549
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    invoke-direct {p0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->invokeReplayActions(J)V

    .line 551
    .end local v4    # "ptr":J
    .end local v7    # "imageInfo":Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;
    .end local v8    # "megapixels":I
    :cond_71
    return-void
.end method

.method private handlePush(Landroid/os/Message;)V
    .registers 14
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const-wide/16 v10, -0x1

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 501
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "handlePush"

    invoke-interface {v3, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 503
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 504
    .local v0, "data":Landroid/os/Bundle;
    iget-wide v8, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    cmp-long v3, v8, v10

    if-lez v3, :cond_48

    if-eqz v0, :cond_48

    .line 506
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    cmp-long v1, v2, v10

    if-eqz v1, :cond_28

    .line 507
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mDatabase:Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    iget-wide v8, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    invoke-virtual {v1, v2, v3, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->deleteActionsFrom(JJ)I

    .line 510
    :cond_28
    const-string v1, "ptr"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 511
    .local v4, "ptr":J
    const-string v1, "bundle-actions"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v6

    check-cast v6, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .line 512
    .local v6, "actionList":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mDatabase:Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    invoke-virtual/range {v1 .. v6}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->push(JJLcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    .line 514
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    invoke-direct {p0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->invokeReplayActions(J)V

    .line 518
    .end local v4    # "ptr":J
    .end local v6    # "actionList":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    :goto_47
    return-void

    .line 516
    :cond_48
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "handlePush failed. mSessionId: %d, data is null? %b"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    iget-wide v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v8, v1

    if-nez v0, :cond_5a

    move v1, v2

    :cond_5a
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v8, v2

    invoke-interface {v3, v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_47
.end method

.method private handleRedo(Landroid/os/Message;)V
    .registers 12
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const-wide/16 v6, -0x1

    .line 454
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "handleRedo"

    invoke-interface {v1, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 456
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 458
    .local v0, "data":Landroid/os/Bundle;
    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    cmp-long v1, v4, v6

    if-lez v1, :cond_3f

    if-eqz v0, :cond_3f

    .line 459
    const-string v1, "ptr"

    invoke-virtual {v0, v1, v6, v7}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 460
    .local v2, "ptr":J
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mDatabase:Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    invoke-virtual {v1, v4, v5, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->findActionByBitmap(JJ)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    .line 461
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v4, "action: %d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-wide v8, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v1, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 463
    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    invoke-direct {p0, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->invokeReplayActions(J)V

    .line 465
    .end local v2    # "ptr":J
    :cond_3f
    return-void
.end method

.method private handleReplayActions(Landroid/os/Message;)V
    .registers 16
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    const-wide/16 v10, -0x1

    .line 415
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "handleReplayActions"

    invoke-interface {v3, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 416
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    .line 418
    .local v1, "data":Landroid/os/Bundle;
    if-eqz v1, :cond_4a

    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    cmp-long v3, v6, v10

    if-lez v3, :cond_4a

    .line 419
    const-string v3, "session-id"

    invoke-virtual {v1, v3, v10, v11}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 421
    .local v4, "sessionId":J
    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    cmp-long v3, v4, v6

    if-nez v3, :cond_4a

    .line 422
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "mCurrentAction: %d, mLastAction: %d"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    iget-wide v8, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mCurrentActionId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v12

    iget-wide v8, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v7, v13

    invoke-interface {v3, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 424
    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mCurrentActionId:J

    cmp-long v3, v6, v10

    if-nez v3, :cond_4b

    .line 425
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "mCurrentActionId = -1. stop"

    invoke-interface {v3, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 451
    .end local v4    # "sessionId":J
    :cond_4a
    :goto_4a
    return-void

    .line 428
    .restart local v4    # "sessionId":J
    :cond_4b
    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    cmp-long v3, v6, v10

    if-nez v3, :cond_59

    .line 429
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "mLastActionId = -1. stop"

    invoke-interface {v3, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_4a

    .line 432
    :cond_59
    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mCurrentActionId:J

    iget-wide v8, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    cmp-long v3, v6, v8

    if-ltz v3, :cond_69

    .line 433
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "mCurrentActionId >= mLastActionId"

    invoke-interface {v3, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_4a

    .line 437
    :cond_69
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mDatabase:Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mCurrentActionId:J

    invoke-virtual {v3, v4, v5, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->findActionGreaterThan(JJ)Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;

    move-result-object v0

    .line 438
    .local v0, "action":Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "action: %s"

    new-array v7, v13, [Ljava/lang/Object;

    aput-object v0, v7, v12

    invoke-interface {v3, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 439
    if-eqz v0, :cond_97

    .line 441
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    const-class v6, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    invoke-virtual {v3, v6}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .line 442
    .local v2, "service":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
    if-eqz v2, :cond_97

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->isRunning()Z

    move-result v3

    if-eqz v3, :cond_97

    .line 443
    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;->actions:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->apply(Ljava/lang/String;)V

    .line 447
    .end local v2    # "service":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
    :cond_97
    iget-wide v6, v0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;->id:J

    iput-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mCurrentActionId:J

    .line 448
    invoke-direct {p0, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->invokeReplayActions(J)V

    goto :goto_4a
.end method

.method private handleRevert(Landroid/os/Message;)V
    .registers 14
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const-wide/16 v10, -0x1

    .line 554
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "handleRevert"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 556
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 557
    .local v0, "data":Landroid/os/Bundle;
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    cmp-long v1, v2, v10

    if-lez v1, :cond_6a

    if-eqz v0, :cond_6a

    .line 558
    const-string v1, "ptr"

    invoke-virtual {v0, v1, v10, v11}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 560
    .local v4, "ptr":J
    cmp-long v1, v4, v10

    if-lez v1, :cond_4c

    .line 562
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mDatabase:Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->deleteActions(J)I

    .line 565
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mDatabase:Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->push(JJLcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    .line 566
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mCurrentActionId:J

    .line 568
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "mCurrentActionId: %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-wide v8, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mCurrentActionId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v3, v6

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 573
    :cond_4c
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mDatabase:Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->findSession(J)Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;

    move-result-object v7

    .line 574
    .local v7, "session":Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;
    if-eqz v7, :cond_6b

    .line 575
    iget-object v1, v7, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;->data:Landroid/net/Uri;

    iget v2, v7, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;->megapixels:I

    iget v3, v7, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;->orientation:I

    invoke-virtual {p0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hiresRevert(Landroid/net/Uri;II)V

    .line 580
    :goto_61
    cmp-long v1, v4, v10

    if-lez v1, :cond_6a

    .line 581
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    invoke-direct {p0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->invokeReplayActions(J)V

    .line 584
    .end local v4    # "ptr":J
    .end local v7    # "session":Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;
    :cond_6a
    return-void

    .line 577
    .restart local v4    # "ptr":J
    .restart local v7    # "session":Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$SessionWrapper;
    :cond_6b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "failed to revert. Session is null"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto :goto_61
.end method

.method private handleSave(Landroid/os/Message;)V
    .registers 12
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 393
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "handleSave"

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 395
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 396
    .local v0, "data":Landroid/os/Bundle;
    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    const-wide/16 v8, -0x1

    cmp-long v5, v6, v8

    if-lez v5, :cond_32

    if-eqz v0, :cond_32

    .line 398
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hasPendingMessages()Z

    move-result v5

    if-eqz v5, :cond_33

    .line 399
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "Other messages pending... append the message at the end of the queue..."

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 401
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/SessionService;)Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    move-result-object v5

    invoke-static {v5}, Landroid/os/Message;->obtain(Landroid/os/Handler;)Landroid/os/Message;

    move-result-object v2

    .line 402
    .local v2, "message":Landroid/os/Message;
    invoke-virtual {v2, p1}, Landroid/os/Message;->copyFrom(Landroid/os/Message;)V

    .line 403
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    .line 412
    .end local v2    # "message":Landroid/os/Message;
    :cond_32
    :goto_32
    return-void

    .line 407
    :cond_33
    const-string v5, "path"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 408
    .local v3, "path":Ljava/lang/String;
    const-string v5, "compress-format"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap$CompressFormat;

    .line 409
    .local v1, "format":Landroid/graphics/Bitmap$CompressFormat;
    const-string v5, "quality"

    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 410
    .local v4, "quality":I
    invoke-virtual {p0, v3, v1, v4}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hiresSave(Ljava/lang/String;Landroid/graphics/Bitmap$CompressFormat;I)V

    goto :goto_32
.end method

.method private handleStop(Landroid/os/Message;)V
    .registers 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 587
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "handleStop"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 588
    return-void
.end method

.method private handleUndo(Landroid/os/Message;)V
    .registers 14
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const-wide/16 v8, -0x1

    .line 468
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "handleUndo"

    invoke-interface {v3, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 470
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 472
    .local v0, "data":Landroid/os/Bundle;
    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    cmp-long v3, v6, v8

    if-lez v3, :cond_71

    if-eqz v0, :cond_71

    .line 473
    const-string v3, "ptr"

    invoke-virtual {v0, v3, v8, v9}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 475
    .local v4, "ptr":J
    iput-wide v8, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mCurrentActionId:J

    .line 476
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mDatabase:Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    invoke-virtual {v3, v6, v7, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->findActionByBitmap(JJ)J

    move-result-wide v6

    iput-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    .line 478
    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    cmp-long v3, v6, v8

    if-lez v3, :cond_55

    .line 480
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    iget-object v3, v3, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mDatabase:Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    invoke-virtual {v3, v6, v7, v8, v9}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->findActionGreaterThan(JJ)Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;

    move-result-object v1

    .line 481
    .local v1, "firstAction":Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;
    if-eqz v1, :cond_3f

    .line 482
    iget-wide v6, v1, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;->id:J

    iput-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mCurrentActionId:J

    .line 486
    :cond_3f
    const/16 v3, 0x8

    invoke-static {p0, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v2

    .line 487
    .local v2, "message":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    .end local v0    # "data":Landroid/os/Bundle;
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 488
    .restart local v0    # "data":Landroid/os/Bundle;
    invoke-virtual {v2, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 489
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    .line 493
    iget-wide v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    invoke-direct {p0, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->invokeReplayActions(J)V

    .line 496
    .end local v1    # "firstAction":Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper$ActionWrapper;
    .end local v2    # "message":Landroid/os/Message;
    :cond_55
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v6, "mCurrentActionId: %d, mLastActionId: %d"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    iget-wide v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mCurrentActionId:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    iget-wide v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mLastActionId:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-interface {v3, v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 498
    .end local v4    # "ptr":J
    :cond_71
    return-void
.end method

.method private hasPendingMessages()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 362
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hasMessages(I)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 389
    :cond_7
    :goto_7
    return v0

    .line 365
    :cond_8
    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hasMessages(I)Z

    move-result v1

    if-nez v1, :cond_7

    .line 368
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hasMessages(I)Z

    move-result v1

    if-nez v1, :cond_7

    .line 371
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hasMessages(I)Z

    move-result v1

    if-nez v1, :cond_7

    .line 374
    const/4 v1, 0x5

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hasMessages(I)Z

    move-result v1

    if-nez v1, :cond_7

    .line 377
    const/4 v1, 0x6

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hasMessages(I)Z

    move-result v1

    if-nez v1, :cond_7

    .line 380
    const/4 v1, 0x7

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hasMessages(I)Z

    move-result v1

    if-nez v1, :cond_7

    .line 383
    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hasMessages(I)Z

    move-result v1

    if-nez v1, :cond_7

    .line 386
    const/16 v1, 0x9

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hasMessages(I)Z

    move-result v1

    if-nez v1, :cond_7

    .line 389
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private invokeReplayActions(J)V
    .registers 6
    .param p1, "sessionId"    # J

    .prologue
    .line 591
    const/4 v2, 0x7

    invoke-static {p0, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    .line 592
    .local v1, "message":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 593
    .local v0, "data":Landroid/os/Bundle;
    const-string v2, "session-id"

    invoke-virtual {v0, v2, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 594
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 595
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 596
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 316
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_38

    .line 359
    :cond_5
    :goto_5
    return-void

    .line 318
    :pswitch_6
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->handleLoad(Landroid/os/Message;)V

    goto :goto_5

    .line 322
    :pswitch_a
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->handleRevert(Landroid/os/Message;)V

    goto :goto_5

    .line 326
    :pswitch_e
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->handlePush(Landroid/os/Message;)V

    goto :goto_5

    .line 330
    :pswitch_12
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->handleSave(Landroid/os/Message;)V

    goto :goto_5

    .line 334
    :pswitch_16
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->handleReplayActions(Landroid/os/Message;)V

    goto :goto_5

    .line 338
    :pswitch_1a
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-lez v0, :cond_5

    .line 339
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mDatabase:Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->mSessionId:J

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;->deleteActions(J)I

    goto :goto_5

    .line 344
    :pswitch_2c
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->handleUndo(Landroid/os/Message;)V

    goto :goto_5

    .line 348
    :pswitch_30
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->handleRedo(Landroid/os/Message;)V

    goto :goto_5

    .line 352
    :pswitch_34
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->handleStop(Landroid/os/Message;)V

    goto :goto_5

    .line 316
    :pswitch_data_38
    .packed-switch 0x1
        :pswitch_34
        :pswitch_6
        :pswitch_e
        :pswitch_1a
        :pswitch_2c
        :pswitch_30
        :pswitch_16
        :pswitch_a
        :pswitch_12
    .end packed-switch
.end method

.method hiResLoad(Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;I)V
    .registers 6
    .param p1, "imageInfo"    # Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;
    .param p2, "megapixels"    # I

    .prologue
    .line 603
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "hiresLoad"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 604
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    const-class v2, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .line 605
    .local v0, "service":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
    if-eqz v0, :cond_20

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_20

    .line 606
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, p2, p1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->load(Landroid/net/Uri;ILcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)V

    .line 608
    :cond_20
    return-void
.end method

.method hiresApplyActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V
    .registers 5
    .param p1, "actions"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .prologue
    .line 621
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "hiresApplyActions"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 622
    if-eqz p1, :cond_1e

    .line 623
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    const-class v2, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .line 624
    .local v0, "service":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
    if-eqz v0, :cond_1e

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 625
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->apply(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 628
    .end local v0    # "service":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
    :cond_1e
    return-void
.end method

.method hiresRevert(Landroid/net/Uri;II)V
    .registers 7
    .param p1, "data"    # Landroid/net/Uri;
    .param p2, "megapixels"    # I
    .param p3, "orientation"    # I

    .prologue
    .line 611
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "hiresRevert"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 614
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    const-class v2, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .line 615
    .local v0, "service":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 616
    invoke-virtual {v0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->revert(Landroid/net/Uri;II)V

    .line 618
    :cond_1c
    return-void
.end method

.method hiresSave(Ljava/lang/String;Landroid/graphics/Bitmap$CompressFormat;I)V
    .registers 7
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "format"    # Landroid/graphics/Bitmap$CompressFormat;
    .param p3, "quality"    # I

    .prologue
    .line 631
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "hiresSave"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 632
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    const-class v2, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .line 633
    .local v0, "service":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 634
    invoke-virtual {v0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->save(Ljava/lang/String;Landroid/graphics/Bitmap$CompressFormat;I)V

    .line 636
    :cond_1c
    return-void
.end method
