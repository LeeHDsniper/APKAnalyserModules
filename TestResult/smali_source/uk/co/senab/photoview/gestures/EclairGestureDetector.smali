.class public Luk/co/senab/photoview/gestures/EclairGestureDetector;
.super Luk/co/senab/photoview/gestures/CupcakeGestureDetector;
.source "EclairGestureDetector.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x5
.end annotation


# instance fields
.field private mActivePointerId:I

.field private mActivePointerIndex:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;-><init>(Landroid/content/Context;)V

    .line 28
    const/4 v0, -0x1

    iput v0, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerId:I

    .line 29
    const/4 v0, 0x0

    iput v0, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerIndex:I

    .line 33
    return-void
.end method


# virtual methods
.method getActiveX(Landroid/view/MotionEvent;)F
    .registers 4
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 38
    :try_start_0
    iget v1, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerIndex:I

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 40
    :goto_6
    return v1

    .line 39
    :catch_7
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    goto :goto_6
.end method

.method getActiveY(Landroid/view/MotionEvent;)F
    .registers 4
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 47
    :try_start_0
    iget v1, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerIndex:I

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 49
    :goto_6
    return v1

    .line 48
    :catch_7
    move-exception v0

    .line 49
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    goto :goto_6
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 9
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v6, -0x1

    const/4 v4, 0x0

    .line 55
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 56
    .local v0, "action":I
    and-int/lit16 v5, v0, 0xff

    packed-switch v5, :pswitch_data_4e

    .line 82
    :cond_b
    :goto_b
    :pswitch_b
    iget v5, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerId:I

    if-eq v5, v6, :cond_11

    iget v4, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerId:I

    :cond_11
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v4

    .line 81
    iput v4, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerIndex:I

    .line 84
    invoke-super {p0, p1}, Luk/co/senab/photoview/gestures/CupcakeGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v4

    return v4

    .line 58
    :pswitch_1c
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iput v5, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerId:I

    goto :goto_b

    .line 62
    :pswitch_23
    iput v6, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerId:I

    goto :goto_b

    .line 68
    :pswitch_26
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v5

    invoke-static {v5}, Luk/co/senab/photoview/Compat;->getPointerIndex(I)I

    move-result v3

    .line 69
    .local v3, "pointerIndex":I
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    .line 70
    .local v2, "pointerId":I
    iget v5, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerId:I

    if-ne v2, v5, :cond_b

    .line 73
    if-nez v3, :cond_4c

    const/4 v1, 0x1

    .line 74
    .local v1, "newPointerIndex":I
    :goto_39
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iput v5, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mActivePointerId:I

    .line 75
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v5

    iput v5, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mLastTouchX:F

    .line 76
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    iput v5, p0, Luk/co/senab/photoview/gestures/EclairGestureDetector;->mLastTouchY:F

    goto :goto_b

    .end local v1    # "newPointerIndex":I
    :cond_4c
    move v1, v4

    .line 73
    goto :goto_39

    .line 56
    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_23
        :pswitch_b
        :pswitch_23
        :pswitch_b
        :pswitch_b
        :pswitch_26
    .end packed-switch
.end method
