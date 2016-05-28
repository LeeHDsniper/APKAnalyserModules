.class public Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;
.super Ljava/lang/Object;
.source "MoaJavaUndo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;
    }
.end annotation


# instance fields
.field private ptr:J


# direct methods
.method public constructor <init>(Z)V
    .registers 5
    .param p1, "enabled"    # Z

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    .line 37
    const-string v0, "MoaJavaUndo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "enabled: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    if-eqz p1, :cond_27

    .line 40
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->nativeCtor()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    .line 42
    :cond_27
    return-void
.end method

.method static native nativeBytesCount(J)J
.end method

.method static native nativeCanRedo(J)Z
.end method

.method static native nativeCanUndo(J)Z
.end method

.method static native nativeClear(J)V
.end method

.method static native nativeCtor()J
.end method

.method static native nativeDispose(J)V
.end method

.method static native nativePush(JLandroid/graphics/Bitmap;)J
.end method

.method static native nativeRedo(JLcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;)Z
.end method

.method static native nativeSize(J)I
.end method

.method static native nativeUndo(JLcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;)Z
.end method


# virtual methods
.method public canRedo()Z
    .registers 5

    .prologue
    .line 122
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_f

    .line 123
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->nativeCanRedo(J)Z

    move-result v0

    .line 125
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public canUndo()Z
    .registers 5

    .prologue
    .line 115
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_f

    .line 116
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->nativeCanUndo(J)Z

    move-result v0

    .line 118
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public dispose()V
    .registers 5

    .prologue
    const-wide/16 v2, 0x0

    .line 84
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_f

    .line 85
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->nativeDispose(J)V

    .line 86
    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    .line 88
    :cond_f
    return-void
.end method

.method public load(Landroid/graphics/Bitmap;)J
    .registers 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const-wide/16 v0, 0x0

    .line 49
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    cmp-long v2, v2, v0

    if-lez v2, :cond_11

    .line 50
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->nativeClear(J)V

    .line 51
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->push(Landroid/graphics/Bitmap;)J

    move-result-wide v0

    .line 53
    :cond_11
    return-wide v0
.end method

.method public push(Landroid/graphics/Bitmap;)J
    .registers 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    const-wide/16 v0, 0x0

    .line 57
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    cmp-long v2, v2, v0

    if-lez v2, :cond_e

    .line 58
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    invoke-static {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->nativePush(JLandroid/graphics/Bitmap;)J

    move-result-wide v0

    .line 60
    :cond_e
    return-wide v0
.end method

.method public redo()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;
    .registers 7

    .prologue
    .line 91
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_44

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->canRedo()Z

    move-result v2

    if-eqz v2, :cond_44

    .line 92
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;-><init>()V

    .line 93
    .local v0, "output":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    invoke-static {v2, v3, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->nativeRedo(JLcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;)Z

    move-result v1

    .line 94
    .local v1, "result":Z
    const-string v2, "MoaJavaUndo"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "redo result: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", output: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    if-eqz v1, :cond_44

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_44

    .line 99
    .end local v0    # "output":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;
    .end local v1    # "result":Z
    :goto_43
    return-object v0

    :cond_44
    const/4 v0, 0x0

    goto :goto_43
.end method

.method public undo()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;
    .registers 7

    .prologue
    .line 103
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_44

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->canUndo()Z

    move-result v2

    if-eqz v2, :cond_44

    .line 104
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;-><init>()V

    .line 105
    .local v0, "output":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->ptr:J

    invoke-static {v2, v3, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo;->nativeUndo(JLcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;)Z

    move-result v1

    .line 106
    .local v1, "result":Z
    const-string v2, "MoaJavaUndo"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "undo result: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", output: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    if-eqz v1, :cond_44

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_44

    .line 111
    .end local v0    # "output":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaJavaUndo$MoaUndoBitmap;
    .end local v1    # "result":Z
    :goto_43
    return-object v0

    :cond_44
    const/4 v0, 0x0

    goto :goto_43
.end method
