.class public final Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;
.super Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;
.source "NativeToolFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;,
        Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;,
        Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;
    }
.end annotation


# instance fields
.field private mBitmapRect:Landroid/graphics/Rect;

.field private final mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

.field private final mType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;

.field private n_ptr:J

.field protected strokes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;)V
    .registers 6
    .param p1, "toolname"    # Ljava/lang/String;
    .param p2, "type"    # Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;

    .prologue
    const/4 v2, 0x0

    .line 51
    const-string v0, "tools"

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilter;-><init>(Ljava/lang/String;)V

    .line 41
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->n_ptr:J

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->strokes:Ljava/util/List;

    .line 53
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;

    .line 54
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;->name()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->nativeCtor(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->n_ptr:J

    .line 55
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mBitmapRect:Landroid/graphics/Rect;

    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    .line 58
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v1, "toolname"

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;->TiltShift:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;

    if-ne p2, v0, :cond_49

    .line 61
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->None:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->setTiltShiftMode(Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;)Z

    .line 66
    :goto_48
    return-void

    .line 63
    :cond_49
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->None:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->setBrushMode(Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;)Z

    .line 64
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mActions:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->get(I)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    move-result-object v0

    const-string v1, "strokes"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->strokes:Ljava/util/List;

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/util/Collection;)V

    goto :goto_48
.end method


# virtual methods
.method public addStrokeData(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;)V
    .registers 3
    .param p1, "data"    # Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaStrokeParameter;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->strokes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    return-void
.end method

.method public declared-synchronized dispose()V
    .registers 3

    .prologue
    .line 177
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->valid()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 178
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->n_ptr:J

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->nativeDispose(J)V

    .line 179
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->n_ptr:J
    :try_end_10
    .catchall {:try_start_1 .. :try_end_10} :catchall_12

    .line 181
    :cond_10
    monitor-exit p0

    return-void

    .line 177
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public varargs draw(DDIZLcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;[F)[F
    .registers 24
    .param p1, "radius"    # D
    .param p3, "angle"    # D
    .param p5, "startIndex"    # I
    .param p6, "isCompleted"    # Z
    .param p7, "result"    # Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;
    .param p8, "points"    # [F

    .prologue
    .line 147
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->valid()Z

    move-result v2

    if-eqz v2, :cond_4d

    .line 148
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mType:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;->TiltShift:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;

    if-ne v2, v3, :cond_32

    .line 149
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v3, "x"

    const/4 v4, 0x0

    aget v4, p8, v4

    invoke-virtual {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;F)V

    .line 150
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v3, "y"

    const/4 v4, 0x1

    aget v4, p8, v4

    invoke-virtual {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;F)V

    .line 151
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v3, "radius"

    move-wide/from16 v0, p1

    invoke-virtual {v2, v3, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    .line 152
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v3, "angle"

    move-wide/from16 v0, p3

    invoke-virtual {v2, v3, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;D)V

    .line 156
    :cond_32
    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->n_ptr:J

    if-eqz p7, :cond_4a

    invoke-virtual/range {p7 .. p7}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->getPointer()J

    move-result-wide v13

    :goto_3a
    move-object v3, p0

    move-wide/from16 v6, p1

    move-wide/from16 v8, p3

    move/from16 v10, p5

    move/from16 v11, p6

    move-object/from16 v12, p8

    invoke-virtual/range {v3 .. v14}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->nativeDraw(JDDIZ[FJ)[F

    move-result-object v2

    .line 158
    :goto_49
    return-object v2

    .line 156
    :cond_4a
    const-wide/16 v13, 0x0

    goto :goto_3a

    .line 158
    :cond_4d
    const/4 v2, 0x0

    goto :goto_49
.end method

.method public varargs draw(DDIZ[F)[F
    .registers 19
    .param p1, "radius"    # D
    .param p3, "angle"    # D
    .param p5, "startIndex"    # I
    .param p6, "isCompleted"    # Z
    .param p7, "points"    # [F

    .prologue
    .line 142
    const/4 v8, 0x0

    move-object v1, p0

    move-wide v2, p1

    move-wide v4, p3

    move/from16 v6, p5

    move/from16 v7, p6

    move-object/from16 v9, p7

    invoke-virtual/range {v1 .. v9}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->draw(DDIZLcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;[F)[F

    move-result-object v0

    return-object v0
.end method

.method public drawStart(DDDDLcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;)Z
    .registers 25
    .param p1, "radius"    # D
    .param p3, "angle"    # D
    .param p5, "x"    # D
    .param p7, "y"    # D
    .param p9, "result"    # Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;

    .prologue
    .line 135
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->valid()Z

    move-result v0

    if-eqz v0, :cond_24

    .line 136
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->n_ptr:J

    if-eqz p9, :cond_1f

    invoke-virtual/range {p9 .. p9}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->getPointer()J

    move-result-wide v12

    :goto_e
    move-object v1, p0

    move-wide/from16 v4, p1

    move-wide/from16 v6, p3

    move-wide/from16 v8, p5

    move-wide/from16 v10, p7

    invoke-virtual/range {v1 .. v13}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->nativeDrawStart(JDDDDJ)I

    move-result v0

    if-nez v0, :cond_22

    const/4 v0, 0x1

    .line 138
    :goto_1e
    return v0

    .line 136
    :cond_1f
    const-wide/16 v12, 0x0

    goto :goto_e

    :cond_22
    const/4 v0, 0x0

    goto :goto_1e

    .line 138
    :cond_24
    const/4 v0, 0x0

    goto :goto_1e
.end method

.method protected finalize()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 185
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->dispose()V

    .line 186
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 187
    return-void
.end method

.method public init(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)I
    .registers 10
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "preview"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v6, 0x0

    const/4 v0, -0x1

    .line 94
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->valid()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 95
    if-nez p1, :cond_b

    .line 106
    :cond_a
    :goto_a
    return v0

    .line 96
    :cond_b
    if-eqz p2, :cond_21

    .line 97
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    if-ne v1, v2, :cond_a

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    if-ne v1, v2, :cond_a

    .line 99
    :cond_21
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->n_ptr:J

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->nativeInit(JLandroid/graphics/Bitmap;Landroid/graphics/Bitmap;)I

    move-result v0

    .line 100
    .local v0, "result":I
    if-nez v0, :cond_a

    .line 101
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v2, "previewsize"

    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    invoke-direct {v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;-><init>(FF)V

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaParameter;)V

    .line 102
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mBitmapRect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-virtual {v1, v6, v6, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_a
.end method

.method native nativeCtor(Ljava/lang/String;)J
.end method

.method native nativeDispose(J)V
.end method

.method native nativeDraw(JDDIZ[FJ)[F
.end method

.method native nativeDrawStart(JDDDDJ)I
.end method

.method native nativeInit(JLandroid/graphics/Bitmap;Landroid/graphics/Bitmap;)I
.end method

.method native nativeRenderPreview(JIIII)I
.end method

.method native nativeSetBrushMode(JLjava/lang/String;)I
.end method

.method native nativeSetTiltShiftMode(JLjava/lang/String;)I
.end method

.method public renderPreview()Z
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 119
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mBitmapRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mBitmapRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, v2, v2, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->renderPreview(IIII)Z

    move-result v0

    return v0
.end method

.method public renderPreview(IIII)Z
    .registers 13
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 110
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->valid()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 111
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->n_ptr:J

    move-object v1, p0

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    invoke-virtual/range {v1 .. v7}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->nativeRenderPreview(JIIII)I

    move-result v0

    if-nez v0, :cond_15

    .line 112
    const/4 v0, 0x1

    .line 115
    :goto_14
    return v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public renderPreview(Landroid/graphics/Rect;)Z
    .registers 6
    .param p1, "rect"    # Landroid/graphics/Rect;

    .prologue
    .line 123
    iget v0, p1, Landroid/graphics/Rect;->left:I

    iget v1, p1, Landroid/graphics/Rect;->top:I

    iget v2, p1, Landroid/graphics/Rect;->right:I

    iget v3, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->renderPreview(IIII)Z

    move-result v0

    return v0
.end method

.method public renderPreview(Landroid/graphics/RectF;)Z
    .registers 6
    .param p1, "rect"    # Landroid/graphics/RectF;

    .prologue
    .line 127
    iget v0, p1, Landroid/graphics/RectF;->left:F

    float-to-int v0, v0

    iget v1, p1, Landroid/graphics/RectF;->top:F

    float-to-int v1, v1

    iget v2, p1, Landroid/graphics/RectF;->right:F

    float-to-int v2, v2

    iget v3, p1, Landroid/graphics/RectF;->bottom:F

    float-to-int v3, v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->renderPreview(IIII)Z

    move-result v0

    return v0
.end method

.method public setBrushMode(Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;)Z
    .registers 7
    .param p1, "mode"    # Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    .prologue
    const/4 v0, 0x0

    .line 170
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->valid()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 171
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->n_ptr:J

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->name()Ljava/lang/String;

    move-result-object v1

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v2, v3, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->nativeSetBrushMode(JLjava/lang/String;)I

    move-result v1

    if-nez v1, :cond_1a

    const/4 v0, 0x1

    .line 173
    :cond_1a
    return v0
.end method

.method public setTiltShiftMode(Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;)Z
    .registers 7
    .param p1, "mode"    # Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;

    .prologue
    const/4 v0, 0x0

    .line 162
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->valid()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 163
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->mFirstAction:Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;

    const-string v2, "tiltshiftmode"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->name()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaAction;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->n_ptr:J

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$TiltShiftMode;->name()Ljava/lang/String;

    move-result-object v1

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v2, v3, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->nativeSetTiltShiftMode(JLjava/lang/String;)I

    move-result v1

    if-nez v1, :cond_2b

    const/4 v0, 0x1

    .line 166
    :cond_2b
    return v0
.end method

.method public valid()Z
    .registers 5

    .prologue
    .line 90
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;->n_ptr:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
