.class Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$2;
.super Ljava/lang/Object;
.source "ImageViewTouchBase.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->scrollBy(FFJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field oldValueX:F

.field oldValueY:F

.field final synthetic this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;

.field final synthetic val$anim1:Lcom/nineoldandroids/animation/ValueAnimator;

.field final synthetic val$anim2:Lcom/nineoldandroids/animation/ValueAnimator;


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;Lcom/nineoldandroids/animation/ValueAnimator;Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 5
    .param p1, "this$0"    # Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;

    .prologue
    const/4 v0, 0x0

    .line 930
    iput-object p1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$2;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;

    iput-object p2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$2;->val$anim1:Lcom/nineoldandroids/animation/ValueAnimator;

    iput-object p3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$2;->val$anim2:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 931
    iput v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$2;->oldValueX:F

    .line 932
    iput v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$2;->oldValueY:F

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 10
    .param p1, "animation"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 936
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$2;->val$anim1:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v2}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 937
    .local v0, "valueX":F
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$2;->val$anim2:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v2}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 938
    .local v1, "valueY":F
    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$2;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;

    iget v3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$2;->oldValueX:F

    sub-float v3, v0, v3

    float-to-double v4, v3

    iget v3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$2;->oldValueY:F

    sub-float v3, v1, v3

    float-to-double v6, v3

    invoke-virtual {v2, v4, v5, v6, v7}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->panBy(DD)V

    .line 940
    iput v0, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$2;->oldValueX:F

    .line 941
    iput v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$2;->oldValueY:F

    .line 942
    return-void
.end method
