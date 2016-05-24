.class Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;
.super Ljava/lang/Object;
.source "AdobeImageAdjustImageView.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


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

.field final synthetic val$camera:Landroid/graphics/Camera;

.field final synthetic val$centerx:F

.field final synthetic val$centery:F

.field final synthetic val$horizontal:Z


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;Landroid/graphics/Camera;ZFF)V
    .registers 6
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    .prologue
    .line 914
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$camera:Landroid/graphics/Camera;

    iput-boolean p3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$horizontal:Z

    iput p4, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$centerx:F

    iput p5, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$centery:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 7
    .param p1, "animation"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    const/high16 v4, 0x3f800000

    .line 917
    invoke-virtual {p1}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 919
    .local v0, "value":F
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mCameraEnabled:Z
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$300(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)Z

    move-result v1

    if-eqz v1, :cond_5a

    .line 921
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$camera:Landroid/graphics/Camera;

    invoke-virtual {v1}, Landroid/graphics/Camera;->save()V

    .line 922
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$horizontal:Z

    if-eqz v1, :cond_54

    .line 923
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$camera:Landroid/graphics/Camera;

    invoke-virtual {v1, v0}, Landroid/graphics/Camera;->rotateY(F)V

    .line 927
    :goto_22
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$camera:Landroid/graphics/Camera;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipMatrix:Landroid/graphics/Matrix;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$400(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/Camera;->getMatrix(Landroid/graphics/Matrix;)V

    .line 928
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$camera:Landroid/graphics/Camera;

    invoke-virtual {v1}, Landroid/graphics/Camera;->restore()V

    .line 929
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipMatrix:Landroid/graphics/Matrix;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$400(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)Landroid/graphics/Matrix;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$centerx:F

    neg-float v2, v2

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$centery:F

    neg-float v3, v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 930
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipMatrix:Landroid/graphics/Matrix;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$400(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)Landroid/graphics/Matrix;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$centerx:F

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$centery:F

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 938
    :goto_4e
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->invalidate()V

    .line 939
    return-void

    .line 925
    :cond_54
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$camera:Landroid/graphics/Camera;

    invoke-virtual {v1, v0}, Landroid/graphics/Camera;->rotateX(F)V

    goto :goto_22

    .line 932
    :cond_5a
    iget-boolean v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$horizontal:Z

    if-eqz v1, :cond_6c

    .line 933
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipMatrix:Landroid/graphics/Matrix;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$400(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)Landroid/graphics/Matrix;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$centerx:F

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$centery:F

    invoke-virtual {v1, v0, v4, v2, v3}, Landroid/graphics/Matrix;->setScale(FFFF)V

    goto :goto_4e

    .line 935
    :cond_6c
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->mFlipMatrix:Landroid/graphics/Matrix;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;->access$400(Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;)Landroid/graphics/Matrix;

    move-result-object v1

    iget v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$centerx:F

    iget v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$5;->val$centery:F

    invoke-virtual {v1, v4, v0, v2, v3}, Landroid/graphics/Matrix;->setScale(FFFF)V

    goto :goto_4e
.end method
