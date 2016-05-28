.class public Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;
.source "NativeVignetteToolFilter.java"


# instance fields
.field private final lock:Ljava/lang/Object;

.field private mBitmap:Landroid/graphics/Bitmap;

.field private final mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

.field private mScale:I

.field private n_ptr:J


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 23
    const-string v0, "vignette"

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;-><init>(Ljava/lang/String;)V

    .line 14
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->lock:Ljava/lang/Object;

    .line 17
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->n_ptr:J

    .line 19
    const/4 v0, 0x1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mScale:I

    .line 24
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->nativeCtor()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->n_ptr:J

    .line 26
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    .line 27
    return-void
.end method

.method private clearBitmapAlreadyLocked()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 57
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->n_ptr:J

    invoke-virtual {p0, v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->nativeSetBitmap(JLandroid/graphics/Bitmap;)Z

    .line 58
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_17

    .line 59
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 61
    :cond_17
    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mBitmap:Landroid/graphics/Bitmap;

    .line 62
    return-void
.end method


# virtual methods
.method public clearBitmap()V
    .registers 3

    .prologue
    .line 51
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 52
    :try_start_3
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->clearBitmapAlreadyLocked()V

    .line 53
    monitor-exit v1

    .line 54
    return-void

    .line 53
    :catchall_8
    move-exception v0

    monitor-exit v1
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_8

    throw v0
.end method

.method public createBitmap(III)V
    .registers 10
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "scale"    # I

    .prologue
    .line 30
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 31
    :try_start_3
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->clearBitmapAlreadyLocked()V

    .line 32
    div-int v0, p1, p3

    div-int v2, p2, p3

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mBitmap:Landroid/graphics/Bitmap;

    .line 33
    iput p3, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mScale:I

    .line 35
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v2, "bitmapscale"

    invoke-virtual {v0, v2, p3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;I)V

    .line 36
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v2, "previewsize"

    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    int-to-float v4, p1

    int-to-float v5, p2

    invoke-direct {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(FF)V

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 38
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->n_ptr:J

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v2, v3, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->nativeSetBitmap(JLandroid/graphics/Bitmap;)Z

    move-result v0

    if-nez v0, :cond_3a

    .line 39
    const-string v0, "VignetteToolFilter"

    const-string v2, "nativeSetBitmap returned false!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    :cond_3a
    monitor-exit v1

    .line 42
    return-void

    .line 41
    :catchall_3c
    move-exception v0

    monitor-exit v1
    :try_end_3e
    .catchall {:try_start_3 .. :try_end_3e} :catchall_3c

    throw v0
.end method

.method public dispose()V
    .registers 7

    .prologue
    const-wide/16 v4, 0x0

    .line 91
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 92
    :try_start_5
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->n_ptr:J

    cmp-long v0, v2, v4

    if-eqz v0, :cond_13

    .line 93
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->clearBitmap()V

    .line 94
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->n_ptr:J

    invoke-virtual {p0, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->nativeDispose(J)V

    .line 96
    :cond_13
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->n_ptr:J

    .line 97
    monitor-exit v1

    .line 98
    return-void

    .line 97
    :catchall_19
    move-exception v0

    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_5 .. :try_end_1b} :catchall_19

    throw v0
.end method

.method public getBitmap()Landroid/graphics/Bitmap;
    .registers 3

    .prologue
    .line 45
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->lock:Ljava/lang/Object;

    monitor-enter v1

    .line 46
    :try_start_3
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mBitmap:Landroid/graphics/Bitmap;

    monitor-exit v1

    return-object v0

    .line 47
    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method native nativeCtor()J
.end method

.method native nativeDispose(J)V
.end method

.method native nativeRenderPreview(JFFFFIF)Z
.end method

.method native nativeSetBitmap(JLandroid/graphics/Bitmap;)Z
.end method

.method public renderPreview(Landroid/graphics/RectF;IF)Z
    .registers 15
    .param p1, "rect"    # Landroid/graphics/RectF;
    .param p2, "intensity"    # I
    .param p3, "feather"    # F

    .prologue
    .line 74
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->n_ptr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_5d

    .line 75
    iget-object v10, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->lock:Ljava/lang/Object;

    monitor-enter v10

    .line 76
    :try_start_b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_5c

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_5c

    .line 77
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "left"

    iget v2, p1, Landroid/graphics/RectF;->left:F

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;F)V

    .line 78
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "top"

    iget v2, p1, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;F)V

    .line 79
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "right"

    iget v2, p1, Landroid/graphics/RectF;->right:F

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;F)V

    .line 80
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "bottom"

    iget v2, p1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;F)V

    .line 81
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "intensity"

    invoke-virtual {v0, v1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;I)V

    .line 82
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "feather"

    invoke-virtual {v0, v1, p3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;F)V

    .line 83
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->n_ptr:J

    iget v4, p1, Landroid/graphics/RectF;->left:F

    iget v5, p1, Landroid/graphics/RectF;->top:F

    iget v6, p1, Landroid/graphics/RectF;->right:F

    iget v7, p1, Landroid/graphics/RectF;->bottom:F

    move-object v1, p0

    move v8, p2

    move v9, p3

    invoke-virtual/range {v1 .. v9}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;->nativeRenderPreview(JFFFFIF)Z

    move-result v0

    monitor-exit v10

    .line 87
    :goto_5b
    return v0

    .line 85
    :cond_5c
    monitor-exit v10

    .line 87
    :cond_5d
    const/4 v0, 0x0

    goto :goto_5b

    .line 85
    :catchall_5f
    move-exception v0

    monitor-exit v10
    :try_end_61
    .catchall {:try_start_b .. :try_end_61} :catchall_5f

    throw v0
.end method
