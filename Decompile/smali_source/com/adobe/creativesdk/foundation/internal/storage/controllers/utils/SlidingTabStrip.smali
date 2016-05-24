.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;
.super Landroid/widget/LinearLayout;
.source "SlidingTabStrip.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$1;,
        Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$SimpleTabColorizer;
    }
.end annotation


# instance fields
.field private final mBottomBorderPaint:Landroid/graphics/Paint;

.field private final mBottomBorderThickness:I

.field private mCustomTabColorizer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;

.field private final mDefaultBottomBorderColor:I

.field private final mDefaultTabColorizer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$SimpleTabColorizer;

.field private final mSelectedIndicatorPaint:Landroid/graphics/Paint;

.field private final mSelectedIndicatorThickness:I

.field private mSelectedPosition:I

.field private mSelectionOffset:F

.field private mTextViewId:I

.field private mViewId:I


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 43
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 44
    invoke-virtual {p0, v6}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->setWillNotDraw(Z)V

    .line 46
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v0, v3, Landroid/util/DisplayMetrics;->density:F

    .line 48
    .local v0, "density":F
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 49
    .local v1, "outValue":Landroid/util/TypedValue;
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    const v4, 0x1010030

    invoke-virtual {v3, v4, v1, v5}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 50
    iget v2, v1, Landroid/util/TypedValue;->data:I

    .line 52
    .local v2, "themeForegroundColor":I
    const/16 v3, 0x26

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->setColorAlpha(IB)I

    move-result v3

    iput v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mDefaultBottomBorderColor:I

    .line 55
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$SimpleTabColorizer;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$SimpleTabColorizer;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$1;)V

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mDefaultTabColorizer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$SimpleTabColorizer;

    .line 56
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mDefaultTabColorizer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$SimpleTabColorizer;

    new-array v4, v5, [I

    const v5, -0xcc4a1b

    aput v5, v4, v6

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$SimpleTabColorizer;->setIndicatorColors([I)V

    .line 58
    const/4 v3, 0x0

    mul-float/2addr v3, v0

    float-to-int v3, v3

    iput v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mBottomBorderThickness:I

    .line 59
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mBottomBorderPaint:Landroid/graphics/Paint;

    .line 60
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mBottomBorderPaint:Landroid/graphics/Paint;

    iget v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mDefaultBottomBorderColor:I

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 62
    const/high16 v3, 0x40400000

    mul-float/2addr v3, v0

    float-to-int v3, v3

    iput v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectedIndicatorThickness:I

    .line 63
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectedIndicatorPaint:Landroid/graphics/Paint;

    .line 64
    return-void
.end method

.method private static blendColors(IIF)I
    .registers 10
    .param p0, "color1"    # I
    .param p1, "color2"    # I
    .param p2, "ratio"    # F

    .prologue
    .line 156
    const/high16 v4, 0x3f800000

    sub-float v2, v4, p2

    .line 157
    .local v2, "inverseRation":F
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, p2

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v2

    add-float v3, v4, v5

    .line 158
    .local v3, "r":F
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, p2

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v2

    add-float v1, v4, v5

    .line 159
    .local v1, "g":F
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, p2

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v2

    add-float v0, v4, v5

    .line 160
    .local v0, "b":F
    float-to-int v4, v3

    float-to-int v5, v1

    float-to-int v6, v0

    invoke-static {v4, v5, v6}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    return v4
.end method

.method private static setColorAlpha(IB)I
    .registers 5
    .param p0, "color"    # I
    .param p1, "alpha"    # B

    .prologue
    .line 146
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    invoke-static {p1, v0, v1, v2}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    return v0
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 17
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 105
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getHeight()I

    move-result v8

    .line 106
    .local v8, "height":I
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getChildCount()I

    move-result v6

    .line 107
    .local v6, "childCount":I
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mCustomTabColorizer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;

    if-eqz v0, :cond_97

    iget-object v14, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mCustomTabColorizer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;

    .line 112
    .local v14, "tabColorizer":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;
    :goto_e
    if-lez v6, :cond_83

    .line 113
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectedPosition:I

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    .line 114
    .local v13, "selectedTitle":Landroid/view/View;
    invoke-virtual {v13}, Landroid/view/View;->getLeft()I

    move-result v9

    .line 115
    .local v9, "left":I
    invoke-virtual {v13}, Landroid/view/View;->getRight()I

    move-result v12

    .line 116
    .local v12, "right":I
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectedPosition:I

    invoke-interface {v14, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;->getIndicatorColor(I)I

    move-result v7

    .line 118
    .local v7, "color":I
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectionOffset:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_6f

    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectedPosition:I

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_6f

    .line 119
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectedPosition:I

    add-int/lit8 v0, v0, 0x1

    invoke-interface {v14, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;->getIndicatorColor(I)I

    move-result v10

    .line 120
    .local v10, "nextColor":I
    if-eq v7, v10, :cond_45

    .line 121
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectionOffset:F

    invoke-static {v10, v7, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->blendColors(IIF)I

    move-result v7

    .line 125
    :cond_45
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectedPosition:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    .line 126
    .local v11, "nextTitle":Landroid/view/View;
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectionOffset:F

    invoke-virtual {v11}, Landroid/view/View;->getLeft()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    const/high16 v1, 0x3f800000

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectionOffset:F

    sub-float/2addr v1, v2

    int-to-float v2, v9

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-int v9, v0

    .line 128
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectionOffset:F

    invoke-virtual {v11}, Landroid/view/View;->getRight()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    const/high16 v1, 0x3f800000

    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectionOffset:F

    sub-float/2addr v1, v2

    int-to-float v2, v12

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    float-to-int v12, v0

    .line 132
    .end local v10    # "nextColor":I
    .end local v11    # "nextTitle":Landroid/view/View;
    :cond_6f
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectedIndicatorPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 134
    int-to-float v1, v9

    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectedIndicatorThickness:I

    sub-int v0, v8, v0

    int-to-float v2, v0

    int-to-float v3, v12

    int-to-float v4, v8

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectedIndicatorPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 139
    .end local v7    # "color":I
    .end local v9    # "left":I
    .end local v12    # "right":I
    .end local v13    # "selectedTitle":Landroid/view/View;
    :cond_83
    const/4 v1, 0x0

    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mBottomBorderThickness:I

    sub-int v0, v8, v0

    int-to-float v2, v0

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getWidth()I

    move-result v0

    int-to-float v3, v0

    int-to-float v4, v8

    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mBottomBorderPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 140
    return-void

    .line 107
    .end local v14    # "tabColorizer":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;
    :cond_97
    iget-object v14, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mDefaultTabColorizer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$SimpleTabColorizer;

    goto/16 :goto_e
.end method

.method onViewPagerPageChanged(IF)V
    .registers 6
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F

    .prologue
    .line 85
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectedPosition:I

    if-eq v2, p1, :cond_30

    .line 88
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectedPosition:I

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 89
    .local v1, "tabView":Landroid/view/View;
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mTextViewId:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 90
    .local v0, "tabTitleView":Landroid/widget/TextView;
    const-string v2, "#a3aeb7"

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 93
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 94
    iget v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mTextViewId:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .end local v0    # "tabTitleView":Landroid/widget/TextView;
    check-cast v0, Landroid/widget/TextView;

    .line 95
    .restart local v0    # "tabTitleView":Landroid/widget/TextView;
    const-string v2, "#2098f5"

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 98
    .end local v0    # "tabTitleView":Landroid/widget/TextView;
    .end local v1    # "tabView":Landroid/view/View;
    :cond_30
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectedPosition:I

    .line 99
    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mSelectionOffset:F

    .line 100
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->invalidate()V

    .line 101
    return-void
.end method

.method setCustomLayoutIds(II)V
    .registers 3
    .param p1, "layoutResId"    # I
    .param p2, "textViewId"    # I

    .prologue
    .line 73
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mViewId:I

    .line 74
    iput p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mTextViewId:I

    .line 75
    return-void
.end method

.method setCustomTabColorizer(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;)V
    .registers 2
    .param p1, "customTabColorizer"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mCustomTabColorizer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;

    .line 68
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->invalidate()V

    .line 69
    return-void
.end method

.method varargs setSelectedIndicatorColors([I)V
    .registers 3
    .param p1, "colors"    # [I

    .prologue
    .line 79
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mCustomTabColorizer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabLayout$TabColorizer;

    .line 80
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->mDefaultTabColorizer:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$SimpleTabColorizer;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip$SimpleTabColorizer;->setIndicatorColors([I)V

    .line 81
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/utils/SlidingTabStrip;->invalidate()V

    .line 82
    return-void
.end method
