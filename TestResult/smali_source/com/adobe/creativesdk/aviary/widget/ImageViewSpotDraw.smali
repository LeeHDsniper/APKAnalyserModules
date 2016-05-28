.class public Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;
.super Lit/sephiroth/android/library/imagezoom/ImageViewTouch;
.source "ImageViewSpotDraw.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;,
        Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;
    }
.end annotation


# instance fields
.field protected mBrushSize:F

.field protected mCanvas:Landroid/graphics/Canvas;

.field protected mCurrentScale:F

.field private mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;

.field protected mInvertedMatrix:Landroid/graphics/Matrix;

.field private mMoved:Z

.field protected mPaint:Landroid/graphics/Paint;

.field private mRestiction:D

.field protected mStartX:F

.field protected mStartY:F

.field protected mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

.field protected mX:F

.field protected mY:F

.field protected tmpPath:Landroid/graphics/Path;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    const/high16 v0, 0x41f00000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mBrushSize:F

    .line 21
    const/high16 v0, 0x3f800000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mCurrentScale:F

    .line 22
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->tmpPath:Landroid/graphics/Path;

    .line 24
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    .line 27
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    .line 29
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mRestiction:D

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mMoved:Z

    .line 38
    return-void
.end method

.method public static getMatrixValues(Landroid/graphics/Matrix;)[F
    .registers 3
    .param p0, "m"    # Landroid/graphics/Matrix;

    .prologue
    .line 214
    const/16 v1, 0x9

    new-array v0, v1, [F

    .line 215
    .local v0, "values":[F
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 216
    return-object v0
.end method

.method private onTouchMove(FF)V
    .registers 25
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 117
    move-object/from16 v0, p0

    iget v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mX:F

    sub-float v15, p1, v15

    invoke-static {v15}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 118
    .local v2, "dx":F
    move-object/from16 v0, p0

    iget v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mY:F

    sub-float v15, p2, v15

    invoke-static {v15}, Ljava/lang/Math;->abs(F)F

    move-result v3

    .line 120
    .local v3, "dy":F
    const/high16 v15, 0x40000000

    cmpl-float v15, v2, v15

    if-gez v15, :cond_20

    const/high16 v15, 0x40000000

    cmpl-float v15, v3, v15

    if-ltz v15, :cond_12c

    .line 122
    :cond_20
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mMoved:Z

    if-nez v15, :cond_3f

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    if-eqz v15, :cond_3f

    .line 123
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->tmpPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mX:F

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mY:F

    move/from16 v17, v0

    invoke-virtual/range {v15 .. v17}, Landroid/graphics/Path;->setLastPoint(FF)V

    .line 126
    :cond_3f
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mMoved:Z

    .line 128
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mRestiction:D

    move-wide/from16 v16, v0

    const-wide/16 v18, 0x0

    cmpl-double v15, v16, v18

    if-lez v15, :cond_ef

    .line 129
    move-object/from16 v0, p0

    iget v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mStartX:F

    sub-float v15, p1, v15

    float-to-double v0, v15

    move-wide/from16 v16, v0

    const-wide/high16 v18, 0x4000000000000000L

    invoke-static/range {v16 .. v19}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v16

    move-object/from16 v0, p0

    iget v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mStartY:F

    sub-float v15, p2, v15

    float-to-double v0, v15

    move-wide/from16 v18, v0

    const-wide/high16 v20, 0x4000000000000000L

    invoke-static/range {v18 .. v21}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v18

    add-double v16, v16, v18

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v6

    .line 130
    .local v6, "r":D
    move-object/from16 v0, p0

    iget v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mStartY:F

    sub-float v15, p2, v15

    float-to-double v0, v15

    move-wide/from16 v16, v0

    move-object/from16 v0, p0

    iget v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mStartX:F

    sub-float v15, p1, v15

    float-to-double v0, v15

    move-wide/from16 v18, v0

    invoke-static/range {v16 .. v19}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v12

    .line 132
    .local v12, "theta":D
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->getWidth()I

    move-result v15

    int-to-float v14, v15

    .line 133
    .local v14, "w":F
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->getHeight()I

    move-result v15

    int-to-float v4, v15

    .line 135
    .local v4, "h":F
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mRestiction:D

    move-wide/from16 v16, v0

    move-object/from16 v0, p0

    iget v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mCurrentScale:F

    float-to-double v0, v15

    move-wide/from16 v18, v0

    div-double v16, v16, v18

    add-float v15, v14, v4

    float-to-double v0, v15

    move-wide/from16 v18, v0

    div-double v16, v16, v18

    move-object/from16 v0, p0

    iget v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mBrushSize:F

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mCurrentScale:F

    move/from16 v18, v0

    div-float v15, v15, v18

    float-to-double v0, v15

    move-wide/from16 v18, v0

    div-double v10, v16, v18

    .line 136
    .local v10, "scale":D
    mul-double v16, v6, v10

    const-wide/high16 v18, 0x3ff0000000000000L

    add-double v16, v16, v18

    invoke-static/range {v16 .. v17}, Ljava/lang/Math;->log(D)D

    move-result-wide v16

    div-double v8, v16, v10

    .line 138
    .local v8, "rNew":D
    move-object/from16 v0, p0

    iget v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mStartX:F

    float-to-double v0, v15

    move-wide/from16 v16, v0

    invoke-static {v12, v13}, Ljava/lang/Math;->cos(D)D

    move-result-wide v18

    mul-double v18, v18, v8

    add-double v16, v16, v18

    move-wide/from16 v0, v16

    double-to-float v0, v0

    move/from16 p1, v0

    .line 139
    move-object/from16 v0, p0

    iget v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mStartY:F

    float-to-double v0, v15

    move-wide/from16 v16, v0

    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    move-result-wide v18

    mul-double v18, v18, v8

    add-double v16, v16, v18

    move-wide/from16 v0, v16

    double-to-float v0, v0

    move/from16 p2, v0

    .line 142
    .end local v4    # "h":F
    .end local v6    # "r":D
    .end local v8    # "rNew":D
    .end local v10    # "scale":D
    .end local v12    # "theta":D
    .end local v14    # "w":F
    :cond_ef
    move/from16 v0, p1

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mX:F

    .line 143
    move/from16 v0, p2

    move-object/from16 v1, p0

    iput v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mY:F

    .line 145
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    if-eqz v15, :cond_12c

    .line 146
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->tmpPath:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mX:F

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mY:F

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mX:F

    move/from16 v18, v0

    add-float v18, v18, p1

    const/high16 v19, 0x40000000

    div-float v18, v18, v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mY:F

    move/from16 v19, v0

    add-float v19, v19, p2

    const/high16 v20, 0x40000000

    div-float v19, v19, v20

    invoke-virtual/range {v15 .. v19}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 151
    :cond_12c
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;

    if-eqz v15, :cond_159

    .line 152
    const/4 v15, 0x2

    new-array v5, v15, [F

    .line 153
    .local v5, "mappedPoints":[F
    const/4 v15, 0x0

    aput p1, v5, v15

    .line 154
    const/4 v15, 0x1

    aput p2, v5, v15

    .line 155
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v15, v5}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 156
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mBrushSize:F

    move/from16 v16, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mCurrentScale:F

    move/from16 v17, v0

    div-float v16, v16, v17

    move/from16 v0, v16

    invoke-interface {v15, v5, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;->onDrawing([FF)V

    .line 158
    .end local v5    # "mappedPoints":[F
    :cond_159
    return-void
.end method

.method private onTouchStart(FF)V
    .registers 7
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/4 v2, 0x0

    .line 93
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mMoved:Z

    .line 95
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->tmpPath:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 97
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    if-eqz v1, :cond_11

    .line 98
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->tmpPath:Landroid/graphics/Path;

    invoke-virtual {v1, p1, p2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 101
    :cond_11
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mX:F

    .line 102
    iput p2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mY:F

    .line 103
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mStartX:F

    .line 104
    iput p2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mStartY:F

    .line 106
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;

    if-eqz v1, :cond_34

    .line 107
    const/4 v1, 0x2

    new-array v0, v1, [F

    .line 108
    .local v0, "mappedPoints":[F
    aput p1, v0, v2

    .line 109
    const/4 v1, 0x1

    aput p2, v0, v1

    .line 110
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 111
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mBrushSize:F

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mCurrentScale:F

    div-float/2addr v2, v3

    invoke-interface {v1, v0, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;->onDrawStart([FF)V

    .line 113
    .end local v0    # "mappedPoints":[F
    :cond_34
    return-void
.end method

.method private onTouchUp()V
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;

    if-eqz v0, :cond_9

    .line 163
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;->onDrawEnd()V

    .line 165
    :cond_9
    return-void
.end method


# virtual methods
.method public getDrawMode()Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;
    .registers 2

    .prologue
    .line 180
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    return-object v0
.end method

.method public getImageRect()Landroid/graphics/RectF;
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 249
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_1f

    .line 250
    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 252
    :goto_1e
    return-object v0

    :cond_1f
    const/4 v0, 0x0

    goto :goto_1e
.end method

.method public getPaint()Landroid/graphics/Paint;
    .registers 2

    .prologue
    .line 220
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 46
    invoke-super {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->tmpPath:Landroid/graphics/Path;

    .line 48
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 240
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDraw(Landroid/graphics/Canvas;)V

    .line 242
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_e

    .line 243
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->tmpPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 246
    :cond_e
    return-void
.end method

.method protected onDrawModeChanged()V
    .registers 7

    .prologue
    .line 191
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    sget-object v4, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    if-ne v3, v4, :cond_5b

    .line 192
    const-string v3, "ImageViewTouchBase"

    const-string v4, "onDrawModeChanged"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    new-instance v0, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 195
    .local v0, "m1":Landroid/graphics/Matrix;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 197
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->getMatrixValues(Landroid/graphics/Matrix;)[F

    move-result-object v1

    .line 198
    .local v1, "v1":[F
    invoke-virtual {v0, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 199
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->getMatrixValues(Landroid/graphics/Matrix;)[F

    move-result-object v2

    .line 201
    .local v2, "v2":[F
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    const/4 v4, 0x2

    aget v4, v1, v4

    neg-float v4, v4

    const/4 v5, 0x5

    aget v5, v1, v5

    neg-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 202
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    const/4 v4, 0x0

    aget v4, v2, v4

    const/4 v5, 0x4

    aget v5, v2, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 203
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mCanvas:Landroid/graphics/Canvas;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v4}, Landroid/graphics/Canvas;->setMatrix(Landroid/graphics/Matrix;)V

    .line 205
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->getScale()F

    move-result v3

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->getBaseScale()F

    move-result v4

    mul-float/2addr v3, v4

    iput v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mCurrentScale:F

    .line 207
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    if-eqz v3, :cond_5b

    .line 208
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mBrushSize:F

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 211
    .end local v0    # "m1":Landroid/graphics/Matrix;
    .end local v1    # "v1":[F
    .end local v2    # "v2":[F
    :cond_5b
    return-void
.end method

.method protected onDrawableChanged(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 258
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDrawableChanged(Landroid/graphics/drawable/Drawable;)V

    .line 260
    if-eqz p1, :cond_19

    instance-of v0, p1, Lit/sephiroth/android/library/imagezoom/graphics/IBitmapDrawable;

    if-eqz v0, :cond_19

    .line 261
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mCanvas:Landroid/graphics/Canvas;

    .line 262
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mCanvas:Landroid/graphics/Canvas;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 263
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->onDrawModeChanged()V

    .line 265
    :cond_19
    return-void
.end method

.method protected onLayoutChanged(IIII)V
    .registers 6
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 52
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onLayoutChanged(IIII)V

    .line 54
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 55
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->onDrawModeChanged()V

    .line 57
    :cond_c
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v2, 0x1

    .line 61
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    sget-object v4, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    if-ne v3, v4, :cond_32

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-ne v3, v2, :cond_32

    .line 62
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 63
    .local v0, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    .line 65
    .local v1, "y":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    packed-switch v3, :pswitch_data_40

    .line 86
    .end local v0    # "x":F
    .end local v1    # "y":F
    :goto_1c
    return v2

    .line 67
    .restart local v0    # "x":F
    .restart local v1    # "y":F
    :pswitch_1d
    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->onTouchStart(FF)V

    .line 68
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->invalidate()V

    goto :goto_1c

    .line 71
    :pswitch_24
    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->onTouchMove(FF)V

    .line 72
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->invalidate()V

    goto :goto_1c

    .line 75
    :pswitch_2b
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->onTouchUp()V

    .line 76
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->invalidate()V

    goto :goto_1c

    .line 83
    .end local v0    # "x":F
    .end local v1    # "y":F
    :cond_32
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    if-ne v2, v3, :cond_3d

    .line 84
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    goto :goto_1c

    .line 86
    :cond_3d
    const/4 v2, 0x0

    goto :goto_1c

    .line 65
    nop

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_2b
        :pswitch_24
    .end packed-switch
.end method

.method public setBrushSize(F)V
    .registers 4
    .param p1, "value"    # F

    .prologue
    .line 172
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mBrushSize:F

    .line 174
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_d

    .line 175
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mBrushSize:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 177
    :cond_d
    return-void
.end method

.method public setDrawLimit(D)V
    .registers 4
    .param p1, "value"    # D

    .prologue
    .line 168
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mRestiction:D

    .line 169
    return-void
.end method

.method public setDrawMode(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;)V
    .registers 3
    .param p1, "mode"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    .prologue
    .line 184
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    if-eq p1, v0, :cond_9

    .line 185
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$TouchMode;

    .line 186
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->onDrawModeChanged()V

    .line 188
    :cond_9
    return-void
.end method

.method public setOnDrawStartListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw$OnDrawListener;

    .line 42
    return-void
.end method

.method public setPaint(Landroid/graphics/Paint;)V
    .registers 3
    .param p1, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 224
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->set(Landroid/graphics/Paint;)V

    .line 225
    return-void
.end method

.method public setPaintEnabled(Z)V
    .registers 5
    .param p1, "enabled"    # Z

    .prologue
    const/4 v2, 0x1

    .line 228
    if-eqz p1, :cond_2b

    .line 229
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    .line 230
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 231
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setDither(Z)V

    .line 232
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    const v1, 0x66ffffcc

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 233
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 234
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotDraw;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 236
    :cond_2b
    return-void
.end method
