.class public Lcom/adobe/android/ui/view/AdaptiveFrameLayout;
.super Landroid/widget/FrameLayout;
.source "AdaptiveFrameLayout.java"


# instance fields
.field mDimension:I

.field mFraction:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/android/ui/view/AdaptiveFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 44
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/android/ui/view/AdaptiveFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 48
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/adobe/android/ui/view/AdaptiveFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 52
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 53
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/android/ui/view/AdaptiveFrameLayout;->initFromAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 54
    return-void
.end method

.method private initFromAttributes(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v3, 0x1

    .line 58
    sget-object v1, Lcom/adobe/android/ui/R$styleable;->AdobeAdaptiveFrameLayout:[I

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 61
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdaptiveFrameLayout;->isInEditMode()Z

    move-result v1

    if-nez v1, :cond_20

    .line 62
    sget v1, Lcom/adobe/android/ui/R$styleable;->AdobeAdaptiveFrameLayout_adobe_layout_dimension:I

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/adobe/android/ui/view/AdaptiveFrameLayout;->mDimension:I

    .line 63
    sget v1, Lcom/adobe/android/ui/R$styleable;->AdobeAdaptiveFrameLayout_adobe_layout_dimension_value:I

    const/high16 v2, 0x3f000000

    invoke-virtual {v0, v1, v3, v3, v2}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result v1

    iput v1, p0, Lcom/adobe/android/ui/view/AdaptiveFrameLayout;->mFraction:F

    .line 65
    :cond_20
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 66
    return-void
.end method


# virtual methods
.method protected onLayout(ZIIII)V
    .registers 12
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 70
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 71
    if-eqz p1, :cond_28

    .line 77
    sub-int v3, p4, p2

    .line 78
    .local v3, "width":I
    sub-int v1, p5, p3

    .line 79
    .local v1, "height":I
    const/4 v0, 0x0

    .line 81
    .local v0, "constrain":Z
    iget v4, p0, Lcom/adobe/android/ui/view/AdaptiveFrameLayout;->mDimension:I

    if-nez v4, :cond_29

    if-lez v3, :cond_29

    .line 82
    int-to-float v4, v3

    iget v5, p0, Lcom/adobe/android/ui/view/AdaptiveFrameLayout;->mFraction:F

    mul-float/2addr v4, v5

    float-to-int v1, v4

    .line 83
    const/4 v0, 0x1

    .line 89
    :cond_16
    :goto_16
    if-eqz v0, :cond_28

    .line 90
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdaptiveFrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 91
    .local v2, "params":Landroid/view/ViewGroup$LayoutParams;
    iget v4, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v4, v3, :cond_24

    iget v4, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v4, v1, :cond_28

    .line 92
    :cond_24
    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 93
    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 97
    .end local v0    # "constrain":Z
    .end local v1    # "height":I
    .end local v2    # "params":Landroid/view/ViewGroup$LayoutParams;
    .end local v3    # "width":I
    :cond_28
    return-void

    .line 84
    .restart local v0    # "constrain":Z
    .restart local v1    # "height":I
    .restart local v3    # "width":I
    :cond_29
    iget v4, p0, Lcom/adobe/android/ui/view/AdaptiveFrameLayout;->mDimension:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_16

    if-lez v1, :cond_16

    .line 85
    int-to-float v4, v1

    iget v5, p0, Lcom/adobe/android/ui/view/AdaptiveFrameLayout;->mFraction:F

    mul-float/2addr v4, v5

    float-to-int v3, v4

    .line 86
    const/4 v0, 0x1

    goto :goto_16
.end method
