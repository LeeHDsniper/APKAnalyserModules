.class public Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$MyScaleListener;
.super Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;
.source "ImageViewWithIntensity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MyScaleListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    .prologue
    .line 487
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$MyScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    invoke-direct {p0}, Landroid/view/ScaleGestureDetector$SimpleOnScaleGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .registers 4
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    .prologue
    .line 490
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$MyScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDownPoint:Landroid/graphics/PointF;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->access$102(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 491
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$MyScaleListener;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    const/4 v1, 0x0

    # setter for: Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mScrollVerticalStarted:Z
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->access$402(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;Z)Z

    .line 492
    const/4 v0, 0x1

    return v0
.end method
