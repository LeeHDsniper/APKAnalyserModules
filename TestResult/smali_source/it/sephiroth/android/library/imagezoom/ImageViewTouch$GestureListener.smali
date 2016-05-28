.class public Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "ImageViewTouch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/imagezoom/ImageViewTouch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GestureListener"
.end annotation


# instance fields
.field final synthetic this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;


# direct methods
.method public constructor <init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;)V
    .registers 2
    .param p1, "this$0"    # Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .prologue
    .line 282
    iput-object p1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .registers 9
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v0, 0x1

    .line 295
    sget-boolean v2, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v2, :cond_21

    .line 296
    const-string v2, "ImageViewTouchBase"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onDoubleTap. double tap enabled? "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-boolean v4, v4, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mDoubleTapEnabled:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    :cond_21
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-boolean v2, v2, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mDoubleTapEnabled:Z

    if-eqz v2, :cond_7a

    .line 299
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x13

    if-lt v2, v3, :cond_38

    .line 300
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v2, v2, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v2}, Landroid/view/ScaleGestureDetector;->isQuickScaleEnabled()Z

    move-result v2

    if-eqz v2, :cond_38

    .line 319
    :goto_37
    return v0

    .line 305
    :cond_38
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iput-boolean v0, v2, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mUserScaled:Z

    .line 307
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getScale()F

    move-result v6

    .line 309
    .local v6, "scale":F
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getMaxScale()F

    move-result v2

    iget-object v3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getMinScale()F

    move-result v3

    invoke-virtual {v0, v6, v2, v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDoubleTapPost(FFF)F

    move-result v1

    .line 310
    .local v1, "targetScale":F
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getMaxScale()F

    move-result v0

    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getMinScale()F

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 311
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iget-object v4, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget v4, v4, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mDefaultAnimationDuration:I

    int-to-long v4, v4

    invoke-virtual/range {v0 .. v5}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->zoomTo(FFFJ)V

    .line 315
    .end local v1    # "targetScale":F
    .end local v6    # "scale":F
    :cond_7a
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    # getter for: Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mDoubleTapListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchDoubleTapListener;
    invoke-static {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->access$100(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;)Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchDoubleTapListener;

    move-result-object v0

    if-eqz v0, :cond_8b

    .line 316
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    # getter for: Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mDoubleTapListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchDoubleTapListener;
    invoke-static {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->access$100(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;)Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchDoubleTapListener;

    move-result-object v0

    invoke-interface {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchDoubleTapListener;->onDoubleTap()V

    .line 319
    :cond_8b
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDoubleTap(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_37
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 382
    sget-boolean v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->DEBUG:Z

    if-eqz v0, :cond_b

    .line 383
    const-string v0, "ImageViewTouchBase"

    const-string v1, "onDown"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 385
    :cond_b
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->stopAllAnimations()V

    .line 387
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onDown(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 13
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    const/4 v4, 0x1

    const/4 v2, 0x0

    .line 351
    iget-object v3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-boolean v3, v3, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScrollEnabled:Z

    if-nez v3, :cond_9

    .line 371
    :cond_8
    :goto_8
    return v2

    .line 354
    :cond_9
    if-eqz p1, :cond_8

    if-eqz p2, :cond_8

    .line 357
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-gt v3, v4, :cond_8

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    if-gt v3, v4, :cond_8

    .line 360
    iget-object v3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v3, v3, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v3}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v3

    if-nez v3, :cond_8

    .line 364
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-object v3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-wide v6, v3, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mPointerUpTime:J

    sub-long v0, v4, v6

    .line 368
    .local v0, "delta":J
    sget-wide v4, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->MIN_FLING_DELTA_TIME:J

    cmp-long v3, v0, v4

    if-lez v3, :cond_8

    .line 369
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v2, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v2

    goto :goto_8
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 324
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->isLongClickable()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 325
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v0, v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v0

    if-nez v0, :cond_1d

    .line 326
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setPressed(Z)V

    .line 327
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->performLongClick()Z

    .line 330
    :cond_1d
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 8
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    const/4 v2, 0x1

    const/4 v0, 0x0

    .line 334
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-boolean v1, v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScrollEnabled:Z

    if-nez v1, :cond_9

    .line 346
    :cond_8
    :goto_8
    return v0

    .line 337
    :cond_9
    if-eqz p1, :cond_8

    if-eqz p2, :cond_8

    .line 340
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    if-gt v1, v2, :cond_8

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    if-gt v1, v2, :cond_8

    .line 343
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v1, v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v1}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v1

    if-nez v1, :cond_8

    .line 346
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0, p1, p2, p3, p4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v0

    goto :goto_8
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 286
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    # getter for: Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mSingleTapListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchSingleTapListener;
    invoke-static {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->access$000(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;)Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchSingleTapListener;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 287
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    # getter for: Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mSingleTapListener:Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchSingleTapListener;
    invoke-static {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->access$000(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;)Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchSingleTapListener;

    move-result-object v0

    invoke-interface {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$OnImageViewTouchSingleTapListener;->onSingleTapConfirmed()V

    .line 290
    :cond_11
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 377
    iget-object v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$GestureListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
