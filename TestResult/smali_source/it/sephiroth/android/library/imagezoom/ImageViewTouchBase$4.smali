.class Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$4;
.super Ljava/lang/Object;
.source "ImageViewTouchBase.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->zoomTo(FFFJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;

.field final synthetic val$destX:F

.field final synthetic val$destY:F


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;FF)V
    .registers 4
    .param p1, "this$0"    # Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;

    .prologue
    .line 995
    iput-object p1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$4;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;

    iput p2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$4;->val$destX:F

    iput p3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$4;->val$destY:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 6
    .param p1, "animation"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 998
    invoke-virtual {p1}, Lcom/nineoldandroids/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    .line 999
    .local v0, "value":F
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$4;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;

    iget v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$4;->val$destX:F

    iget v3, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$4;->val$destY:F

    invoke-virtual {v1, v0, v2, v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->zoomTo(FFF)V

    .line 1000
    return-void
.end method
