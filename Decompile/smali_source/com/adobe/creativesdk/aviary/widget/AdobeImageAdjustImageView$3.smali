.class Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$3;
.super Ljava/lang/Object;
.source "AdobeImageAdjustImageView.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->rotateBy(DJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    .prologue
    .line 823
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 7
    .param p1, "animation"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 826
    invoke-virtual {p1}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 827
    .local v0, "value":F
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    float-to-double v2, v0

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->angle360(D)D

    move-result-wide v2

    iput-wide v2, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    .line 828
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-wide v2, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    const/4 v4, 0x0

    # invokes: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->setImageRotation(DZ)V
    invoke-static {v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$200(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;DZ)V

    .line 829
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->initStraighten:Z

    .line 830
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$3;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 831
    return-void
.end method
