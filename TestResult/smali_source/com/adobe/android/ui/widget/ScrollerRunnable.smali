.class public Lcom/adobe/android/ui/widget/ScrollerRunnable;
.super Ljava/lang/Object;
.source "ScrollerRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;
    }
.end annotation


# instance fields
.field protected mAnimationDuration:I

.field protected mHasMore:Z

.field protected mLastFlingX:I

.field private mOverscrollDistance:I

.field protected mParent:Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;

.field protected mPreviousX:I

.field private mScroller:Landroid/widget/OverScroller;

.field protected mShouldStopFling:Z


# direct methods
.method public constructor <init>(Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;IILandroid/view/animation/Interpolator;)V
    .registers 7
    .param p1, "parent"    # Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;
    .param p2, "animationDuration"    # I
    .param p3, "overscrollDistance"    # I
    .param p4, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    if-nez p4, :cond_1a

    .line 28
    new-instance v1, Landroid/widget/OverScroller;

    move-object v0, p1

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v1, v0}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mScroller:Landroid/widget/OverScroller;

    .line 33
    :goto_13
    iput p3, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mOverscrollDistance:I

    .line 34
    iput-object p1, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mParent:Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;

    .line 35
    iput p2, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mAnimationDuration:I

    .line 36
    return-void

    .line 30
    :cond_1a
    new-instance v1, Landroid/widget/OverScroller;

    move-object v0, p1

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v1, v0, p4}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v1, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mScroller:Landroid/widget/OverScroller;

    goto :goto_13
.end method


# virtual methods
.method protected abortAnimation()V
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->abortAnimation()V

    .line 59
    return-void
.end method

.method public computeScrollOffset()Z
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    move-result v0

    return v0
.end method

.method public endFling(Z)V
    .registers 3
    .param p1, "scrollIntoSlots"    # Z

    .prologue
    const/4 v0, 0x0

    .line 48
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->abortAnimation()V

    .line 49
    iput v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mLastFlingX:I

    .line 50
    iput-boolean v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mHasMore:Z

    .line 52
    if-eqz p1, :cond_f

    .line 53
    iget-object v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mParent:Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;

    invoke-interface {v0}, Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;->scrollIntoSlots()V

    .line 55
    :cond_f
    return-void
.end method

.method public getCurrVelocity()F
    .registers 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 104
    iget-object v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrVelocity()F

    move-result v0

    return v0
.end method

.method public getCurrX()I
    .registers 2

    .prologue
    .line 132
    iget-object v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrX()I

    move-result v0

    return v0
.end method

.method public getLastFlingX()I
    .registers 2

    .prologue
    .line 39
    iget v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mLastFlingX:I

    return v0
.end method

.method public isFinished()Z
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    move-result v0

    return v0
.end method

.method public run()V
    .registers 3

    .prologue
    .line 117
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mShouldStopFling:Z

    .line 118
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->getCurrX()I

    move-result v1

    iput v1, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mPreviousX:I

    .line 119
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->computeScrollOffset()Z

    move-result v1

    iput-boolean v1, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mHasMore:Z

    .line 120
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->getCurrX()I

    move-result v0

    .line 121
    .local v0, "x":I
    iget-object v1, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mParent:Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;

    invoke-interface {v1, v0}, Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;->trackMotionScroll(I)V

    .line 123
    iget-boolean v1, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mHasMore:Z

    if-eqz v1, :cond_28

    iget-boolean v1, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mShouldStopFling:Z

    if-nez v1, :cond_28

    .line 124
    iput v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mLastFlingX:I

    .line 125
    iget-object v1, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mParent:Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;

    invoke-interface {v1, p0}, Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;->post(Ljava/lang/Runnable;)Z

    .line 129
    :goto_27
    return-void

    .line 127
    :cond_28
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->endFling(Z)V

    goto :goto_27
.end method

.method protected startCommon()V
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mParent:Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;

    invoke-interface {v0, p0}, Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 73
    return-void
.end method

.method public startUsingDistance(II)V
    .registers 9
    .param p1, "initialX"    # I
    .param p2, "distance"    # I

    .prologue
    const/4 v2, 0x0

    .line 62
    if-nez p2, :cond_4

    .line 69
    :goto_3
    return-void

    .line 65
    :cond_4
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->startCommon()V

    .line 66
    iput p1, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mLastFlingX:I

    .line 67
    iget-object v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mScroller:Landroid/widget/OverScroller;

    iget v5, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mAnimationDuration:I

    move v1, p1

    move v3, p2

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 68
    iget-object v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mParent:Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;

    invoke-interface {v0, p0}, Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;->post(Ljava/lang/Runnable;)Z

    goto :goto_3
.end method

.method public startUsingVelocity(II)V
    .registers 14
    .param p1, "initialX"    # I
    .param p2, "initialVelocity"    # I

    .prologue
    const/4 v2, 0x0

    .line 76
    if-nez p2, :cond_4

    .line 92
    :goto_3
    return-void

    .line 79
    :cond_4
    invoke-virtual {p0}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->startCommon()V

    .line 80
    iput p1, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mLastFlingX:I

    .line 81
    iget-object v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mScroller:Landroid/widget/OverScroller;

    iget-object v1, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mParent:Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;

    .line 85
    invoke-interface {v1}, Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;->getMinX()I

    move-result v5

    iget-object v1, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mParent:Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;

    .line 86
    invoke-interface {v1}, Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;->getMaxX()I

    move-result v6

    const v8, 0x7fffffff

    iget v9, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mOverscrollDistance:I

    move v1, p1

    move v3, p2

    move v4, v2

    move v7, v2

    move v10, v2

    .line 81
    invoke-virtual/range {v0 .. v10}, Landroid/widget/OverScroller;->fling(IIIIIIIIII)V

    .line 91
    iget-object v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mParent:Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;

    invoke-interface {v0, p0}, Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;->post(Ljava/lang/Runnable;)Z

    goto :goto_3
.end method

.method public stop(Z)V
    .registers 3
    .param p1, "scrollIntoSlots"    # Z

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/android/ui/widget/ScrollerRunnable;->mParent:Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;

    invoke-interface {v0, p0}, Lcom/adobe/android/ui/widget/ScrollerRunnable$ScrollableView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 44
    invoke-virtual {p0, p1}, Lcom/adobe/android/ui/widget/ScrollerRunnable;->endFling(Z)V

    .line 45
    return-void
.end method
