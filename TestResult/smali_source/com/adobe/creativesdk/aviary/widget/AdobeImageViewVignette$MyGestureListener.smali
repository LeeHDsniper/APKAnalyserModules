.class Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyGestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "AdobeImageViewVignette.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyGestureListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)V
    .registers 2

    .prologue
    .line 496
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;
    .param p2, "x1"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$1;

    .prologue
    .line 496
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyGestureListener;-><init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)V

    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 530
    const/4 v0, 0x0

    return v0
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 525
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->onDown(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 6
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "velocityX"    # F
    .param p4, "velocityY"    # F

    .prologue
    .line 520
    const/4 v0, 0x0

    return v0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .registers 2
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 503
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

    .line 507
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mScaleDetector:Landroid/view/ScaleGestureDetector;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->access$200(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)Landroid/view/ScaleGestureDetector;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 514
    :cond_e
    :goto_e
    return v0

    .line 510
    :cond_f
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    if-gt v1, v2, :cond_e

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    if-gt v1, v2, :cond_e

    .line 514
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$MyGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v0

    goto :goto_e
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 499
    const/4 v0, 0x0

    return v0
.end method
