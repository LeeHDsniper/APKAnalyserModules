.class public final Lcom/nineoldandroids/view/animation/AnimatorProxy;
.super Landroid/view/animation/Animation;
.source "AnimatorProxy.java"


# static fields
.field public static final NEEDS_PROXY:Z

.field private static final PROXIES:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Landroid/view/View;",
            "Lcom/nineoldandroids/view/animation/AnimatorProxy;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mAfter:Landroid/graphics/RectF;

.field private mAlpha:F

.field private final mBefore:Landroid/graphics/RectF;

.field private final mCamera:Landroid/graphics/Camera;

.field private mHasPivot:Z

.field private mPivotX:F

.field private mPivotY:F

.field private mRotationX:F

.field private mRotationY:F

.field private mRotationZ:F

.field private mScaleX:F

.field private mScaleY:F

.field private final mTempMatrix:Landroid/graphics/Matrix;

.field private mTranslationX:F

.field private mTranslationY:F

.field private final mView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 21
    sget-object v0, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0xb

    if-ge v0, v1, :cond_19

    const/4 v0, 0x1

    :goto_f
    sput-boolean v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->NEEDS_PROXY:Z

    .line 23
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->PROXIES:Ljava/util/WeakHashMap;

    return-void

    .line 21
    :cond_19
    const/4 v0, 0x0

    goto :goto_f
.end method

.method private constructor <init>(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/high16 v1, 0x3f800000

    .line 63
    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    .line 45
    new-instance v0, Landroid/graphics/Camera;

    invoke-direct {v0}, Landroid/graphics/Camera;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mCamera:Landroid/graphics/Camera;

    .line 48
    iput v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mAlpha:F

    .line 54
    iput v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mScaleX:F

    .line 55
    iput v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mScaleY:F

    .line 59
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mBefore:Landroid/graphics/RectF;

    .line 60
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mAfter:Landroid/graphics/RectF;

    .line 61
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mTempMatrix:Landroid/graphics/Matrix;

    .line 64
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->setDuration(J)V

    .line 65
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->setFillAfter(Z)V

    .line 66
    invoke-virtual {p1, p0}, Landroid/view/View;->setAnimation(Landroid/view/animation/Animation;)V

    .line 67
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mView:Ljava/lang/ref/WeakReference;

    .line 68
    return-void
.end method

.method private computeRect(Landroid/graphics/RectF;Landroid/view/View;)V
    .registers 9
    .param p1, "r"    # Landroid/graphics/RectF;
    .param p2, "view"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x0

    .line 254
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v4

    int-to-float v3, v4

    .line 255
    .local v3, "w":F
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v4

    int-to-float v1, v4

    .line 258
    .local v1, "h":F
    invoke-virtual {p1, v5, v5, v3, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 260
    iget-object v2, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mTempMatrix:Landroid/graphics/Matrix;

    .line 261
    .local v2, "m":Landroid/graphics/Matrix;
    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    .line 262
    invoke-direct {p0, v2, p2}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->transformMatrix(Landroid/graphics/Matrix;Landroid/view/View;)V

    .line 263
    iget-object v4, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v4, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 265
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p1, v4, v5}, Landroid/graphics/RectF;->offset(FF)V

    .line 268
    iget v4, p1, Landroid/graphics/RectF;->right:F

    iget v5, p1, Landroid/graphics/RectF;->left:F

    cmpg-float v4, v4, v5

    if-gez v4, :cond_38

    .line 269
    iget v0, p1, Landroid/graphics/RectF;->right:F

    .line 270
    .local v0, "f":F
    iget v4, p1, Landroid/graphics/RectF;->left:F

    iput v4, p1, Landroid/graphics/RectF;->right:F

    .line 271
    iput v0, p1, Landroid/graphics/RectF;->left:F

    .line 273
    .end local v0    # "f":F
    :cond_38
    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    iget v5, p1, Landroid/graphics/RectF;->top:F

    cmpg-float v4, v4, v5

    if-gez v4, :cond_48

    .line 274
    iget v0, p1, Landroid/graphics/RectF;->top:F

    .line 275
    .restart local v0    # "f":F
    iget v4, p1, Landroid/graphics/RectF;->bottom:F

    iput v4, p1, Landroid/graphics/RectF;->top:F

    .line 276
    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    .line 278
    .end local v0    # "f":F
    :cond_48
    return-void
.end method

.method private invalidateAfterUpdate()V
    .registers 9

    .prologue
    .line 236
    iget-object v2, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 237
    .local v1, "view":Landroid/view/View;
    if-eqz v1, :cond_10

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-nez v2, :cond_11

    .line 250
    :cond_10
    :goto_10
    return-void

    .line 241
    :cond_11
    iget-object v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mAfter:Landroid/graphics/RectF;

    .line 242
    .local v0, "after":Landroid/graphics/RectF;
    invoke-direct {p0, v0, v1}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->computeRect(Landroid/graphics/RectF;Landroid/view/View;)V

    .line 243
    iget-object v2, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mBefore:Landroid/graphics/RectF;

    invoke-virtual {v0, v2}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    .line 245
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    iget v3, v0, Landroid/graphics/RectF;->left:F

    float-to-double v4, v3

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v3, v4

    iget v4, v0, Landroid/graphics/RectF;->top:F

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v4, v4

    iget v5, v0, Landroid/graphics/RectF;->right:F

    float-to-double v6, v5

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v5, v6

    iget v6, v0, Landroid/graphics/RectF;->bottom:F

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v6, v6

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/view/View;->invalidate(IIII)V

    goto :goto_10
.end method

.method private prepareForUpdate()V
    .registers 3

    .prologue
    .line 230
    iget-object v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 231
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_f

    .line 232
    iget-object v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mBefore:Landroid/graphics/RectF;

    invoke-direct {p0, v1, v0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->computeRect(Landroid/graphics/RectF;Landroid/view/View;)V

    .line 234
    :cond_f
    return-void
.end method

.method private transformMatrix(Landroid/graphics/Matrix;Landroid/view/View;)V
    .registers 19
    .param p1, "m"    # Landroid/graphics/Matrix;
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 281
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getWidth()I

    move-result v14

    int-to-float v13, v14

    .line 282
    .local v13, "w":F
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getHeight()I

    move-result v14

    int-to-float v2, v14

    .line 283
    .local v2, "h":F
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mHasPivot:Z

    .line 284
    .local v3, "hasPivot":Z
    if-eqz v3, :cond_96

    move-object/from16 v0, p0

    iget v4, v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mPivotX:F

    .line 285
    .local v4, "pX":F
    :goto_14
    if-eqz v3, :cond_9c

    move-object/from16 v0, p0

    iget v5, v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mPivotY:F

    .line 287
    .local v5, "pY":F
    :goto_1a
    move-object/from16 v0, p0

    iget v6, v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mRotationX:F

    .line 288
    .local v6, "rX":F
    move-object/from16 v0, p0

    iget v7, v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mRotationY:F

    .line 289
    .local v7, "rY":F
    move-object/from16 v0, p0

    iget v8, v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mRotationZ:F

    .line 290
    .local v8, "rZ":F
    const/4 v14, 0x0

    cmpl-float v14, v6, v14

    if-nez v14, :cond_35

    const/4 v14, 0x0

    cmpl-float v14, v7, v14

    if-nez v14, :cond_35

    const/4 v14, 0x0

    cmpl-float v14, v8, v14

    if-eqz v14, :cond_5a

    .line 291
    :cond_35
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mCamera:Landroid/graphics/Camera;

    .line 292
    .local v1, "camera":Landroid/graphics/Camera;
    invoke-virtual {v1}, Landroid/graphics/Camera;->save()V

    .line 293
    invoke-virtual {v1, v6}, Landroid/graphics/Camera;->rotateX(F)V

    .line 294
    invoke-virtual {v1, v7}, Landroid/graphics/Camera;->rotateY(F)V

    .line 295
    neg-float v14, v8

    invoke-virtual {v1, v14}, Landroid/graphics/Camera;->rotateZ(F)V

    .line 296
    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Landroid/graphics/Camera;->getMatrix(Landroid/graphics/Matrix;)V

    .line 297
    invoke-virtual {v1}, Landroid/graphics/Camera;->restore()V

    .line 298
    neg-float v14, v4

    neg-float v15, v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 299
    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 302
    .end local v1    # "camera":Landroid/graphics/Camera;
    :cond_5a
    move-object/from16 v0, p0

    iget v11, v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mScaleX:F

    .line 303
    .local v11, "sX":F
    move-object/from16 v0, p0

    iget v12, v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mScaleY:F

    .line 304
    .local v12, "sY":F
    const/high16 v14, 0x3f800000

    cmpl-float v14, v11, v14

    if-nez v14, :cond_6e

    const/high16 v14, 0x3f800000

    cmpl-float v14, v12, v14

    if-eqz v14, :cond_88

    .line 305
    :cond_6e
    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v12}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 306
    div-float v14, v4, v13

    neg-float v14, v14

    mul-float v15, v11, v13

    sub-float/2addr v15, v13

    mul-float v9, v14, v15

    .line 307
    .local v9, "sPX":F
    div-float v14, v5, v2

    neg-float v14, v14

    mul-float v15, v12, v2

    sub-float/2addr v15, v2

    mul-float v10, v14, v15

    .line 308
    .local v10, "sPY":F
    move-object/from16 v0, p1

    invoke-virtual {v0, v9, v10}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 311
    .end local v9    # "sPX":F
    .end local v10    # "sPY":F
    :cond_88
    move-object/from16 v0, p0

    iget v14, v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mTranslationX:F

    move-object/from16 v0, p0

    iget v15, v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mTranslationY:F

    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 312
    return-void

    .line 284
    .end local v4    # "pX":F
    .end local v5    # "pY":F
    .end local v6    # "rX":F
    .end local v7    # "rY":F
    .end local v8    # "rZ":F
    .end local v11    # "sX":F
    .end local v12    # "sY":F
    :cond_96
    const/high16 v14, 0x40000000

    div-float v4, v13, v14

    goto/16 :goto_14

    .line 285
    .restart local v4    # "pX":F
    :cond_9c
    const/high16 v14, 0x40000000

    div-float v5, v2, v14

    goto/16 :goto_1a
.end method

.method public static wrap(Landroid/view/View;)Lcom/nineoldandroids/view/animation/AnimatorProxy;
    .registers 3
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 35
    sget-object v1, Lcom/nineoldandroids/view/animation/AnimatorProxy;->PROXIES:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;

    .line 37
    .local v0, "proxy":Lcom/nineoldandroids/view/animation/AnimatorProxy;
    if-eqz v0, :cond_10

    invoke-virtual {p0}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v1

    if-eq v0, v1, :cond_1a

    .line 38
    :cond_10
    new-instance v0, Lcom/nineoldandroids/view/animation/AnimatorProxy;

    .end local v0    # "proxy":Lcom/nineoldandroids/view/animation/AnimatorProxy;
    invoke-direct {v0, p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;-><init>(Landroid/view/View;)V

    .line 39
    .restart local v0    # "proxy":Lcom/nineoldandroids/view/animation/AnimatorProxy;
    sget-object v1, Lcom/nineoldandroids/view/animation/AnimatorProxy;->PROXIES:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    :cond_1a
    return-object v0
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .registers 5
    .param p1, "interpolatedTime"    # F
    .param p2, "t"    # Landroid/view/animation/Transformation;

    .prologue
    .line 316
    iget-object v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 317
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_16

    .line 318
    iget v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mAlpha:F

    invoke-virtual {p2, v1}, Landroid/view/animation/Transformation;->setAlpha(F)V

    .line 319
    invoke-virtual {p2}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->transformMatrix(Landroid/graphics/Matrix;Landroid/view/View;)V

    .line 321
    :cond_16
    return-void
.end method

.method public getAlpha()F
    .registers 2

    .prologue
    .line 71
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mAlpha:F

    return v0
.end method

.method public getPivotX()F
    .registers 2

    .prologue
    .line 83
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mPivotX:F

    return v0
.end method

.method public getPivotY()F
    .registers 2

    .prologue
    .line 94
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mPivotY:F

    return v0
.end method

.method public getRotation()F
    .registers 2

    .prologue
    .line 105
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mRotationZ:F

    return v0
.end method

.method public getRotationX()F
    .registers 2

    .prologue
    .line 115
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mRotationX:F

    return v0
.end method

.method public getRotationY()F
    .registers 2

    .prologue
    .line 125
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mRotationY:F

    return v0
.end method

.method public getScaleX()F
    .registers 2

    .prologue
    .line 136
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mScaleX:F

    return v0
.end method

.method public getScaleY()F
    .registers 2

    .prologue
    .line 146
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mScaleY:F

    return v0
.end method

.method public getScrollX()I
    .registers 3

    .prologue
    .line 156
    iget-object v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 157
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_c

    .line 158
    const/4 v1, 0x0

    .line 160
    :goto_b
    return v1

    :cond_c
    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    move-result v1

    goto :goto_b
.end method

.method public getScrollY()I
    .registers 3

    .prologue
    .line 169
    iget-object v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 170
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_c

    .line 171
    const/4 v1, 0x0

    .line 173
    :goto_b
    return v1

    :cond_c
    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v1

    goto :goto_b
.end method

.method public getTranslationX()F
    .registers 2

    .prologue
    .line 183
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mTranslationX:F

    return v0
.end method

.method public getTranslationY()F
    .registers 2

    .prologue
    .line 193
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mTranslationY:F

    return v0
.end method

.method public getX()F
    .registers 4

    .prologue
    .line 203
    iget-object v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 204
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_c

    .line 205
    const/4 v1, 0x0

    .line 207
    :goto_b
    return v1

    :cond_c
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mTranslationX:F

    add-float/2addr v1, v2

    goto :goto_b
.end method

.method public getY()F
    .registers 4

    .prologue
    .line 216
    iget-object v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 217
    .local v0, "view":Landroid/view/View;
    if-nez v0, :cond_c

    .line 218
    const/4 v1, 0x0

    .line 220
    :goto_b
    return v1

    :cond_c
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mTranslationY:F

    add-float/2addr v1, v2

    goto :goto_b
.end method

.method public setAlpha(F)V
    .registers 4
    .param p1, "alpha"    # F

    .prologue
    .line 74
    iget v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mAlpha:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_15

    .line 75
    iput p1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mAlpha:F

    .line 76
    iget-object v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 77
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_15

    .line 78
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 81
    .end local v0    # "view":Landroid/view/View;
    :cond_15
    return-void
.end method

.method public setPivotX(F)V
    .registers 3
    .param p1, "pivotX"    # F

    .prologue
    .line 86
    iget-boolean v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mHasPivot:Z

    if-eqz v0, :cond_a

    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mPivotX:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_15

    .line 87
    :cond_a
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->prepareForUpdate()V

    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mHasPivot:Z

    .line 89
    iput p1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mPivotX:F

    .line 90
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->invalidateAfterUpdate()V

    .line 92
    :cond_15
    return-void
.end method

.method public setPivotY(F)V
    .registers 3
    .param p1, "pivotY"    # F

    .prologue
    .line 97
    iget-boolean v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mHasPivot:Z

    if-eqz v0, :cond_a

    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mPivotY:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_15

    .line 98
    :cond_a
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->prepareForUpdate()V

    .line 99
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mHasPivot:Z

    .line 100
    iput p1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mPivotY:F

    .line 101
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->invalidateAfterUpdate()V

    .line 103
    :cond_15
    return-void
.end method

.method public setRotation(F)V
    .registers 3
    .param p1, "rotation"    # F

    .prologue
    .line 108
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mRotationZ:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_e

    .line 109
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->prepareForUpdate()V

    .line 110
    iput p1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mRotationZ:F

    .line 111
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->invalidateAfterUpdate()V

    .line 113
    :cond_e
    return-void
.end method

.method public setRotationX(F)V
    .registers 3
    .param p1, "rotationX"    # F

    .prologue
    .line 118
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mRotationX:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_e

    .line 119
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->prepareForUpdate()V

    .line 120
    iput p1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mRotationX:F

    .line 121
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->invalidateAfterUpdate()V

    .line 123
    :cond_e
    return-void
.end method

.method public setRotationY(F)V
    .registers 3
    .param p1, "rotationY"    # F

    .prologue
    .line 129
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mRotationY:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_e

    .line 130
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->prepareForUpdate()V

    .line 131
    iput p1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mRotationY:F

    .line 132
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->invalidateAfterUpdate()V

    .line 134
    :cond_e
    return-void
.end method

.method public setScaleX(F)V
    .registers 3
    .param p1, "scaleX"    # F

    .prologue
    .line 139
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mScaleX:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_e

    .line 140
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->prepareForUpdate()V

    .line 141
    iput p1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mScaleX:F

    .line 142
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->invalidateAfterUpdate()V

    .line 144
    :cond_e
    return-void
.end method

.method public setScaleY(F)V
    .registers 3
    .param p1, "scaleY"    # F

    .prologue
    .line 149
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mScaleY:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_e

    .line 150
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->prepareForUpdate()V

    .line 151
    iput p1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mScaleY:F

    .line 152
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->invalidateAfterUpdate()V

    .line 154
    :cond_e
    return-void
.end method

.method public setScrollX(I)V
    .registers 4
    .param p1, "value"    # I

    .prologue
    .line 163
    iget-object v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 164
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_11

    .line 165
    invoke-virtual {v0}, Landroid/view/View;->getScrollY()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Landroid/view/View;->scrollTo(II)V

    .line 167
    :cond_11
    return-void
.end method

.method public setScrollY(I)V
    .registers 4
    .param p1, "value"    # I

    .prologue
    .line 176
    iget-object v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 177
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_11

    .line 178
    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/view/View;->scrollTo(II)V

    .line 180
    :cond_11
    return-void
.end method

.method public setTranslationX(F)V
    .registers 3
    .param p1, "translationX"    # F

    .prologue
    .line 186
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mTranslationX:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_e

    .line 187
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->prepareForUpdate()V

    .line 188
    iput p1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mTranslationX:F

    .line 189
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->invalidateAfterUpdate()V

    .line 191
    :cond_e
    return-void
.end method

.method public setTranslationY(F)V
    .registers 3
    .param p1, "translationY"    # F

    .prologue
    .line 196
    iget v0, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mTranslationY:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_e

    .line 197
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->prepareForUpdate()V

    .line 198
    iput p1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mTranslationY:F

    .line 199
    invoke-direct {p0}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->invalidateAfterUpdate()V

    .line 201
    :cond_e
    return-void
.end method

.method public setX(F)V
    .registers 4
    .param p1, "x"    # F

    .prologue
    .line 210
    iget-object v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 211
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_14

    .line 212
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v1

    int-to-float v1, v1

    sub-float v1, p1, v1

    invoke-virtual {p0, v1}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->setTranslationX(F)V

    .line 214
    :cond_14
    return-void
.end method

.method public setY(F)V
    .registers 4
    .param p1, "y"    # F

    .prologue
    .line 223
    iget-object v1, p0, Lcom/nineoldandroids/view/animation/AnimatorProxy;->mView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 224
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_14

    .line 225
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v1

    int-to-float v1, v1

    sub-float v1, p1, v1

    invoke-virtual {p0, v1}, Lcom/nineoldandroids/view/animation/AnimatorProxy;->setTranslationY(F)V

    .line 227
    :cond_14
    return-void
.end method
