.class Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$3;
.super Ljava/lang/Object;
.source "ImageViewTouchBase.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->scrollBy(FFJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;)V
    .registers 2
    .param p1, "this$0"    # Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;

    .prologue
    .line 947
    iput-object p1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$3;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 964
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 7
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 955
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$3;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;

    iget-object v2, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$3;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;

    iget-object v2, v2, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2, v4, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->getCenter(Landroid/graphics/Matrix;ZZ)Landroid/graphics/RectF;

    move-result-object v0

    .line 956
    .local v0, "centerRect":Landroid/graphics/RectF;
    iget v1, v0, Landroid/graphics/RectF;->left:F

    cmpl-float v1, v1, v3

    if-nez v1, :cond_18

    iget v1, v0, Landroid/graphics/RectF;->top:F

    cmpl-float v1, v1, v3

    if-eqz v1, :cond_21

    .line 957
    :cond_18
    iget-object v1, p0, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$3;->this$0:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;

    iget v2, v0, Landroid/graphics/RectF;->left:F

    iget v3, v0, Landroid/graphics/RectF;->top:F

    invoke-virtual {v1, v2, v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase;->scrollBy(FF)V

    .line 959
    :cond_21
    return-void
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 969
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 951
    return-void
.end method
