.class public Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;
.super Lit/sephiroth/android/library/imagezoom/ImageViewTouch;
.source "ImageViewTouchAndDraw.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;,
        Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawStartListener;,
        Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;
    }
.end annotation


# instance fields
.field protected mCanvas:Landroid/graphics/Canvas;

.field protected mCopy:Landroid/graphics/Bitmap;

.field private mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawStartListener;

.field private mDrawPathListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;

.field protected mIdentityMatrix:Landroid/graphics/Matrix;

.field protected mInvertedMatrix:Landroid/graphics/Matrix;

.field protected mPaint:Landroid/graphics/Paint;

.field protected mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

.field private mTouchStarted:Z

.field protected mX:F

.field protected mY:F

.field protected tmpPath:Landroid/graphics/Path;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 38
    invoke-direct {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->tmpPath:Landroid/graphics/Path;

    .line 24
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    .line 26
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mIdentityMatrix:Landroid/graphics/Matrix;

    .line 27
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    .line 39
    return-void
.end method

.method public static getMatrixValues(Landroid/graphics/Matrix;)[F
    .registers 3
    .param p0, "m"    # Landroid/graphics/Matrix;

    .prologue
    .line 197
    const/16 v1, 0x9

    new-array v0, v1, [F

    .line 198
    .local v0, "values":[F
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 199
    return-object v0
.end method

.method private onTouchMove(FF)V
    .registers 14
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    const/high16 v7, 0x40800000

    const/high16 v6, 0x40000000

    .line 128
    iget-boolean v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mTouchStarted:Z

    if-nez v5, :cond_c

    .line 155
    :cond_b
    :goto_b
    return-void

    .line 132
    :cond_c
    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mX:F

    sub-float v5, p1, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 133
    .local v0, "dx":F
    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mY:F

    sub-float v5, p2, v5

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 134
    .local v1, "dy":F
    cmpl-float v5, v0, v7

    if-gez v5, :cond_24

    cmpl-float v5, v1, v7

    if-ltz v5, :cond_b

    .line 136
    :cond_24
    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mX:F

    add-float/2addr v5, p1

    div-float v3, v5, v6

    .line 137
    .local v3, "x1":F
    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mY:F

    add-float/2addr v5, p2

    div-float v4, v5, v6

    .line 139
    .local v4, "y1":F
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->tmpPath:Landroid/graphics/Path;

    iget v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mX:F

    iget v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mY:F

    invoke-virtual {v5, v6, v7, v3, v4}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 141
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mCanvas:Landroid/graphics/Canvas;

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->tmpPath:Landroid/graphics/Path;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v6, v7}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 142
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->tmpPath:Landroid/graphics/Path;

    invoke-virtual {v5}, Landroid/graphics/Path;->reset()V

    .line 143
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->tmpPath:Landroid/graphics/Path;

    invoke-virtual {v5, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 145
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mDrawPathListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;

    if-eqz v5, :cond_71

    .line 147
    const/4 v5, 0x4

    new-array v2, v5, [F

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mX:F

    aput v5, v2, v8

    iget v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mY:F

    aput v5, v2, v9

    aput v3, v2, v10

    const/4 v5, 0x3

    aput v4, v2, v5

    .line 148
    .local v2, "pts":[F
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v5, v2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 149
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mDrawPathListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;

    aget v6, v2, v8

    aget v7, v2, v9

    aget v8, v2, v10

    const/4 v9, 0x3

    aget v9, v2, v9

    invoke-interface {v5, v6, v7, v8, v9}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;->onQuadTo(FFFF)V

    .line 152
    .end local v2    # "pts":[F
    :cond_71
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mX:F

    .line 153
    iput p2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mY:F

    goto :goto_b
.end method

.method private onTouchStart(FF)V
    .registers 7
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 103
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mTouchStarted:Z

    if-eqz v1, :cond_7

    .line 125
    :cond_6
    :goto_6
    return-void

    .line 107
    :cond_7
    iput-boolean v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mTouchStarted:Z

    .line 108
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->tmpPath:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 109
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->tmpPath:Landroid/graphics/Path;

    invoke-virtual {v1, p1, p2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 111
    iput p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mX:F

    .line 112
    iput p2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mY:F

    .line 114
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawStartListener;

    if-eqz v1, :cond_20

    .line 115
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawStartListener;

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawStartListener;->onDrawStart()V

    .line 117
    :cond_20
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mDrawPathListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;

    if-eqz v1, :cond_6

    .line 119
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mDrawPathListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;->onStart()V

    .line 121
    const/4 v1, 0x2

    new-array v0, v1, [F

    aput p1, v0, v2

    aput p2, v0, v3

    .line 122
    .local v0, "pts":[F
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 123
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mDrawPathListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;

    aget v2, v0, v2

    aget v3, v0, v3

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;->onMoveTo(FF)V

    goto :goto_6
.end method

.method private onTouchUp()V
    .registers 2

    .prologue
    .line 158
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mTouchStarted:Z

    if-eqz v0, :cond_12

    .line 159
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->tmpPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 160
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mDrawPathListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;

    if-eqz v0, :cond_12

    .line 161
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mDrawPathListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;->onEnd()V

    .line 164
    :cond_12
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mTouchStarted:Z

    .line 165
    return-void
.end method


# virtual methods
.method public commit(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v3, 0x0

    .line 236
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 237
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_23

    instance-of v1, v0, Lit/sephiroth/android/library/imagezoom/graphics/IBitmapDrawable;

    if-eqz v1, :cond_23

    .line 238
    check-cast v0, Lit/sephiroth/android/library/imagezoom/graphics/IBitmapDrawable;

    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-interface {v0}, Lit/sephiroth/android/library/imagezoom/graphics/IBitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {p1, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 239
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mCopy:Landroid/graphics/Bitmap;

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {p1, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 241
    :cond_23
    return-void
.end method

.method public getDrawMode()Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    return-object v0
.end method

.method public getDrawingScale()F
    .registers 2

    .prologue
    .line 203
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->getScale(Landroid/graphics/Matrix;)F

    move-result v0

    return v0
.end method

.method public getOverlayBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 262
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mCopy:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getPaint()Landroid/graphics/Paint;
    .registers 2

    .prologue
    .line 207
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 51
    invoke-super {p0, p1, p2, p3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 52
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mPaint:Landroid/graphics/Paint;

    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 54
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mPaint:Landroid/graphics/Paint;

    const/high16 v1, -0x10000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 55
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 56
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 57
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 58
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x41200000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 60
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->tmpPath:Landroid/graphics/Path;

    .line 61
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 216
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDraw(Landroid/graphics/Canvas;)V

    .line 220
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mCopy:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_1b

    .line 221
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getSaveCount()I

    move-result v0

    .line 222
    .local v0, "saveCount":I
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 223
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mCopy:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 224
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 226
    .end local v0    # "saveCount":I
    :cond_1b
    return-void
.end method

.method protected onDrawModeChanged()V
    .registers 7

    .prologue
    .line 179
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    sget-object v4, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    if-ne v3, v4, :cond_5c

    .line 181
    new-instance v0, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 182
    .local v0, "m1":Landroid/graphics/Matrix;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    .line 184
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->getMatrixValues(Landroid/graphics/Matrix;)[F

    move-result-object v1

    .line 185
    .local v1, "v1":[F
    invoke-virtual {v0, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 186
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->getMatrixValues(Landroid/graphics/Matrix;)[F

    move-result-object v2

    .line 188
    .local v2, "v2":[F
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    const/4 v4, 0x2

    aget v4, v1, v4

    neg-float v4, v4

    const/4 v5, 0x5

    aget v5, v1, v5

    neg-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 189
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    const/4 v4, 0x0

    aget v4, v2, v4

    const/4 v5, 0x4

    aget v5, v2, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 190
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mCanvas:Landroid/graphics/Canvas;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v4}, Landroid/graphics/Canvas;->setMatrix(Landroid/graphics/Matrix;)V

    .line 192
    const-string v3, "ImageViewTouchBase"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "scale: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mInvertedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v5}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->getScale(Landroid/graphics/Matrix;)F

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    .end local v0    # "m1":Landroid/graphics/Matrix;
    .end local v1    # "v1":[F
    .end local v2    # "v2":[F
    :cond_5c
    return-void
.end method

.method protected onDrawableChanged(Landroid/graphics/drawable/Drawable;)V
    .registers 6
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 245
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDrawableChanged(Landroid/graphics/drawable/Drawable;)V

    .line 247
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mCopy:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_f

    .line 248
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mCopy:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 249
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mCopy:Landroid/graphics/Bitmap;

    .line 252
    :cond_f
    if-eqz p1, :cond_3d

    instance-of v1, p1, Lit/sephiroth/android/library/imagezoom/graphics/IBitmapDrawable;

    if-eqz v1, :cond_3d

    .line 253
    check-cast p1, Lit/sephiroth/android/library/imagezoom/graphics/IBitmapDrawable;

    .end local p1    # "drawable":Landroid/graphics/drawable/Drawable;
    invoke-interface {p1}, Lit/sephiroth/android/library/imagezoom/graphics/IBitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 254
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mCopy:Landroid/graphics/Bitmap;

    .line 255
    new-instance v1, Landroid/graphics/Canvas;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mCopy:Landroid/graphics/Bitmap;

    invoke-direct {v1, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mCanvas:Landroid/graphics/Canvas;

    .line 256
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mCanvas:Landroid/graphics/Canvas;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 257
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->onDrawModeChanged()V

    .line 259
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :cond_3d
    return-void
.end method

.method protected onLayoutChanged(IIII)V
    .registers 5
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 65
    invoke-super {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onLayoutChanged(IIII)V

    .line 66
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->onDrawModeChanged()V

    .line 67
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v2, 0x1

    .line 71
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    sget-object v4, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    if-ne v3, v4, :cond_32

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-ne v3, v2, :cond_32

    .line 72
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 73
    .local v0, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    .line 75
    .local v1, "y":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    packed-switch v3, :pswitch_data_40

    .line 97
    .end local v0    # "x":F
    .end local v1    # "y":F
    :goto_1c
    return v2

    .line 77
    .restart local v0    # "x":F
    .restart local v1    # "y":F
    :pswitch_1d
    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->onTouchStart(FF)V

    .line 78
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->invalidate()V

    goto :goto_1c

    .line 81
    :pswitch_24
    invoke-direct {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->onTouchMove(FF)V

    .line 82
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->invalidate()V

    goto :goto_1c

    .line 86
    :pswitch_2b
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->onTouchUp()V

    .line 87
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->invalidate()V

    goto :goto_1c

    .line 94
    .end local v0    # "x":F
    .end local v1    # "y":F
    :cond_32
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    sget-object v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;->IMAGE:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    if-ne v2, v3, :cond_3d

    .line 95
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    goto :goto_1c

    .line 97
    :cond_3d
    const/4 v2, 0x0

    goto :goto_1c

    .line 75
    nop

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_2b
        :pswitch_24
        :pswitch_2b
    .end packed-switch
.end method

.method public setDrawMode(Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;)V
    .registers 3
    .param p1, "mode"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    .prologue
    .line 172
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    if-eq p1, v0, :cond_9

    .line 173
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$TouchMode;

    .line 174
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->onDrawModeChanged()V

    .line 176
    :cond_9
    return-void
.end method

.method public setOnDrawPathListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mDrawPathListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawPathListener;

    .line 47
    return-void
.end method

.method public setOnDrawStartListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawStartListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawStartListener;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mDrawListener:Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw$OnDrawStartListener;

    .line 43
    return-void
.end method

.method public setPaint(Landroid/graphics/Paint;)V
    .registers 3
    .param p1, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 211
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTouchAndDraw;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->set(Landroid/graphics/Paint;)V

    .line 212
    return-void
.end method
