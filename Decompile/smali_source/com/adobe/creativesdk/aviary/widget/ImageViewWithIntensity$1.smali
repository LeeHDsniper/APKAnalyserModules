.class Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$1;
.super Ljava/lang/Object;
.source "ImageViewWithIntensity.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->playDemo()Landroid/graphics/PointF;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    .prologue
    .line 337
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 9
    .param p1, "animation"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 340
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDownPoint:Landroid/graphics/PointF;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->access$100(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;)Landroid/graphics/PointF;

    move-result-object v0

    if-nez v0, :cond_9

    .line 346
    :goto_8
    return-void

    .line 343
    :cond_9
    invoke-virtual {p1}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .line 344
    .local v6, "value":Ljava/lang/Integer;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDownPoint:Landroid/graphics/PointF;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->access$100(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;)Landroid/graphics/PointF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/PointF;->x:F

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$1;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->mDownPoint:Landroid/graphics/PointF;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->access$100(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;)Landroid/graphics/PointF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/PointF;->y:F

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v2, v3

    const/4 v3, 0x0

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-float v4, v4

    const/4 v5, 0x0

    # invokes: Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->onScroll(FFFFZ)Z
    invoke-static/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->access$200(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;FFFFZ)Z

    goto :goto_8
.end method
