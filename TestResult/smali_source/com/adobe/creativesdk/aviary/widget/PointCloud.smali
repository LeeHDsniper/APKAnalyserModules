.class public Lcom/adobe/creativesdk/aviary/widget/PointCloud;
.super Ljava/lang/Object;
.source "PointCloud.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "FloatMath"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;,
        Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;,
        Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;
    }
.end annotation


# static fields
.field private static mEllipseOffsetX:F

.field private static mEllipseOffsetY:F


# instance fields
.field private bandDistance:F

.field mAxisRatio:F

.field private mCenterX:F

.field private mCenterY:F

.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field mInnerMajor:F

.field mInnerMinor:F

.field mIsHorizontalEllipse:Z

.field private mOuterRadius:F

.field private mPaint:Landroid/graphics/Paint;

.field private mPointCloud1:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;",
            ">;"
        }
    .end annotation
.end field

.field private mPointCloud2:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;",
            ">;"
        }
    .end annotation
.end field

.field private mPointCloud3:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;",
            ">;"
        }
    .end annotation
.end field

.field private mRotation:F

.field private mScale:F

.field public waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .registers 6
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v3, 0x0

    const/16 v1, 0xff

    const/4 v2, 0x1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPointCloud1:Ljava/util/ArrayList;

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPointCloud2:Ljava/util/ArrayList;

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPointCloud3:Ljava/util/ArrayList;

    .line 33
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mRotation:F

    .line 36
    const/high16 v0, 0x3f800000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mScale:F

    .line 40
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPaint:Landroid/graphics/Paint;

    .line 41
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 42
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPaint:Landroid/graphics/Paint;

    invoke-static {v1, v1, v1}, Landroid/graphics/Color;->rgb(III)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 44
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setDither(Z)V

    .line 46
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 48
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_5a

    .line 49
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    invoke-virtual {p1, v3, v3, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 51
    :cond_5a
    return-void
.end method

.method static clamp(FFF)F
    .registers 4
    .param p0, "value"    # F
    .param p1, "min"    # F
    .param p2, "max"    # F

    .prologue
    .line 166
    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method public static ellipseCircumference(DD)D
    .registers 12
    .param p0, "a"    # D
    .param p2, "b"    # D

    .prologue
    const-wide/high16 v6, 0x4008000000000000L

    .line 144
    const-wide v0, 0x400921fb54442d18L

    add-double v2, p0, p2

    mul-double/2addr v2, v6

    mul-double v4, v6, p0

    add-double/2addr v4, p2

    mul-double/2addr v6, p2

    add-double/2addr v6, p0

    mul-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v4

    sub-double/2addr v2, v4

    mul-double/2addr v0, v2

    return-wide v0
.end method

.method private static hypot(FF)F
    .registers 4
    .param p0, "x"    # F
    .param p1, "y"    # F

    .prologue
    .line 376
    mul-float v0, p0, p0

    mul-float v1, p1, p1

    add-float/2addr v0, v1

    invoke-static {v0}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v0

    return v0
.end method

.method private interp(FFF)F
    .registers 5
    .param p1, "min"    # F
    .param p2, "max"    # F
    .param p3, "f"    # F

    .prologue
    .line 240
    sub-float v0, p2, p1

    mul-float/2addr v0, p3

    add-float/2addr v0, p1

    return v0
.end method

.method private static max(FF)F
    .registers 3
    .param p0, "a"    # F
    .param p1, "b"    # F

    .prologue
    .line 380
    cmpl-float v0, p0, p1

    if-lez v0, :cond_5

    .end local p0    # "a":F
    :goto_4
    return p0

    .restart local p0    # "a":F
    :cond_5
    move p0, p1

    goto :goto_4
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 26
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->getAlpha()F

    move-result v19

    const/16 v20, 0x0

    cmpl-float v19, v19, v20

    if-gtz v19, :cond_11

    .line 350
    :goto_10
    return-void

    .line 257
    :cond_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->getType()Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;

    move-result-object v18

    .line 259
    .local v18, "type":Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;
    const/16 v19, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->save(I)I

    move-result v17

    .line 260
    .local v17, "saveCount":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mScale:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mScale:F

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mCenterX:F

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mCenterY:F

    move/from16 v22, v0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    move/from16 v4, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 262
    sget-object v19, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;->Line:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_151

    .line 263
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mRotation:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mCenterX:F

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mCenterY:F

    move/from16 v21, v0

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 264
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPointCloud2:Ljava/util/ArrayList;

    .line 265
    .local v13, "points":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;>;"
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_74
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v9, v0, :cond_30a

    .line 266
    invoke-virtual {v13, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;

    .line 267
    .local v11, "point":Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;
    const/high16 v19, 0x40800000

    const/high16 v20, 0x40000000

    iget v0, v11, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->radius:F

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mOuterRadius:F

    move/from16 v22, v0

    div-float v21, v21, v22

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->interp(FFF)F

    move-result v12

    .line 268
    .local v12, "pointSize":F
    iget v0, v11, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->x:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mCenterX:F

    move/from16 v20, v0

    add-float v14, v19, v20

    .line 269
    .local v14, "px":F
    iget v0, v11, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->y:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mCenterY:F

    move/from16 v20, v0

    add-float v15, v19, v20

    .line 271
    .local v15, "py":F
    iget v0, v11, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->radius:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->getAlphaForPoint(F)I

    move-result v5

    .line 273
    .local v5, "alpha":I
    if-nez v5, :cond_c7

    .line 265
    :goto_c4
    add-int/lit8 v9, v9, 0x1

    goto :goto_74

    .line 277
    :cond_c7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v19, v0

    if-eqz v19, :cond_137

    .line 278
    const/16 v19, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->save(I)I

    move-result v6

    .line 279
    .local v6, "count":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    const/high16 v20, 0x3f000000

    mul-float v7, v19, v20

    .line 280
    .local v7, "cx":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    const/high16 v20, 0x3f000000

    mul-float v8, v19, v20

    .line 281
    .local v8, "cy":F
    const/high16 v19, 0x40800000

    div-float v16, v12, v19

    .line 282
    .local v16, "s":F
    move-object/from16 v0, p1

    move/from16 v1, v16

    move/from16 v2, v16

    invoke-virtual {v0, v1, v2, v14, v15}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 283
    sub-float v19, v14, v7

    sub-float v20, v15, v8

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 284
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 285
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 286
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_c4

    .line 288
    .end local v6    # "count":I
    .end local v7    # "cx":F
    .end local v8    # "cy":F
    .end local v16    # "s":F
    :cond_137
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 289
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v14, v15, v12, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_c4

    .line 293
    .end local v5    # "alpha":I
    .end local v9    # "i":I
    .end local v11    # "point":Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;
    .end local v12    # "pointSize":F
    .end local v13    # "points":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;>;"
    .end local v14    # "px":F
    .end local v15    # "py":F
    :cond_151
    sget-object v19, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;->Ellipse:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveType;

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    if-ne v0, v1, :cond_220

    .line 295
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPointCloud3:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_163
    :goto_163
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_30a

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;

    .line 297
    .local v10, "p":Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    if-eqz v20, :cond_163

    .line 298
    const/16 v20, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->save(I)I

    move-result v6

    .line 299
    .restart local v6    # "count":I
    const/high16 v20, 0x40800000

    const/high16 v21, 0x40000000

    iget v0, v10, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->radius:F

    move/from16 v22, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mOuterRadius:F

    move/from16 v23, v0

    div-float v22, v22, v23

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->interp(FFF)F

    move-result v12

    .line 300
    .restart local v12    # "pointSize":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    const/high16 v21, 0x3f000000

    mul-float v7, v20, v21

    .line 301
    .restart local v7    # "cx":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v20

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v20, v0

    const/high16 v21, 0x3f000000

    mul-float v8, v20, v21

    .line 302
    .restart local v8    # "cy":F
    const/high16 v20, 0x40800000

    div-float v16, v12, v20

    .line 304
    .restart local v16    # "s":F
    iget v14, v10, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->x:F

    .line 305
    .restart local v14    # "px":F
    iget v15, v10, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->y:F

    .line 307
    .restart local v15    # "py":F
    sget v20, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mEllipseOffsetX:F

    add-float v20, v20, v14

    sget v21, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mEllipseOffsetY:F

    add-float v21, v21, v15

    move-object/from16 v0, p1

    move/from16 v1, v16

    move/from16 v2, v16

    move/from16 v3, v20

    move/from16 v4, v21

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 308
    sub-float v20, v14, v7

    sget v21, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mEllipseOffsetX:F

    add-float v20, v20, v21

    sub-float v21, v15, v8

    sget v22, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mEllipseOffsetY:F

    add-float v21, v21, v22

    move-object/from16 v0, p1

    move/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 309
    iget v0, v10, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->radius:F

    move/from16 v20, v0

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->getAlphaForPoint(F)I

    move-result v5

    .line 311
    .restart local v5    # "alpha":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 312
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 313
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto/16 :goto_163

    .line 320
    .end local v5    # "alpha":I
    .end local v6    # "count":I
    .end local v7    # "cx":F
    .end local v8    # "cy":F
    .end local v10    # "p":Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;
    .end local v12    # "pointSize":F
    .end local v14    # "px":F
    .end local v15    # "py":F
    .end local v16    # "s":F
    :cond_220
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPointCloud1:Ljava/util/ArrayList;

    .line 321
    .restart local v13    # "points":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;>;"
    const/4 v9, 0x0

    .restart local v9    # "i":I
    :goto_225
    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v9, v0, :cond_30a

    .line 322
    invoke-virtual {v13, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;

    .line 323
    .restart local v11    # "point":Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;
    const/high16 v19, 0x40800000

    const/high16 v20, 0x40000000

    iget v0, v11, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->radius:F

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mOuterRadius:F

    move/from16 v22, v0

    div-float v21, v21, v22

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->interp(FFF)F

    move-result v12

    .line 324
    .restart local v12    # "pointSize":F
    iget v0, v11, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->x:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mCenterX:F

    move/from16 v20, v0

    add-float v14, v19, v20

    .line 325
    .restart local v14    # "px":F
    iget v0, v11, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->y:F

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mCenterY:F

    move/from16 v20, v0

    add-float v15, v19, v20

    .line 327
    .restart local v15    # "py":F
    iget v0, v11, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->x:F

    move/from16 v19, v0

    iget v0, v11, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;->y:F

    move/from16 v20, v0

    invoke-static/range {v19 .. v20}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->hypot(FF)F

    move-result v19

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->getAlphaForPoint(F)I

    move-result v5

    .line 329
    .restart local v5    # "alpha":I
    if-nez v5, :cond_280

    .line 321
    :goto_27d
    add-int/lit8 v9, v9, 0x1

    goto :goto_225

    .line 333
    :cond_280
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v19, v0

    if-eqz v19, :cond_2f0

    .line 334
    const/16 v19, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->save(I)I

    move-result v6

    .line 335
    .restart local v6    # "count":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    const/high16 v20, 0x3f000000

    mul-float v7, v19, v20

    .line 336
    .restart local v7    # "cx":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v19

    move/from16 v0, v19

    int-to-float v0, v0

    move/from16 v19, v0

    const/high16 v20, 0x3f000000

    mul-float v8, v19, v20

    .line 337
    .restart local v8    # "cy":F
    const/high16 v19, 0x40800000

    div-float v16, v12, v19

    .line 338
    .restart local v16    # "s":F
    move-object/from16 v0, p1

    move/from16 v1, v16

    move/from16 v2, v16

    invoke-virtual {v0, v1, v2, v14, v15}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 339
    sub-float v19, v14, v7

    sub-float v20, v15, v8

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 340
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 341
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 342
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_27d

    .line 344
    .end local v6    # "count":I
    .end local v7    # "cx":F
    .end local v8    # "cy":F
    .end local v16    # "s":F
    :cond_2f0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 345
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v19, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v14, v15, v12, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    goto/16 :goto_27d

    .line 349
    .end local v5    # "alpha":I
    .end local v9    # "i":I
    .end local v11    # "point":Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;
    .end local v12    # "pointSize":F
    .end local v13    # "points":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;>;"
    .end local v14    # "px":F
    .end local v15    # "py":F
    :cond_30a
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto/16 :goto_10
.end method

.method public getAlphaForPoint(F)I
    .registers 12
    .param p1, "radius"    # F

    .prologue
    const v4, 0x3f490fdb

    const-wide/high16 v8, 0x4034000000000000L

    const/4 v6, 0x0

    const/high16 v5, 0x3f000000

    .line 354
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->radius:F
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->access$000(Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;)F

    move-result v3

    sub-float v1, p1, v3

    .line 355
    .local v1, "distanceToWaveRing":F
    const/4 v2, 0x0

    .line 357
    .local v2, "waveAlpha":F
    cmpl-float v3, v1, v6

    if-lez v3, :cond_45

    .line 359
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->width:F
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->access$100(Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;)F

    move-result v3

    mul-float/2addr v3, v5

    cmpg-float v3, v1, v3

    if-gez v3, :cond_40

    .line 360
    mul-float v3, v4, v1

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->width:F
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->access$100(Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;)F

    move-result v4

    mul-float/2addr v4, v5

    div-float/2addr v3, v4

    invoke-static {v3}, Landroid/util/FloatMath;->cos(F)F

    move-result v0

    .line 361
    .local v0, "cosf":F
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->alpha:F
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->access$200(Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;)F

    move-result v3

    float-to-double v4, v0

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    double-to-float v4, v4

    invoke-static {v6, v4}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->max(FF)F

    move-result v4

    mul-float v2, v3, v4

    .line 372
    .end local v0    # "cosf":F
    :cond_40
    :goto_40
    const/high16 v3, 0x437f0000

    mul-float/2addr v3, v2

    float-to-int v3, v3

    return v3

    .line 366
    :cond_45
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->width:F
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->access$100(Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;)F

    move-result v3

    mul-float/2addr v3, v5

    neg-float v3, v3

    cmpl-float v3, v1, v3

    if-lez v3, :cond_40

    .line 367
    mul-float v3, v4, v1

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->width:F
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->access$100(Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;)F

    move-result v4

    mul-float/2addr v4, v5

    div-float/2addr v3, v4

    invoke-static {v3}, Landroid/util/FloatMath;->cos(F)F

    move-result v0

    .line 368
    .restart local v0    # "cosf":F
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->alpha:F
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->access$200(Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;)F

    move-result v3

    float-to-double v4, v0

    invoke-static {v4, v5, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    double-to-float v4, v4

    invoke-static {v6, v4}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->max(FF)F

    move-result v4

    mul-float v2, v3, v4

    goto :goto_40
.end method

.method public getBandDistance()F
    .registers 2

    .prologue
    .line 155
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->bandDistance:F

    return v0
.end method

.method public getOuterRadius()F
    .registers 2

    .prologue
    .line 63
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mOuterRadius:F

    return v0
.end method

.method public getScale()F
    .registers 2

    .prologue
    .line 244
    iget v0, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mScale:F

    return v0
.end method

.method public makeEllipseCloud(Landroid/graphics/RectF;)V
    .registers 34
    .param p1, "innerBand"    # Landroid/graphics/RectF;

    .prologue
    .line 68
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/RectF;->width()F

    move-result v28

    const/high16 v29, 0x40000000

    div-float v14, v28, v29

    .line 69
    .local v14, "innerA":F
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/RectF;->height()F

    move-result v28

    const/high16 v29, 0x40000000

    div-float v15, v28, v29

    .line 70
    .local v15, "innerB":F
    float-to-double v0, v14

    move-wide/from16 v28, v0

    float-to-double v0, v15

    move-wide/from16 v30, v0

    invoke-static/range {v28 .. v31}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->ellipseCircumference(DD)D

    move-result-wide v16

    .line 72
    .local v16, "innerC":D
    cmpl-float v28, v14, v15

    if-lez v28, :cond_120

    .line 73
    move-object/from16 v0, p0

    iput v15, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mInnerMinor:F

    .line 74
    move-object/from16 v0, p0

    iput v14, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mInnerMajor:F

    .line 75
    const/16 v28, 0x1

    move/from16 v0, v28

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mIsHorizontalEllipse:Z

    .line 82
    :goto_2e
    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mInnerMinor:F

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mInnerMajor:F

    move/from16 v29, v0

    div-float v28, v28, v29

    move/from16 v0, v28

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mAxisRatio:F

    .line 84
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/RectF;->width()F

    move-result v28

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/RectF;->height()F

    move-result v29

    invoke-static/range {v28 .. v29}, Ljava/lang/Math;->max(FF)F

    move-result v28

    const/high16 v29, 0x40000000

    div-float v18, v28, v29

    .line 85
    .local v18, "innerRadius":F
    const v28, 0x3fb33333

    mul-float v19, v18, v28

    .line 89
    .local v19, "outerRadius":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPointCloud3:Ljava/util/ArrayList;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Ljava/util/ArrayList;->clear()V

    .line 90
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mOuterRadius:F

    .line 92
    sub-float v28, v19, v18

    const/high16 v29, 0x42700000

    const/high16 v30, 0x43820000

    invoke-static/range {v28 .. v30}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->clamp(FFF)F

    move-result v20

    .line 93
    .local v20, "pointAreaRadius":F
    move-wide/from16 v0, v16

    double-to-float v0, v0

    move/from16 v28, v0

    const/high16 v29, 0x42200000

    div-float v12, v28, v29

    .line 94
    .local v12, "ds2":F
    const v28, 0x40c90fdb

    mul-float v28, v28, v18

    const/high16 v29, 0x42200000

    div-float v11, v28, v29

    .line 95
    .local v11, "ds":F
    const-wide/high16 v28, 0x4020000000000000L

    div-float v30, v20, v12

    move/from16 v0, v30

    float-to-double v0, v0

    move-wide/from16 v30, v0

    invoke-static/range {v30 .. v31}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v30

    invoke-static/range {v28 .. v31}, Ljava/lang/Math;->min(DD)D

    move-result-wide v28

    move-wide/from16 v0, v28

    double-to-int v7, v0

    .line 96
    .local v7, "bands":I
    int-to-float v0, v7

    move/from16 v28, v0

    div-float v28, v20, v28

    const/high16 v29, 0x41900000

    const/high16 v30, 0x42040000

    invoke-static/range {v28 .. v30}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->clamp(FFF)F

    move-result v10

    .line 97
    .local v10, "dr":F
    move/from16 v22, v18

    .line 99
    .local v22, "r":F
    const/high16 v28, 0x42c80000

    cmpg-float v28, v18, v28

    if-gez v28, :cond_ac

    .line 100
    const/4 v7, 0x0

    .line 111
    :cond_ac
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/RectF;->width()F

    move-result v28

    const/high16 v29, 0x40000000

    div-float v23, v28, v29

    .line 112
    .local v23, "rx":F
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/RectF;->height()F

    move-result v28

    const/high16 v29, 0x40000000

    div-float v24, v28, v29

    .line 114
    .local v24, "ry":F
    move-object/from16 v0, p0

    iput v12, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->bandDistance:F

    .line 116
    if-lez v7, :cond_137

    .line 117
    const/4 v6, 0x0

    .local v6, "band":I
    :goto_c3
    if-gt v6, v7, :cond_137

    .line 118
    add-float v23, v23, v10

    .line 119
    add-float v24, v24, v10

    .line 121
    add-float v4, v14, v22

    .line 122
    .local v4, "a":F
    add-float v5, v15, v22

    .line 124
    .local v5, "b":F
    const v28, 0x40c90fdb

    mul-float v8, v28, v22

    .line 125
    .local v8, "circumference":F
    const/high16 v28, 0x43160000

    div-float v29, v8, v12

    invoke-static/range {v28 .. v29}, Ljava/lang/Math;->min(FF)F

    move-result v28

    move/from16 v0, v28

    float-to-int v0, v0

    move/from16 v21, v0

    .line 130
    .local v21, "pointsInBand":I
    const v25, 0x3fc90fdb

    .line 131
    .local v25, "theta":F
    const v28, 0x40c90fdb

    move/from16 v0, v21

    int-to-float v0, v0

    move/from16 v29, v0

    div-float v9, v28, v29

    .line 133
    .local v9, "dTheta":F
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_ed
    move/from16 v0, v21

    if-ge v13, v0, :cond_132

    .line 134
    invoke-static/range {v25 .. v25}, Landroid/util/FloatMath;->cos(F)F

    move-result v28

    mul-float v28, v28, v23

    add-float v26, v28, v14

    .line 135
    .local v26, "x":F
    invoke-static/range {v25 .. v25}, Landroid/util/FloatMath;->sin(F)F

    move-result v28

    mul-float v28, v28, v24

    add-float v27, v28, v15

    .line 136
    .local v27, "y":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPointCloud3:Ljava/util/ArrayList;

    move-object/from16 v28, v0

    new-instance v29, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;

    invoke-static/range {v23 .. v24}, Ljava/lang/Math;->max(FF)F

    move-result v30

    move-object/from16 v0, v29

    move/from16 v1, v26

    move/from16 v2, v27

    move/from16 v3, v30

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;-><init>(FFF)V

    invoke-virtual/range {v28 .. v29}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 137
    add-float v25, v25, v9

    .line 133
    add-int/lit8 v13, v13, 0x1

    goto :goto_ed

    .line 77
    .end local v4    # "a":F
    .end local v5    # "b":F
    .end local v6    # "band":I
    .end local v7    # "bands":I
    .end local v8    # "circumference":F
    .end local v9    # "dTheta":F
    .end local v10    # "dr":F
    .end local v11    # "ds":F
    .end local v12    # "ds2":F
    .end local v13    # "i":I
    .end local v18    # "innerRadius":F
    .end local v19    # "outerRadius":F
    .end local v20    # "pointAreaRadius":F
    .end local v21    # "pointsInBand":I
    .end local v22    # "r":F
    .end local v23    # "rx":F
    .end local v24    # "ry":F
    .end local v25    # "theta":F
    .end local v26    # "x":F
    .end local v27    # "y":F
    :cond_120
    move-object/from16 v0, p0

    iput v14, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mInnerMinor:F

    .line 78
    move-object/from16 v0, p0

    iput v15, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mInnerMajor:F

    .line 79
    const/16 v28, 0x0

    move/from16 v0, v28

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mIsHorizontalEllipse:Z

    goto/16 :goto_2e

    .line 117
    .restart local v4    # "a":F
    .restart local v5    # "b":F
    .restart local v6    # "band":I
    .restart local v7    # "bands":I
    .restart local v8    # "circumference":F
    .restart local v9    # "dTheta":F
    .restart local v10    # "dr":F
    .restart local v11    # "ds":F
    .restart local v12    # "ds2":F
    .restart local v13    # "i":I
    .restart local v18    # "innerRadius":F
    .restart local v19    # "outerRadius":F
    .restart local v20    # "pointAreaRadius":F
    .restart local v21    # "pointsInBand":I
    .restart local v22    # "r":F
    .restart local v23    # "rx":F
    .restart local v24    # "ry":F
    .restart local v25    # "theta":F
    :cond_132
    add-int/lit8 v6, v6, 0x1

    add-float v22, v22, v10

    goto :goto_c3

    .line 141
    .end local v4    # "a":F
    .end local v5    # "b":F
    .end local v6    # "band":I
    .end local v8    # "circumference":F
    .end local v9    # "dTheta":F
    .end local v13    # "i":I
    .end local v21    # "pointsInBand":I
    .end local v25    # "theta":F
    :cond_137
    return-void
.end method

.method public makePointCloud(FLandroid/graphics/RectF;)V
    .registers 27
    .param p1, "innerRadius"    # F
    .param p2, "rect"    # Landroid/graphics/RectF;

    .prologue
    .line 171
    const/16 v20, 0x0

    cmpl-float v20, p1, v20

    if-nez v20, :cond_e

    .line 172
    const-string v20, "PointCloud"

    const-string v21, "Must specify an inner radius"

    invoke-static/range {v20 .. v21}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    :goto_d
    return-void

    .line 176
    :cond_e
    const v20, 0x3fb33333

    mul-float v12, p1, v20

    .line 178
    .local v12, "outerRadius":F
    move-object/from16 v0, p0

    iput v12, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mOuterRadius:F

    .line 181
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPointCloud1:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->clear()V

    .line 183
    sub-float v20, v12, p1

    const/high16 v21, 0x42700000

    const/high16 v22, 0x43820000

    invoke-static/range {v20 .. v22}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->clamp(FFF)F

    move-result v13

    .line 184
    .local v13, "pointAreaRadius":F
    const v20, 0x40c90fdb

    mul-float v20, v20, p1

    const/high16 v21, 0x42200000

    div-float v9, v20, v21

    .line 185
    .local v9, "ds":F
    const-wide/high16 v20, 0x4020000000000000L

    div-float v22, v13, v9

    move/from16 v0, v22

    float-to-double v0, v0

    move-wide/from16 v22, v0

    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v22

    invoke-static/range {v20 .. v23}, Ljava/lang/Math;->min(DD)D

    move-result-wide v20

    move-wide/from16 v0, v20

    double-to-int v5, v0

    .line 186
    .local v5, "bands":I
    int-to-float v0, v5

    move/from16 v20, v0

    div-float v20, v13, v20

    const/high16 v21, 0x41900000

    const/high16 v22, 0x42040000

    invoke-static/range {v20 .. v22}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->clamp(FFF)F

    move-result v8

    .line 187
    .local v8, "dr":F
    move/from16 v16, p1

    .line 189
    .local v16, "r":F
    const/high16 v20, 0x42960000

    cmpg-float v20, p1, v20

    if-gez v20, :cond_5d

    .line 190
    const/4 v5, 0x0

    .line 198
    :cond_5d
    if-lez v5, :cond_ab

    .line 199
    const/4 v4, 0x0

    .local v4, "b":I
    :goto_60
    if-gt v4, v5, :cond_ab

    .line 200
    const v20, 0x40c90fdb

    mul-float v6, v20, v16

    .line 201
    .local v6, "circumference":F
    const/high16 v20, 0x43160000

    div-float v21, v6, v9

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->min(FF)F

    move-result v20

    move/from16 v0, v20

    float-to-int v15, v0

    .line 204
    .local v15, "pointsInBand":I
    const v10, 0x3fc90fdb

    .line 205
    .local v10, "eta":F
    const v20, 0x40c90fdb

    int-to-float v0, v15

    move/from16 v21, v0

    div-float v7, v20, v21

    .line 206
    .local v7, "dEta":F
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_7e
    if-ge v11, v15, :cond_a6

    .line 207
    invoke-static {v10}, Landroid/util/FloatMath;->cos(F)F

    move-result v20

    mul-float v18, v16, v20

    .line 208
    .local v18, "x":F
    invoke-static {v10}, Landroid/util/FloatMath;->sin(F)F

    move-result v20

    mul-float v19, v16, v20

    .line 209
    .local v19, "y":F
    add-float/2addr v10, v7

    .line 210
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPointCloud1:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    new-instance v21, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;

    move-object/from16 v0, v21

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v16

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;-><init>(FFF)V

    invoke-virtual/range {v20 .. v21}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 206
    add-int/lit8 v11, v11, 0x1

    goto :goto_7e

    .line 199
    .end local v18    # "x":F
    .end local v19    # "y":F
    :cond_a6
    add-int/lit8 v4, v4, 0x1

    add-float v16, v16, v8

    goto :goto_60

    .line 216
    .end local v4    # "b":I
    .end local v6    # "circumference":F
    .end local v7    # "dEta":F
    .end local v10    # "eta":F
    .end local v11    # "i":I
    .end local v15    # "pointsInBand":I
    :cond_ab
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPointCloud2:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->clear()V

    .line 217
    move/from16 v16, p1

    .line 218
    invoke-virtual/range {p2 .. p2}, Landroid/graphics/RectF;->width()F

    move-result v20

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/RectF;->height()F

    move-result v21

    invoke-static/range {v20 .. v21}, Ljava/lang/Math;->max(FF)F

    move-result v17

    .line 219
    .local v17, "rectSide":F
    move/from16 v6, v17

    .line 221
    .restart local v6    # "circumference":F
    if-lez v5, :cond_13d

    .line 222
    const/4 v4, 0x0

    .restart local v4    # "b":I
    :goto_c7
    if-gt v4, v5, :cond_13d

    .line 223
    const/high16 v20, 0x40800000

    const/high16 v21, 0x40000000

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mOuterRadius:F

    move/from16 v22, v0

    div-float v22, v16, v22

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v21

    move/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->interp(FFF)F

    move-result v14

    .line 224
    .local v14, "pointSize":F
    const/high16 v20, 0x40000000

    div-float v20, v14, v20

    mul-float v20, v20, v9

    div-float v20, v6, v20

    move/from16 v0, v20

    float-to-int v15, v0

    .line 226
    .restart local v15    # "pointsInBand":I
    const/4 v11, 0x0

    .restart local v11    # "i":I
    :goto_ed
    if-gt v11, v15, :cond_138

    .line 227
    move/from16 v18, v16

    .line 228
    .restart local v18    # "x":F
    neg-float v0, v6

    move/from16 v20, v0

    const/high16 v21, 0x40000000

    div-float v20, v20, v21

    int-to-float v0, v15

    move/from16 v21, v0

    div-float v21, v6, v21

    int-to-float v0, v11

    move/from16 v22, v0

    mul-float v21, v21, v22

    add-float v19, v20, v21

    .line 229
    .restart local v19    # "y":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPointCloud2:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    new-instance v21, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;

    move-object/from16 v0, v21

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v16

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;-><init>(FFF)V

    invoke-virtual/range {v20 .. v21}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mPointCloud2:Ljava/util/ArrayList;

    move-object/from16 v20, v0

    new-instance v21, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;

    move/from16 v0, v18

    neg-float v0, v0

    move/from16 v22, v0

    move-object/from16 v0, v21

    move/from16 v1, v22

    move/from16 v2, v19

    move/from16 v3, v16

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$Point;-><init>(FFF)V

    invoke-virtual/range {v20 .. v21}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 226
    add-int/lit8 v11, v11, 0x1

    goto :goto_ed

    .line 222
    .end local v18    # "x":F
    .end local v19    # "y":F
    :cond_138
    add-int/lit8 v4, v4, 0x1

    add-float v16, v16, v8

    goto :goto_c7

    .line 235
    .end local v4    # "b":I
    .end local v11    # "i":I
    .end local v14    # "pointSize":F
    .end local v15    # "pointsInBand":I
    :cond_13d
    move-object/from16 v0, p0

    iput v8, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->bandDistance:F

    goto/16 :goto_d
.end method

.method public setCenter(FF)V
    .registers 3
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 54
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mCenterX:F

    .line 55
    iput p2, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mCenterY:F

    .line 56
    return-void
.end method

.method public setEllipseOffset(FF)V
    .registers 3
    .param p1, "offX"    # F
    .param p2, "offY"    # F

    .prologue
    .line 148
    sput p1, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mEllipseOffsetX:F

    .line 149
    sput p2, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mEllipseOffsetY:F

    .line 150
    return-void
.end method

.method public setRotation(F)V
    .registers 2
    .param p1, "angle"    # F

    .prologue
    .line 59
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mRotation:F

    .line 60
    return-void
.end method

.method public setScale(F)V
    .registers 2
    .param p1, "scale"    # F

    .prologue
    .line 248
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->mScale:F

    .line 249
    return-void
.end method
