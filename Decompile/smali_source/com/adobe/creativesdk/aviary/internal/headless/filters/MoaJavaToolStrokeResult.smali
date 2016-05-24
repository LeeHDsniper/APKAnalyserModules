.class public Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;
.super Ljava/lang/Object;
.source "MoaJavaToolStrokeResult.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;


# instance fields
.field private n_ptr:J


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 22
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->nativeCtor()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;-><init>(J)V

    .line 23
    return-void
.end method

.method constructor <init>(J)V
    .registers 6
    .param p1, "pointer"    # J

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->n_ptr:J

    .line 26
    const-string v0, "MoaJavaToolStrokeResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MoaJavaToolStrokeResult("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->n_ptr:J

    .line 28
    return-void
.end method

.method static native nativeClone(J)J
.end method

.method static native nativeCtor()J
.end method

.method static native nativeDispose(J)V
.end method

.method static native nativeGetBrushMode(J)I
.end method

.method static native nativeGetColorSelected(J)I
.end method

.method static native nativeGetOffsetPointX(J)F
.end method

.method static native nativeGetOffsetPointY(J)F
.end method

.method static native nativeSetBrushMode(JI)V
.end method

.method static native nativeSetColorSelected(JI)V
.end method

.method static native nativeSetOffsetPoint(JFF)V
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 87
    const-string v2, "MoaJavaToolStrokeResult"

    const-string v3, "clone"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->n_ptr:J

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->nativeClone(J)J

    move-result-wide v0

    .line 90
    .local v0, "newPointer":J
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;

    invoke-direct {v2, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;-><init>(J)V

    return-object v2
.end method

.method public encode()Lorg/json/JSONObject;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 114
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->getOffsetPoint()Landroid/graphics/PointF;

    move-result-object v1

    .line 116
    .local v1, "point":Landroid/graphics/PointF;
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 117
    .local v0, "object":Lorg/json/JSONObject;
    const-string v2, "colorselected"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->getColorSelected()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 118
    const-string v2, "brushmode"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->getBrushMode()Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->ordinal()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 119
    const-string v2, "offsetpoint"

    iget v3, v1, Landroid/graphics/PointF;->x:F

    iget v4, v1, Landroid/graphics/PointF;->y:F

    invoke-static {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaPointParameter;->encode(FF)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 120
    return-object v0
.end method

.method protected finalize()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 36
    const-string v0, "MoaJavaToolStrokeResult"

    const-string v1, "finalize"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->n_ptr:J

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->nativeDispose(J)V

    .line 38
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 39
    return-void
.end method

.method public getBrushMode()Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;
    .registers 5

    .prologue
    .line 52
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->n_ptr:J

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->nativeGetBrushMode(J)I

    move-result v0

    .line 53
    .local v0, "mode":I
    if-ltz v0, :cond_f

    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->values()[Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    move-result-object v1

    array-length v1, v1

    if-lt v0, v1, :cond_11

    .line 54
    :cond_f
    const/4 v1, 0x0

    .line 56
    :goto_10
    return-object v1

    :cond_11
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->values()[Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    move-result-object v1

    aget-object v1, v1, v0

    goto :goto_10
.end method

.method public getColorSelected()I
    .registers 3

    .prologue
    .line 42
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->n_ptr:J

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->nativeGetColorSelected(J)I

    move-result v0

    return v0
.end method

.method public getOffsetPoint()Landroid/graphics/PointF;
    .registers 5

    .prologue
    .line 46
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->n_ptr:J

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->nativeGetOffsetPointX(J)F

    move-result v0

    .line 47
    .local v0, "x":F
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->n_ptr:J

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->nativeGetOffsetPointY(J)F

    move-result v1

    .line 48
    .local v1, "y":F
    new-instance v2, Landroid/graphics/PointF;

    invoke-direct {v2, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v2
.end method

.method public getPointer()J
    .registers 3

    .prologue
    .line 31
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->n_ptr:J

    return-wide v0
.end method

.method public setBrushMode(Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;)V
    .registers 5
    .param p1, "mode"    # Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    .prologue
    .line 71
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->n_ptr:J

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;->ordinal()I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->nativeSetBrushMode(JI)V

    .line 72
    return-void
.end method

.method public setColorSelected(I)V
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 61
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->n_ptr:J

    invoke-static {v0, v1, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->nativeSetColorSelected(JI)V

    .line 62
    return-void
.end method

.method public setOffsetPoint(FF)V
    .registers 5
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 66
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->n_ptr:J

    invoke-static {v0, v1, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->nativeSetOffsetPoint(JFF)V

    .line 67
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 76
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->n_ptr:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-eqz v1, :cond_54

    .line 77
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->getOffsetPoint()Landroid/graphics/PointF;

    move-result-object v0

    .line 78
    .local v0, "point":Landroid/graphics/PointF;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MoaJavaToolStrokeResult [colorSelected: 0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->getColorSelected()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", offsetPoint: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Landroid/graphics/PointF;->x:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", brushMode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 79
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/MoaJavaToolStrokeResult;->getBrushMode()Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$BrushMode;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 81
    .end local v0    # "point":Landroid/graphics/PointF;
    :goto_53
    return-object v1

    :cond_54
    const-string v1, "MoaJavaToolStrokeResult{NULL}"

    goto :goto_53
.end method
