.class final Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;
.super Landroid/os/Handler;
.source "HiResBackgroundService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "InternalHandler"
.end annotation


# instance fields
.field private mHiResEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;Landroid/os/Looper;)V
    .registers 5
    .param p2, "looper"    # Landroid/os/Looper;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .line 103
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 100
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->mHiResEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 104
    return-void
.end method

.method private handleActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V
    .registers 6
    .param p1, "actionList"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .prologue
    .line 291
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    const-string v2, "InternalHandler::handleActions"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 292
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->mHiResEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_66

    .line 293
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v1

    if-eqz v1, :cond_5a

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->isLoaded()Z

    move-result v1

    if-eqz v1, :cond_5a

    if-eqz p1, :cond_5a

    .line 295
    :try_start_2c
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->applyActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V
    :try_end_35
    .catch Lorg/json/JSONException; {:try_start_2c .. :try_end_35} :catch_36
    .catch Ljava/lang/NullPointerException; {:try_start_2c .. :try_end_35} :catch_48

    .line 310
    :goto_35
    return-void

    .line 297
    :catch_36
    move-exception v0

    .line 298
    .local v0, "e":Lorg/json/JSONException;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 299
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_35

    .line 300
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_48
    move-exception v0

    .line 301
    .local v0, "e":Ljava/lang/NullPointerException;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 302
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    goto :goto_35

    .line 305
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :cond_5a
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    const-string v2, "moa is not loaded.."

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_35

    .line 308
    :cond_66
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    const-string v2, "hires is not enabled, skipping actions.."

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_35
.end method

.method private handleActions(Ljava/lang/String;)V
    .registers 6
    .param p1, "actionList"    # Ljava/lang/String;

    .prologue
    .line 318
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    const-string v2, "InternalHandler::handleActions(s)"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 319
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->mHiResEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_54

    .line 320
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v1

    if-eqz v1, :cond_48

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->isLoaded()Z

    move-result v1

    if-eqz v1, :cond_48

    if-eqz p1, :cond_48

    .line 322
    :try_start_2c
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->applyActions(Ljava/lang/String;)V
    :try_end_35
    .catch Ljava/lang/NullPointerException; {:try_start_2c .. :try_end_35} :catch_36

    .line 334
    :goto_35
    return-void

    .line 324
    :catch_36
    move-exception v0

    .line 325
    .local v0, "e":Ljava/lang/NullPointerException;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 326
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    goto :goto_35

    .line 329
    .end local v0    # "e":Ljava/lang/NullPointerException;
    :cond_48
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    const-string v2, "moa is not loaded.."

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_35

    .line 332
    :cond_54
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    const-string v2, "hires is not enabled, skipping actions.."

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_35
.end method

.method private handleFile(Landroid/net/Uri;II)V
    .registers 13
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "maxSize"    # I
    .param p3, "orientation"    # I

    .prologue
    const/4 v8, 0x0

    .line 391
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v3

    const-string v4, "InternalHandler::handleFile: %s, maxSize: %d, orientation: %d"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    aput-object p1, v5, v8

    const/4 v6, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 393
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->getActivityContext()Landroid/content/Context;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$700(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Landroid/content/Context;

    move-result-object v0

    .line 394
    .local v0, "context":Landroid/content/Context;
    if-nez v0, :cond_33

    .line 395
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v3

    const-string v4, "Context is gone"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 423
    :goto_32
    return-void

    .line 398
    :cond_33
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "orientation: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v5, v8, [Ljava/lang/Object;

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 400
    if-eqz p3, :cond_63

    .line 401
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v3

    const-string v4, "need to rotate the image"

    new-array v5, v8, [Ljava/lang/Object;

    invoke-interface {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 402
    invoke-direct {p0, p3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->handleRotate90(I)V

    .line 406
    :cond_63
    if-eqz v0, :cond_94

    .line 407
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils;->getPermissions(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    .line 408
    .local v2, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;->hires:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$Permission;->name()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_94

    .line 409
    if-lez p2, :cond_81

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/CameraUtils;->getNormalMegaPixels()Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->ordinal()I

    move-result v3

    if-le p2, v3, :cond_94

    .line 410
    :cond_81
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v3

    const-string v4, "overriding maxSize due to permissions constrains"

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 411
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/CameraUtils;->getNormalMegaPixels()Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->ordinal()I

    move-result p2

    .line 417
    .end local v2    # "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_94
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->Mp3:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    .line 418
    .local v1, "mp":Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;
    if-ltz p2, :cond_a5

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->values()[Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    move-result-object v3

    array-length v3, v3

    if-ge p2, v3, :cond_a5

    .line 419
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->values()[Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    move-result-object v3

    aget-object v1, v3, p2

    .line 422
    :cond_a5
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->ordinal()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->handleResize(I)V

    goto :goto_32
.end method

.method private handleResize(I)V
    .registers 9
    .param p1, "maxSize"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 337
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "InternalHandler::handleResize: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-array v4, v5, [Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 339
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->mHiResEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-eqz v2, :cond_78

    .line 340
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v2

    if-eqz v2, :cond_77

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->isLoaded()Z

    move-result v2

    if-eqz v2, :cond_77

    .line 342
    if-lez p1, :cond_77

    .line 343
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "need to resize to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-array v4, v5, [Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 345
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "resize"

    aput-object v3, v2, v5

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->actionList([Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    .line 346
    .local v0, "actionlist":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    invoke-virtual {v0, v5}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v1

    .line 347
    .local v1, "moaAction":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    const-string v2, "size"

    invoke-virtual {v1, v2, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;I)V

    .line 350
    const-string v2, "sizeInMegaPixels"

    invoke-virtual {v1, v2, v6}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Z)V

    .line 351
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->handleActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 357
    .end local v0    # "actionlist":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    .end local v1    # "moaAction":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    :cond_77
    :goto_77
    return-void

    .line 355
    :cond_78
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v2

    const-string v3, "hires is not enabled, skipping resize"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_77
.end method

.method private handleRotate90(I)V
    .registers 7
    .param p1, "angle"    # I

    .prologue
    .line 360
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "InternalHandler::handleRotate: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 362
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->mHiResEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-eqz v2, :cond_59

    .line 363
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v2

    if-eqz v2, :cond_58

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->isLoaded()Z

    move-result v2

    if-eqz v2, :cond_58

    .line 364
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->actionList()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v1

    .line 367
    .local v1, "actionList":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    if-eqz p1, :cond_4f

    .line 368
    const-string v2, "rotate90"

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->action(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    .line 369
    .local v0, "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    const-string v2, "angle"

    invoke-virtual {v0, v2, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;I)V

    .line 370
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->add(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;)Z

    .line 373
    .end local v0    # "action":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;
    :cond_4f
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->size()I

    move-result v2

    if-lez v2, :cond_58

    .line 374
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->handleActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 380
    .end local v1    # "actionList":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    :cond_58
    :goto_58
    return-void

    .line 378
    :cond_59
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v2

    const-string v3, "hires is not enabled, skipping rotate90"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_58
.end method

.method private loadImage(Landroid/net/Uri;II)V
    .registers 15
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "maxSize"    # I
    .param p3, "orientation"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/4 v5, 0x1

    .line 230
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v6

    const-string v7, "InternalHandler::loadImage (uri: %s, maxSize: %d, orientation: %d)"

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    aput-object p1, v8, v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v5

    const/4 v9, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-interface {v6, v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 232
    if-lez p2, :cond_22

    move v3, v5

    .line 233
    .local v3, "hiresEnabled":Z
    :cond_22
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->mHiResEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v6, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 235
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v6

    if-nez v6, :cond_46

    .line 236
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    new-instance v7, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    invoke-direct {v7}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;-><init>()V

    # setter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$402(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    .line 237
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v6

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->isHiResOriginalAvailable()Z

    move-result v7

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->setOriginalEnabled(Z)V

    .line 240
    :cond_46
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->isLoaded()Z

    move-result v6

    if-eqz v6, :cond_5b

    .line 242
    :try_start_52
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v6

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->unload()V
    :try_end_5b
    .catch Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException; {:try_start_52 .. :try_end_5b} :catch_be

    .line 247
    :cond_5b
    :goto_5b
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->getActivityContext()Landroid/content/Context;
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$700(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Landroid/content/Context;

    move-result-object v0

    .line 248
    .local v0, "context":Landroid/content/Context;
    if-nez v0, :cond_6f

    .line 249
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v5

    const-string v6, "Context is gone"

    invoke-interface {v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 282
    :cond_6e
    :goto_6e
    return-void

    .line 253
    :cond_6f
    if-eqz v3, :cond_6e

    .line 254
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->getRealFilePath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v4

    .line 256
    .local v4, "path":Ljava/lang/String;
    if-eqz v4, :cond_90

    .line 257
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->load(Ljava/lang/String;)V

    .line 278
    :cond_80
    :goto_80
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->isLoaded()Z

    move-result v5

    if-eqz v5, :cond_6e

    .line 279
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->handleFile(Landroid/net/Uri;II)V

    goto :goto_6e

    .line 259
    :cond_90
    const/4 v2, 0x0

    .line 261
    .local v2, "fd":Landroid/os/ParcelFileDescriptor;
    :try_start_91
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "r"

    invoke-virtual {v6, p1, v7}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;
    :try_end_9a
    .catch Ljava/lang/Exception; {:try_start_91 .. :try_end_9a} :catch_ae

    move-result-object v2

    .line 266
    if-eqz v2, :cond_80

    .line 268
    :try_start_9d
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v5

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->load(Ljava/io/FileDescriptor;)V
    :try_end_aa
    .catch Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException; {:try_start_9d .. :try_end_aa} :catch_b4
    .catch Ljava/lang/Exception; {:try_start_9d .. :try_end_aa} :catch_b6

    .line 274
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Landroid/os/ParcelFileDescriptor;)V

    goto :goto_80

    .line 262
    :catch_ae
    move-exception v1

    .line 263
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;->fromInt(I)Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    move-result-object v5

    throw v5

    .line 269
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_b4
    move-exception v1

    .line 270
    .local v1, "e":Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
    throw v1

    .line 271
    .end local v1    # "e":Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
    :catch_b6
    move-exception v1

    .line 272
    .local v1, "e":Ljava/lang/Exception;
    const/16 v5, 0x8

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;->fromInt(I)Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    move-result-object v5

    throw v5

    .line 243
    .end local v0    # "context":Landroid/content/Context;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "fd":Landroid/os/ParcelFileDescriptor;
    .end local v4    # "path":Ljava/lang/String;
    :catch_be
    move-exception v6

    goto :goto_5b
.end method

.method private saveImage(Ljava/lang/String;II)V
    .registers 11
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "format"    # I
    .param p3, "quality"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x3

    .line 201
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    const-string v2, "InternalHandler::saveImage: %s, format: %d, quality: %d "

    new-array v3, v6, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 203
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->mHiResEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_53

    .line 205
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->isLoaded()Z

    move-result v1

    if-nez v1, :cond_38

    .line 206
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;->fromInt(I)Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;

    move-result-object v1

    throw v1

    .line 209
    :cond_38
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 210
    .local v0, "outputFormat":Landroid/graphics/Bitmap$CompressFormat;
    if-ltz p2, :cond_49

    invoke-static {}, Landroid/graphics/Bitmap$CompressFormat;->values()[Landroid/graphics/Bitmap$CompressFormat;

    move-result-object v1

    array-length v1, v1

    if-ge p2, v1, :cond_49

    .line 211
    invoke-static {}, Landroid/graphics/Bitmap$CompressFormat;->values()[Landroid/graphics/Bitmap$CompressFormat;

    move-result-object v1

    aget-object v0, v1, p2

    .line 214
    :cond_49
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v1

    invoke-virtual {v1, p1, p3, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->save(Ljava/lang/String;ILandroid/graphics/Bitmap$CompressFormat;)V

    .line 218
    .end local v0    # "outputFormat":Landroid/graphics/Bitmap$CompressFormat;
    :goto_52
    return-void

    .line 216
    :cond_53
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    const-string v2, "hires is not enabled, skipping save"

    invoke-interface {v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_52
.end method


# virtual methods
.method public getHiresEnabled()Z
    .registers 2

    .prologue
    .line 107
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->mHiResEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 16
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 113
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 115
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v10}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "handleMessage: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p1, Landroid/os/Message;->what:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 117
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    .line 118
    .local v1, "data":Landroid/os/Bundle;
    if-eqz v1, :cond_56

    .line 119
    const-string v10, "counter_id"

    const-wide/16 v12, 0x0

    invoke-virtual {v1, v10, v12, v13}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 120
    .local v2, "counterId":J
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;
    invoke-static {v10}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$100(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    move-result-object v10

    invoke-virtual {v10}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->getId()J

    move-result-wide v10

    cmp-long v10, v2, v10

    if-nez v10, :cond_56

    .line 121
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    iget-object v11, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;
    invoke-static {v11}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$100(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    move-result-object v11

    iget v12, v11, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->index:I

    add-int/lit8 v12, v12, 0x1

    iput v12, v11, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->index:I

    iget-object v11, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->mCounter:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;
    invoke-static {v11}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$100(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;

    move-result-object v11

    iget v11, v11, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$ProgressCounter;->total:I

    # invokes: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->dispatchProgress(II)V
    invoke-static {v10, v12, v11}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$200(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;II)V

    .line 125
    .end local v2    # "counterId":J
    :cond_56
    iget v10, p1, Landroid/os/Message;->what:I

    sparse-switch v10, :sswitch_data_102

    .line 198
    :cond_5b
    :goto_5b
    return-void

    .line 128
    :sswitch_5c
    iget-object v8, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v8, Landroid/net/Uri;

    .line 130
    .local v8, "uri":Landroid/net/Uri;
    :try_start_60
    iget v10, p1, Landroid/os/Message;->arg1:I

    iget v11, p1, Landroid/os/Message;->arg2:I

    invoke-direct {p0, v8, v10, v11}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->loadImage(Landroid/net/Uri;II)V
    :try_end_67
    .catch Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException; {:try_start_60 .. :try_end_67} :catch_68

    goto :goto_5b

    .line 131
    :catch_68
    move-exception v4

    .line 132
    .local v4, "e":Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->dispatchError(Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;)V
    invoke-static {v10, v4}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$300(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;)V

    goto :goto_5b

    .line 137
    .end local v4    # "e":Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
    .end local v8    # "uri":Landroid/net/Uri;
    :sswitch_6f
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v10}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v10

    invoke-virtual {v10}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->isLoaded()Z

    move-result v10

    if-eqz v10, :cond_5b

    .line 138
    const/4 v7, 0x0

    .line 139
    .local v7, "reverted":Z
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v10}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v10

    invoke-virtual {v10}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->getOriginalEnabled()Z

    move-result v10

    if-eqz v10, :cond_a0

    .line 141
    :try_start_88
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->moa:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;
    invoke-static {v10}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$400(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;

    move-result-object v10

    invoke-virtual {v10}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaHD;->revert()V

    .line 143
    iget v10, p1, Landroid/os/Message;->arg2:I

    if-eqz v10, :cond_9a

    .line 144
    iget v10, p1, Landroid/os/Message;->arg2:I

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->handleRotate90(I)V

    .line 146
    :cond_9a
    iget v10, p1, Landroid/os/Message;->arg1:I

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->handleResize(I)V
    :try_end_9f
    .catch Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException; {:try_start_88 .. :try_end_9f} :catch_b5

    .line 148
    const/4 v7, 0x1

    .line 154
    :cond_a0
    :goto_a0
    if-nez v7, :cond_5b

    .line 155
    iget-object v9, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v9, Landroid/net/Uri;

    .line 157
    .local v9, "uri2":Landroid/net/Uri;
    :try_start_a6
    iget v10, p1, Landroid/os/Message;->arg1:I

    iget v11, p1, Landroid/os/Message;->arg2:I

    invoke-direct {p0, v9, v10, v11}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->loadImage(Landroid/net/Uri;II)V
    :try_end_ad
    .catch Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException; {:try_start_a6 .. :try_end_ad} :catch_ae

    goto :goto_5b

    .line 158
    :catch_ae
    move-exception v4

    .line 159
    .restart local v4    # "e":Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->dispatchError(Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;)V
    invoke-static {v10, v4}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$300(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;)V

    goto :goto_5b

    .line 149
    .end local v4    # "e":Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
    .end local v9    # "uri2":Landroid/net/Uri;
    :catch_b5
    move-exception v4

    .line 150
    .restart local v4    # "e":Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;->printStackTrace()V

    goto :goto_a0

    .line 167
    .end local v4    # "e":Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
    .end local v7    # "reverted":Z
    :sswitch_ba
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 168
    .local v0, "actions":Ljava/lang/Object;
    instance-of v10, v0, Ljava/lang/String;

    if-eqz v10, :cond_c8

    .line 169
    iget-object v10, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->handleActions(Ljava/lang/String;)V

    goto :goto_5b

    .line 171
    :cond_c8
    iget-object v10, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v10, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->handleActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    goto :goto_5b

    .line 177
    .end local v0    # "actions":Ljava/lang/Object;
    :sswitch_d0
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->quit()V
    invoke-static {v10}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$500(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)V

    goto :goto_5b

    .line 183
    :sswitch_d6
    :try_start_d6
    iget v5, p1, Landroid/os/Message;->arg1:I

    .line 184
    .local v5, "format":I
    iget v6, p1, Landroid/os/Message;->arg2:I

    .line 185
    .local v6, "quality":I
    iget-object v10, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    invoke-direct {p0, v10, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->saveImage(Ljava/lang/String;II)V
    :try_end_e1
    .catch Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException; {:try_start_d6 .. :try_end_e1} :catch_e8

    .line 191
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->dispatchSaveComplete()V
    invoke-static {v10}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$600(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)V

    goto/16 :goto_5b

    .line 186
    .end local v5    # "format":I
    .end local v6    # "quality":I
    :catch_e8
    move-exception v4

    .line 187
    .restart local v4    # "e":Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    invoke-static {v10}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$000(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v10

    const-string v11, "handled save error: %s"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v4, v12, v13

    invoke-interface {v10, v11, v12}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 188
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService$InternalHandler;->this$0:Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->dispatchError(Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;)V
    invoke-static {v10, v4}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->access$300(Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;Lcom/adobe/creativesdk/aviary/internal/headless/AdobeImageExecutionException;)V

    goto/16 :goto_5b

    .line 125
    nop

    :sswitch_data_102
    .sparse-switch
        0x3e8 -> :sswitch_5c
        0x3e9 -> :sswitch_ba
        0x3ea -> :sswitch_d6
        0x3eb -> :sswitch_6f
        0x7cf -> :sswitch_d0
    .end sparse-switch
.end method
