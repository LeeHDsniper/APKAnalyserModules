.class public Landroid/support/design/widget/AppBarLayout$LayoutParams;
.super Landroid/widget/LinearLayout$LayoutParams;
.source "AppBarLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/AppBarLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field mScrollFlags:I

.field mScrollInterpolator:Landroid/view/animation/Interpolator;


# direct methods
.method public constructor <init>(II)V
    .registers 4
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 502
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 485
    const/4 v0, 0x1

    iput v0, p0, Landroid/support/design/widget/AppBarLayout$LayoutParams;->mScrollFlags:I

    .line 503
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, 0x0

    .line 489
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 485
    const/4 v2, 0x1

    iput v2, p0, Landroid/support/design/widget/AppBarLayout$LayoutParams;->mScrollFlags:I

    .line 490
    sget-object v2, Landroid/support/design/R$styleable;->AppBarLayout_LayoutParams:[I

    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 491
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v2, Landroid/support/design/R$styleable;->AppBarLayout_LayoutParams_layout_scrollFlags:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Landroid/support/design/widget/AppBarLayout$LayoutParams;->mScrollFlags:I

    .line 492
    sget v2, Landroid/support/design/R$styleable;->AppBarLayout_LayoutParams_layout_scrollInterpolator:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_29

    .line 493
    sget v2, Landroid/support/design/R$styleable;->AppBarLayout_LayoutParams_layout_scrollInterpolator:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 495
    .local v1, "resId":I
    invoke-static {p1, v1}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v2

    iput-object v2, p0, Landroid/support/design/widget/AppBarLayout$LayoutParams;->mScrollInterpolator:Landroid/view/animation/Interpolator;

    .line 498
    .end local v1    # "resId":I
    :cond_29
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 499
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .registers 3
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 510
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 485
    const/4 v0, 0x1

    iput v0, p0, Landroid/support/design/widget/AppBarLayout$LayoutParams;->mScrollFlags:I

    .line 511
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    .registers 3
    .param p1, "source"    # Landroid/view/ViewGroup$MarginLayoutParams;

    .prologue
    .line 514
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 485
    const/4 v0, 0x1

    iput v0, p0, Landroid/support/design/widget/AppBarLayout$LayoutParams;->mScrollFlags:I

    .line 515
    return-void
.end method

.method public constructor <init>(Landroid/widget/LinearLayout$LayoutParams;)V
    .registers 3
    .param p1, "source"    # Landroid/widget/LinearLayout$LayoutParams;

    .prologue
    .line 518
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/widget/LinearLayout$LayoutParams;)V

    .line 485
    const/4 v0, 0x1

    iput v0, p0, Landroid/support/design/widget/AppBarLayout$LayoutParams;->mScrollFlags:I

    .line 519
    return-void
.end method


# virtual methods
.method public getScrollFlags()I
    .registers 2

    .prologue
    .line 551
    iget v0, p0, Landroid/support/design/widget/AppBarLayout$LayoutParams;->mScrollFlags:I

    return v0
.end method

.method public getScrollInterpolator()Landroid/view/animation/Interpolator;
    .registers 2

    .prologue
    .line 575
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout$LayoutParams;->mScrollInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method
