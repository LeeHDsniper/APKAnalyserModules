.class Landroid/support/design/widget/ValueAnimatorCompatImplHoneycombMr1;
.super Landroid/support/design/widget/ValueAnimatorCompat$Impl;
.source "ValueAnimatorCompatImplHoneycombMr1.java"


# instance fields
.field final mValueAnimator:Landroid/animation/ValueAnimator;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/support/design/widget/ValueAnimatorCompat$Impl;-><init>()V

    .line 29
    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplHoneycombMr1;->mValueAnimator:Landroid/animation/ValueAnimator;

    .line 30
    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplHoneycombMr1;->mValueAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 105
    return-void
.end method

.method public getAnimatedIntValue()I
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplHoneycombMr1;->mValueAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public setIntValues(II)V
    .registers 6
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    .line 79
    iget-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplHoneycombMr1;->mValueAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, 0x2

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v2, 0x1

    aput p2, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    .line 80
    return-void
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 3
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 44
    iget-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplHoneycombMr1;->mValueAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 45
    return-void
.end method

.method public setUpdateListener(Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorUpdateListenerProxy;)V
    .registers 4
    .param p1, "updateListener"    # Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorUpdateListenerProxy;

    .prologue
    .line 49
    iget-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplHoneycombMr1;->mValueAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Landroid/support/design/widget/ValueAnimatorCompatImplHoneycombMr1$1;

    invoke-direct {v1, p0, p1}, Landroid/support/design/widget/ValueAnimatorCompatImplHoneycombMr1$1;-><init>(Landroid/support/design/widget/ValueAnimatorCompatImplHoneycombMr1;Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorUpdateListenerProxy;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 55
    return-void
.end method

.method public start()V
    .registers 2

    .prologue
    .line 34
    iget-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplHoneycombMr1;->mValueAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 35
    return-void
.end method
