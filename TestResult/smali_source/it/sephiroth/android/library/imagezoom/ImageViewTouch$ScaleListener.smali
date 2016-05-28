.class public Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;
.source "ImageViewTouch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/imagezoom/ImageViewTouch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ScaleListener"
.end annotation


# instance fields
.field protected mScaled:Z

.field final synthetic this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;


# direct methods
.method public constructor <init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;)V
    .registers 3
    .param p1, "this$0"    # Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .prologue
    .line 391
    iput-object p1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    .line 392
    const/4 v0, 0x0

    iput-boolean v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->mScaled:Z

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .registers 8
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    const/4 v5, 0x1

    .line 396
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpan()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getPreviousSpan()F

    move-result v3

    sub-float v0, v2, v3

    .line 397
    .local v0, "span":F
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getScale()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v3

    mul-float v1, v2, v3

    .line 399
    .local v1, "targetScale":F
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-boolean v2, v2, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mScaleEnabled:Z

    if-eqz v2, :cond_58

    .line 400
    iget-boolean v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->mScaled:Z

    if-eqz v2, :cond_59

    const/4 v2, 0x0

    cmpl-float v2, v0, v2

    if-eqz v2, :cond_59

    .line 401
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iput-boolean v5, v2, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mUserScaled:Z

    .line 402
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getMaxScale()F

    move-result v2

    iget-object v3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getMinScale()F

    move-result v3

    const v4, 0x3dcccccd

    sub-float/2addr v3, v4

    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    .line 403
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v4

    invoke-virtual {v2, v1, v3, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->zoomTo(FFF)V

    .line 404
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iput v5, v2, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->mDoubleTapDirection:I

    .line 405
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate()V

    .line 415
    :cond_58
    :goto_58
    return v5

    .line 411
    :cond_59
    iget-boolean v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->mScaled:Z

    if-nez v2, :cond_58

    .line 412
    iput-boolean v5, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->mScaled:Z

    goto :goto_58
.end method
