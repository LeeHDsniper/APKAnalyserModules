.class Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "CropImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/CropImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CropGestureListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    .prologue
    .line 377
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .registers 9
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 458
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mDoubleTapEnabled:Z
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$700(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Z

    move-result v0

    if-eqz v0, :cond_4b

    .line 459
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    const/4 v2, 0x0

    # setter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$102(Lcom/adobe/creativesdk/aviary/widget/CropImageView;Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .line 461
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getScale()F

    move-result v6

    .line 462
    .local v6, "scale":F
    move v1, v6

    .line 463
    .local v1, "targetScale":F
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getMaxScale()F

    move-result v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getMinScale()F

    move-result v3

    # invokes: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->onDoubleTapPost(FFF)F
    invoke-static {v0, v6, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$800(Lcom/adobe/creativesdk/aviary/widget/CropImageView;FFF)F

    move-result v1

    .line 464
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->getMaxScale()F

    move-result v0

    const/high16 v2, 0x3f800000

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 465
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    const-wide/16 v4, 0xc8

    # invokes: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->zoomTo(FFFJ)V
    invoke-static/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$900(Lcom/adobe/creativesdk/aviary/widget/CropImageView;FFFJ)V

    .line 466
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->invalidate()V

    .line 468
    .end local v1    # "targetScale":F
    .end local v6    # "scale":F
    :cond_4b
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDoubleTap(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 6
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 438
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    const/4 v3, 0x0

    # setter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$102(Lcom/adobe/creativesdk/aviary/widget/CropImageView;Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .line 439
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$000(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v1

    .line 441
    .local v1, "hv":Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    if-eqz v1, :cond_3b

    .line 443
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getHit(FF)I

    move-result v0

    .line 444
    .local v0, "edge":I
    const/4 v2, 0x1

    if-eq v0, v2, :cond_3b

    .line 445
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # setter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionEdge:I
    invoke-static {v2, v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$202(Lcom/adobe/creativesdk/aviary/widget/CropImageView;I)I

    .line 446
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # setter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v2, v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$102(Lcom/adobe/creativesdk/aviary/widget/CropImageView;Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .line 447
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$100(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v3

    const/16 v2, 0x20

    if-ne v0, v2, :cond_40

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;->Move:Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;

    :goto_33
    invoke-virtual {v3, v2, v0}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->setMode(Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;I)V

    .line 450
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->postInvalidate()V

    .line 453
    .end local v0    # "edge":I
    :cond_3b
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onDown(Landroid/view/MotionEvent;)Z

    move-result v2

    return v2

    .line 447
    .restart local v0    # "edge":I
    :cond_40
    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;->Grow:Lcom/adobe/creativesdk/aviary/widget/HighlightView$Mode;

    goto :goto_33
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 8
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    const/4 v2, 0x1

    const/4 v0, 0x0

    .line 423
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    if-gt v1, v2, :cond_e

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    if-le v1, v2, :cond_f

    .line 433
    :cond_e
    :goto_e
    return v0

    .line 426
    :cond_f
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mScaleDetector:Landroid/view/ScaleGestureDetector;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$600(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Landroid/view/ScaleGestureDetector;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v1

    if-nez v1, :cond_e

    .line 429
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$100(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v1

    if-nez v1, :cond_e

    .line 433
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v0

    goto :goto_e
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 10
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 393
    if-eqz p1, :cond_6

    if-nez p2, :cond_7

    .line 417
    :cond_6
    :goto_6
    return v0

    .line 396
    :cond_7
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    if-gt v2, v1, :cond_6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    if-gt v2, v1, :cond_6

    .line 399
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mScaleDetector:Landroid/view/ScaleGestureDetector;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$400(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Landroid/view/ScaleGestureDetector;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v2

    if-nez v2, :cond_6

    .line 403
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$100(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v0

    if-eqz v0, :cond_6c

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionEdge:I
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$200(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)I

    move-result v0

    if-eq v0, v1, :cond_6c

    .line 404
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$100(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v0

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionEdge:I
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$200(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)I

    move-result v2

    neg-float v3, p3

    neg-float v4, p4

    invoke-virtual {v0, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->handleMotion(IFF)V

    .line 406
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionEdge:I
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$200(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)I

    move-result v0

    const/16 v2, 0x20

    if-ne v0, v2, :cond_66

    .line 407
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$100(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/HighlightView;->getInvalidateRect()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->invalidate(Landroid/graphics/Rect;)V

    .line 412
    :goto_59
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$100(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v2

    # invokes: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->ensureVisible(Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Z
    invoke-static {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$500(Lcom/adobe/creativesdk/aviary/widget/CropImageView;Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Z

    move v0, v1

    .line 413
    goto :goto_6

    .line 409
    :cond_66
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->postInvalidate()V

    goto :goto_59

    .line 415
    :cond_6c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    neg-float v2, p3

    neg-float v3, p4

    invoke-virtual {v0, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->scrollBy(FF)V

    .line 416
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->invalidate()V

    move v0, v1

    .line 417
    goto :goto_6
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 473
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$102(Lcom/adobe/creativesdk/aviary/widget/CropImageView;Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .line 475
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onSingleTapConfirmed(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 380
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$102(Lcom/adobe/creativesdk/aviary/widget/CropImageView;Lcom/adobe/creativesdk/aviary/widget/HighlightView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    .line 382
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightView:Lcom/adobe/creativesdk/aviary/widget/HighlightView;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$000(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/HighlightView;

    move-result-object v0

    if-eqz v0, :cond_29

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mMotionEdge:I
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$200(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)I

    move-result v0

    const/16 v1, 0x20

    if-ne v0, v1, :cond_29

    .line 384
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightSingleTapUpListener:Lcom/adobe/creativesdk/aviary/widget/CropImageView$OnHighlightSingleTapUpConfirmedListener;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$300(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/CropImageView$OnHighlightSingleTapUpConfirmedListener;

    move-result-object v0

    if-eqz v0, :cond_29

    .line 385
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/CropImageView$CropGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/CropImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/CropImageView;->mHighlightSingleTapUpListener:Lcom/adobe/creativesdk/aviary/widget/CropImageView$OnHighlightSingleTapUpConfirmedListener;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView;->access$300(Lcom/adobe/creativesdk/aviary/widget/CropImageView;)Lcom/adobe/creativesdk/aviary/widget/CropImageView$OnHighlightSingleTapUpConfirmedListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/widget/CropImageView$OnHighlightSingleTapUpConfirmedListener;->onSingleTapUpConfirmed()V

    .line 388
    :cond_29
    invoke-super {p0, p1}, Landroid/view/GestureDetector$SimpleOnGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
