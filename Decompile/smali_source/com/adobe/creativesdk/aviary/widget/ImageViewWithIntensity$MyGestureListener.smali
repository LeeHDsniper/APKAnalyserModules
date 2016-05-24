.class Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$MyGestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "ImageViewWithIntensity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyGestureListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;)V
    .registers 2

    .prologue
    .line 456
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$MyGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;
    .param p2, "x1"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$1;

    .prologue
    .line 456
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$MyGestureListener;-><init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;)V

    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 483
    const/4 v0, 0x0

    return v0
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 478
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$MyGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->onDown(Landroid/view/MotionEvent;)Z

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
    .line 473
    const/4 v0, 0x0

    return v0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .registers 2
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 463
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .registers 6
    .param p1, "e1"    # Landroid/view/MotionEvent;
    .param p2, "e2"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    .prologue
    .line 467
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$MyGestureListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z

    move-result v0

    return v0
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "e"    # Landroid/view/MotionEvent;

    .prologue
    .line 459
    const/4 v0, 0x0

    return v0
.end method
