.class Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;
.super Ljava/lang/Object;
.source "AdobeImageAdjustImageView.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->flipTo(ZJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

.field final synthetic val$centerx:F

.field final synthetic val$centery:F

.field final synthetic val$horizontal:Z


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;ZFF)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    .prologue
    .line 942
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iput-boolean p2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->val$horizontal:Z

    iput p3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->val$centerx:F

    iput p4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->val$centery:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 978
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 8
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    const/high16 v4, 0x3f800000

    const/high16 v3, -0x40800000

    .line 950
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->val$horizontal:Z

    if-eqz v0, :cond_6e

    .line 951
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget v1, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_HORIZONTAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    xor-int/2addr v1, v2

    iput v1, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    .line 952
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$500(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)Landroid/graphics/Matrix;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->val$centerx:F

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->val$centery:F

    invoke-virtual {v0, v3, v4, v1, v2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 959
    :goto_20
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotateMatrix:Landroid/graphics/Matrix;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$600(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-wide v2, v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    neg-double v2, v2

    const-wide/high16 v4, 0x4000000000000000L

    mul-double/2addr v2, v4

    double-to-float v1, v2

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->val$centerx:F

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->val$centery:F

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 960
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotateMatrix:Landroid/graphics/Matrix;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$600(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)Landroid/graphics/Matrix;

    move-result-object v2

    # invokes: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->getRotationFromMatrix(Landroid/graphics/Matrix;)D
    invoke-static {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$700(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;Landroid/graphics/Matrix;)D

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/Point2D;->angle360(D)D

    move-result-wide v2

    iput-wide v2, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRotation:D

    .line 961
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipMatrix:Landroid/graphics/Matrix;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$400(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 963
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 964
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->printDetails()V

    .line 966
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mRunning:Z

    .line 968
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget-boolean v0, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->isReset:Z

    if-eqz v0, :cond_87

    .line 969
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    # invokes: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->onReset()V
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$100(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)V

    .line 973
    :goto_6d
    return-void

    .line 954
    :cond_6e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iget v1, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_VERTICAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    iget v2, v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    xor-int/2addr v1, v2

    iput v1, v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipType:I

    .line 955
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mDrawMatrix:Landroid/graphics/Matrix;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$500(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)Landroid/graphics/Matrix;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->val$centerx:F

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->val$centery:F

    invoke-virtual {v0, v4, v3, v1, v2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    goto :goto_20

    .line 971
    :cond_87
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$6;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    const/16 v1, 0x190

    const/16 v2, 0x12c

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->fadeInOutlines(II)V

    goto :goto_6d
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 983
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 946
    return-void
.end method
