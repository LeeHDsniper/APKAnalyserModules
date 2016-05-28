.class public Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;
.super Ljava/lang/Object;
.source "RecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/RecyclerView$SmoothScroller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Action"
.end annotation


# instance fields
.field private changed:Z

.field private consecutiveUpdates:I

.field private mDuration:I

.field private mDx:I

.field private mDy:I

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mJumpToPosition:I


# direct methods
.method public constructor <init>(II)V
    .registers 5
    .param p1, "dx"    # I
    .param p2, "dy"    # I

    .prologue
    .line 8786
    const/high16 v0, -0x80000000

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v0, v1}, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;-><init>(IIILandroid/view/animation/Interpolator;)V

    .line 8787
    return-void
.end method

.method public constructor <init>(IIILandroid/view/animation/Interpolator;)V
    .registers 7
    .param p1, "dx"    # I
    .param p2, "dy"    # I
    .param p3, "duration"    # I
    .param p4, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    const/4 v1, 0x0

    .line 8805
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8771
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mJumpToPosition:I

    .line 8775
    iput-boolean v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->changed:Z

    .line 8779
    iput v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->consecutiveUpdates:I

    .line 8806
    iput p1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDx:I

    .line 8807
    iput p2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDy:I

    .line 8808
    iput p3, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    .line 8809
    iput-object p4, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 8810
    return-void
.end method

.method static synthetic access$5000(Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;Landroid/support/v7/widget/RecyclerView;)V
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;
    .param p1, "x1"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    .line 8761
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->runIfNecessary(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method

.method private runIfNecessary(Landroid/support/v7/widget/RecyclerView;)V
    .registers 9
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;

    .prologue
    const/4 v6, 0x0

    .line 8836
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mJumpToPosition:I

    if-ltz v1, :cond_10

    .line 8837
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mJumpToPosition:I

    .line 8838
    .local v0, "position":I
    const/4 v1, -0x1

    iput v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mJumpToPosition:I

    .line 8839
    # invokes: Landroid/support/v7/widget/RecyclerView;->jumpToPositionForSmoothScroller(I)V
    invoke-static {p1, v0}, Landroid/support/v7/widget/RecyclerView;->access$5100(Landroid/support/v7/widget/RecyclerView;I)V

    .line 8840
    iput-boolean v6, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->changed:Z

    .line 8865
    .end local v0    # "position":I
    :goto_f
    return-void

    .line 8843
    :cond_10
    iget-boolean v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->changed:Z

    if-eqz v1, :cond_60

    .line 8844
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->validate()V

    .line 8845
    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mInterpolator:Landroid/view/animation/Interpolator;

    if-nez v1, :cond_50

    .line 8846
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    const/high16 v2, -0x80000000

    if-ne v1, v2, :cond_42

    .line 8847
    # getter for: Landroid/support/v7/widget/RecyclerView;->mViewFlinger:Landroid/support/v7/widget/RecyclerView$ViewFlinger;
    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->access$4800(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$ViewFlinger;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDx:I

    iget v3, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDy:I

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->smoothScrollBy(II)V

    .line 8854
    :goto_2c
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->consecutiveUpdates:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->consecutiveUpdates:I

    .line 8855
    iget v1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->consecutiveUpdates:I

    const/16 v2, 0xa

    if-le v1, v2, :cond_3f

    .line 8858
    const-string v1, "RecyclerView"

    const-string v2, "Smooth Scroll action is being updated too frequently. Make sure you are not changing it unless necessary"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 8861
    :cond_3f
    iput-boolean v6, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->changed:Z

    goto :goto_f

    .line 8849
    :cond_42
    # getter for: Landroid/support/v7/widget/RecyclerView;->mViewFlinger:Landroid/support/v7/widget/RecyclerView$ViewFlinger;
    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->access$4800(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$ViewFlinger;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDx:I

    iget v3, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDy:I

    iget v4, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    invoke-virtual {v1, v2, v3, v4}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->smoothScrollBy(III)V

    goto :goto_2c

    .line 8852
    :cond_50
    # getter for: Landroid/support/v7/widget/RecyclerView;->mViewFlinger:Landroid/support/v7/widget/RecyclerView$ViewFlinger;
    invoke-static {p1}, Landroid/support/v7/widget/RecyclerView;->access$4800(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$ViewFlinger;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDx:I

    iget v3, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDy:I

    iget v4, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    iget-object v5, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->smoothScrollBy(IIILandroid/view/animation/Interpolator;)V

    goto :goto_2c

    .line 8863
    :cond_60
    iput v6, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->consecutiveUpdates:I

    goto :goto_f
.end method

.method private validate()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 8868
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mInterpolator:Landroid/view/animation/Interpolator;

    if-eqz v0, :cond_11

    iget v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    if-ge v0, v1, :cond_11

    .line 8869
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "If you provide an interpolator, you must set a positive duration"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 8871
    :cond_11
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    if-ge v0, v1, :cond_1d

    .line 8872
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Scroll duration must be a positive number"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 8874
    :cond_1d
    return-void
.end method


# virtual methods
.method hasJumpTarget()Z
    .registers 2

    .prologue
    .line 8832
    iget v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mJumpToPosition:I

    if-ltz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public jumpTo(I)V
    .registers 2
    .param p1, "targetPosition"    # I

    .prologue
    .line 8828
    iput p1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mJumpToPosition:I

    .line 8829
    return-void
.end method

.method public update(IIILandroid/view/animation/Interpolator;)V
    .registers 6
    .param p1, "dx"    # I
    .param p2, "dy"    # I
    .param p3, "duration"    # I
    .param p4, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 8927
    iput p1, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDx:I

    .line 8928
    iput p2, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDy:I

    .line 8929
    iput p3, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mDuration:I

    .line 8930
    iput-object p4, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 8931
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$SmoothScroller$Action;->changed:Z

    .line 8932
    return-void
.end method
