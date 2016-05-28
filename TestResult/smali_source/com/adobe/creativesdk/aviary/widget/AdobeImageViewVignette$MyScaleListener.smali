.class public Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;
.source "AdobeImageViewVignette.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MyScaleListener"
.end annotation


# instance fields
.field private mRatio:F

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    .prologue
    .line 534
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .registers 13
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 539
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mTouchState:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->access$300(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    move-result-object v4

    sget-object v5, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->Scale:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    if-eq v4, v5, :cond_e

    .line 568
    :goto_d
    return v10

    .line 543
    :cond_e
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getPreviousSpan()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpan()F

    move-result v5

    sub-float v0, v4, v5

    .line 545
    .local v0, "distance":F
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getPreviousSpanX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpanX()F

    move-result v5

    sub-float v1, v4, v5

    .line 546
    .local v1, "distanceX":F
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getPreviousSpanY()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpanY()F

    move-result v5

    sub-float v2, v4, v5

    .line 548
    .local v2, "distanceY":F
    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;->mRatio:F

    const/high16 v5, 0x3f000000

    cmpl-float v4, v4, v5

    if-lez v4, :cond_66

    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;->mRatio:F

    const/high16 v5, 0x3fc00000

    cmpg-float v4, v4, v5

    if-gez v4, :cond_66

    .line 550
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->access$400(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mVignetteRect:Landroid/graphics/RectF;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->access$400(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)Landroid/graphics/RectF;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    div-float v3, v4, v5

    .line 552
    .local v3, "ratio":F
    float-to-double v4, v3

    const-wide/high16 v6, 0x3ff0000000000000L

    cmpl-double v4, v4, v6

    if-ltz v4, :cond_62

    .line 553
    move v1, v0

    .line 554
    div-float v2, v0, v3

    .line 559
    :goto_5c
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    invoke-virtual {v4, v8, v8, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    goto :goto_d

    .line 556
    :cond_62
    mul-float v1, v0, v3

    .line 557
    move v2, v0

    goto :goto_5c

    .line 560
    .end local v3    # "ratio":F
    :cond_66
    iget v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;->mRatio:F

    float-to-double v4, v4

    const-wide/high16 v6, 0x3fe8000000000000L

    cmpg-double v4, v4, v6

    if-gtz v4, :cond_75

    .line 562
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    invoke-virtual {v4, v8, v8, v9, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    goto :goto_d

    .line 565
    :cond_75
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    invoke-virtual {v4, v8, v8, v1, v9}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    goto :goto_d
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .registers 4
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 573
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpanX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getCurrentSpanY()F

    move-result v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;->mRatio:F

    .line 574
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;->Scale:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;

    # invokes: Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setTouchState(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->access$500(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$TouchState;)V

    .line 575
    invoke-super {p0, p1}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;->onScaleBegin(Landroid/view/ScaleGestureDetector;)Z

    move-result v0

    return v0
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .registers 2
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 580
    invoke-super {p0, p1}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;->onScaleEnd(Landroid/view/ScaleGestureDetector;)V

    .line 581
    return-void
.end method
