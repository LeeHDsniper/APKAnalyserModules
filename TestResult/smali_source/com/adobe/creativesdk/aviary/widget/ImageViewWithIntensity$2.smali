.class Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$2;
.super Ljava/lang/Object;
.source "ImageViewWithIntensity.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


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

.field final synthetic val$downPoint:Landroid/graphics/PointF;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;Landroid/graphics/PointF;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    .prologue
    .line 349
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$2;->val$downPoint:Landroid/graphics/PointF;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 362
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 357
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->onUp(Landroid/view/MotionEvent;)Z

    .line 358
    return-void
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 367
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 6
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 352
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$2;->val$downPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity$2;->val$downPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    const/4 v3, 0x0

    # invokes: Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->onDown(FFZ)Z
    invoke-static {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;->access$300(Lcom/adobe/creativesdk/aviary/widget/ImageViewWithIntensity;FFZ)Z

    .line 353
    return-void
.end method
