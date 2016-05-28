.class Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;
.super Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;
.source "VersionedGestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CupcakeDetector"
.end annotation


# instance fields
.field private mIsDragging:Z

.field mLastTouchX:F

.field mLastTouchY:F

.field final mMinimumVelocity:F

.field final mTouchSlop:F

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector;-><init>()V

    .line 70
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 71
    .local v0, "configuration":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mMinimumVelocity:F

    .line 72
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mTouchSlop:F

    .line 73
    return-void
.end method


# virtual methods
.method getActiveX(Landroid/view/MotionEvent;)F
    .registers 3
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 79
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    return v0
.end method

.method getActiveY(Landroid/view/MotionEvent;)F
    .registers 3
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 83
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    return v0
.end method

.method public isScaling()Z
    .registers 2

    .prologue
    .line 87
    const/4 v0, 0x0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 15
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v12, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 92
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v8

    packed-switch v8, :pswitch_data_c4

    .line 164
    :cond_a
    :goto_a
    return v7

    .line 94
    :pswitch_b
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v8

    iput-object v8, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 95
    iget-object v8, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v8, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 97
    invoke-virtual {p0, p1}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v8

    iput v8, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mLastTouchX:F

    .line 98
    invoke-virtual {p0, p1}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v8

    iput v8, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mLastTouchY:F

    .line 99
    iput-boolean v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mIsDragging:Z

    goto :goto_a

    .line 104
    :pswitch_25
    invoke-virtual {p0, p1}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v4

    .line 105
    .local v4, "x":F
    invoke-virtual {p0, p1}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v5

    .line 106
    .local v5, "y":F
    iget v8, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mLastTouchX:F

    sub-float v0, v4, v8

    .local v0, "dx":F
    iget v8, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mLastTouchY:F

    sub-float v1, v5, v8

    .line 108
    .local v1, "dy":F
    iget-boolean v8, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mIsDragging:Z

    if-nez v8, :cond_4b

    .line 111
    mul-float v8, v0, v0

    mul-float v9, v1, v1

    add-float/2addr v8, v9

    invoke-static {v8}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v8

    iget v9, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mTouchSlop:F

    cmpl-float v8, v8, v9

    if-ltz v8, :cond_49

    move v6, v7

    :cond_49
    iput-boolean v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mIsDragging:Z

    .line 114
    :cond_4b
    iget-boolean v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mIsDragging:Z

    if-eqz v6, :cond_a

    .line 115
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mListener:Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$OnGestureListener;

    invoke-interface {v6, v0, v1}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$OnGestureListener;->onDrag(FF)V

    .line 116
    iput v4, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mLastTouchX:F

    .line 117
    iput v5, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mLastTouchY:F

    .line 119
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v6, :cond_a

    .line 120
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    goto :goto_a

    .line 128
    .end local v0    # "dx":F
    .end local v1    # "dy":F
    .end local v4    # "x":F
    .end local v5    # "y":F
    :pswitch_62
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v6, :cond_a

    .line 129
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->recycle()V

    .line 130
    iput-object v12, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    goto :goto_a

    .line 136
    :pswitch_6e
    iget-boolean v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mIsDragging:Z

    if-eqz v6, :cond_b7

    .line 137
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v6, :cond_b7

    .line 138
    invoke-virtual {p0, p1}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v6

    iput v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mLastTouchX:F

    .line 139
    invoke-virtual {p0, p1}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v6

    iput v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mLastTouchY:F

    .line 142
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 143
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v8, 0x3e8

    invoke-virtual {v6, v8}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 145
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v2

    .local v2, "vX":F
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v3

    .line 149
    .local v3, "vY":F
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v6

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v8

    invoke-static {v6, v8}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iget v8, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mMinimumVelocity:F

    cmpl-float v6, v6, v8

    if-ltz v6, :cond_b7

    .line 150
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mListener:Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$OnGestureListener;

    iget v8, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mLastTouchX:F

    iget v9, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mLastTouchY:F

    neg-float v10, v2

    neg-float v11, v3

    invoke-interface {v6, v8, v9, v10, v11}, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$OnGestureListener;->onFling(FFFF)V

    .line 156
    .end local v2    # "vX":F
    .end local v3    # "vY":F
    :cond_b7
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v6, :cond_a

    .line 157
    iget-object v6, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->recycle()V

    .line 158
    iput-object v12, p0, Lcom/behance/sdk/senab/photoview/VersionedGestureDetector$CupcakeDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    goto/16 :goto_a

    .line 92
    :pswitch_data_c4
    .packed-switch 0x0
        :pswitch_b
        :pswitch_6e
        :pswitch_25
        :pswitch_62
    .end packed-switch
.end method
