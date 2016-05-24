.class Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;
.super Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;
.source "ImageViewSpotSingleTap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TapScaleListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    .prologue
    .line 318
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    invoke-direct {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;-><init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;)V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .registers 4
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 341
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    if-ne v0, v1, :cond_1f

    .line 342
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v1

    iput v1, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mX:F

    .line 343
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v1

    iput v1, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mY:F

    .line 344
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->postInvalidate()V

    .line 345
    const/4 v0, 0x1

    .line 347
    :goto_1e
    return v0

    :cond_1f
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->onScale(Landroid/view/ScaleGestureDetector;)Z

    move-result v0

    goto :goto_1e
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .registers 5
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    const/4 v0, 0x1

    .line 321
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mTouchMode:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;->DRAW:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TouchMode;

    if-ne v1, v2, :cond_33

    .line 322
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v2

    iput v2, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mX:F

    .line 323
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v2

    iput v2, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mY:F

    .line 324
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mX:F

    iput v2, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mStartX:F

    .line 325
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mY:F

    iput v2, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mStartY:F

    .line 326
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    iput-boolean v0, v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mCanceled:Z

    .line 327
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->postInvalidate()V

    .line 330
    :goto_32
    return v0

    :cond_33
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->onScaleBegin(Landroid/view/ScaleGestureDetector;)Z

    move-result v0

    goto :goto_32
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .registers 4
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 335
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap$TapScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewSpotSingleTap;->mCanceled:Z

    .line 336
    invoke-super {p0, p1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch$ScaleListener;->onScaleEnd(Landroid/view/ScaleGestureDetector;)V

    .line 337
    return-void
.end method
