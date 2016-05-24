.class public Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;
.super Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;
.source "AdobeImageMemeTextDrawable.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
.implements Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;


# instance fields
.field private mBoundsChanged:Z

.field protected mContentHeight:I

.field protected mContentWidth:I

.field private mTempPaint:Landroid/graphics/Paint;

.field private mTextChanged:Z

.field mTop:Z

.field private maxSize:F

.field private padW:F

.field private xoff:F

.field private yoff:F


# direct methods
.method public constructor <init>(Ljava/lang/String;FLandroid/graphics/Typeface;Z)V
    .registers 7
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "textSize"    # F
    .param p3, "typeface"    # Landroid/graphics/Typeface;
    .param p4, "top"    # Z

    .prologue
    const/4 v0, 0x1

    .line 29
    invoke-direct {p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;-><init>(Ljava/lang/String;FLandroid/graphics/Typeface;)V

    .line 31
    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mTextChanged:Z

    .line 32
    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mBoundsChanged:Z

    .line 33
    iput-boolean p4, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mTop:Z

    .line 34
    new-instance v0, Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mTempPaint:Landroid/graphics/Paint;

    .line 36
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->setText(Ljava/lang/String;)V

    .line 37
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 20
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 137
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->drawRect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->copyBounds(Landroid/graphics/RectF;)V

    .line 139
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mDebugPaint:Landroid/graphics/Paint;

    if-eqz v2, :cond_1c

    .line 140
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->drawRect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mDebugPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v7}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 143
    :cond_1c
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->getNumLines()I

    move-result v12

    .line 147
    .local v12, "numLines":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F

    .line 149
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    iget v2, v2, Landroid/graphics/Paint$FontMetrics;->ascent:F

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    iget v7, v7, Landroid/graphics/Paint$FontMetrics;->top:F

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    iget v14, v14, Landroid/graphics/Paint$FontMetrics;->ascent:F

    sub-float/2addr v7, v14

    sub-float v8, v2, v7

    .line 151
    .local v8, "ascent":F
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mTop:Z

    if-eqz v2, :cond_d4

    .line 152
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->drawRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    sub-float v13, v2, v8

    .line 157
    .local v13, "top":F
    :goto_4c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->drawRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    move-object/from16 v0, p0

    iget v7, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->xoff:F

    add-float v9, v2, v7

    .line 159
    .local v9, "left":F
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mText:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v9, v13, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 160
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mText:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v9, v13, v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 162
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mEditing:Z

    if-eqz v2, :cond_d3

    .line 163
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 164
    .local v10, "now":J
    move-object/from16 v0, p0

    iget-wide v14, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mNow:J

    sub-long v14, v10, v14

    const-wide/16 v16, 0x12c

    cmp-long v2, v14, v16

    if-lez v2, :cond_97

    .line 165
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mShowCursor:Z

    if-nez v2, :cond_eb

    const/4 v2, 0x1

    :goto_8f
    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mShowCursor:Z

    .line 166
    move-object/from16 v0, p0

    iput-wide v10, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mNow:J

    .line 169
    :cond_97
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mShowCursor:Z

    if-eqz v2, :cond_d3

    .line 170
    add-int/lit8 v2, v12, -0x1

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->lastRect:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->getLineBounds(ILandroid/graphics/Rect;)V

    .line 172
    move-object/from16 v0, p0

    iget v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mCursorDistance:F

    add-float/2addr v2, v9

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->lastRect:Landroid/graphics/Rect;

    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v7

    int-to-float v7, v7

    add-float v3, v2, v7

    .line 173
    .local v3, "l":F
    add-float v4, v13, v8

    .line 174
    .local v4, "t":F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mCursorWidth:F

    add-float v5, v3, v2

    .line 175
    .local v5, "r":F
    move v6, v13

    .line 177
    .local v6, "b":F
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 178
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mCursorPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 181
    .end local v3    # "l":F
    .end local v4    # "t":F
    .end local v5    # "r":F
    .end local v6    # "b":F
    .end local v10    # "now":J
    :cond_d3
    return-void

    .line 154
    .end local v9    # "left":F
    .end local v13    # "top":F
    :cond_d4
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->drawRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    iget v7, v7, Landroid/graphics/Paint$FontMetrics;->bottom:F

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->metrics:Landroid/graphics/Paint$FontMetrics;

    iget v14, v14, Landroid/graphics/Paint$FontMetrics;->descent:F

    sub-float/2addr v7, v14

    sub-float v13, v2, v7

    .restart local v13    # "top":F
    goto/16 :goto_4c

    .line 165
    .restart local v9    # "left":F
    .restart local v10    # "now":J
    :cond_eb
    const/4 v2, 0x0

    goto :goto_8f
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getTextSize()F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .prologue
    .line 48
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mContentWidth:I

    return v0
.end method

.method public getNumLines()I
    .registers 2

    .prologue
    .line 185
    const/4 v0, 0x1

    return v0
.end method

.method protected onTextInvalidate()V
    .registers 1

    .prologue
    .line 72
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->invalidateSize()V

    .line 73
    return-void
.end method

.method public setBounds(FFFF)V
    .registers 11
    .param p1, "left"    # F
    .param p2, "top"    # F
    .param p3, "right"    # F
    .param p4, "bottom"    # F

    .prologue
    const/4 v5, 0x0

    const/high16 v4, 0x40000000

    .line 91
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    cmpl-float v2, p1, v2

    if-nez v2, :cond_23

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    cmpl-float v2, p2, v2

    if-nez v2, :cond_23

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    cmpl-float v2, p3, v2

    if-nez v2, :cond_23

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    cmpl-float v2, p4, v2

    if-eqz v2, :cond_34

    .line 92
    :cond_23
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    invoke-virtual {v2, p1, p2, p3, p4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 94
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mBoundsChanged:Z

    .line 95
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    float-to-int v2, v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mContentWidth:I

    .line 98
    :cond_34
    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mTextChanged:Z

    if-nez v2, :cond_3c

    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mBoundsChanged:Z

    if-eqz v2, :cond_a0

    .line 99
    :cond_3c
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mDefaultTextSize:F

    .line 102
    .local v0, "sizeValT":F
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mTempPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 104
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mText:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_a1

    .line 105
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mTempPaint:Landroid/graphics/Paint;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mText:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    .line 110
    .local v1, "topW":F
    :goto_53
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    iget v3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->padW:F

    mul-float/2addr v3, v4

    sub-float/2addr v2, v3

    div-float/2addr v2, v1

    mul-float/2addr v0, v2

    .line 111
    iget v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->maxSize:F

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 113
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 114
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 115
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    const/high16 v3, 0x41200000

    div-float v3, v0, v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 117
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v2

    iput v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mCursorDistance:F

    .line 119
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mText:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_aa

    .line 120
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mText:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    .line 125
    :goto_90
    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->yoff:F

    .line 127
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mBoundsF:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    sub-float/2addr v2, v1

    div-float/2addr v2, v4

    iput v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->xoff:F

    .line 129
    iput-boolean v5, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mTextChanged:Z

    .line 130
    iput-boolean v5, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mBoundsChanged:Z

    .line 132
    .end local v0    # "sizeValT":F
    .end local v1    # "topW":F
    :cond_a0
    return-void

    .line 107
    .restart local v0    # "sizeValT":F
    :cond_a1
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mTempPaint:Landroid/graphics/Paint;

    const-string v3, "a"

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    .restart local v1    # "topW":F
    goto :goto_53

    .line 122
    :cond_aa
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mPaint:Landroid/graphics/Paint;

    const-string v3, "a"

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    goto :goto_90
.end method

.method public setContentSize(FF)V
    .registers 5
    .param p1, "w"    # F
    .param p2, "h"    # F

    .prologue
    .line 40
    float-to-int v0, p1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mContentWidth:I

    .line 41
    float-to-int v0, p2

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mContentHeight:I

    .line 42
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const/high16 v1, 0x40e00000

    div-float/2addr v0, v1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->maxSize:F

    .line 43
    const/high16 v0, 0x42200000

    div-float v0, p1, v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->padW:F

    .line 44
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .registers 3
    .param p1, "arg0"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "DefaultLocale"
        }
    .end annotation

    .prologue
    .line 66
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    invoke-super {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->setText(Ljava/lang/String;)V

    .line 67
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mTextChanged:Z

    .line 68
    return-void
.end method

.method public setTextSize(F)V
    .registers 3
    .param p1, "size"    # F

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->getTextSize()F

    move-result v0

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_b

    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->mTextChanged:Z

    .line 61
    :cond_b
    return-void
.end method

.method public validateSize(Landroid/graphics/RectF;)Z
    .registers 3
    .param p1, "arg0"    # Landroid/graphics/RectF;

    .prologue
    .line 77
    const/4 v0, 0x1

    return v0
.end method
