.class Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;
.super Ljava/lang/Object;
.source "ImageViewTiltiShiftTouch.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

.field final synthetic val$layerType:I


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;I)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    iput p2, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;->val$layerType:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 207
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->access$100(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;)Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    move-result-object v0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->setAlpha(F)V

    .line 208
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->invalidate()V

    .line 209
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 5
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    const/4 v1, 0x0

    .line 199
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->access$100(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;)Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    move-result-object v0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->setRadius(F)V

    .line 200
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->access$100(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;)Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    move-result-object v0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->setAlpha(F)V

    .line 201
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    iget v1, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;->val$layerType:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->setLayerType(ILandroid/graphics/Paint;)V

    .line 202
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->invalidate()V

    .line 203
    return-void
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 212
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 192
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->access$100(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;)Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    move-result-object v0

    iget-object v1, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->access$000(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->setRadius(F)V

    .line 193
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    # getter for: Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->mPointCloud:Lcom/adobe/creativesdk/aviary/widget/PointCloud;
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->access$100(Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;)Lcom/adobe/creativesdk/aviary/widget/PointCloud;

    move-result-object v0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/widget/PointCloud;->waveManager:Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;

    const/high16 v1, 0x3f800000

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/PointCloud$WaveManager;->setAlpha(F)V

    .line 194
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch$2;->this$0:Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewTiltiShiftTouch;->invalidate()V

    .line 195
    return-void
.end method
