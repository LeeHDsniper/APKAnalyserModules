.class public Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;
.super Lit/sephiroth/android/library/viewrevealanimator/RevealAnimatorImpl;
.source "ICSRevealAnimatorImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;
    }
.end annotation


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;)V
    .registers 2
    .param p1, "animator"    # Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/viewrevealanimator/RevealAnimatorImpl;-><init>(Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;)V

    .line 17
    return-void
.end method


# virtual methods
.method public isAnimating()Z
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInAnimation:Landroid/view/animation/Animation;

    .line 66
    invoke-virtual {v0}, Landroid/view/animation/Animation;->hasStarted()Z

    move-result v0

    if-eqz v0, :cond_1a

    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->hasEnded()Z

    move-result v0

    if-eqz v0, :cond_34

    :cond_1a
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mOutAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_36

    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mOutAnimation:Landroid/view/animation/Animation;

    .line 68
    invoke-virtual {v0}, Landroid/view/animation/Animation;->hasStarted()Z

    move-result v0

    if-eqz v0, :cond_36

    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mOutAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0}, Landroid/view/animation/Animation;->hasEnded()Z

    move-result v0

    if-nez v0, :cond_36

    :cond_34
    const/4 v0, 0x1

    :goto_35
    return v0

    :cond_36
    const/4 v0, 0x0

    goto :goto_35
.end method

.method public shouldAnimate()Z
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-boolean v0, v0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mFirstTime:Z

    if-eqz v0, :cond_c

    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-boolean v0, v0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mAnimateFirstTime:Z

    if-eqz v0, :cond_20

    .line 74
    :cond_c
    invoke-virtual {p0}, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->isAnimating()Z

    move-result v0

    if-nez v0, :cond_20

    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_20

    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v0, v0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mOutAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_20

    const/4 v0, 0x1

    :goto_1f
    return v0

    :cond_20
    const/4 v0, 0x0

    goto :goto_1f
.end method

.method public showOnly(IILandroid/graphics/Point;)V
    .registers 10
    .param p1, "previousChild"    # I
    .param p2, "childIndex"    # I
    .param p3, "origin"    # Landroid/graphics/Point;

    .prologue
    const/4 v5, 0x0

    .line 25
    iget-object v3, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v3, v3, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInAnimation:Landroid/view/animation/Animation;

    new-instance v4, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;

    invoke-direct {v4, p0, p1, p2}, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl$MyAnimationListener;-><init>(Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;II)V

    invoke-virtual {v3, v4}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 27
    iget-object v3, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    invoke-virtual {v3}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getChildCount()I

    move-result v1

    .line 28
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_14
    if-ge v2, v1, :cond_64

    .line 29
    iget-object v3, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    invoke-virtual {v3, v2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 30
    .local v0, "child":Landroid/view/View;
    if-ne v2, p2, :cond_35

    .line 31
    iget-object v3, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v3, v3, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInAnimation:Landroid/view/animation/Animation;

    if-eqz v3, :cond_2b

    .line 32
    iget-object v3, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v3, v3, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, v3}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 34
    :cond_2b
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 35
    iget-object v3, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iput-boolean v5, v3, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mFirstTime:Z

    .line 28
    :goto_32
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 37
    :cond_35
    iget-object v3, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v3, v3, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mOutAnimation:Landroid/view/animation/Animation;

    if-eqz v3, :cond_4e

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_4e

    .line 38
    iget-object v3, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v3, v3, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mOutAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, v3}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 43
    :cond_48
    :goto_48
    const/16 v3, 0x8

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_32

    .line 39
    :cond_4e
    invoke-virtual {v0}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v3

    iget-object v4, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v4, v4, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInAnimation:Landroid/view/animation/Animation;

    if-ne v3, v4, :cond_48

    .line 40
    iget-object v3, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v3, v3, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInAnimation:Landroid/view/animation/Animation;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 41
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    goto :goto_48

    .line 46
    .end local v0    # "child":Landroid/view/View;
    :cond_64
    return-void
.end method

.method public showOnlyNoAnimation(II)V
    .registers 7
    .param p1, "previousIndex"    # I
    .param p2, "childIndex"    # I

    .prologue
    .line 50
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v2, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    invoke-virtual {v2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_3e

    .line 51
    iget-object v2, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    invoke-virtual {v2, v1}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 52
    .local v0, "child":Landroid/view/View;
    if-ne v1, p2, :cond_2d

    const/4 v2, 0x0

    :goto_12
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 53
    invoke-virtual {v0}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v2

    iget-object v3, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v3, v3, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInAnimation:Landroid/view/animation/Animation;

    if-ne v2, v3, :cond_30

    .line 54
    iget-object v2, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v2, v2, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInAnimation:Landroid/view/animation/Animation;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 55
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 50
    :cond_2a
    :goto_2a
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 52
    :cond_2d
    const/16 v2, 0x8

    goto :goto_12

    .line 56
    :cond_30
    invoke-virtual {v0}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v2

    iget-object v3, p0, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v3, v3, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mOutAnimation:Landroid/view/animation/Animation;

    if-ne v2, v3, :cond_2a

    .line 57
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    goto :goto_2a

    .line 60
    .end local v0    # "child":Landroid/view/View;
    :cond_3e
    return-void
.end method
