.class public Landroid/support/design/widget/Snackbar$SnackbarLayout;
.super Landroid/widget/LinearLayout;
.source "Snackbar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/Snackbar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SnackbarLayout"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/Snackbar$SnackbarLayout$OnLayoutChangeListener;
    }
.end annotation


# instance fields
.field private mActionView:Landroid/widget/TextView;

.field private mMaxInlineActionWidth:I

.field private mMaxWidth:I

.field private mMessageView:Landroid/widget/TextView;

.field private mOnLayoutChangeListener:Landroid/support/design/widget/Snackbar$SnackbarLayout$OnLayoutChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 514
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/design/widget/Snackbar$SnackbarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 515
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, -0x1

    .line 518
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 519
    sget-object v1, Landroid/support/design/R$styleable;->SnackbarLayout:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 520
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Landroid/support/design/R$styleable;->SnackbarLayout_android_maxWidth:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMaxWidth:I

    .line 521
    sget v1, Landroid/support/design/R$styleable;->SnackbarLayout_maxActionInlineWidth:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMaxInlineActionWidth:I

    .line 523
    sget v1, Landroid/support/design/R$styleable;->SnackbarLayout_elevation:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 524
    sget v1, Landroid/support/design/R$styleable;->SnackbarLayout_elevation:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    int-to-float v1, v1

    invoke-static {p0, v1}, Landroid/support/v4/view/ViewCompat;->setElevation(Landroid/view/View;F)V

    .line 527
    :cond_2d
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 529
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/support/design/widget/Snackbar$SnackbarLayout;->setClickable(Z)V

    .line 534
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Landroid/support/design/R$layout;->layout_snackbar_include:I

    invoke-virtual {v1, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 535
    return-void
.end method

.method private static updateTopBottomPadding(Landroid/view/View;II)V
    .registers 5
    .param p0, "view"    # Landroid/view/View;
    .param p1, "topPadding"    # I
    .param p2, "bottomPadding"    # I

    .prologue
    .line 638
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->isPaddingRelative(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 639
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getPaddingStart(Landroid/view/View;)I

    move-result v0

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getPaddingEnd(Landroid/view/View;)I

    move-result v1

    invoke-static {p0, v0, p1, v1, p2}, Landroid/support/v4/view/ViewCompat;->setPaddingRelative(Landroid/view/View;IIII)V

    .line 646
    :goto_11
    return-void

    .line 643
    :cond_12
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    invoke-virtual {p0, v0, p1, v1, p2}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_11
.end method

.method private updateViewsWithinLayout(III)Z
    .registers 6
    .param p1, "orientation"    # I
    .param p2, "messagePadTop"    # I
    .param p3, "messagePadBottom"    # I

    .prologue
    .line 624
    const/4 v0, 0x0

    .line 625
    .local v0, "changed":Z
    invoke-virtual {p0}, Landroid/support/design/widget/Snackbar$SnackbarLayout;->getOrientation()I

    move-result v1

    if-eq p1, v1, :cond_b

    .line 626
    invoke-virtual {p0, p1}, Landroid/support/design/widget/Snackbar$SnackbarLayout;->setOrientation(I)V

    .line 627
    const/4 v0, 0x1

    .line 629
    :cond_b
    iget-object v1, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMessageView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getPaddingTop()I

    move-result v1

    if-ne v1, p2, :cond_1b

    iget-object v1, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMessageView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v1

    if-eq v1, p3, :cond_21

    .line 631
    :cond_1b
    iget-object v1, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMessageView:Landroid/widget/TextView;

    invoke-static {v1, p2, p3}, Landroid/support/design/widget/Snackbar$SnackbarLayout;->updateTopBottomPadding(Landroid/view/View;II)V

    .line 632
    const/4 v0, 0x1

    .line 634
    :cond_21
    return v0
.end method


# virtual methods
.method animateChildrenIn(II)V
    .registers 8
    .param p1, "delay"    # I
    .param p2, "duration"    # I

    .prologue
    const/high16 v4, 0x3f800000

    const/4 v1, 0x0

    .line 587
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMessageView:Landroid/widget/TextView;

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 588
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMessageView:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    int-to-long v2, p2

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 591
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mActionView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_43

    .line 592
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mActionView:Landroid/widget/TextView;

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 593
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mActionView:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    int-to-long v2, p2

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 596
    :cond_43
    return-void
.end method

.method animateChildrenOut(II)V
    .registers 8
    .param p1, "delay"    # I
    .param p2, "duration"    # I

    .prologue
    const/high16 v4, 0x3f800000

    const/4 v1, 0x0

    .line 599
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMessageView:Landroid/widget/TextView;

    invoke-static {v0, v4}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 600
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMessageView:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    int-to-long v2, p2

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 603
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mActionView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_43

    .line 604
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mActionView:Landroid/widget/TextView;

    invoke-static {v0, v4}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 605
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mActionView:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    int-to-long v2, p2

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    int-to-long v2, p1

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 608
    :cond_43
    return-void
.end method

.method getActionView()Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 549
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mActionView:Landroid/widget/TextView;

    return-object v0
.end method

.method getMessageView()Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 545
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMessageView:Landroid/widget/TextView;

    return-object v0
.end method

.method protected onFinishInflate()V
    .registers 2

    .prologue
    .line 539
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 540
    sget v0, Landroid/support/design/R$id;->snackbar_text:I

    invoke-virtual {p0, v0}, Landroid/support/design/widget/Snackbar$SnackbarLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMessageView:Landroid/widget/TextView;

    .line 541
    sget v0, Landroid/support/design/R$id;->snackbar_action:I

    invoke-virtual {p0, v0}, Landroid/support/design/widget/Snackbar$SnackbarLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mActionView:Landroid/widget/TextView;

    .line 542
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 12
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 612
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 613
    if-eqz p1, :cond_13

    iget-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mOnLayoutChangeListener:Landroid/support/design/widget/Snackbar$SnackbarLayout$OnLayoutChangeListener;

    if-eqz v0, :cond_13

    .line 614
    iget-object v0, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mOnLayoutChangeListener:Landroid/support/design/widget/Snackbar$SnackbarLayout$OnLayoutChangeListener;

    move-object v1, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Landroid/support/design/widget/Snackbar$SnackbarLayout$OnLayoutChangeListener;->onLayoutChange(Landroid/view/View;IIII)V

    .line 616
    :cond_13
    return-void
.end method

.method protected onMeasure(II)V
    .registers 12
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 554
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 556
    iget v7, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMaxWidth:I

    if-lez v7, :cond_1c

    invoke-virtual {p0}, Landroid/support/design/widget/Snackbar$SnackbarLayout;->getMeasuredWidth()I

    move-result v7

    iget v8, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMaxWidth:I

    if-le v7, v8, :cond_1c

    .line 557
    iget v7, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMaxWidth:I

    const/high16 v8, 0x40000000

    invoke-static {v7, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 558
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 561
    :cond_1c
    invoke-virtual {p0}, Landroid/support/design/widget/Snackbar$SnackbarLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Landroid/support/design/R$dimen;->snackbar_padding_vertical_2lines:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 563
    .local v2, "multiLineVPadding":I
    invoke-virtual {p0}, Landroid/support/design/widget/Snackbar$SnackbarLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Landroid/support/design/R$dimen;->snackbar_padding_vertical:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 565
    .local v4, "singleLineVPadding":I
    iget-object v7, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMessageView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v7

    invoke-virtual {v7}, Landroid/text/Layout;->getLineCount()I

    move-result v7

    if-le v7, v5, :cond_5d

    move v0, v5

    .line 567
    .local v0, "isMultiLine":Z
    :goto_3d
    const/4 v3, 0x0

    .line 568
    .local v3, "remeasure":Z
    if-eqz v0, :cond_5f

    iget v7, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMaxInlineActionWidth:I

    if-lez v7, :cond_5f

    iget-object v7, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mActionView:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v7

    iget v8, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mMaxInlineActionWidth:I

    if-le v7, v8, :cond_5f

    .line 570
    sub-int v6, v2, v4

    invoke-direct {p0, v5, v2, v6}, Landroid/support/design/widget/Snackbar$SnackbarLayout;->updateViewsWithinLayout(III)Z

    move-result v5

    if-eqz v5, :cond_57

    .line 572
    const/4 v3, 0x1

    .line 581
    :cond_57
    :goto_57
    if-eqz v3, :cond_5c

    .line 582
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 584
    :cond_5c
    return-void

    .end local v0    # "isMultiLine":Z
    .end local v3    # "remeasure":Z
    :cond_5d
    move v0, v6

    .line 565
    goto :goto_3d

    .line 575
    .restart local v0    # "isMultiLine":Z
    .restart local v3    # "remeasure":Z
    :cond_5f
    if-eqz v0, :cond_6a

    move v1, v2

    .line 576
    .local v1, "messagePadding":I
    :goto_62
    invoke-direct {p0, v6, v1, v1}, Landroid/support/design/widget/Snackbar$SnackbarLayout;->updateViewsWithinLayout(III)Z

    move-result v5

    if-eqz v5, :cond_57

    .line 577
    const/4 v3, 0x1

    goto :goto_57

    .end local v1    # "messagePadding":I
    :cond_6a
    move v1, v4

    .line 575
    goto :goto_62
.end method

.method setOnLayoutChangeListener(Landroid/support/design/widget/Snackbar$SnackbarLayout$OnLayoutChangeListener;)V
    .registers 2
    .param p1, "onLayoutChangeListener"    # Landroid/support/design/widget/Snackbar$SnackbarLayout$OnLayoutChangeListener;

    .prologue
    .line 619
    iput-object p1, p0, Landroid/support/design/widget/Snackbar$SnackbarLayout;->mOnLayoutChangeListener:Landroid/support/design/widget/Snackbar$SnackbarLayout$OnLayoutChangeListener;

    .line 620
    return-void
.end method
