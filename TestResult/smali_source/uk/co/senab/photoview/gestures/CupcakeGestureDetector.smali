.class public Luk/co/senab/photoview/gestures/CupcakeGestureDetector;
.super Ljava/lang/Object;
.source "CupcakeGestureDetector.java"

# interfaces
.implements Luk/co/senab/photoview/gestures/GestureDetector;


# instance fields
.field private mIsDragging:Z

.field mLastTouchX:F

.field mLastTouchY:F

.field protected mListener:Luk/co/senab/photoview/gestures/OnGestureListener;

.field final mMinimumVelocity:F

.field final mTouchSlop:F

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 42
    .local v0, "configuration":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mMinimumVelocity:F

    .line 43
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mTouchSlop:F

    .line 44
    return-void
.end method


# virtual methods
.method getActiveX(Landroid/view/MotionEvent;)F
    .registers 3
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 50
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    return v0
.end method

.method getActiveY(Landroid/view/MotionEvent;)F
    .registers 3
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 54
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    return v0
.end method

.method public isScaling()Z
    .registers 2

    .prologue
    .line 58
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

    .line 63
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v8

    packed-switch v8, :pswitch_data_d0

    .line 141
    :cond_a
    :goto_a
    return v7

    .line 65
    :pswitch_b
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v8

    iput-object v8, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 66
    iget-object v8, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v8, :cond_29

    .line 67
    iget-object v8, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v8, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 72
    :goto_1a
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v8

    iput v8, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mLastTouchX:F

    .line 73
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v8

    iput v8, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mLastTouchY:F

    .line 74
    iput-boolean v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mIsDragging:Z

    goto :goto_a

    .line 69
    :cond_29
    const-string v8, "CupcakeGestureDetector"

    const-string v9, "Velocity tracker is null"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1a

    .line 79
    :pswitch_31
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v4

    .line 80
    .local v4, "x":F
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v5

    .line 81
    .local v5, "y":F
    iget v8, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mLastTouchX:F

    sub-float v0, v4, v8

    .local v0, "dx":F
    iget v8, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mLastTouchY:F

    sub-float v1, v5, v8

    .line 83
    .local v1, "dy":F
    iget-boolean v8, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mIsDragging:Z

    if-nez v8, :cond_57

    .line 86
    mul-float v8, v0, v0

    mul-float v9, v1, v1

    add-float/2addr v8, v9

    invoke-static {v8}, Landroid/util/FloatMath;->sqrt(F)F

    move-result v8

    iget v9, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mTouchSlop:F

    cmpl-float v8, v8, v9

    if-ltz v8, :cond_55

    move v6, v7

    :cond_55
    iput-boolean v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mIsDragging:Z

    .line 89
    :cond_57
    iget-boolean v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mIsDragging:Z

    if-eqz v6, :cond_a

    .line 90
    iget-object v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mListener:Luk/co/senab/photoview/gestures/OnGestureListener;

    invoke-interface {v6, v0, v1}, Luk/co/senab/photoview/gestures/OnGestureListener;->onDrag(FF)V

    .line 91
    iput v4, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mLastTouchX:F

    .line 92
    iput v5, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mLastTouchY:F

    .line 94
    iget-object v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v6, :cond_a

    .line 95
    iget-object v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    goto :goto_a

    .line 103
    .end local v0    # "dx":F
    .end local v1    # "dy":F
    .end local v4    # "x":F
    .end local v5    # "y":F
    :pswitch_6e
    iget-object v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v6, :cond_a

    .line 104
    iget-object v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->recycle()V

    .line 105
    iput-object v12, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    goto :goto_a

    .line 111
    :pswitch_7a
    iget-boolean v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mIsDragging:Z

    if-eqz v6, :cond_c3

    .line 112
    iget-object v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v6, :cond_c3

    .line 113
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v6

    iput v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mLastTouchX:F

    .line 114
    invoke-virtual {p0, p1}, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v6

    iput v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mLastTouchY:F

    .line 117
    iget-object v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 118
    iget-object v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v8, 0x3e8

    invoke-virtual {v6, v8}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 120
    iget-object v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v2

    .local v2, "vX":F
    iget-object v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 121
    invoke-virtual {v6}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v3

    .line 125
    .local v3, "vY":F
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v6

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v8

    invoke-static {v6, v8}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iget v8, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mMinimumVelocity:F

    cmpl-float v6, v6, v8

    if-ltz v6, :cond_c3

    .line 126
    iget-object v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mListener:Luk/co/senab/photoview/gestures/OnGestureListener;

    iget v8, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mLastTouchX:F

    iget v9, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mLastTouchY:F

    neg-float v10, v2

    .line 127
    neg-float v11, v3

    .line 126
    invoke-interface {v6, v8, v9, v10, v11}, Luk/co/senab/photoview/gestures/OnGestureListener;->onFling(FFFF)V

    .line 133
    .end local v2    # "vX":F
    .end local v3    # "vY":F
    :cond_c3
    iget-object v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v6, :cond_a

    .line 134
    iget-object v6, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->recycle()V

    .line 135
    iput-object v12, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    goto/16 :goto_a

    .line 63
    :pswitch_data_d0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_7a
        :pswitch_31
        :pswitch_6e
    .end packed-switch
.end method

.method public setOnGestureListener(Luk/co/senab/photoview/gestures/OnGestureListener;)V
    .registers 2
    .param p1, "listener"    # Luk/co/senab/photoview/gestures/OnGestureListener;

    .prologue
    .line 36
    iput-object p1, p0, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->mListener:Luk/co/senab/photoview/gestures/OnGestureListener;

    .line 37
    return-void
.end method
