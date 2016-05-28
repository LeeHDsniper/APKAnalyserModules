.class public Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;
.super Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;
.source "UndoRedoOverlay.java"


# instance fields
.field private mRedoDrawable:Landroid/graphics/drawable/Drawable;

.field private mRedoText:Ljava/lang/CharSequence;

.field private mRedoTextDrawable:Landroid/graphics/drawable/Drawable;

.field private final mTextAlign:Landroid/text/Layout$Alignment;

.field private mTitleDrawable1:Landroid/graphics/drawable/Drawable;

.field private mTitleText:Ljava/lang/CharSequence;

.field private final mTitleWidthFraction:F

.field private mUndoDrawable:Landroid/graphics/drawable/Drawable;

.field private mUndoRext:Ljava/lang/CharSequence;

.field private mUndoTextDrawable:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    const-string v1, "undo_redo"

    sget v2, Lcom/aviary/android/feather/sdk/R$attr;->com_adobe_image_editor_undo_redo_overlay_style:I

    const/4 v3, 0x5

    invoke-direct {p0, p1, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;-><init>(Landroid/content/Context;Ljava/lang/String;II)V

    .line 35
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 37
    .local v0, "res":Landroid/content/res/Resources;
    sget v1, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_editor_overlay_undo_arrow_left:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoDrawable:Landroid/graphics/drawable/Drawable;

    .line 38
    sget v1, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_editor_overlay_undo_arrow_right:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mUndoDrawable:Landroid/graphics/drawable/Drawable;

    .line 40
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getTitleText(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mTitleText:Ljava/lang/CharSequence;

    .line 41
    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_redo:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoText:Ljava/lang/CharSequence;

    .line 42
    sget v1, Lcom/aviary/android/feather/sdk/R$string;->feather_undo:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mUndoRext:Ljava/lang/CharSequence;

    .line 44
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getTitleWidthFraction(Landroid/content/res/Resources;)F

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mTitleWidthFraction:F

    .line 46
    sget-object v1, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mTextAlign:Landroid/text/Layout$Alignment;

    .line 47
    return-void
.end method

.method private calculateTextLayouts()V
    .registers 23

    .prologue
    .line 94
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->isAttachedToParent()Z

    move-result v18

    if-nez v18, :cond_7

    .line 141
    :goto_6
    return-void

    .line 98
    :cond_7
    const/4 v5, 0x0

    .line 99
    .local v5, "alpha":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mOrientationChanged:Z

    move/from16 v18, v0

    if-eqz v18, :cond_12

    .line 100
    const/16 v5, 0xff

    .line 103
    :cond_12
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v10

    .line 105
    .local v10, "metrics":Landroid/util/DisplayMetrics;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v15

    .line 106
    .local v15, "width":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v9

    .line 109
    .local v9, "height":I
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getWidth()I

    move-result v18

    div-int/lit8 v16, v18, 0x2

    .line 110
    .local v16, "x":I
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getHeight()I

    move-result v18

    div-int/lit8 v17, v18, 0x2

    .line 111
    .local v17, "y":I
    new-instance v6, Landroid/graphics/Rect;

    div-int/lit8 v18, v15, 0x2

    sub-int v18, v16, v18

    div-int/lit8 v19, v9, 0x2

    sub-int v19, v17, v19

    div-int/lit8 v20, v15, 0x2

    add-int v20, v20, v16

    div-int/lit8 v21, v9, 0x2

    add-int v21, v21, v17

    move/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-direct {v6, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 112
    .local v6, "bounds1":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mUndoDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 113
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mUndoDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 116
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getContext()Landroid/content/Context;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mUndoRext:Ljava/lang/CharSequence;

    move-object/from16 v19, v0

    invoke-virtual {v6}, Landroid/graphics/Rect;->width()I

    move-result v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mTextAlign:Landroid/text/Layout$Alignment;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    move/from16 v3, v20

    move-object/from16 v4, v21

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->generateTextDrawable(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/graphics/drawable/Drawable;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mUndoTextDrawable:Landroid/graphics/drawable/Drawable;

    .line 117
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mUndoTextDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const/16 v20, 0x50

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-direct {v0, v1, v6, v2, v3}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->relativeBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;II)Landroid/graphics/Rect;

    move-result-object v14

    .line 118
    .local v14, "undoBounds":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mUndoTextDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 119
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mUndoTextDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 122
    iget v0, v14, Landroid/graphics/Rect;->bottom:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    const/high16 v19, 0x42700000

    move/from16 v0, v19

    invoke-static {v10, v0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->dp2px(Landroid/util/DisplayMetrics;F)F

    move-result v19

    add-float v18, v18, v19

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v17, v0

    .line 123
    new-instance v7, Landroid/graphics/Rect;

    div-int/lit8 v18, v15, 0x2

    sub-int v18, v16, v18

    div-int/lit8 v19, v9, 0x2

    sub-int v19, v17, v19

    div-int/lit8 v20, v15, 0x2

    add-int v20, v20, v16

    div-int/lit8 v21, v9, 0x2

    add-int v21, v21, v17

    move/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-direct {v7, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 124
    .local v7, "bounds2":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 125
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 128
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getContext()Landroid/content/Context;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoText:Ljava/lang/CharSequence;

    move-object/from16 v19, v0

    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mTextAlign:Landroid/text/Layout$Alignment;

    move-object/from16 v21, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    move/from16 v3, v20

    move-object/from16 v4, v21

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->generateTextDrawable(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/graphics/drawable/Drawable;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoTextDrawable:Landroid/graphics/drawable/Drawable;

    .line 129
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoTextDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const/16 v20, 0x50

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-direct {v0, v1, v7, v2, v3}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->relativeBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;II)Landroid/graphics/Rect;

    move-result-object v11

    .line 130
    .local v11, "redoBounds":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoTextDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 131
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoTextDrawable:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 134
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getWidth()I

    move-result v18

    div-int/lit8 v16, v18, 0x2

    .line 135
    new-instance v8, Landroid/graphics/Rect;

    iget v0, v6, Landroid/graphics/Rect;->top:I

    move/from16 v18, v0

    iget v0, v6, Landroid/graphics/Rect;->bottom:I

    move/from16 v19, v0

    move/from16 v0, v16

    move/from16 v1, v18

    move/from16 v2, v16

    move/from16 v3, v19

    invoke-direct {v8, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 136
    .local v8, "bounds3":Landroid/graphics/Rect;
    iget v0, v10, Landroid/util/DisplayMetrics;->widthPixels:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mTitleWidthFraction:F

    move/from16 v19, v0

    const/high16 v20, 0x42c80000

    div-float v19, v19, v20

    mul-float v18, v18, v19

    move/from16 v0, v18

    float-to-int v13, v0

    .line 137
    .local v13, "titleWidth":I
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getContext()Landroid/content/Context;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mTitleText:Ljava/lang/CharSequence;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mTextAlign:Landroid/text/Layout$Alignment;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    invoke-virtual {v0, v1, v2, v13, v3}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->generateTitleDrawable(Landroid/content/Context;Ljava/lang/CharSequence;ILandroid/text/Layout$Alignment;)Landroid/graphics/drawable/Drawable;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    .line 138
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getTextMargins()I

    move-result v19

    const-string v20, "top"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    move-object/from16 v3, v20

    invoke-direct {v0, v1, v8, v2, v3}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->generateBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;ILjava/lang/CharSequence;)Landroid/graphics/Rect;

    move-result-object v12

    .line 139
    .local v12, "textBounds":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 140
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto/16 :goto_6
.end method

.method static dp2px(Landroid/util/DisplayMetrics;F)F
    .registers 3
    .param p0, "metrics"    # Landroid/util/DisplayMetrics;
    .param p1, "size"    # F

    .prologue
    .line 144
    iget v0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, p1

    return v0
.end method

.method private generateBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;ILjava/lang/CharSequence;)Landroid/graphics/Rect;
    .registers 11
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "relativeTo"    # Landroid/graphics/Rect;
    .param p3, "margins"    # I
    .param p4, "relativePosition"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v4, 0x0

    .line 149
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 150
    .local v2, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    .line 151
    .local v1, "drawableWidth":I
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .line 153
    .local v0, "drawableHeight":I
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3, v4, v4, v1, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 155
    .local v3, "textBounds":Landroid/graphics/Rect;
    const-string v4, "top"

    invoke-virtual {v4, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_27

    .line 156
    iget v4, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    sub-int/2addr v4, v1

    div-int/lit8 v4, v4, 0x2

    iget v5, p2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v5, v0

    sub-int/2addr v5, p3

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 160
    :goto_26
    return-object v3

    .line 158
    :cond_27
    iget v4, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    sub-int/2addr v4, v1

    div-int/lit8 v4, v4, 0x2

    iget v5, p2, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v5, p3

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Rect;->offsetTo(II)V

    goto :goto_26
.end method

.method private relativeBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/Rect;II)Landroid/graphics/Rect;
    .registers 11
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "relativeTo"    # Landroid/graphics/Rect;
    .param p3, "margins"    # I
    .param p4, "relativePosition"    # I

    .prologue
    const/4 v5, 0x0

    .line 165
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    .line 166
    .local v1, "drawableWidth":I
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .line 168
    .local v0, "drawableHeight":I
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2, v5, v5, v1, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 169
    .local v2, "textBounds":Landroid/graphics/Rect;
    invoke-virtual {p2}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    div-int/lit8 v4, v1, 0x2

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3, v5}, Landroid/graphics/Rect;->offsetTo(II)V

    .line 171
    const/16 v3, 0x30

    if-ne p4, v3, :cond_24

    .line 172
    iget v3, p2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v3, v0

    sub-int/2addr v3, p3

    invoke-virtual {v2, v5, v3}, Landroid/graphics/Rect;->offset(II)V

    .line 176
    :goto_23
    return-object v2

    .line 174
    :cond_24
    iget v3, p2, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v3, p3

    invoke-virtual {v2, v5, v3}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_23
.end method


# virtual methods
.method protected calculatePositions()V
    .registers 1

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->calculateTextLayouts()V

    .line 91
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 261
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getVisibility()I

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->isAttachedToParent()Z

    move-result v0

    if-nez v0, :cond_d

    .line 278
    :cond_c
    :goto_c
    return-void

    .line 265
    :cond_d
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getBackgroundColor()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 267
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 269
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mUndoDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 271
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 273
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoTextDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 275
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mUndoTextDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 277
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->dispatchDraw(Landroid/graphics/Canvas;)V

    goto :goto_c
.end method

.method protected doShow()V
    .registers 2

    .prologue
    .line 181
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->isAttachedToParent()Z

    move-result v0

    if-nez v0, :cond_7

    .line 185
    :goto_6
    return-void

    .line 184
    :cond_7
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->fadeIn()V

    goto :goto_6
.end method

.method protected generateInAnimation()Lcom/nineoldandroids/animation/Animator;
    .registers 10

    .prologue
    const/4 v8, 0x2

    .line 190
    new-instance v4, Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-direct {v4}, Lcom/nineoldandroids/animation/AnimatorSet;-><init>()V

    .line 192
    .local v4, "set":Lcom/nineoldandroids/animation/AnimatorSet;
    const-string v5, "alpha"

    new-array v6, v8, [F

    fill-array-data v6, :array_74

    invoke-static {p0, v5, v6}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    .line 193
    .local v0, "anim0":Lcom/nineoldandroids/animation/Animator;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getAnimationDuration()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v0, v6, v7}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    .line 195
    const-string v5, "alpha1"

    new-array v6, v8, [I

    fill-array-data v6, :array_7c

    invoke-static {p0, v5, v6}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v1

    .line 196
    .local v1, "anim1":Lcom/nineoldandroids/animation/Animator;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getAnimationDuration()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v1, v6, v7}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    .line 197
    const-wide/16 v6, 0x32

    invoke-virtual {v1, v6, v7}, Lcom/nineoldandroids/animation/Animator;->setStartDelay(J)V

    .line 199
    const-string v5, "alpha2"

    new-array v6, v8, [I

    fill-array-data v6, :array_84

    invoke-static {p0, v5, v6}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v2

    .line 200
    .local v2, "anim2":Lcom/nineoldandroids/animation/Animator;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getAnimationDuration()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v2, v6, v7}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    .line 201
    const-wide/16 v6, 0x64

    invoke-virtual {v2, v6, v7}, Lcom/nineoldandroids/animation/Animator;->setStartDelay(J)V

    .line 203
    const-string v5, "alpha3"

    new-array v6, v8, [I

    fill-array-data v6, :array_8c

    invoke-static {p0, v5, v6}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v3

    .line 204
    .local v3, "anim3":Lcom/nineoldandroids/animation/Animator;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getAnimationDuration()I

    move-result v5

    int-to-long v6, v5

    invoke-virtual {v3, v6, v7}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    .line 205
    const-wide/16 v6, 0x12c

    invoke-virtual {v3, v6, v7}, Lcom/nineoldandroids/animation/Animator;->setStartDelay(J)V

    .line 207
    const/4 v5, 0x4

    new-array v5, v5, [Lcom/nineoldandroids/animation/Animator;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v6, 0x1

    aput-object v1, v5, v6

    aput-object v2, v5, v8

    const/4 v6, 0x3

    aput-object v3, v5, v6

    invoke-virtual {v4, v5}, Lcom/nineoldandroids/animation/AnimatorSet;->playSequentially([Lcom/nineoldandroids/animation/Animator;)V

    .line 209
    return-object v4

    .line 192
    nop

    :array_74
    .array-data 4
        0x0
        0x3f800000
    .end array-data

    .line 195
    :array_7c
    .array-data 4
        0x0
        0xff
    .end array-data

    .line 199
    :array_84
    .array-data 4
        0x0
        0xff
    .end array-data

    .line 203
    :array_8c
    .array-data 4
        0x0
        0xff
    .end array-data
.end method

.method public getAlpha1()I
    .registers 2

    .prologue
    .line 225
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    move-result v0

    return v0
.end method

.method public getAlpha2()I
    .registers 2

    .prologue
    .line 237
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mUndoDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    move-result v0

    return v0
.end method

.method public getAlpha3()I
    .registers 2

    .prologue
    .line 249
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    move-result v0

    return v0
.end method

.method protected getTitleText(Landroid/content/res/Resources;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "res"    # Landroid/content/res/Resources;

    .prologue
    .line 54
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_overlay_undo_title:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTitleWidthFraction(Landroid/content/res/Resources;)F
    .registers 3
    .param p1, "res"    # Landroid/content/res/Resources;

    .prologue
    .line 50
    const/high16 v0, 0x42b40000

    return v0
.end method

.method protected inAnimationCompleted()V
    .registers 3

    .prologue
    .line 254
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getCloseButton()Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_e

    .line 255
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getCloseButton()Landroid/widget/Button;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 257
    :cond_e
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 79
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->getCloseButton()Landroid/widget/Button;

    move-result-object v0

    if-ne p1, v0, :cond_15

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mCloseListener:Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;

    if-eqz v0, :cond_15

    .line 80
    const-string v0, "button"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->trackTutorialClosed(Ljava/lang/String;)V

    .line 81
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mCloseListener:Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;

    invoke-interface {v0, p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;->onClose(Lcom/adobe/android/ui/view/AdobeTutorialOverlay;)V

    .line 86
    :goto_14
    return-void

    .line 85
    :cond_15
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->onClick(Landroid/view/View;)V

    goto :goto_14
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x1

    .line 60
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->isActive()Z

    move-result v0

    if-nez v0, :cond_e

    .line 74
    :cond_d
    :goto_d
    return v1

    .line 64
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mCloseListener:Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;

    if-eqz v0, :cond_1d

    .line 65
    const-string v0, "background"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->trackTutorialClosed(Ljava/lang/String;)V

    .line 66
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mCloseListener:Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;

    invoke-interface {v0, p0}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay$OnCloseListener;->onClose(Lcom/adobe/android/ui/view/AdobeTutorialOverlay;)V

    goto :goto_d

    .line 70
    :cond_1d
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_d

    .line 71
    const-string v0, "background"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->hide(Ljava/lang/String;)V

    goto :goto_d
.end method

.method public setAlpha(F)V
    .registers 2
    .param p1, "alpha"    # F

    .prologue
    .line 214
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->setAlpha(F)V

    .line 215
    return-void
.end method

.method public setAlpha1(I)V
    .registers 3
    .param p1, "value"    # I

    .prologue
    .line 219
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mTitleDrawable1:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 220
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->postInvalidate()V

    .line 221
    return-void
.end method

.method public setAlpha2(I)V
    .registers 3
    .param p1, "value"    # I

    .prologue
    .line 230
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mUndoDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 231
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mUndoTextDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 232
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->postInvalidate()V

    .line 233
    return-void
.end method

.method public setAlpha3(I)V
    .registers 3
    .param p1, "value"    # I

    .prologue
    .line 242
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 243
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->mRedoTextDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 244
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/UndoRedoOverlay;->postInvalidate()V

    .line 245
    return-void
.end method
