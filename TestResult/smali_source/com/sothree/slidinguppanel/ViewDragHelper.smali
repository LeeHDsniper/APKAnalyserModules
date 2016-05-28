.class public Lcom/sothree/slidinguppanel/ViewDragHelper;
.super Ljava/lang/Object;
.source "ViewDragHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;
    }
.end annotation


# static fields
.field private static final sInterpolator:Landroid/view/animation/Interpolator;


# instance fields
.field private mActivePointerId:I

.field private final mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

.field private mCapturedView:Landroid/view/View;

.field private mDragState:I

.field private mEdgeDragsInProgress:[I

.field private mEdgeDragsLocked:[I

.field private mEdgeSize:I

.field private mInitialEdgesTouched:[I

.field private mInitialMotionX:[F

.field private mInitialMotionY:[F

.field private mLastMotionX:[F

.field private mLastMotionY:[F

.field private mMaxVelocity:F

.field private mMinVelocity:F

.field private final mParentView:Landroid/view/ViewGroup;

.field private mPointersDown:I

.field private mReleaseInProgress:Z

.field private mScroller:Landroid/support/v4/widget/ScrollerCompat;

.field private final mSetIdleRunnable:Ljava/lang/Runnable;

.field private mTouchSlop:I

.field private mTrackingEdges:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 327
    new-instance v0, Lcom/sothree/slidinguppanel/ViewDragHelper$1;

    invoke-direct {v0}, Lcom/sothree/slidinguppanel/ViewDragHelper$1;-><init>()V

    sput-object v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->sInterpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "forParent"    # Landroid/view/ViewGroup;
    .param p3, "cb"    # Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    .prologue
    .line 374
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    const/4 v2, -0x1

    iput v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    .line 334
    new-instance v2, Lcom/sothree/slidinguppanel/ViewDragHelper$2;

    invoke-direct {v2, p0}, Lcom/sothree/slidinguppanel/ViewDragHelper$2;-><init>(Lcom/sothree/slidinguppanel/ViewDragHelper;)V

    iput-object v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mSetIdleRunnable:Ljava/lang/Runnable;

    .line 375
    if-nez p2, :cond_17

    .line 376
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Parent view may not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 378
    :cond_17
    if-nez p3, :cond_21

    .line 379
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Callback may not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 382
    :cond_21
    iput-object p2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    .line 383
    iput-object p3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    .line 385
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    .line 386
    .local v1, "vc":Landroid/view/ViewConfiguration;
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v0, v2, Landroid/util/DisplayMetrics;->density:F

    .line 387
    .local v0, "density":F
    const/high16 v2, 0x41a00000

    mul-float/2addr v2, v0

    const/high16 v3, 0x3f000000

    add-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeSize:I

    .line 389
    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v2

    iput v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTouchSlop:I

    .line 390
    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v2

    int-to-float v2, v2

    iput v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mMaxVelocity:F

    .line 391
    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v2

    int-to-float v2, v2

    iput v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mMinVelocity:F

    .line 392
    sget-object v2, Lcom/sothree/slidinguppanel/ViewDragHelper;->sInterpolator:Landroid/view/animation/Interpolator;

    invoke-static {p1, v2}, Landroid/support/v4/widget/ScrollerCompat;->create(Landroid/content/Context;Landroid/view/animation/Interpolator;)Landroid/support/v4/widget/ScrollerCompat;

    move-result-object v2

    iput-object v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    .line 393
    return-void
.end method

.method private checkNewEdgeDrag(FFII)Z
    .registers 10
    .param p1, "delta"    # F
    .param p2, "odelta"    # F
    .param p3, "pointerId"    # I
    .param p4, "edge"    # I

    .prologue
    const/4 v2, 0x0

    .line 1229
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 1230
    .local v0, "absDelta":F
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 1232
    .local v1, "absODelta":F
    iget-object v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialEdgesTouched:[I

    aget v3, v3, p3

    and-int/2addr v3, p4

    if-ne v3, p4, :cond_31

    iget v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTrackingEdges:I

    and-int/2addr v3, p4

    if-eqz v3, :cond_31

    iget-object v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeDragsLocked:[I

    aget v3, v3, p3

    and-int/2addr v3, p4

    if-eq v3, p4, :cond_31

    iget-object v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeDragsInProgress:[I

    aget v3, v3, p3

    and-int/2addr v3, p4

    if-eq v3, p4, :cond_31

    iget v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTouchSlop:I

    int-to-float v3, v3

    cmpg-float v3, v0, v3

    if-gtz v3, :cond_32

    iget v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTouchSlop:I

    int-to-float v3, v3

    cmpg-float v3, v1, v3

    if-gtz v3, :cond_32

    .line 1242
    :cond_31
    :goto_31
    return v2

    .line 1238
    :cond_32
    const/high16 v3, 0x3f000000

    mul-float/2addr v3, v1

    cmpg-float v3, v0, v3

    if-gez v3, :cond_49

    iget-object v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    invoke-virtual {v3, p4}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->onEdgeLock(I)Z

    move-result v3

    if-eqz v3, :cond_49

    .line 1239
    iget-object v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeDragsLocked:[I

    aget v4, v3, p3

    or-int/2addr v4, p4

    aput v4, v3, p3

    goto :goto_31

    .line 1242
    :cond_49
    iget-object v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeDragsInProgress:[I

    aget v3, v3, p3

    and-int/2addr v3, p4

    if-nez v3, :cond_31

    iget v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTouchSlop:I

    int-to-float v3, v3

    cmpl-float v3, v0, v3

    if-lez v3, :cond_31

    const/4 v2, 0x1

    goto :goto_31
.end method

.method private checkTouchSlop(Landroid/view/View;FF)Z
    .registers 11
    .param p1, "child"    # Landroid/view/View;
    .param p2, "dx"    # F
    .param p3, "dy"    # F

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1256
    if-nez p1, :cond_6

    move v2, v3

    .line 1269
    :cond_5
    :goto_5
    return v2

    .line 1259
    :cond_6
    iget-object v4, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    invoke-virtual {v4, p1}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->getViewHorizontalDragRange(Landroid/view/View;)I

    move-result v4

    if-lez v4, :cond_2d

    move v0, v2

    .line 1260
    .local v0, "checkHorizontal":Z
    :goto_f
    iget-object v4, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    invoke-virtual {v4, p1}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->getViewVerticalDragRange(Landroid/view/View;)I

    move-result v4

    if-lez v4, :cond_2f

    move v1, v2

    .line 1262
    .local v1, "checkVertical":Z
    :goto_18
    if-eqz v0, :cond_31

    if-eqz v1, :cond_31

    .line 1263
    mul-float v4, p2, p2

    mul-float v5, p3, p3

    add-float/2addr v4, v5

    iget v5, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTouchSlop:I

    iget v6, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTouchSlop:I

    mul-int/2addr v5, v6

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-gtz v4, :cond_5

    move v2, v3

    goto :goto_5

    .end local v0    # "checkHorizontal":Z
    .end local v1    # "checkVertical":Z
    :cond_2d
    move v0, v3

    .line 1259
    goto :goto_f

    .restart local v0    # "checkHorizontal":Z
    :cond_2f
    move v1, v3

    .line 1260
    goto :goto_18

    .line 1264
    .restart local v1    # "checkVertical":Z
    :cond_31
    if-eqz v0, :cond_40

    .line 1265
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v5, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTouchSlop:I

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-gtz v4, :cond_5

    move v2, v3

    goto :goto_5

    .line 1266
    :cond_40
    if-eqz v1, :cond_4f

    .line 1267
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v5, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTouchSlop:I

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-gtz v4, :cond_5

    move v2, v3

    goto :goto_5

    :cond_4f
    move v2, v3

    .line 1269
    goto :goto_5
.end method

.method private clampMag(FFF)F
    .registers 7
    .param p1, "value"    # F
    .param p2, "absMin"    # F
    .param p3, "absMax"    # F

    .prologue
    const/4 v1, 0x0

    .line 668
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 669
    .local v0, "absValue":F
    cmpg-float v2, v0, p2

    if-gez v2, :cond_b

    move p3, v1

    .line 671
    .end local p3    # "absMax":F
    :cond_a
    :goto_a
    return p3

    .line 670
    .restart local p3    # "absMax":F
    :cond_b
    cmpl-float v2, v0, p3

    if-lez v2, :cond_15

    cmpl-float v1, p1, v1

    if-gtz v1, :cond_a

    neg-float p3, p3

    goto :goto_a

    :cond_15
    move p3, p1

    .line 671
    goto :goto_a
.end method

.method private clampMag(III)I
    .registers 5
    .param p1, "value"    # I
    .param p2, "absMin"    # I
    .param p3, "absMax"    # I

    .prologue
    .line 651
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 652
    .local v0, "absValue":I
    if-ge v0, p2, :cond_8

    const/4 p3, 0x0

    .line 654
    .end local p3    # "absMax":I
    :cond_7
    :goto_7
    return p3

    .line 653
    .restart local p3    # "absMax":I
    :cond_8
    if-le v0, p3, :cond_e

    if-gtz p1, :cond_7

    neg-int p3, p3

    goto :goto_7

    :cond_e
    move p3, p1

    .line 654
    goto :goto_7
.end method

.method private clearMotionHistory()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 775
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    if-nez v0, :cond_7

    .line 786
    :goto_6
    return-void

    .line 778
    :cond_7
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    .line 779
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionY:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    .line 780
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionX:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    .line 781
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionY:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    .line 782
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialEdgesTouched:[I

    invoke-static {v0, v2}, Ljava/util/Arrays;->fill([II)V

    .line 783
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeDragsInProgress:[I

    invoke-static {v0, v2}, Ljava/util/Arrays;->fill([II)V

    .line 784
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeDragsLocked:[I

    invoke-static {v0, v2}, Ljava/util/Arrays;->fill([II)V

    .line 785
    iput v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mPointersDown:I

    goto :goto_6
.end method

.method private clearMotionHistory(I)V
    .registers 5
    .param p1, "pointerId"    # I

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 789
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    if-nez v0, :cond_7

    .line 800
    :goto_6
    return-void

    .line 792
    :cond_7
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    aput v1, v0, p1

    .line 793
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionY:[F

    aput v1, v0, p1

    .line 794
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionX:[F

    aput v1, v0, p1

    .line 795
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionY:[F

    aput v1, v0, p1

    .line 796
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialEdgesTouched:[I

    aput v2, v0, p1

    .line 797
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeDragsInProgress:[I

    aput v2, v0, p1

    .line 798
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeDragsLocked:[I

    aput v2, v0, p1

    .line 799
    iget v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mPointersDown:I

    const/4 v1, 0x1

    shl-int/2addr v1, p1

    xor-int/lit8 v1, v1, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mPointersDown:I

    goto :goto_6
.end method

.method private computeAxisDuration(III)I
    .registers 14
    .param p1, "delta"    # I
    .param p2, "velocity"    # I
    .param p3, "motionRange"    # I

    .prologue
    const/high16 v9, 0x3f800000

    .line 619
    if-nez p1, :cond_6

    .line 620
    const/4 v6, 0x0

    .line 637
    :goto_5
    return v6

    .line 623
    :cond_6
    iget-object v6, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    invoke-virtual {v6}, Landroid/view/ViewGroup;->getWidth()I

    move-result v5

    .line 624
    .local v5, "width":I
    div-int/lit8 v3, v5, 0x2

    .line 625
    .local v3, "halfWidth":I
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v6

    int-to-float v6, v6

    int-to-float v7, v5

    div-float/2addr v6, v7

    invoke-static {v9, v6}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 626
    .local v1, "distanceRatio":F
    int-to-float v6, v3

    int-to-float v7, v3

    .line 627
    invoke-direct {p0, v1}, Lcom/sothree/slidinguppanel/ViewDragHelper;->distanceInfluenceForSnapDuration(F)F

    move-result v8

    mul-float/2addr v7, v8

    add-float v0, v6, v7

    .line 630
    .local v0, "distance":F
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    .line 631
    if-lez p2, :cond_3f

    .line 632
    const/high16 v6, 0x447a0000

    int-to-float v7, p2

    div-float v7, v0, v7

    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result v7

    mul-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    mul-int/lit8 v2, v6, 0x4

    .line 637
    .local v2, "duration":I
    :goto_38
    const/16 v6, 0x258

    invoke-static {v2, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    goto :goto_5

    .line 634
    .end local v2    # "duration":I
    :cond_3f
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v6

    int-to-float v6, v6

    int-to-float v7, p3

    div-float v4, v6, v7

    .line 635
    .local v4, "range":F
    add-float v6, v4, v9

    const/high16 v7, 0x43800000

    mul-float/2addr v6, v7

    float-to-int v2, v6

    .restart local v2    # "duration":I
    goto :goto_38
.end method

.method private computeSettleDuration(Landroid/view/View;IIII)I
    .registers 20
    .param p1, "child"    # Landroid/view/View;
    .param p2, "dx"    # I
    .param p3, "dy"    # I
    .param p4, "xvel"    # I
    .param p5, "yvel"    # I

    .prologue
    .line 598
    iget v12, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mMinVelocity:F

    float-to-int v12, v12

    iget v13, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mMaxVelocity:F

    float-to-int v13, v13

    move/from16 v0, p4

    invoke-direct {p0, v0, v12, v13}, Lcom/sothree/slidinguppanel/ViewDragHelper;->clampMag(III)I

    move-result p4

    .line 599
    iget v12, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mMinVelocity:F

    float-to-int v12, v12

    iget v13, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mMaxVelocity:F

    float-to-int v13, v13

    move/from16 v0, p5

    invoke-direct {p0, v0, v12, v13}, Lcom/sothree/slidinguppanel/ViewDragHelper;->clampMag(III)I

    move-result p5

    .line 600
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    .line 601
    .local v2, "absDx":I
    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    .line 602
    .local v3, "absDy":I
    invoke-static/range {p4 .. p4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    .line 603
    .local v4, "absXVel":I
    invoke-static/range {p5 .. p5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    .line 604
    .local v5, "absYVel":I
    add-int v7, v4, v5

    .line 605
    .local v7, "addedVel":I
    add-int v6, v2, v3

    .line 607
    .local v6, "addedDistance":I
    if-eqz p4, :cond_5b

    int-to-float v12, v4

    int-to-float v13, v7

    div-float v9, v12, v13

    .line 609
    .local v9, "xweight":F
    :goto_32
    if-eqz p5, :cond_60

    int-to-float v12, v5

    int-to-float v13, v7

    div-float v11, v12, v13

    .line 612
    .local v11, "yweight":F
    :goto_38
    iget-object v12, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    invoke-virtual {v12, p1}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->getViewHorizontalDragRange(Landroid/view/View;)I

    move-result v12

    move/from16 v0, p2

    move/from16 v1, p4

    invoke-direct {p0, v0, v1, v12}, Lcom/sothree/slidinguppanel/ViewDragHelper;->computeAxisDuration(III)I

    move-result v8

    .line 613
    .local v8, "xduration":I
    iget-object v12, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    invoke-virtual {v12, p1}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->getViewVerticalDragRange(Landroid/view/View;)I

    move-result v12

    move/from16 v0, p3

    move/from16 v1, p5

    invoke-direct {p0, v0, v1, v12}, Lcom/sothree/slidinguppanel/ViewDragHelper;->computeAxisDuration(III)I

    move-result v10

    .line 615
    .local v10, "yduration":I
    int-to-float v12, v8

    mul-float/2addr v12, v9

    int-to-float v13, v10

    mul-float/2addr v13, v11

    add-float/2addr v12, v13

    float-to-int v12, v12

    return v12

    .line 607
    .end local v8    # "xduration":I
    .end local v9    # "xweight":F
    .end local v10    # "yduration":I
    .end local v11    # "yweight":F
    :cond_5b
    int-to-float v12, v2

    int-to-float v13, v6

    div-float v9, v12, v13

    goto :goto_32

    .line 609
    .restart local v9    # "xweight":F
    :cond_60
    int-to-float v12, v3

    int-to-float v13, v6

    div-float v11, v12, v13

    goto :goto_38
.end method

.method public static create(Landroid/view/ViewGroup;FLcom/sothree/slidinguppanel/ViewDragHelper$Callback;)Lcom/sothree/slidinguppanel/ViewDragHelper;
    .registers 6
    .param p0, "forParent"    # Landroid/view/ViewGroup;
    .param p1, "sensitivity"    # F
    .param p2, "cb"    # Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    .prologue
    .line 361
    invoke-static {p0, p2}, Lcom/sothree/slidinguppanel/ViewDragHelper;->create(Landroid/view/ViewGroup;Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;)Lcom/sothree/slidinguppanel/ViewDragHelper;

    move-result-object v0

    .line 362
    .local v0, "helper":Lcom/sothree/slidinguppanel/ViewDragHelper;
    iget v1, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTouchSlop:I

    int-to-float v1, v1

    const/high16 v2, 0x3f800000

    div-float/2addr v2, p1

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTouchSlop:I

    .line 363
    return-object v0
.end method

.method public static create(Landroid/view/ViewGroup;Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;)Lcom/sothree/slidinguppanel/ViewDragHelper;
    .registers 4
    .param p0, "forParent"    # Landroid/view/ViewGroup;
    .param p1, "cb"    # Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    .prologue
    .line 348
    new-instance v0, Lcom/sothree/slidinguppanel/ViewDragHelper;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0, p1}, Lcom/sothree/slidinguppanel/ViewDragHelper;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;)V

    return-object v0
.end method

.method private dispatchViewReleased(FF)V
    .registers 7
    .param p1, "xvel"    # F
    .param p2, "yvel"    # F

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 764
    iput-boolean v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mReleaseInProgress:Z

    .line 765
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v0, v1, p1, p2}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->onViewReleased(Landroid/view/View;FF)V

    .line 766
    iput-boolean v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mReleaseInProgress:Z

    .line 768
    iget v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    if-ne v0, v3, :cond_14

    .line 770
    invoke-virtual {p0, v2}, Lcom/sothree/slidinguppanel/ViewDragHelper;->setDragState(I)V

    .line 772
    :cond_14
    return-void
.end method

.method private distanceInfluenceForSnapDuration(F)F
    .registers 6
    .param p1, "f"    # F

    .prologue
    .line 675
    const/high16 v0, 0x3f000000

    sub-float/2addr p1, v0

    .line 676
    float-to-double v0, p1

    const-wide v2, 0x3fde28c7460698c7L

    mul-double/2addr v0, v2

    double-to-float p1, v0

    .line 677
    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method private dragTo(IIII)V
    .registers 13
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "dx"    # I
    .param p4, "dy"    # I

    .prologue
    .line 1377
    move v2, p1

    .line 1378
    .local v2, "clampedX":I
    move v3, p2

    .line 1379
    .local v3, "clampedY":I
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v6

    .line 1380
    .local v6, "oldLeft":I
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v7

    .line 1381
    .local v7, "oldTop":I
    if-eqz p3, :cond_1f

    .line 1382
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v0, v1, p1, p3}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->clampViewPositionHorizontal(Landroid/view/View;II)I

    move-result v2

    .line 1383
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    sub-int v1, v2, v6

    invoke-virtual {v0, v1}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 1385
    :cond_1f
    if-eqz p4, :cond_30

    .line 1386
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v0, v1, p2, p4}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->clampViewPositionVertical(Landroid/view/View;II)I

    move-result v3

    .line 1387
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    sub-int v1, v3, v7

    invoke-virtual {v0, v1}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 1390
    :cond_30
    if-nez p3, :cond_34

    if-eqz p4, :cond_3f

    .line 1391
    :cond_34
    sub-int v4, v2, v6

    .line 1392
    .local v4, "clampedDx":I
    sub-int v5, v3, v7

    .line 1393
    .local v5, "clampedDy":I
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual/range {v0 .. v5}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->onViewPositionChanged(Landroid/view/View;IIII)V

    .line 1396
    .end local v4    # "clampedDx":I
    .end local v5    # "clampedDy":I
    :cond_3f
    return-void
.end method

.method private ensureMotionHistorySizeForId(I)V
    .registers 12
    .param p1, "pointerId"    # I

    .prologue
    const/4 v9, 0x0

    .line 803
    iget-object v7, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    if-eqz v7, :cond_a

    iget-object v7, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    array-length v7, v7

    if-gt v7, p1, :cond_70

    .line 804
    :cond_a
    add-int/lit8 v7, p1, 0x1

    new-array v3, v7, [F

    .line 805
    .local v3, "imx":[F
    add-int/lit8 v7, p1, 0x1

    new-array v4, v7, [F

    .line 806
    .local v4, "imy":[F
    add-int/lit8 v7, p1, 0x1

    new-array v5, v7, [F

    .line 807
    .local v5, "lmx":[F
    add-int/lit8 v7, p1, 0x1

    new-array v6, v7, [F

    .line 808
    .local v6, "lmy":[F
    add-int/lit8 v7, p1, 0x1

    new-array v2, v7, [I

    .line 809
    .local v2, "iit":[I
    add-int/lit8 v7, p1, 0x1

    new-array v0, v7, [I

    .line 810
    .local v0, "edip":[I
    add-int/lit8 v7, p1, 0x1

    new-array v1, v7, [I

    .line 812
    .local v1, "edl":[I
    iget-object v7, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    if-eqz v7, :cond_62

    .line 813
    iget-object v7, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    iget-object v8, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    array-length v8, v8

    invoke-static {v7, v9, v3, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 814
    iget-object v7, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionY:[F

    iget-object v8, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionY:[F

    array-length v8, v8

    invoke-static {v7, v9, v4, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 815
    iget-object v7, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionX:[F

    iget-object v8, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionX:[F

    array-length v8, v8

    invoke-static {v7, v9, v5, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 816
    iget-object v7, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionY:[F

    iget-object v8, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionY:[F

    array-length v8, v8

    invoke-static {v7, v9, v6, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 817
    iget-object v7, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialEdgesTouched:[I

    iget-object v8, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialEdgesTouched:[I

    array-length v8, v8

    invoke-static {v7, v9, v2, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 818
    iget-object v7, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeDragsInProgress:[I

    iget-object v8, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeDragsInProgress:[I

    array-length v8, v8

    invoke-static {v7, v9, v0, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 819
    iget-object v7, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeDragsLocked:[I

    iget-object v8, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeDragsLocked:[I

    array-length v8, v8

    invoke-static {v7, v9, v1, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 822
    :cond_62
    iput-object v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    .line 823
    iput-object v4, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionY:[F

    .line 824
    iput-object v5, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionX:[F

    .line 825
    iput-object v6, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionY:[F

    .line 826
    iput-object v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialEdgesTouched:[I

    .line 827
    iput-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeDragsInProgress:[I

    .line 828
    iput-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeDragsLocked:[I

    .line 830
    .end local v0    # "edip":[I
    .end local v1    # "edl":[I
    .end local v2    # "iit":[I
    .end local v3    # "imx":[F
    .end local v4    # "imy":[F
    .end local v5    # "lmx":[F
    .end local v6    # "lmy":[F
    :cond_70
    return-void
.end method

.method private forceSettleCapturedViewAt(IIII)Z
    .registers 16
    .param p1, "finalLeft"    # I
    .param p2, "finalTop"    # I
    .param p3, "xvel"    # I
    .param p4, "yvel"    # I

    .prologue
    const/4 v0, 0x0

    .line 578
    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v10

    .line 579
    .local v10, "startLeft":I
    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v6

    .line 580
    .local v6, "startTop":I
    sub-int v2, p1, v10

    .line 581
    .local v2, "dx":I
    sub-int v3, p2, v6

    .line 583
    .local v3, "dy":I
    if-nez v2, :cond_1e

    if-nez v3, :cond_1e

    .line 585
    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v1}, Landroid/support/v4/widget/ScrollerCompat;->abortAnimation()V

    .line 586
    invoke-virtual {p0, v0}, Lcom/sothree/slidinguppanel/ViewDragHelper;->setDragState(I)V

    .line 594
    :goto_1d
    return v0

    .line 590
    :cond_1e
    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    move-object v0, p0

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/sothree/slidinguppanel/ViewDragHelper;->computeSettleDuration(Landroid/view/View;IIII)I

    move-result v9

    .line 591
    .local v9, "duration":I
    iget-object v4, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    move v5, v10

    move v7, v2

    move v8, v3

    invoke-virtual/range {v4 .. v9}, Landroid/support/v4/widget/ScrollerCompat;->startScroll(IIIII)V

    .line 593
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/sothree/slidinguppanel/ViewDragHelper;->setDragState(I)V

    .line 594
    const/4 v0, 0x1

    goto :goto_1d
.end method

.method private getEdgesTouched(II)I
    .registers 6
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 1451
    const/4 v0, 0x0

    .line 1453
    .local v0, "result":I
    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLeft()I

    move-result v1

    iget v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeSize:I

    add-int/2addr v1, v2

    if-ge p1, v1, :cond_e

    or-int/lit8 v0, v0, 0x1

    .line 1454
    :cond_e
    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getTop()I

    move-result v1

    iget v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeSize:I

    add-int/2addr v1, v2

    if-ge p2, v1, :cond_1b

    or-int/lit8 v0, v0, 0x4

    .line 1455
    :cond_1b
    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getRight()I

    move-result v1

    iget v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeSize:I

    sub-int/2addr v1, v2

    if-le p1, v1, :cond_28

    or-int/lit8 v0, v0, 0x2

    .line 1456
    :cond_28
    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getBottom()I

    move-result v1

    iget v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeSize:I

    sub-int/2addr v1, v2

    if-le p2, v1, :cond_35

    or-int/lit8 v0, v0, 0x8

    .line 1458
    :cond_35
    return v0
.end method

.method private releaseViewForPointerUp()V
    .registers 6

    .prologue
    .line 1366
    iget-object v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v3, 0x3e8

    iget v4, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mMaxVelocity:F

    invoke-virtual {v2, v3, v4}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 1367
    iget-object v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    .line 1368
    invoke-static {v2, v3}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v2

    iget v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mMinVelocity:F

    iget v4, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mMaxVelocity:F

    .line 1367
    invoke-direct {p0, v2, v3, v4}, Lcom/sothree/slidinguppanel/ViewDragHelper;->clampMag(FFF)F

    move-result v0

    .line 1370
    .local v0, "xvel":F
    iget-object v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    .line 1371
    invoke-static {v2, v3}, Landroid/support/v4/view/VelocityTrackerCompat;->getYVelocity(Landroid/view/VelocityTracker;I)F

    move-result v2

    iget v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mMinVelocity:F

    iget v4, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mMaxVelocity:F

    .line 1370
    invoke-direct {p0, v2, v3, v4}, Lcom/sothree/slidinguppanel/ViewDragHelper;->clampMag(FFF)F

    move-result v1

    .line 1373
    .local v1, "yvel":F
    invoke-direct {p0, v0, v1}, Lcom/sothree/slidinguppanel/ViewDragHelper;->dispatchViewReleased(FF)V

    .line 1374
    return-void
.end method

.method private reportNewEdgeDrags(FFI)V
    .registers 7
    .param p1, "dx"    # F
    .param p2, "dy"    # F
    .param p3, "pointerId"    # I

    .prologue
    .line 1208
    const/4 v0, 0x0

    .line 1209
    .local v0, "dragsStarted":I
    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, p3, v1}, Lcom/sothree/slidinguppanel/ViewDragHelper;->checkNewEdgeDrag(FFII)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 1210
    or-int/lit8 v0, v0, 0x1

    .line 1212
    :cond_a
    const/4 v1, 0x4

    invoke-direct {p0, p2, p1, p3, v1}, Lcom/sothree/slidinguppanel/ViewDragHelper;->checkNewEdgeDrag(FFII)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 1213
    or-int/lit8 v0, v0, 0x4

    .line 1215
    :cond_13
    const/4 v1, 0x2

    invoke-direct {p0, p1, p2, p3, v1}, Lcom/sothree/slidinguppanel/ViewDragHelper;->checkNewEdgeDrag(FFII)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 1216
    or-int/lit8 v0, v0, 0x2

    .line 1218
    :cond_1c
    const/16 v1, 0x8

    invoke-direct {p0, p2, p1, p3, v1}, Lcom/sothree/slidinguppanel/ViewDragHelper;->checkNewEdgeDrag(FFII)Z

    move-result v1

    if-eqz v1, :cond_26

    .line 1219
    or-int/lit8 v0, v0, 0x8

    .line 1222
    :cond_26
    if-eqz v0, :cond_34

    .line 1223
    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mEdgeDragsInProgress:[I

    aget v2, v1, p3

    or-int/2addr v2, v0

    aput v2, v1, p3

    .line 1224
    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    invoke-virtual {v1, v0, p3}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->onEdgeDragStarted(II)V

    .line 1226
    :cond_34
    return-void
.end method

.method private saveInitialMotion(FFI)V
    .registers 7
    .param p1, "x"    # F
    .param p2, "y"    # F
    .param p3, "pointerId"    # I

    .prologue
    .line 833
    invoke-direct {p0, p3}, Lcom/sothree/slidinguppanel/ViewDragHelper;->ensureMotionHistorySizeForId(I)V

    .line 834
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionX:[F

    aput p1, v1, p3

    aput p1, v0, p3

    .line 835
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionY:[F

    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionY:[F

    aput p2, v1, p3

    aput p2, v0, p3

    .line 836
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialEdgesTouched:[I

    float-to-int v1, p1

    float-to-int v2, p2

    invoke-direct {p0, v1, v2}, Lcom/sothree/slidinguppanel/ViewDragHelper;->getEdgesTouched(II)I

    move-result v1

    aput v1, v0, p3

    .line 837
    iget v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mPointersDown:I

    const/4 v1, 0x1

    shl-int/2addr v1, p3

    or-int/2addr v0, v1

    iput v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mPointersDown:I

    .line 838
    return-void
.end method

.method private saveLastMotion(Landroid/view/MotionEvent;)V
    .registers 8
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 841
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getPointerCount(Landroid/view/MotionEvent;)I

    move-result v1

    .line 842
    .local v1, "pointerCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    if-ge v0, v1, :cond_26

    .line 843
    invoke-static {p1, v0}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v2

    .line 844
    .local v2, "pointerId":I
    invoke-static {p1, v0}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v3

    .line 845
    .local v3, "x":F
    invoke-static {p1, v0}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v4

    .line 846
    .local v4, "y":F
    iget-object v5, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionX:[F

    if-eqz v5, :cond_23

    iget-object v5, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionY:[F

    if-eqz v5, :cond_23

    .line 847
    iget-object v5, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionX:[F

    aput v3, v5, v2

    .line 848
    iget-object v5, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionY:[F

    aput v4, v5, v2

    .line 842
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 851
    .end local v2    # "pointerId":I
    .end local v3    # "x":F
    .end local v4    # "y":F
    :cond_26
    return-void
.end method


# virtual methods
.method public abort()V
    .registers 9

    .prologue
    .line 513
    invoke-virtual {p0}, Lcom/sothree/slidinguppanel/ViewDragHelper;->cancel()V

    .line 514
    iget v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_30

    .line 515
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->getCurrX()I

    move-result v6

    .line 516
    .local v6, "oldX":I
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->getCurrY()I

    move-result v7

    .line 517
    .local v7, "oldY":I
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->abortAnimation()V

    .line 518
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->getCurrX()I

    move-result v2

    .line 519
    .local v2, "newX":I
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->getCurrY()I

    move-result v3

    .line 520
    .local v3, "newY":I
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    sub-int v4, v2, v6

    sub-int v5, v3, v7

    invoke-virtual/range {v0 .. v5}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->onViewPositionChanged(Landroid/view/View;IIII)V

    .line 522
    .end local v2    # "newX":I
    .end local v3    # "newY":I
    .end local v6    # "oldX":I
    .end local v7    # "oldY":I
    :cond_30
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/sothree/slidinguppanel/ViewDragHelper;->setDragState(I)V

    .line 523
    return-void
.end method

.method public cancel()V
    .registers 2

    .prologue
    .line 499
    const/4 v0, -0x1

    iput v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    .line 500
    invoke-direct {p0}, Lcom/sothree/slidinguppanel/ViewDragHelper;->clearMotionHistory()V

    .line 502
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_12

    .line 503
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 504
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 506
    :cond_12
    return-void
.end method

.method public captureChildView(Landroid/view/View;I)V
    .registers 6
    .param p1, "childView"    # Landroid/view/View;
    .param p2, "activePointerId"    # I

    .prologue
    .line 461
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    if-eq v0, v1, :cond_29

    .line 462
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "captureChildView: parameter must be a descendant of the ViewDragHelper\'s tracked parent view ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 466
    :cond_29
    iput-object p1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    .line 467
    iput p2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    .line 468
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    invoke-virtual {v0, p1, p2}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->onViewCaptured(Landroid/view/View;I)V

    .line 469
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/sothree/slidinguppanel/ViewDragHelper;->setDragState(I)V

    .line 470
    return-void
.end method

.method public continueSettling(Z)Z
    .registers 11
    .param p1, "deferCallbacks"    # Z

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x0

    .line 717
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    if-nez v0, :cond_7

    .line 754
    :goto_6
    return v7

    .line 720
    :cond_7
    iget v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    if-ne v0, v8, :cond_6e

    .line 721
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->computeScrollOffset()Z

    move-result v6

    .line 722
    .local v6, "keepGoing":Z
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->getCurrX()I

    move-result v2

    .line 723
    .local v2, "x":I
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->getCurrY()I

    move-result v3

    .line 724
    .local v3, "y":I
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    sub-int v4, v2, v0

    .line 725
    .local v4, "dx":I
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    sub-int v5, v3, v0

    .line 727
    .local v5, "dy":I
    if-eqz v4, :cond_34

    .line 728
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 730
    :cond_34
    if-eqz v5, :cond_3b

    .line 731
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 734
    :cond_3b
    if-nez v4, :cond_3f

    if-eqz v5, :cond_46

    .line 735
    :cond_3f
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual/range {v0 .. v5}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->onViewPositionChanged(Landroid/view/View;IIII)V

    .line 738
    :cond_46
    if-eqz v6, :cond_63

    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->getFinalX()I

    move-result v0

    if-ne v2, v0, :cond_63

    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->getFinalY()I

    move-result v0

    if-ne v3, v0, :cond_63

    .line 741
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->abortAnimation()V

    .line 742
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->isFinished()Z

    move-result v6

    .line 745
    :cond_63
    if-nez v6, :cond_6e

    .line 746
    if-eqz p1, :cond_75

    .line 747
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mSetIdleRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 754
    .end local v2    # "x":I
    .end local v3    # "y":I
    .end local v4    # "dx":I
    .end local v5    # "dy":I
    .end local v6    # "keepGoing":Z
    :cond_6e
    :goto_6e
    iget v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    if-ne v0, v8, :cond_79

    const/4 v0, 0x1

    :goto_73
    move v7, v0

    goto :goto_6

    .line 749
    .restart local v2    # "x":I
    .restart local v3    # "y":I
    .restart local v4    # "dx":I
    .restart local v5    # "dy":I
    .restart local v6    # "keepGoing":Z
    :cond_75
    invoke-virtual {p0, v7}, Lcom/sothree/slidinguppanel/ViewDragHelper;->setDragState(I)V

    goto :goto_6e

    .end local v2    # "x":I
    .end local v3    # "y":I
    .end local v4    # "dx":I
    .end local v5    # "dy":I
    .end local v6    # "keepGoing":Z
    :cond_79
    move v0, v7

    .line 754
    goto :goto_73
.end method

.method public findTopChildUnder(II)Landroid/view/View;
    .registers 8
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 1439
    iget-object v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .line 1440
    .local v1, "childCount":I
    add-int/lit8 v2, v1, -0x1

    .local v2, "i":I
    :goto_8
    if-ltz v2, :cond_32

    .line 1441
    iget-object v3, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    iget-object v4, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    invoke-virtual {v4, v2}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->getOrderedChildIndex(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1442
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v3

    if-lt p1, v3, :cond_2f

    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v3

    if-ge p1, v3, :cond_2f

    .line 1443
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v3

    if-lt p2, v3, :cond_2f

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v3

    if-ge p2, v3, :cond_2f

    .line 1447
    .end local v0    # "child":Landroid/view/View;
    :goto_2e
    return-object v0

    .line 1440
    .restart local v0    # "child":Landroid/view/View;
    :cond_2f
    add-int/lit8 v2, v2, -0x1

    goto :goto_8

    .line 1447
    .end local v0    # "child":Landroid/view/View;
    :cond_32
    const/4 v0, 0x0

    goto :goto_2e
.end method

.method public getTouchSlop()I
    .registers 2

    .prologue
    .line 491
    iget v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTouchSlop:I

    return v0
.end method

.method public getViewDragState()I
    .registers 2

    .prologue
    .line 422
    iget v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    return v0
.end method

.method public isCapturedViewUnder(II)Z
    .registers 4
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 1408
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {p0, v0, p1, p2}, Lcom/sothree/slidinguppanel/ViewDragHelper;->isViewUnder(Landroid/view/View;II)Z

    move-result v0

    return v0
.end method

.method public isViewUnder(Landroid/view/View;II)Z
    .registers 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "x"    # I
    .param p3, "y"    # I

    .prologue
    const/4 v0, 0x0

    .line 1421
    if-nez p1, :cond_4

    .line 1427
    :cond_3
    :goto_3
    return v0

    .line 1424
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    if-lt p2, v1, :cond_3

    .line 1425
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v1

    if-ge p2, v1, :cond_3

    .line 1426
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v1

    if-lt p3, v1, :cond_3

    .line 1427
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v1

    if-ge p3, v1, :cond_3

    const/4 v0, 0x1

    goto :goto_3
.end method

.method public processTouchEvent(Landroid/view/MotionEvent;)V
    .registers 23
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 1056
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v3

    .line 1057
    .local v3, "action":I
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v4

    .line 1059
    .local v4, "actionIndex":I
    if-nez v3, :cond_d

    .line 1062
    invoke-virtual/range {p0 .. p0}, Lcom/sothree/slidinguppanel/ViewDragHelper;->cancel()V

    .line 1065
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v19, v0

    if-nez v19, :cond_1f

    .line 1066
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/sothree/slidinguppanel/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 1068
    :cond_1f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 1070
    packed-switch v3, :pswitch_data_2be

    .line 1205
    :cond_2f
    :goto_2f
    :pswitch_2f
    return-void

    .line 1072
    :pswitch_30
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v17

    .line 1073
    .local v17, "x":F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v18

    .line 1074
    .local v18, "y":F
    const/16 v19, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v15

    .line 1075
    .local v15, "pointerId":I
    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v19, v0

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v20, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/sothree/slidinguppanel/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v16

    .line 1077
    .local v16, "toCapture":Landroid/view/View;
    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-direct {v0, v1, v2, v15}, Lcom/sothree/slidinguppanel/ViewDragHelper;->saveInitialMotion(FFI)V

    .line 1082
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v15}, Lcom/sothree/slidinguppanel/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    .line 1084
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialEdgesTouched:[I

    move-object/from16 v19, v0

    aget v7, v19, v15

    .line 1085
    .local v7, "edgesTouched":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTrackingEdges:I

    move/from16 v19, v0

    and-int v19, v19, v7

    if-eqz v19, :cond_2f

    .line 1086
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTrackingEdges:I

    move/from16 v20, v0

    and-int v20, v20, v7

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v0, v1, v15}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->onEdgeTouched(II)V

    goto :goto_2f

    .line 1092
    .end local v7    # "edgesTouched":I
    .end local v15    # "pointerId":I
    .end local v16    # "toCapture":Landroid/view/View;
    .end local v17    # "x":F
    .end local v18    # "y":F
    :pswitch_8e
    move-object/from16 v0, p1

    invoke-static {v0, v4}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v15

    .line 1093
    .restart local v15    # "pointerId":I
    move-object/from16 v0, p1

    invoke-static {v0, v4}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v17

    .line 1094
    .restart local v17    # "x":F
    move-object/from16 v0, p1

    invoke-static {v0, v4}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v18

    .line 1096
    .restart local v18    # "y":F
    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    invoke-direct {v0, v1, v2, v15}, Lcom/sothree/slidinguppanel/ViewDragHelper;->saveInitialMotion(FFI)V

    .line 1099
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    move/from16 v19, v0

    if-nez v19, :cond_f5

    .line 1102
    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v19, v0

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v20, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/sothree/slidinguppanel/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v16

    .line 1103
    .restart local v16    # "toCapture":Landroid/view/View;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v15}, Lcom/sothree/slidinguppanel/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    .line 1105
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialEdgesTouched:[I

    move-object/from16 v19, v0

    aget v7, v19, v15

    .line 1106
    .restart local v7    # "edgesTouched":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTrackingEdges:I

    move/from16 v19, v0

    and-int v19, v19, v7

    if-eqz v19, :cond_2f

    .line 1107
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTrackingEdges:I

    move/from16 v20, v0

    and-int v20, v20, v7

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v0, v1, v15}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->onEdgeTouched(II)V

    goto/16 :goto_2f

    .line 1109
    .end local v7    # "edgesTouched":I
    .end local v16    # "toCapture":Landroid/view/View;
    :cond_f5
    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v19, v0

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v20, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/sothree/slidinguppanel/ViewDragHelper;->isCapturedViewUnder(II)Z

    move-result v19

    if-eqz v19, :cond_2f

    .line 1114
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v15}, Lcom/sothree/slidinguppanel/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    goto/16 :goto_2f

    .line 1120
    .end local v15    # "pointerId":I
    .end local v17    # "x":F
    .end local v18    # "y":F
    :pswitch_11a
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_18e

    .line 1121
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    move/from16 v19, v0

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-static {v0, v1}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v12

    .line 1122
    .local v12, "index":I
    move-object/from16 v0, p1

    invoke-static {v0, v12}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v17

    .line 1123
    .restart local v17    # "x":F
    move-object/from16 v0, p1

    invoke-static {v0, v12}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v18

    .line 1124
    .restart local v18    # "y":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionX:[F

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    move/from16 v20, v0

    aget v19, v19, v20

    sub-float v19, v17, v19

    move/from16 v0, v19

    float-to-int v10, v0

    .line 1125
    .local v10, "idx":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mLastMotionY:[F

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    move/from16 v20, v0

    aget v19, v19, v20

    sub-float v19, v18, v19

    move/from16 v0, v19

    float-to-int v11, v0

    .line 1127
    .local v11, "idy":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/view/View;->getLeft()I

    move-result v19

    add-int v19, v19, v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Landroid/view/View;->getTop()I

    move-result v20

    add-int v20, v20, v11

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2, v10, v11}, Lcom/sothree/slidinguppanel/ViewDragHelper;->dragTo(IIII)V

    .line 1129
    invoke-direct/range {p0 .. p1}, Lcom/sothree/slidinguppanel/ViewDragHelper;->saveLastMotion(Landroid/view/MotionEvent;)V

    goto/16 :goto_2f

    .line 1132
    .end local v10    # "idx":I
    .end local v11    # "idy":I
    .end local v12    # "index":I
    .end local v17    # "x":F
    .end local v18    # "y":F
    :cond_18e
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getPointerCount(Landroid/view/MotionEvent;)I

    move-result v14

    .line 1133
    .local v14, "pointerCount":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_193
    if-ge v8, v14, :cond_1ce

    .line 1134
    move-object/from16 v0, p1

    invoke-static {v0, v8}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v15

    .line 1136
    .restart local v15    # "pointerId":I
    move-object/from16 v0, p1

    invoke-static {v0, v8}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v17

    .line 1137
    .restart local v17    # "x":F
    move-object/from16 v0, p1

    invoke-static {v0, v8}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v18

    .line 1138
    .restart local v18    # "y":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    move-object/from16 v19, v0

    aget v19, v19, v15

    sub-float v5, v17, v19

    .line 1139
    .local v5, "dx":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionY:[F

    move-object/from16 v19, v0

    aget v19, v19, v15

    sub-float v6, v18, v19

    .line 1141
    .local v6, "dy":F
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v6, v15}, Lcom/sothree/slidinguppanel/ViewDragHelper;->reportNewEdgeDrags(FFI)V

    .line 1142
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_1d3

    .line 1153
    .end local v5    # "dx":F
    .end local v6    # "dy":F
    .end local v15    # "pointerId":I
    .end local v17    # "x":F
    .end local v18    # "y":F
    :cond_1ce
    invoke-direct/range {p0 .. p1}, Lcom/sothree/slidinguppanel/ViewDragHelper;->saveLastMotion(Landroid/view/MotionEvent;)V

    goto/16 :goto_2f

    .line 1147
    .restart local v5    # "dx":F
    .restart local v6    # "dy":F
    .restart local v15    # "pointerId":I
    .restart local v17    # "x":F
    .restart local v18    # "y":F
    :cond_1d3
    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v19, v0

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v20, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/sothree/slidinguppanel/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v16

    .line 1148
    .restart local v16    # "toCapture":Landroid/view/View;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1, v5, v6}, Lcom/sothree/slidinguppanel/ViewDragHelper;->checkTouchSlop(Landroid/view/View;FF)Z

    move-result v19

    if-eqz v19, :cond_1fb

    .line 1149
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v15}, Lcom/sothree/slidinguppanel/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    move-result v19

    if-nez v19, :cond_1ce

    .line 1133
    :cond_1fb
    add-int/lit8 v8, v8, 0x1

    goto :goto_193

    .line 1159
    .end local v5    # "dx":F
    .end local v6    # "dy":F
    .end local v8    # "i":I
    .end local v14    # "pointerCount":I
    .end local v15    # "pointerId":I
    .end local v16    # "toCapture":Landroid/view/View;
    .end local v17    # "x":F
    .end local v18    # "y":F
    :pswitch_1fe
    move-object/from16 v0, p1

    invoke-static {v0, v4}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v15

    .line 1160
    .restart local v15    # "pointerId":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_280

    move-object/from16 v0, p0

    iget v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ne v15, v0, :cond_280

    .line 1162
    const/4 v13, -0x1

    .line 1163
    .local v13, "newActivePointer":I
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getPointerCount(Landroid/view/MotionEvent;)I

    move-result v14

    .line 1164
    .restart local v14    # "pointerCount":I
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_222
    if-ge v8, v14, :cond_277

    .line 1165
    move-object/from16 v0, p1

    invoke-static {v0, v8}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v9

    .line 1166
    .local v9, "id":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ne v9, v0, :cond_237

    .line 1164
    :cond_234
    add-int/lit8 v8, v8, 0x1

    goto :goto_222

    .line 1171
    :cond_237
    move-object/from16 v0, p1

    invoke-static {v0, v8}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v17

    .line 1172
    .restart local v17    # "x":F
    move-object/from16 v0, p1

    invoke-static {v0, v8}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v18

    .line 1173
    .restart local v18    # "y":F
    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v19, v0

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v20, v0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lcom/sothree/slidinguppanel/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_234

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    move-object/from16 v19, v0

    .line 1174
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v9}, Lcom/sothree/slidinguppanel/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    move-result v19

    if-eqz v19, :cond_234

    .line 1175
    move-object/from16 v0, p0

    iget v13, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    .line 1180
    .end local v9    # "id":I
    .end local v17    # "x":F
    .end local v18    # "y":F
    :cond_277
    const/16 v19, -0x1

    move/from16 v0, v19

    if-ne v13, v0, :cond_280

    .line 1182
    invoke-direct/range {p0 .. p0}, Lcom/sothree/slidinguppanel/ViewDragHelper;->releaseViewForPointerUp()V

    .line 1185
    .end local v8    # "i":I
    .end local v13    # "newActivePointer":I
    .end local v14    # "pointerCount":I
    :cond_280
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/sothree/slidinguppanel/ViewDragHelper;->clearMotionHistory(I)V

    goto/16 :goto_2f

    .line 1190
    .end local v15    # "pointerId":I
    :pswitch_287
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_298

    .line 1191
    invoke-direct/range {p0 .. p0}, Lcom/sothree/slidinguppanel/ViewDragHelper;->releaseViewForPointerUp()V

    .line 1193
    :cond_298
    invoke-virtual/range {p0 .. p0}, Lcom/sothree/slidinguppanel/ViewDragHelper;->cancel()V

    goto/16 :goto_2f

    .line 1198
    :pswitch_29d
    move-object/from16 v0, p0

    iget v0, v0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_2b8

    .line 1199
    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/sothree/slidinguppanel/ViewDragHelper;->dispatchViewReleased(FF)V

    .line 1201
    :cond_2b8
    invoke-virtual/range {p0 .. p0}, Lcom/sothree/slidinguppanel/ViewDragHelper;->cancel()V

    goto/16 :goto_2f

    .line 1070
    nop

    :pswitch_data_2be
    .packed-switch 0x0
        :pswitch_30
        :pswitch_287
        :pswitch_11a
        :pswitch_29d
        :pswitch_2f
        :pswitch_8e
        :pswitch_1fe
    .end packed-switch
.end method

.method setDragState(I)V
    .registers 3
    .param p1, "state"    # I

    .prologue
    .line 871
    iget v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    if-eq v0, p1, :cond_10

    .line 872
    iput p1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    .line 873
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    invoke-virtual {v0, p1}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->onViewDragStateChanged(I)V

    .line 874
    if-nez p1, :cond_10

    .line 875
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    .line 878
    :cond_10
    return-void
.end method

.method public setMinVelocity(F)V
    .registers 2
    .param p1, "minVel"    # F

    .prologue
    .line 402
    iput p1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mMinVelocity:F

    .line 403
    return-void
.end method

.method public settleCapturedViewAt(II)Z
    .registers 6
    .param p1, "finalLeft"    # I
    .param p2, "finalTop"    # I

    .prologue
    .line 558
    iget-boolean v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mReleaseInProgress:Z

    if-nez v0, :cond_c

    .line 559
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot settleCapturedViewAt outside of a call to Callback#onViewReleased"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 563
    :cond_c
    iget-object v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    .line 564
    invoke-static {v0, v1}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v0

    float-to-int v0, v0

    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    .line 565
    invoke-static {v1, v2}, Landroid/support/v4/view/VelocityTrackerCompat;->getYVelocity(Landroid/view/VelocityTracker;I)F

    move-result v1

    float-to-int v1, v1

    .line 563
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/sothree/slidinguppanel/ViewDragHelper;->forceSettleCapturedViewAt(IIII)Z

    move-result v0

    return v0
.end method

.method public shouldInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 15
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 946
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    .line 947
    .local v0, "action":I
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v1

    .line 949
    .local v1, "actionIndex":I
    if-nez v0, :cond_d

    .line 952
    invoke-virtual {p0}, Lcom/sothree/slidinguppanel/ViewDragHelper;->cancel()V

    .line 955
    :cond_d
    iget-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v11, :cond_17

    .line 956
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v11

    iput-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 958
    :cond_17
    iget-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v11, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 960
    packed-switch v0, :pswitch_data_102

    .line 1046
    :cond_1f
    :goto_1f
    :pswitch_1f
    iget v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    const/4 v12, 0x1

    if-ne v11, v12, :cond_fe

    const/4 v11, 0x1

    :goto_25
    return v11

    .line 962
    :pswitch_26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v9

    .line 963
    .local v9, "x":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v10

    .line 964
    .local v10, "y":F
    const/4 v11, 0x0

    invoke-static {p1, v11}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v7

    .line 965
    .local v7, "pointerId":I
    invoke-direct {p0, v9, v10, v7}, Lcom/sothree/slidinguppanel/ViewDragHelper;->saveInitialMotion(FFI)V

    .line 967
    float-to-int v11, v9

    float-to-int v12, v10

    invoke-virtual {p0, v11, v12}, Lcom/sothree/slidinguppanel/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v8

    .line 970
    .local v8, "toCapture":Landroid/view/View;
    iget-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    if-ne v8, v11, :cond_48

    iget v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    const/4 v12, 0x2

    if-ne v11, v12, :cond_48

    .line 971
    invoke-virtual {p0, v8, v7}, Lcom/sothree/slidinguppanel/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    .line 974
    :cond_48
    iget-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialEdgesTouched:[I

    aget v4, v11, v7

    .line 975
    .local v4, "edgesTouched":I
    iget v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTrackingEdges:I

    and-int/2addr v11, v4

    if-eqz v11, :cond_1f

    .line 976
    iget-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    iget v12, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTrackingEdges:I

    and-int/2addr v12, v4

    invoke-virtual {v11, v12, v7}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->onEdgeTouched(II)V

    goto :goto_1f

    .line 982
    .end local v4    # "edgesTouched":I
    .end local v7    # "pointerId":I
    .end local v8    # "toCapture":Landroid/view/View;
    .end local v9    # "x":F
    .end local v10    # "y":F
    :pswitch_5a
    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v7

    .line 983
    .restart local v7    # "pointerId":I
    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v9

    .line 984
    .restart local v9    # "x":F
    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v10

    .line 986
    .restart local v10    # "y":F
    invoke-direct {p0, v9, v10, v7}, Lcom/sothree/slidinguppanel/ViewDragHelper;->saveInitialMotion(FFI)V

    .line 989
    iget v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    if-nez v11, :cond_7f

    .line 990
    iget-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialEdgesTouched:[I

    aget v4, v11, v7

    .line 991
    .restart local v4    # "edgesTouched":I
    iget v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTrackingEdges:I

    and-int/2addr v11, v4

    if-eqz v11, :cond_1f

    .line 992
    iget-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    iget v12, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mTrackingEdges:I

    and-int/2addr v12, v4

    invoke-virtual {v11, v12, v7}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->onEdgeTouched(II)V

    goto :goto_1f

    .line 994
    .end local v4    # "edgesTouched":I
    :cond_7f
    iget v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    const/4 v12, 0x2

    if-ne v11, v12, :cond_1f

    .line 996
    float-to-int v11, v9

    float-to-int v12, v10

    invoke-virtual {p0, v11, v12}, Lcom/sothree/slidinguppanel/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v8

    .line 997
    .restart local v8    # "toCapture":Landroid/view/View;
    iget-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    if-ne v8, v11, :cond_1f

    .line 998
    invoke-virtual {p0, v8, v7}, Lcom/sothree/slidinguppanel/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    goto :goto_1f

    .line 1006
    .end local v7    # "pointerId":I
    .end local v8    # "toCapture":Landroid/view/View;
    .end local v9    # "x":F
    .end local v10    # "y":F
    :pswitch_92
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getPointerCount(Landroid/view/MotionEvent;)I

    move-result v6

    .line 1007
    .local v6, "pointerCount":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_97
    if-ge v5, v6, :cond_ce

    iget-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    if-eqz v11, :cond_ce

    iget-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionY:[F

    if-eqz v11, :cond_ce

    .line 1008
    invoke-static {p1, v5}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v7

    .line 1009
    .restart local v7    # "pointerId":I
    iget-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    array-length v11, v11

    if-ge v7, v11, :cond_af

    iget-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionY:[F

    array-length v11, v11

    if-lt v7, v11, :cond_b2

    .line 1007
    :cond_af
    add-int/lit8 v5, v5, 0x1

    goto :goto_97

    .line 1012
    :cond_b2
    invoke-static {p1, v5}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v9

    .line 1013
    .restart local v9    # "x":F
    invoke-static {p1, v5}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v10

    .line 1014
    .restart local v10    # "y":F
    iget-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    aget v11, v11, v7

    sub-float v2, v9, v11

    .line 1015
    .local v2, "dx":F
    iget-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionY:[F

    aget v11, v11, v7

    sub-float v3, v10, v11

    .line 1017
    .local v3, "dy":F
    invoke-direct {p0, v2, v3, v7}, Lcom/sothree/slidinguppanel/ViewDragHelper;->reportNewEdgeDrags(FFI)V

    .line 1018
    iget v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mDragState:I

    const/4 v12, 0x1

    if-ne v11, v12, :cond_d3

    .line 1029
    .end local v2    # "dx":F
    .end local v3    # "dy":F
    .end local v7    # "pointerId":I
    .end local v9    # "x":F
    .end local v10    # "y":F
    :cond_ce
    :goto_ce
    invoke-direct {p0, p1}, Lcom/sothree/slidinguppanel/ViewDragHelper;->saveLastMotion(Landroid/view/MotionEvent;)V

    goto/16 :goto_1f

    .line 1023
    .restart local v2    # "dx":F
    .restart local v3    # "dy":F
    .restart local v7    # "pointerId":I
    .restart local v9    # "x":F
    .restart local v10    # "y":F
    :cond_d3
    iget-object v11, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionX:[F

    aget v11, v11, v7

    float-to-int v11, v11

    iget-object v12, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mInitialMotionY:[F

    aget v12, v12, v7

    float-to-int v12, v12

    invoke-virtual {p0, v11, v12}, Lcom/sothree/slidinguppanel/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v8

    .line 1024
    .restart local v8    # "toCapture":Landroid/view/View;
    if-eqz v8, :cond_af

    invoke-direct {p0, v8, v2, v3}, Lcom/sothree/slidinguppanel/ViewDragHelper;->checkTouchSlop(Landroid/view/View;FF)Z

    move-result v11

    if-eqz v11, :cond_af

    .line 1025
    invoke-virtual {p0, v8, v7}, Lcom/sothree/slidinguppanel/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    move-result v11

    if-eqz v11, :cond_af

    goto :goto_ce

    .line 1034
    .end local v2    # "dx":F
    .end local v3    # "dy":F
    .end local v5    # "i":I
    .end local v6    # "pointerCount":I
    .end local v7    # "pointerId":I
    .end local v8    # "toCapture":Landroid/view/View;
    .end local v9    # "x":F
    .end local v10    # "y":F
    :pswitch_f0
    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v7

    .line 1035
    .restart local v7    # "pointerId":I
    invoke-direct {p0, v7}, Lcom/sothree/slidinguppanel/ViewDragHelper;->clearMotionHistory(I)V

    goto/16 :goto_1f

    .line 1041
    .end local v7    # "pointerId":I
    :pswitch_f9
    invoke-virtual {p0}, Lcom/sothree/slidinguppanel/ViewDragHelper;->cancel()V

    goto/16 :goto_1f

    .line 1046
    :cond_fe
    const/4 v11, 0x0

    goto/16 :goto_25

    .line 960
    nop

    :pswitch_data_102
    .packed-switch 0x0
        :pswitch_26
        :pswitch_f9
        :pswitch_92
        :pswitch_f9
        :pswitch_1f
        :pswitch_5a
        :pswitch_f0
    .end packed-switch
.end method

.method public smoothSlideViewTo(Landroid/view/View;II)Z
    .registers 6
    .param p1, "child"    # Landroid/view/View;
    .param p2, "finalLeft"    # I
    .param p3, "finalTop"    # I

    .prologue
    const/4 v1, 0x0

    .line 540
    iput-object p1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    .line 541
    const/4 v0, -0x1

    iput v0, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    .line 543
    invoke-direct {p0, p2, p3, v1, v1}, Lcom/sothree/slidinguppanel/ViewDragHelper;->forceSettleCapturedViewAt(IIII)Z

    move-result v0

    return v0
.end method

.method tryCaptureViewForDrag(Landroid/view/View;I)Z
    .registers 5
    .param p1, "toCapture"    # Landroid/view/View;
    .param p2, "pointerId"    # I

    .prologue
    const/4 v0, 0x1

    .line 890
    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCapturedView:Landroid/view/View;

    if-ne p1, v1, :cond_a

    iget v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    if-ne v1, p2, :cond_a

    .line 899
    :goto_9
    return v0

    .line 894
    :cond_a
    if-eqz p1, :cond_1a

    iget-object v1, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mCallback:Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;

    invoke-virtual {v1, p1, p2}, Lcom/sothree/slidinguppanel/ViewDragHelper$Callback;->tryCaptureView(Landroid/view/View;I)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 895
    iput p2, p0, Lcom/sothree/slidinguppanel/ViewDragHelper;->mActivePointerId:I

    .line 896
    invoke-virtual {p0, p1, p2}, Lcom/sothree/slidinguppanel/ViewDragHelper;->captureChildView(Landroid/view/View;I)V

    goto :goto_9

    .line 899
    :cond_1a
    const/4 v0, 0x0

    goto :goto_9
.end method
