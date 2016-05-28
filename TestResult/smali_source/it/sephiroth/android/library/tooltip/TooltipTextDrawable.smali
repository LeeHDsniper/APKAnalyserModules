.class Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "ToolTipTextDrawable.java"


# instance fields
.field private final arrowRatio:F

.field private arrowWeight:I

.field private final backgroundColor:I

.field private final bgPaint:Landroid/graphics/Paint;

.field private final ellipseSize:F

.field private gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

.field private padding:I

.field private final path:Landroid/graphics/Path;

.field private point:Landroid/graphics/Point;

.field private final rectF:Landroid/graphics/RectF;

.field private final stPaint:Landroid/graphics/Paint;

.field private final strokeColor:I

.field private final strokeWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "builder"    # Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 38
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 33
    iput v5, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->padding:I

    .line 34
    iput v5, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    .line 40
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    sget-object v2, Lit/sephiroth/android/library/tooltip/R$styleable;->TooltipLayout:[I

    iget v3, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->defStyleAttr:I

    iget v4, p2, Lit/sephiroth/android/library/tooltip/TooltipManager$Builder;->defStyleRes:I

    invoke-virtual {v1, v6, v2, v3, v4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 42
    .local v0, "theme":Landroid/content/res/TypedArray;
    sget v1, Lit/sephiroth/android/library/tooltip/R$styleable;->TooltipLayout_ttlm_cornerRadius:I

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    .line 43
    sget v1, Lit/sephiroth/android/library/tooltip/R$styleable;->TooltipLayout_ttlm_strokeWeight:I

    const/16 v2, 0x1e

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->strokeWidth:I

    .line 44
    sget v1, Lit/sephiroth/android/library/tooltip/R$styleable;->TooltipLayout_ttlm_backgroundColor:I

    invoke-virtual {v0, v1, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->backgroundColor:I

    .line 45
    sget v1, Lit/sephiroth/android/library/tooltip/R$styleable;->TooltipLayout_ttlm_strokeColor:I

    invoke-virtual {v0, v1, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->strokeColor:I

    .line 46
    sget v1, Lit/sephiroth/android/library/tooltip/R$styleable;->TooltipLayout_ttlm_arrowRatio:I

    const v2, 0x3fb33333

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowRatio:F

    .line 47
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 49
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->rectF:Landroid/graphics/RectF;

    .line 51
    iget v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->backgroundColor:I

    if-eqz v1, :cond_93

    .line 52
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v7}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->bgPaint:Landroid/graphics/Paint;

    .line 53
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->bgPaint:Landroid/graphics/Paint;

    iget v2, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->backgroundColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 54
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->bgPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 60
    :goto_6a
    iget v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->strokeColor:I

    if-eqz v1, :cond_96

    .line 61
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v7}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->stPaint:Landroid/graphics/Paint;

    .line 62
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->stPaint:Landroid/graphics/Paint;

    iget v2, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->strokeColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 63
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->stPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 64
    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->stPaint:Landroid/graphics/Paint;

    iget v2, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->strokeWidth:I

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 70
    :goto_8b
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    .line 71
    return-void

    .line 57
    :cond_93
    iput-object v6, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->bgPaint:Landroid/graphics/Paint;

    goto :goto_6a

    .line 67
    :cond_96
    iput-object v6, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->stPaint:Landroid/graphics/Paint;

    goto :goto_8b
.end method

.method private calculatePath(Landroid/graphics/Rect;)V
    .registers 18
    .param p1, "outBounds"    # Landroid/graphics/Rect;

    .prologue
    .line 76
    move-object/from16 v0, p1

    iget v10, v0, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->padding:I

    add-int v3, v10, v11

    .line 77
    .local v3, "left":I
    move-object/from16 v0, p1

    iget v10, v0, Landroid/graphics/Rect;->top:I

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->padding:I

    add-int v9, v10, v11

    .line 78
    .local v9, "top":I
    move-object/from16 v0, p1

    iget v10, v0, Landroid/graphics/Rect;->right:I

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->padding:I

    sub-int v8, v10, v11

    .line 79
    .local v8, "right":I
    move-object/from16 v0, p1

    iget v10, v0, Landroid/graphics/Rect;->bottom:I

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->padding:I

    sub-int v1, v10, v11

    .line 81
    .local v1, "bottom":I
    int-to-float v10, v1

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    sub-float v5, v10, v11

    .line 82
    .local v5, "max_y":F
    int-to-float v10, v8

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    sub-float v4, v10, v11

    .line 83
    .local v4, "max_x":F
    int-to-float v10, v9

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    add-float v7, v10, v11

    .line 84
    .local v7, "min_y":F
    int-to-float v10, v3

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    add-float v6, v10, v11

    .line 97
    .local v6, "min_x":F
    const/4 v2, 0x0

    .line 99
    .local v2, "drawPoint":Z
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    if-eqz v10, :cond_302

    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-eqz v10, :cond_302

    .line 101
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    sget-object v11, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->RIGHT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-eq v10, v11, :cond_61

    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    sget-object v11, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->LEFT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-ne v10, v11, :cond_28d

    .line 102
    :cond_61
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->y:I

    if-lt v10, v9, :cond_93

    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->y:I

    if-gt v10, v1, :cond_93

    .line 103
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->y:I

    add-int/2addr v10, v9

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    add-int/2addr v10, v11

    int-to-float v10, v10

    cmpl-float v10, v10, v5

    if-lez v10, :cond_26b

    .line 104
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    int-to-float v11, v11

    sub-float v11, v5, v11

    int-to-float v12, v9

    sub-float/2addr v11, v12

    float-to-int v11, v11

    iput v11, v10, Landroid/graphics/Point;->y:I

    .line 109
    :cond_92
    :goto_92
    const/4 v2, 0x1

    .line 128
    :cond_93
    :goto_93
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    invoke-virtual {v10}, Landroid/graphics/Path;->reset()V

    .line 131
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->y:I

    if-ge v10, v9, :cond_2f2

    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iput v9, v10, Landroid/graphics/Point;->y:I

    .line 133
    :cond_a8
    :goto_a8
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->x:I

    if-ge v10, v3, :cond_b6

    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iput v3, v10, Landroid/graphics/Point;->x:I

    .line 134
    :cond_b6
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->x:I

    if-le v10, v8, :cond_c4

    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iput v8, v10, Landroid/graphics/Point;->x:I

    .line 137
    :cond_c4
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    int-to-float v11, v3

    move-object/from16 v0, p0

    iget v12, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    add-float/2addr v11, v12

    int-to-float v12, v9

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->moveTo(FF)V

    .line 139
    if-eqz v2, :cond_11a

    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    sget-object v11, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->BOTTOM:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-ne v10, v11, :cond_11a

    .line 140
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v11, v11, Landroid/graphics/Point;->x:I

    add-int/2addr v11, v3

    move-object/from16 v0, p0

    iget v12, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    sub-int/2addr v11, v12

    int-to-float v11, v11

    int-to-float v12, v9

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 141
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v11, v11, Landroid/graphics/Point;->x:I

    add-int/2addr v11, v3

    int-to-float v11, v11

    move-object/from16 v0, p1

    iget v12, v0, Landroid/graphics/Rect;->top:I

    int-to-float v12, v12

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 142
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v11, v11, Landroid/graphics/Point;->x:I

    add-int/2addr v11, v3

    move-object/from16 v0, p0

    iget v12, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    add-int/2addr v11, v12

    int-to-float v11, v11

    int-to-float v12, v9

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 146
    :cond_11a
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    int-to-float v11, v8

    move-object/from16 v0, p0

    iget v12, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    sub-float/2addr v11, v12

    int-to-float v12, v9

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 147
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    int-to-float v11, v8

    int-to-float v12, v9

    int-to-float v13, v8

    int-to-float v14, v9

    move-object/from16 v0, p0

    iget v15, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    add-float/2addr v14, v15

    invoke-virtual {v10, v11, v12, v13, v14}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 149
    if-eqz v2, :cond_180

    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    sget-object v11, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->LEFT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-ne v10, v11, :cond_180

    .line 150
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    int-to-float v11, v8

    move-object/from16 v0, p0

    iget-object v12, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v12, v12, Landroid/graphics/Point;->y:I

    add-int/2addr v12, v9

    move-object/from16 v0, p0

    iget v13, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    sub-int/2addr v12, v13

    int-to-float v12, v12

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 151
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    move-object/from16 v0, p1

    iget v11, v0, Landroid/graphics/Rect;->right:I

    int-to-float v11, v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v12, v12, Landroid/graphics/Point;->y:I

    add-int/2addr v12, v9

    int-to-float v12, v12

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 152
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    int-to-float v11, v8

    move-object/from16 v0, p0

    iget-object v12, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v12, v12, Landroid/graphics/Point;->y:I

    add-int/2addr v12, v9

    move-object/from16 v0, p0

    iget v13, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    add-int/2addr v12, v13

    int-to-float v12, v12

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 156
    :cond_180
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    int-to-float v11, v8

    int-to-float v12, v1

    move-object/from16 v0, p0

    iget v13, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    sub-float/2addr v12, v13

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 157
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    int-to-float v11, v8

    int-to-float v12, v1

    int-to-float v13, v8

    move-object/from16 v0, p0

    iget v14, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    sub-float/2addr v13, v14

    int-to-float v14, v1

    invoke-virtual {v10, v11, v12, v13, v14}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 159
    if-eqz v2, :cond_1e6

    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    sget-object v11, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->TOP:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-ne v10, v11, :cond_1e6

    .line 160
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v11, v11, Landroid/graphics/Point;->x:I

    add-int/2addr v11, v3

    move-object/from16 v0, p0

    iget v12, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    add-int/2addr v11, v12

    int-to-float v11, v11

    int-to-float v12, v1

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 161
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v11, v11, Landroid/graphics/Point;->x:I

    add-int/2addr v11, v3

    int-to-float v11, v11

    move-object/from16 v0, p1

    iget v12, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v12, v12

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 162
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v11, v11, Landroid/graphics/Point;->x:I

    add-int/2addr v11, v3

    move-object/from16 v0, p0

    iget v12, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    sub-int/2addr v11, v12

    int-to-float v11, v11

    int-to-float v12, v1

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 166
    :cond_1e6
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    int-to-float v11, v3

    move-object/from16 v0, p0

    iget v12, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    add-float/2addr v11, v12

    int-to-float v12, v1

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 167
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    int-to-float v11, v3

    int-to-float v12, v1

    int-to-float v13, v3

    int-to-float v14, v1

    move-object/from16 v0, p0

    iget v15, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    sub-float/2addr v14, v15

    invoke-virtual {v10, v11, v12, v13, v14}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 169
    if-eqz v2, :cond_24c

    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    sget-object v11, Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;->RIGHT:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    if-ne v10, v11, :cond_24c

    .line 170
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    int-to-float v11, v3

    move-object/from16 v0, p0

    iget-object v12, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v12, v12, Landroid/graphics/Point;->y:I

    add-int/2addr v12, v9

    move-object/from16 v0, p0

    iget v13, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    add-int/2addr v12, v13

    int-to-float v12, v12

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 171
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    move-object/from16 v0, p1

    iget v11, v0, Landroid/graphics/Rect;->left:I

    int-to-float v11, v11

    move-object/from16 v0, p0

    iget-object v12, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v12, v12, Landroid/graphics/Point;->y:I

    add-int/2addr v12, v9

    int-to-float v12, v12

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 172
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    int-to-float v11, v3

    move-object/from16 v0, p0

    iget-object v12, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v12, v12, Landroid/graphics/Point;->y:I

    add-int/2addr v12, v9

    move-object/from16 v0, p0

    iget v13, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    sub-int/2addr v12, v13

    int-to-float v12, v12

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 176
    :cond_24c
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    int-to-float v11, v3

    int-to-float v12, v9

    move-object/from16 v0, p0

    iget v13, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    add-float/2addr v12, v13

    invoke-virtual {v10, v11, v12}, Landroid/graphics/Path;->lineTo(FF)V

    .line 177
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    int-to-float v11, v3

    int-to-float v12, v9

    int-to-float v13, v3

    move-object/from16 v0, p0

    iget v14, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    add-float/2addr v13, v14

    int-to-float v14, v9

    invoke-virtual {v10, v11, v12, v13, v14}, Landroid/graphics/Path;->quadTo(FFFF)V

    .line 183
    :goto_26a
    return-void

    .line 106
    :cond_26b
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->y:I

    add-int/2addr v10, v9

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    sub-int/2addr v10, v11

    int-to-float v10, v10

    cmpg-float v10, v10, v7

    if-gez v10, :cond_92

    .line 107
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    int-to-float v11, v11

    add-float/2addr v11, v7

    int-to-float v12, v9

    sub-float/2addr v11, v12

    float-to-int v11, v11

    iput v11, v10, Landroid/graphics/Point;->y:I

    goto/16 :goto_92

    .line 113
    :cond_28d
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->x:I

    if-lt v10, v3, :cond_93

    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->x:I

    if-gt v10, v8, :cond_93

    .line 114
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->x:I

    if-lt v10, v3, :cond_93

    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->x:I

    if-gt v10, v8, :cond_93

    .line 115
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->x:I

    add-int/2addr v10, v3

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    add-int/2addr v10, v11

    int-to-float v10, v10

    cmpl-float v10, v10, v4

    if-lez v10, :cond_2d1

    .line 116
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    int-to-float v11, v11

    sub-float v11, v4, v11

    int-to-float v12, v3

    sub-float/2addr v11, v12

    float-to-int v11, v11

    iput v11, v10, Landroid/graphics/Point;->x:I

    .line 121
    :cond_2ce
    :goto_2ce
    const/4 v2, 0x1

    goto/16 :goto_93

    .line 118
    :cond_2d1
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->x:I

    add-int/2addr v10, v3

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    sub-int/2addr v10, v11

    int-to-float v10, v10

    cmpg-float v10, v10, v6

    if-gez v10, :cond_2ce

    .line 119
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    move-object/from16 v0, p0

    iget v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    int-to-float v11, v11

    add-float/2addr v11, v6

    int-to-float v12, v3

    sub-float/2addr v11, v12

    float-to-int v11, v11

    iput v11, v10, Landroid/graphics/Point;->x:I

    goto :goto_2ce

    .line 132
    :cond_2f2
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->y:I

    if-le v10, v1, :cond_a8

    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    iput v1, v10, Landroid/graphics/Point;->y:I

    goto/16 :goto_a8

    .line 180
    :cond_302
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->rectF:Landroid/graphics/RectF;

    int-to-float v11, v3

    int-to-float v12, v9

    int-to-float v13, v8

    int-to-float v14, v1

    invoke-virtual {v10, v11, v12, v13, v14}, Landroid/graphics/RectF;->set(FFFF)V

    .line 181
    move-object/from16 v0, p0

    iget-object v10, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    move-object/from16 v0, p0

    iget-object v11, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->rectF:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget v12, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    move-object/from16 v0, p0

    iget v13, v0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->ellipseSize:F

    sget-object v14, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v10, v11, v12, v13, v14}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    goto/16 :goto_26a
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 188
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->bgPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_b

    .line 189
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->bgPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 192
    :cond_b
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->stPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_16

    .line 193
    iget-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->path:Landroid/graphics/Path;

    iget-object v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->stPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 195
    :cond_16
    return-void
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 214
    const/4 v0, 0x0

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .registers 2
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 200
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 201
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->calculatePath(Landroid/graphics/Rect;)V

    .line 202
    return-void
.end method

.method public setAlpha(I)V
    .registers 2
    .param p1, "alpha"    # I

    .prologue
    .line 206
    return-void
.end method

.method public setAnchor(Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;I)V
    .registers 5
    .param p1, "gravity"    # Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;
    .param p2, "padding"    # I

    .prologue
    .line 222
    iput-object p1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->gravity:Lit/sephiroth/android/library/tooltip/TooltipManager$Gravity;

    .line 223
    iput p2, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->padding:I

    .line 224
    int-to-float v0, p2

    iget v1, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowRatio:F

    div-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->arrowWeight:I

    .line 225
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 210
    return-void
.end method

.method public setDestinationPoint(Landroid/graphics/Point;)V
    .registers 3
    .param p1, "point"    # Landroid/graphics/Point;

    .prologue
    .line 218
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0, p1}, Landroid/graphics/Point;-><init>(Landroid/graphics/Point;)V

    iput-object v0, p0, Lit/sephiroth/android/library/tooltip/TooltipTextDrawable;->point:Landroid/graphics/Point;

    .line 219
    return-void
.end method
