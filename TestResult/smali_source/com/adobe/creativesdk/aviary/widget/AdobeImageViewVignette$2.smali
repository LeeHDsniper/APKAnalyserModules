.class Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;
.super Ljava/lang/Object;
.source "AdobeImageViewVignette.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setupRipple()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

.field final synthetic val$layerType:I

.field final synthetic val$mAnimator:Lcom/nineoldandroids/animation/ValueAnimator;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;Lcom/nineoldandroids/animation/ValueAnimator;I)V
    .registers 4
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    .prologue
    .line 352
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;->val$mAnimator:Lcom/nineoldandroids/animation/ValueAnimator;

    iput p3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;->val$layerType:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 370
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->access$100(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    move-result-object v0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->setAlpha(F)V

    .line 371
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->invalidate()V

    .line 372
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 5
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    const/4 v1, 0x0

    .line 362
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->access$100(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    move-result-object v0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->setRadius(F)V

    .line 363
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->access$100(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    move-result-object v0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->setAlpha(F)V

    .line 364
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;->val$layerType:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->setLayerType(ILandroid/graphics/Paint;)V

    .line 365
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->invalidate()V

    .line 366
    return-void
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 375
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 355
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->access$100(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    move-result-object v0

    iget-object v1, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;->val$mAnimator:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->setRadius(F)V

    .line 356
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->access$100(Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;)Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    move-result-object v0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    const/high16 v1, 0x3f800000

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->setAlpha(F)V

    .line 357
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageViewVignette;->invalidate()V

    .line 358
    return-void
.end method
