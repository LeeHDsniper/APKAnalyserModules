.class public Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "AdobeImageTextDrawable.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
.implements Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;


# instance fields
.field final drawRect:Landroid/graphics/RectF;

.field final lastRect:Landroid/graphics/Rect;

.field protected final linesBreak:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected final mBoundsF:Landroid/graphics/RectF;

.field protected mCursorDistance:F

.field protected final mCursorPaint:Landroid/graphics/Paint;

.field protected mCursorWidth:F

.field protected final mDebugPaint:Landroid/graphics/Paint;

.field protected mDefaultTextSize:F

.field protected mEditing:Z

.field protected mHintString:Ljava/lang/String;

.field protected mIntrinsicHeight:F

.field protected mIntrinsicWidth:F

.field protected mMinHeight:F

.field protected mMinTextSize:F

.field protected mMinWidth:F

.field protected mNow:J

.field protected final mPaint:Landroid/graphics/Paint;

.field protected mPaintAlpha:I

.field protected mShowCursor:Z

.field private mSizeChangeListener:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable$OnSizeChange;

.field protected mStrokeAlpha:I

.field protected mStrokeEnabled:Z

.field protected final mStrokePaint:Landroid/graphics/Paint;

.field protected mText:Ljava/lang/String;

.field protected mTextHint:Z

.field metrics:Landroid/graphics/Paint$FontMetrics;


# direct methods
.method public constructor <init>(Ljava/lang/String;F)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "textSize"    # F

    .prologue
    .line 58
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;-><init>(Ljava/lang/String;FLandroid/graphics/Typeface;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;FLandroid/graphics/Typeface;)V
    .registers 9
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "textSize"    # F
    .param p3, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    const/4 v4, 0x1

    const/high16 v3, 0x3f800000

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 61
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 36
    const-string v0, ""

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    .line 37
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    .line 38
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mEditing:Z

    .line 39
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mNow:J

    .line 40
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mShowCursor:Z

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->linesBreak:Ljava/util/List;

    .line 42
    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mTextHint:Z

    .line 43
    const/high16 v0, 0x40000000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mCursorWidth:F

    .line 44
    iput v3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mCursorDistance:F

    .line 45
    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokeEnabled:Z

    .line 51
    const/high16 v0, 0x41600000

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mMinTextSize:F

    .line 52
    new-instance v0, Landroid/graphics/Paint$FontMetrics;

    invoke-direct {v0}, Landroid/graphics/Paint$FontMetrics;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    .line 53
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->lastRect:Landroid/graphics/Rect;

    .line 54
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->drawRect:Landroid/graphics/RectF;

    .line 62
    new-instance v0, Landroid/graphics/Paint;

    const/16 v1, 0x1c3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    .line 66
    iput p2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mDefaultTextSize:F

    .line 68
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mMinTextSize:F

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mDefaultTextSize:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_5d

    .line 69
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mDefaultTextSize:F

    sub-float/2addr v0, v3

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mMinTextSize:F

    .line 72
    :cond_5d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setDither(Z)V

    .line 73
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 74
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 76
    if-eqz p3, :cond_8d

    .line 78
    const-string v0, "text-drawable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "typeface: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 83
    :cond_8d
    new-instance v0, Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mCursorPaint:Landroid/graphics/Paint;

    .line 85
    new-instance v0, Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    .line 86
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 87
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    const/high16 v1, 0x41200000

    div-float v1, p2, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 89
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mDebugPaint:Landroid/graphics/Paint;

    .line 91
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->setTextColor(I)V

    .line 92
    const/high16 v0, -0x1000000

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->setStrokeColor(I)V

    .line 94
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->setText(Ljava/lang/String;)V

    .line 96
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->computeMinSize()V

    .line 97
    return-void
.end method


# virtual methods
.method public beginEdit()V
    .registers 2

    .prologue
    .line 163
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mEditing:Z

    .line 164
    return-void
.end method

.method protected computeMinSize()V
    .registers 4

    .prologue
    .line 364
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getMinTextWidth()F

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mMinWidth:F

    .line 365
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getMinTextSize()F

    move-result v0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getNumLines()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mMinHeight:F

    .line 367
    const-string v0, "text-drawable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "computeMinSize, minHeight: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mMinHeight:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 369
    return-void
.end method

.method protected computeTextHeight()F
    .registers 5

    .prologue
    .line 386
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getTextSize()F

    move-result v0

    .line 388
    .local v0, "textSize":F
    const-string v1, "text-drawable"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "computeTextHeight. single line height: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 390
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    if-ge v1, v2, :cond_28

    .line 391
    float-to-int v1, v0

    int-to-float v1, v1

    .line 393
    :goto_27
    return v1

    :cond_28
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getNumLines()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    goto :goto_27
.end method

.method protected computeTextWidth()F
    .registers 9

    .prologue
    .line 397
    const/4 v1, 0x0

    .line 399
    .local v1, "maxWidth":F
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_22

    .line 400
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getNumLines()I

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_29

    .line 401
    const/4 v6, 0x0

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {p0, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getTextWidth(II)F

    move-result v6

    iget v7, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mCursorWidth:F

    add-float/2addr v6, v7

    iget v7, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mCursorDistance:F

    add-float v1, v6, v7

    .line 413
    :cond_22
    iget v6, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mMinWidth:F

    invoke-static {v1, v6}, Ljava/lang/Math;->max(FF)F

    move-result v4

    .line 414
    .local v4, "result":F
    return v4

    .line 403
    .end local v4    # "result":F
    :cond_29
    const/4 v5, 0x0

    .line 404
    .local v5, "start":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2b
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->linesBreak:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v0, v6, :cond_22

    .line 405
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->linesBreak:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 406
    .local v2, "nextBreak":I
    invoke-virtual {p0, v5, v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getTextWidth(II)F

    move-result v6

    iget v7, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mCursorWidth:F

    add-float/2addr v6, v7

    iget v7, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mCursorDistance:F

    add-float v3, v6, v7

    .line 407
    .local v3, "real":F
    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 408
    add-int/lit8 v5, v2, 0x1

    .line 404
    add-int/lit8 v0, v0, 0x1

    goto :goto_2b
.end method

.method protected copyBounds(Landroid/graphics/RectF;)V
    .registers 3
    .param p1, "rect"    # Landroid/graphics/RectF;

    .prologue
    .line 427
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 428
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 28
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 432
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->drawRect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->copyBounds(Landroid/graphics/RectF;)V

    .line 434
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mDebugPaint:Landroid/graphics/Paint;

    if-eqz v4, :cond_1c

    .line 435
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->drawRect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mDebugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v9}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 438
    :cond_1c
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getNumLines()I

    move-result v16

    .line 444
    .local v16, "numLines":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F

    .line 446
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    iget v4, v4, Landroid/graphics/Paint$FontMetrics;->descent:F

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    iget v9, v9, Landroid/graphics/Paint$FontMetrics;->leading:F

    add-float/2addr v4, v9

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    iget v9, v9, Landroid/graphics/Paint$FontMetrics;->bottom:F

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->descent:F

    move/from16 v21, v0

    sub-float v9, v9, v21

    sub-float v11, v4, v9

    .line 447
    .local v11, "descent":F
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    iget v4, v4, Landroid/graphics/Paint$FontMetrics;->ascent:F

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    iget v9, v9, Landroid/graphics/Paint$FontMetrics;->top:F

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->ascent:F

    move/from16 v21, v0

    sub-float v9, v9, v21

    sub-float v10, v4, v9

    .line 448
    .local v10, "ascent":F
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->drawRect:Landroid/graphics/RectF;

    iget v0, v4, Landroid/graphics/RectF;->top:F

    move/from16 v20, v0

    .line 449
    .local v20, "top":F
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->drawRect:Landroid/graphics/RectF;

    iget v13, v4, Landroid/graphics/RectF;->left:F

    .line 450
    .local v13, "left":F
    const/16 v17, 0x0

    .line 453
    .local v17, "start":I
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_79
    move/from16 v0, v16

    if-ge v12, v0, :cond_17b

    .line 454
    sub-float v20, v20, v10

    .line 455
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->linesBreak:Ljava/util/List;

    invoke-interface {v4, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v18

    .line 456
    .local v18, "stop":I
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    move/from16 v0, v17

    move/from16 v1, v18

    invoke-virtual {v4, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    .line 458
    .local v19, "text":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->isTextHint()Z

    move-result v4

    if-nez v4, :cond_b2

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokeEnabled:Z

    if-eqz v4, :cond_b2

    .line 459
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v13, v2, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 461
    :cond_b2
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v13, v2, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 463
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mEditing:Z

    if-eqz v4, :cond_157

    add-int/lit8 v4, v16, -0x1

    if-ne v12, v4, :cond_157

    .line 464
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 465
    .local v14, "now":J
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mNow:J

    move-wide/from16 v22, v0

    sub-long v22, v14, v22

    const-wide/16 v24, 0x190

    cmp-long v4, v22, v24

    if-lez v4, :cond_ea

    .line 466
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mShowCursor:Z

    if-nez v4, :cond_15f

    const/4 v4, 0x1

    :goto_e2
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mShowCursor:Z

    .line 467
    move-object/from16 v0, p0

    iput-wide v14, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mNow:J

    .line 470
    :cond_ea
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mShowCursor:Z

    if-eqz v4, :cond_157

    .line 471
    add-int/lit8 v4, v16, -0x1

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->lastRect:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v9}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getLineBounds(ILandroid/graphics/Rect;)V

    .line 473
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->drawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->lastRect:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->right:I

    int-to-float v9, v9

    add-float/2addr v4, v9

    move-object/from16 v0, p0

    iget v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mCursorDistance:F

    add-float/2addr v9, v4

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->isTextHint()Z

    move-result v4

    if-nez v4, :cond_11a

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokeEnabled:Z

    if-nez v4, :cond_161

    :cond_11a
    const/4 v4, 0x0

    .line 474
    :goto_11b
    add-float v5, v9, v4

    .line 475
    .local v5, "l":F
    add-float v6, v20, v10

    .line 476
    .local v6, "t":F
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->drawRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->lastRect:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->right:I

    int-to-float v9, v9

    add-float/2addr v4, v9

    move-object/from16 v0, p0

    iget v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mCursorWidth:F

    add-float/2addr v4, v9

    move-object/from16 v0, p0

    iget v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mCursorDistance:F

    add-float/2addr v9, v4

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->isTextHint()Z

    move-result v4

    if-nez v4, :cond_143

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokeEnabled:Z

    if-nez v4, :cond_16e

    :cond_143
    const/4 v4, 0x0

    .line 477
    :goto_144
    add-float v7, v9, v4

    .line 478
    .local v7, "r":F
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    iget v4, v4, Landroid/graphics/Paint$FontMetrics;->descent:F

    add-float v8, v20, v4

    .line 480
    .local v8, "b":F
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mCursorPaint:Landroid/graphics/Paint;

    move-object/from16 v4, p1

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 484
    .end local v5    # "l":F
    .end local v6    # "t":F
    .end local v7    # "r":F
    .end local v8    # "b":F
    .end local v14    # "now":J
    :cond_157
    add-int/lit8 v17, v18, 0x1

    .line 485
    add-float v20, v20, v11

    .line 453
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_79

    .line 466
    .restart local v14    # "now":J
    :cond_15f
    const/4 v4, 0x0

    goto :goto_e2

    .line 473
    :cond_161
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    .line 474
    invoke-virtual {v4}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v4

    const/high16 v21, 0x40000000

    div-float v4, v4, v21

    goto :goto_11b

    .line 476
    .restart local v5    # "l":F
    .restart local v6    # "t":F
    :cond_16e
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    .line 477
    invoke-virtual {v4}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v4

    const/high16 v21, 0x40000000

    div-float v4, v4, v21

    goto :goto_144

    .line 487
    .end local v5    # "l":F
    .end local v6    # "t":F
    .end local v14    # "now":J
    .end local v18    # "stop":I
    .end local v19    # "text":Ljava/lang/String;
    :cond_17b
    return-void
.end method

.method public endEdit()V
    .registers 3

    .prologue
    .line 168
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mEditing:Z

    .line 170
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_14

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_1d

    :cond_14
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mHintString:Ljava/lang/String;

    if-eqz v0, :cond_1d

    .line 171
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mHintString:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->setTextHint(Ljava/lang/String;)V

    .line 173
    :cond_1d
    return-void
.end method

.method public getCurrentHeight()F
    .registers 4

    .prologue
    .line 177
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mIntrinsicHeight:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_d

    .line 178
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->computeTextHeight()F

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mIntrinsicHeight:F

    .line 181
    :cond_d
    const-string v0, "text-drawable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getIntrinsicHeight: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mIntrinsicHeight:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mIntrinsicHeight:F

    return v0
.end method

.method public getCurrentWidth()F
    .registers 4

    .prologue
    .line 201
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mIntrinsicWidth:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_13

    .line 202
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mMinWidth:F

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->computeTextWidth()F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mIntrinsicWidth:F

    .line 205
    :cond_13
    const-string v0, "text-drawable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getIntrinsicWidth: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mIntrinsicWidth:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mIntrinsicWidth:F

    return v0
.end method

.method public getDefaultTextSize()F
    .registers 2

    .prologue
    .line 113
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mDefaultTextSize:F

    return v0
.end method

.method public getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F
    .registers 3
    .param p1, "metrics"    # Landroid/graphics/Paint$FontMetrics;

    .prologue
    .line 360
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F

    move-result v0

    return v0
.end method

.method public getHorizontalFlip()Z
    .registers 2

    .prologue
    .line 188
    const/4 v0, 0x0

    return v0
.end method

.method public getHorizontalFlipEnabled()Z
    .registers 2

    .prologue
    .line 193
    const/4 v0, 0x0

    return v0
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 217
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getCurrentHeight()F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .prologue
    .line 212
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getCurrentWidth()F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method protected getLineBounds(ILandroid/graphics/Rect;)V
    .registers 8
    .param p1, "line"    # I
    .param p2, "outBounds"    # Landroid/graphics/Rect;

    .prologue
    const/4 v4, 0x0

    .line 491
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_69

    .line 492
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getNumLines()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_20

    .line 493
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0, v1, v4, v2, p2}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 494
    iput v4, p2, Landroid/graphics/Rect;->left:I

    .line 506
    :goto_1f
    return-void

    .line 497
    :cond_20
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->linesBreak:Ljava/util/List;

    add-int/lit8 v3, p1, -0x1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v3, v0, 0x1

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->linesBreak:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v1, v2, v3, v0, p2}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 498
    iput v4, p2, Landroid/graphics/Rect;->left:I

    .line 499
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->linesBreak:Ljava/util/List;

    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v1, v0, 0x1

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->linesBreak:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v1, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getTextWidth(II)F

    move-result v0

    float-to-int v0, v0

    iput v0, p2, Landroid/graphics/Rect;->right:I

    goto :goto_1f

    .line 502
    :cond_69
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0, v1, v4, v2, p2}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 503
    iput v4, p2, Landroid/graphics/Rect;->left:I

    .line 504
    iput v4, p2, Landroid/graphics/Rect;->right:I

    goto :goto_1f
.end method

.method public getMinHeight()F
    .registers 3

    .prologue
    .line 156
    const-string v0, "text-drawable"

    const-string v1, "getMinHeight"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mMinHeight:F

    return v0
.end method

.method public getMinTextSize()F
    .registers 2

    .prologue
    .line 355
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mMinTextSize:F

    return v0
.end method

.method protected getMinTextWidth()F
    .registers 4

    .prologue
    .line 372
    const/4 v1, 0x1

    new-array v0, v1, [F

    .line 373
    .local v0, "widths":[F
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    const-string v2, " "

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Paint;->getTextWidths(Ljava/lang/String;[F)I

    .line 374
    const/4 v1, 0x0

    aget v1, v0, v1

    const/high16 v2, 0x40000000

    div-float/2addr v1, v2

    return v1
.end method

.method public getMinWidth()F
    .registers 2

    .prologue
    .line 150
    const v0, 0x7f7fffff

    return v0
.end method

.method public getNumLines()I
    .registers 3

    .prologue
    .line 515
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->linesBreak:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 227
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    return v0
.end method

.method public getScaleX()F
    .registers 2

    .prologue
    .line 101
    const/high16 v0, 0x3f800000

    return v0
.end method

.method public getStrokeEnabled()Z
    .registers 2

    .prologue
    .line 127
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokeEnabled:Z

    return v0
.end method

.method public getText()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 232
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    return-object v0
.end method

.method public getTextColor()I
    .registers 2

    .prologue
    .line 237
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    move-result v0

    return v0
.end method

.method public getTextSize()F
    .registers 2

    .prologue
    .line 252
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getTextSize()F

    move-result v0

    return v0
.end method

.method public getTextStrokeColor()I
    .registers 2

    .prologue
    .line 242
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    move-result v0

    return v0
.end method

.method protected getTextWidth(II)F
    .registers 7
    .param p1, "start"    # I
    .param p2, "stop"    # I

    .prologue
    .line 418
    sub-int v1, p2, p1

    new-array v0, v1, [F

    .line 420
    .local v0, "w":[F
    const-string v1, "text-drawable"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getTextWidth: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    invoke-virtual {v3, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 422
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    invoke-virtual {v1, v2, p1, p2, v0}, Landroid/graphics/Paint;->getTextWidths(Ljava/lang/String;II[F)I

    .line 423
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getTotal([F)F

    move-result v1

    return v1
.end method

.method protected getTotal([F)F
    .registers 6
    .param p1, "array"    # [F

    .prologue
    .line 378
    const/4 v0, 0x0

    .line 379
    .local v0, "total":F
    array-length v3, p1

    const/4 v2, 0x0

    :goto_3
    if-ge v2, v3, :cond_b

    aget v1, p1, v2

    .line 380
    .local v1, "v":F
    add-float/2addr v0, v1

    .line 379
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 382
    .end local v1    # "v":F
    :cond_b
    return v0
.end method

.method protected invalidateSize()V
    .registers 2

    .prologue
    const/high16 v0, -0x40800000

    .line 221
    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mIntrinsicHeight:F

    .line 222
    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mIntrinsicWidth:F

    .line 223
    return-void
.end method

.method public isEditing()Z
    .registers 2

    .prologue
    .line 257
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mEditing:Z

    return v0
.end method

.method public isTextHint()Z
    .registers 2

    .prologue
    .line 145
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mTextHint:Z

    return v0
.end method

.method protected onTextInvalidate()V
    .registers 9

    .prologue
    .line 520
    const-string v0, "text-drawable"

    const-string v1, "onTextInvalidate"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 523
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->isTextHint()Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 524
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaintAlpha:I

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 525
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokeAlpha:I

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 531
    :goto_1f
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->linesBreak:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 532
    const/4 v7, 0x0

    .line 533
    .local v7, "start":I
    const/4 v6, -0x1

    .line 535
    .local v6, "last":I
    :goto_26
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    const/16 v1, 0xa

    invoke-virtual {v0, v1, v7}, Ljava/lang/String;->indexOf(II)I

    move-result v6

    const/4 v0, -0x1

    if-le v6, v0, :cond_4c

    .line 536
    add-int/lit8 v7, v6, 0x1

    .line 537
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->linesBreak:Ljava/util/List;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_26

    .line 527
    .end local v6    # "last":I
    .end local v7    # "start":I
    :cond_3d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaintAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 528
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokeAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_1f

    .line 539
    .restart local v6    # "last":I
    .restart local v7    # "start":I
    :cond_4c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->linesBreak:Ljava/util/List;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 541
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->invalidateSize()V

    .line 543
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mSizeChangeListener:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable$OnSizeChange;

    if-eqz v0, :cond_84

    .line 544
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mSizeChangeListener:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable$OnSizeChange;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    iget v2, v1, Landroid/graphics/RectF;->left:F

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    iget v3, v1, Landroid/graphics/RectF;->top:F

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    .line 548
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getIntrinsicWidth()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v4, v1

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    .line 549
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getIntrinsicHeight()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v5, v1

    move-object v1, p0

    .line 544
    invoke-interface/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable$OnSizeChange;->onSizeChanged(Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;FFFF)V

    .line 551
    :cond_84
    return-void
.end method

.method public setAlpha(I)V
    .registers 3
    .param p1, "alpha"    # I

    .prologue
    .line 262
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 263
    return-void
.end method

.method public setBounds(FFFF)V
    .registers 8
    .param p1, "left"    # F
    .param p2, "top"    # F
    .param p3, "right"    # F
    .param p4, "bottom"    # F

    .prologue
    .line 267
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    cmpl-float v0, p1, v0

    if-nez v0, :cond_20

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    cmpl-float v0, p2, v0

    if-nez v0, :cond_20

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    cmpl-float v0, p3, v0

    if-nez v0, :cond_20

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    cmpl-float v0, p4, v0

    if-eqz v0, :cond_60

    .line 269
    :cond_20
    const-string v0, "text-drawable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setBounds: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 272
    sub-float v0, p4, p2

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->setTextSize(F)V

    .line 274
    :cond_60
    return-void
.end method

.method public setBounds(IIII)V
    .registers 9
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 278
    invoke-super {p0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 279
    int-to-float v0, p1

    int-to-float v1, p2

    int-to-float v2, p3

    int-to-float v3, p4

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->setBounds(FFFF)V

    .line 280
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 284
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 285
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 286
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mCursorPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 287
    return-void
.end method

.method public setCursorWidth(I)V
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 117
    int-to-float v0, p1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mCursorWidth:F

    .line 118
    return-void
.end method

.method public setHorizontalFlip(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 197
    return-void
.end method

.method public setMinSize(FF)V
    .registers 3
    .param p1, "width"    # F
    .param p2, "height"    # F

    .prologue
    .line 345
    return-void
.end method

.method public setMinTextSize(F)V
    .registers 5
    .param p1, "size"    # F

    .prologue
    .line 349
    const-string v0, "text-drawable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setMinTextSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 351
    iput p1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mMinTextSize:F

    .line 352
    return-void
.end method

.method public setOnSizeChangeListener(Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable$OnSizeChange;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable$OnSizeChange;

    .prologue
    .line 555
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mSizeChangeListener:Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable$OnSizeChange;

    .line 556
    return-void
.end method

.method public setScaleX(F)V
    .registers 2
    .param p1, "value"    # F

    .prologue
    .line 105
    return-void
.end method

.method public setStrokeColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 290
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 291
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokeAlpha:I

    .line 292
    return-void
.end method

.method public setStrokeEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 122
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokeEnabled:Z

    .line 123
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 296
    check-cast p1, Ljava/lang/String;

    .end local p1    # "text":Ljava/lang/CharSequence;
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->setText(Ljava/lang/String;)V

    .line 297
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .registers 5
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 302
    const-string v0, "text-drawable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setText: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    .line 305
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mTextHint:Z

    .line 306
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->onTextInvalidate()V

    .line 307
    return-void
.end method

.method public setTextColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 311
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 312
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mCursorPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 313
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaintAlpha:I

    .line 314
    return-void
.end method

.method public setTextHint(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 132
    check-cast p1, Ljava/lang/String;

    .end local p1    # "text":Ljava/lang/CharSequence;
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->setTextHint(Ljava/lang/String;)V

    .line 133
    return-void
.end method

.method public setTextHint(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 137
    if-nez p1, :cond_15

    const-string v0, ""

    :goto_4
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mText:Ljava/lang/String;

    .line 138
    if-eqz p1, :cond_17

    const/4 v0, 0x1

    :goto_9
    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mTextHint:Z

    .line 139
    if-nez p1, :cond_f

    const-string p1, ""

    .end local p1    # "text":Ljava/lang/String;
    :cond_f
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mHintString:Ljava/lang/String;

    .line 140
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->onTextInvalidate()V

    .line 141
    return-void

    .restart local p1    # "text":Ljava/lang/String;
    :cond_15
    move-object v0, p1

    .line 137
    goto :goto_4

    .line 138
    :cond_17
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public setTextSize(F)V
    .registers 6
    .param p1, "size"    # F

    .prologue
    .line 317
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getNumLines()I

    move-result v1

    int-to-float v1, v1

    div-float v1, p1, v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getTextSize()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Float;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_60

    .line 319
    const-string v1, "text-drawable"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setTextSize: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getNumLines()I

    move-result v0

    .line 322
    .local v0, "lines":I
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mPaint:Landroid/graphics/Paint;

    int-to-float v2, v0

    div-float v2, p1, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 323
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mCursorPaint:Landroid/graphics/Paint;

    int-to-float v2, v0

    div-float v2, p1, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 324
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    int-to-float v2, v0

    div-float v2, p1, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 325
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    int-to-float v2, v0

    div-float v2, p1, v2

    const/high16 v3, 0x41200000

    div-float/2addr v2, v3

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 326
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->invalidateSize()V

    .line 327
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->computeMinSize()V

    .line 329
    .end local v0    # "lines":I
    :cond_60
    return-void
.end method

.method public validateSize(Landroid/graphics/RectF;)Z
    .registers 5
    .param p1, "rect"    # Landroid/graphics/RectF;

    .prologue
    .line 334
    const-string v0, "text-drawable"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "validateSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " == "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mMinHeight:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->mMinHeight:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_42

    .line 337
    const/4 v0, 0x0

    .line 339
    :goto_41
    return v0

    :cond_42
    const/4 v0, 0x1

    goto :goto_41
.end method
