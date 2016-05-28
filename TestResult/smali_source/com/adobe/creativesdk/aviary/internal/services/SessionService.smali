.class public Lcom/adobe/creativesdk/aviary/internal/services/SessionService;
.super Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;
.source "SessionService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;
    }
.end annotation


# instance fields
.field mDatabase:Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

.field private mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

.field private mLooper:Landroid/os/Looper;

.field private mThread:Landroid/os/HandlerThread;

.field private mUndoEnabled:Z

.field moaJavaUndo:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;

.field private running:Z


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V
    .registers 7
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V

    .line 52
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->isUndoRedoAvailable()Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mUndoEnabled:Z

    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "undoEnabled: %b"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mUndoEnabled:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 56
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "session-service-thread"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mThread:Landroid/os/HandlerThread;

    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 59
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;

    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mUndoEnabled:Z

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;-><init>(Z)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->moaJavaUndo:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;

    .line 60
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mDatabase:Lcom/adobe/creativesdk/aviary/internal/content/SessionDatabaseHelper;

    .line 61
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/internal/services/SessionService;)Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/services/SessionService;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    return-object v0
.end method

.method private removeAllMessages()V
    .registers 3

    .prologue
    .line 267
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "removeAllMessages"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 268
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 269
    return-void
.end method

.method private varargs removeMessages([I)V
    .registers 10
    .param p1, "what"    # [I

    .prologue
    const/4 v2, 0x0

    .line 272
    array-length v3, p1

    move v1, v2

    :goto_3
    if-ge v1, v3, :cond_1f

    aget v0, p1, v1

    .line 273
    .local v0, "arg":I
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "removeMessage: %d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 274
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    invoke-virtual {v4, v0}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->removeMessages(I)V

    .line 272
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 276
    .end local v0    # "arg":I
    :cond_1f
    return-void
.end method

.method private stop()V
    .registers 3

    .prologue
    .line 260
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->moaJavaUndo:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->dispose()V

    .line 261
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->removeAllMessages()V

    .line 262
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->sendEmptyMessage(I)Z

    .line 263
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->running:Z

    .line 264
    return-void
.end method


# virtual methods
.method public canRedo()Z
    .registers 2

    .prologue
    .line 244
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->getEnabled()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->moaJavaUndo:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->canRedo()Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public canUndo()Z
    .registers 2

    .prologue
    .line 239
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->getEnabled()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->moaJavaUndo:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->canUndo()Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public dispose()V
    .registers 1

    .prologue
    .line 256
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->stop()V

    .line 257
    return-void
.end method

.method public getEnabled()Z
    .registers 2

    .prologue
    .line 64
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mUndoEnabled:Z

    return v0
.end method

.method public isRunning()Z
    .registers 2

    .prologue
    .line 85
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->running:Z

    return v0
.end method

.method public load(Landroid/graphics/Bitmap;ILcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)V
    .registers 13
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "megapixels"    # I
    .param p3, "imageInfo"    # Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    .prologue
    const/4 v8, 0x0

    .line 89
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "load"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 91
    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->running:Z

    if-nez v4, :cond_d

    .line 122
    :goto_c
    return-void

    .line 95
    :cond_d
    const-wide/16 v2, 0x0

    .line 96
    .local v2, "ptr":J
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->getEnabled()Z

    move-result v4

    if-eqz v4, :cond_2b

    .line 97
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->moaJavaUndo:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;

    invoke-virtual {v4, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->load(Landroid/graphics/Bitmap;)J

    move-result-wide v2

    .line 98
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gtz v4, :cond_2b

    .line 99
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "failed to load bitmap, we have to disable session.service"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 100
    invoke-virtual {p0, v8}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->setEnabled(Z)V

    .line 104
    :cond_2b
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "result: %d"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 106
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->getEnabled()Z

    move-result v4

    if-eqz v4, :cond_66

    .line 107
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->removeAllMessages()V

    .line 109
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    const/4 v5, 0x2

    invoke-static {v4, v5}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    .line 111
    .local v1, "message":Landroid/os/Message;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 112
    .local v0, "data":Landroid/os/Bundle;
    const-string v4, "ptr"

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 113
    const-string v4, "bundle-megapixels"

    invoke-virtual {v0, v4, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 114
    const-string v4, "bundle-image-info"

    invoke-virtual {v0, v4, p3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 116
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 117
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_c

    .line 120
    .end local v0    # "data":Landroid/os/Bundle;
    .end local v1    # "message":Landroid/os/Message;
    :cond_66
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    invoke-virtual {v4, p3, p2}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hiResLoad(Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;I)V

    goto :goto_c
.end method

.method public push(Landroid/graphics/Bitmap;Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V
    .registers 13
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "editResultVO"    # Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 150
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "push: %s"

    new-array v6, v9, [Ljava/lang/Object;

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->getActionList()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 152
    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->running:Z

    if-nez v4, :cond_16

    .line 173
    :cond_15
    :goto_15
    return-void

    .line 156
    :cond_16
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->getEnabled()Z

    move-result v4

    if-eqz v4, :cond_58

    .line 157
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->moaJavaUndo:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;

    invoke-virtual {v4, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->push(Landroid/graphics/Bitmap;)J

    move-result-wide v2

    .line 158
    .local v2, "result":J
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "result: 0x%x"

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 160
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-lez v4, :cond_15

    .line 161
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 162
    .local v0, "data":Landroid/os/Bundle;
    const-string v4, "ptr"

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 163
    const-string v4, "bundle-actions"

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->getActionList()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 165
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    const/4 v5, 0x3

    invoke-static {v4, v5}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    .line 166
    .local v1, "message":Landroid/os/Message;
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 167
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_15

    .line 171
    .end local v0    # "data":Landroid/os/Bundle;
    .end local v1    # "message":Landroid/os/Message;
    .end local v2    # "result":J
    :cond_58
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->getActionList()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hiresApplyActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    goto :goto_15
.end method

.method public redo()Landroid/graphics/Bitmap;
    .registers 9

    .prologue
    const/4 v3, 0x0

    .line 216
    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->running:Z

    if-nez v4, :cond_6

    .line 234
    :cond_5
    :goto_5
    return-object v3

    .line 220
    :cond_6
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->getEnabled()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 221
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->moaJavaUndo:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->redo()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;

    move-result-object v2

    .line 222
    .local v2, "result":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "redo result: %s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 223
    if-eqz v2, :cond_5

    .line 225
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 226
    .local v0, "data":Landroid/os/Bundle;
    const-string v3, "ptr"

    iget-wide v4, v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;->ptr:J

    invoke-virtual {v0, v3, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 227
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    const/4 v4, 0x6

    invoke-static {v3, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    .line 228
    .local v1, "message":Landroid/os/Message;
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 229
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 231
    iget-object v3, v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;->bitmap:Landroid/graphics/Bitmap;

    goto :goto_5
.end method

.method public save(Ljava/lang/String;Landroid/graphics/Bitmap$CompressFormat;I)V
    .registers 9
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "format"    # Landroid/graphics/Bitmap$CompressFormat;
    .param p3, "quality"    # I

    .prologue
    const/16 v4, 0x9

    .line 279
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "save"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 281
    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->running:Z

    if-nez v2, :cond_e

    .line 299
    :goto_d
    return-void

    .line 285
    :cond_e
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->getEnabled()Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 286
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    invoke-virtual {v2, v4}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->removeMessages(I)V

    .line 288
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 289
    .local v0, "data":Landroid/os/Bundle;
    const-string v2, "path"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    const-string v2, "compress-format"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 291
    const-string v2, "quality"

    invoke-virtual {v0, v2, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 293
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    invoke-static {v2, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    .line 294
    .local v1, "message":Landroid/os/Message;
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 295
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_d

    .line 297
    .end local v0    # "data":Landroid/os/Bundle;
    .end local v1    # "message":Landroid/os/Message;
    :cond_3a
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    invoke-virtual {v2, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;->hiresSave(Ljava/lang/String;Landroid/graphics/Bitmap$CompressFormat;I)V

    goto :goto_d
.end method

.method setEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 68
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mUndoEnabled:Z

    .line 69
    return-void
.end method

.method public start()V
    .registers 4

    .prologue
    .line 72
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->running:Z

    if-nez v1, :cond_2b

    .line 73
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->running:Z

    .line 74
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mLooper:Landroid/os/Looper;

    .line 75
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mLooper:Landroid/os/Looper;

    invoke-direct {v1, p0, v2}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;-><init>(Lcom/adobe/creativesdk/aviary/internal/services/SessionService;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    .line 77
    const-class v1, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;

    .line 78
    .local v0, "service":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
    if-eqz v0, :cond_2b

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->isRunning()Z

    move-result v1

    if-nez v1, :cond_2b

    .line 79
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;->start()V

    .line 82
    .end local v0    # "service":Lcom/adobe/creativesdk/aviary/internal/services/HiResBackgroundService;
    :cond_2b
    return-void
.end method

.method public undo()Landroid/graphics/Bitmap;
    .registers 9

    .prologue
    const/4 v3, 0x0

    .line 190
    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->running:Z

    if-nez v4, :cond_6

    .line 211
    :cond_5
    :goto_5
    return-object v3

    .line 194
    :cond_6
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->getEnabled()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 195
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->moaJavaUndo:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->undo()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;

    move-result-object v2

    .line 196
    .local v2, "result":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "undo result: %s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v2, v6, v7

    invoke-interface {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 198
    if-eqz v2, :cond_5

    .line 200
    const/4 v3, 0x2

    new-array v3, v3, [I

    fill-array-data v3, :array_46

    invoke-direct {p0, v3}, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->removeMessages([I)V

    .line 202
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 203
    .local v0, "data":Landroid/os/Bundle;
    const-string v3, "ptr"

    iget-wide v4, v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;->ptr:J

    invoke-virtual {v0, v3, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 204
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/SessionService;->mInternalHandler:Lcom/adobe/creativesdk/aviary/internal/services/SessionService$SessionServiceHandler;

    const/4 v4, 0x5

    invoke-static {v3, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    .line 205
    .local v1, "message":Landroid/os/Message;
    invoke-virtual {v1, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 206
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 208
    iget-object v3, v2, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;->bitmap:Landroid/graphics/Bitmap;

    goto :goto_5

    .line 200
    :array_46
    .array-data 4
        0x5
        0x7
    .end array-data
.end method
