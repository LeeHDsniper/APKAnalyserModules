.class public Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;
.super Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;
.source "AdobeImageBottomBarAnimator.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;
    }
.end annotation


# instance fields
.field private mListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;

.field private openOriginPoint:Landroid/graphics/Point;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    return-void
.end method


# virtual methods
.method public close()Z
    .registers 6

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 62
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->getDisplayedChild()I

    move-result v3

    if-ne v3, v1, :cond_2e

    .line 64
    sget-boolean v3, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_21:Z

    if-nez v3, :cond_25

    .line 65
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/aviary/android/feather/sdk/R$anim;->com_adobe_image_bottombar_out:I

    invoke-static {v3, v4}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 66
    .local v0, "animation":Landroid/view/animation/Animation;
    invoke-virtual {v0, p0}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 68
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/aviary/android/feather/sdk/R$anim;->com_adobe_image_bottombar_void:I

    invoke-virtual {p0, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->setInAnimation(Landroid/content/Context;I)V

    .line 69
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 72
    .end local v0    # "animation":Landroid/view/animation/Animation;
    :cond_25
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->openOriginPoint:Landroid/graphics/Point;

    invoke-virtual {p0, v2, v1, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->setDisplayedChild(IZLandroid/graphics/Point;)V

    .line 73
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->openOriginPoint:Landroid/graphics/Point;

    .line 76
    :goto_2d
    return v1

    :cond_2e
    move v1, v2

    goto :goto_2d
.end method

.method public getContentPanel()Landroid/view/ViewGroup;
    .registers 2

    .prologue
    .line 89
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getToolsListView()Landroid/support/v7/widget/RecyclerView;
    .registers 2

    .prologue
    .line 98
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method protected onAnimationCompleted(II)V
    .registers 5
    .param p1, "prevIndex"    # I
    .param p2, "curIndex"    # I

    .prologue
    .line 141
    invoke-super {p0, p1, p2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->onAnimationCompleted(II)V

    .line 142
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->mListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;

    if-eqz v0, :cond_13

    .line 143
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->getDisplayedChild()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_14

    .line 144
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->mListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;->onOpenEnd()V

    .line 149
    :cond_13
    :goto_13
    return-void

    .line 146
    :cond_14
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->mListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;->onCloseEnd()V

    goto :goto_13
.end method

.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .registers 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 114
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->mListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;

    if-eqz v0, :cond_10

    .line 115
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->getDisplayedChild()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_15

    .line 116
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->mListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;->onOpenEnd()V

    .line 121
    :cond_10
    :goto_10
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 122
    return-void

    .line 118
    :cond_15
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->mListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;->onCloseEnd()V

    goto :goto_10
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 125
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .registers 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->mListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;

    if-eqz v0, :cond_10

    .line 104
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->getDisplayedChild()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_11

    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->mListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;->onOpenStart()V

    .line 110
    :cond_10
    :goto_10
    return-void

    .line 107
    :cond_11
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->mListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;->onCloseStart()V

    goto :goto_10
.end method

.method protected onAnimationStarted(II)V
    .registers 4
    .param p1, "prevIndex"    # I
    .param p2, "curIndex"    # I

    .prologue
    .line 129
    invoke-super {p0, p1, p2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->onAnimationStarted(II)V

    .line 130
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->mListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;

    if-eqz v0, :cond_f

    .line 131
    const/4 v0, 0x1

    if-ne p2, v0, :cond_10

    .line 132
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->mListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;->onOpenStart()V

    .line 137
    :cond_f
    :goto_f
    return-void

    .line 134
    :cond_10
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->mListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;->onOpenEnd()V

    goto :goto_f
.end method

.method protected onFinishInflate()V
    .registers 1

    .prologue
    .line 34
    invoke-super {p0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->onFinishInflate()V

    .line 35
    return-void
.end method

.method public open(Landroid/graphics/Point;)Z
    .registers 6
    .param p1, "origin"    # Landroid/graphics/Point;

    .prologue
    const/4 v1, 0x1

    .line 42
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->getDisplayedChild()I

    move-result v2

    if-nez v2, :cond_31

    .line 44
    sget-boolean v2, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_21:Z

    if-nez v2, :cond_24

    .line 45
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/aviary/android/feather/sdk/R$anim;->com_adobe_image_bottombar_in:I

    invoke-static {v2, v3}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 46
    .local v0, "animation":Landroid/view/animation/Animation;
    invoke-virtual {v0, p0}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 48
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 49
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->getContext()Landroid/content/Context;

    move-result-object v2

    sget v3, Lcom/aviary/android/feather/sdk/R$anim;->com_adobe_image_bottombar_void:I

    invoke-virtual {p0, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->setOutAnimation(Landroid/content/Context;I)V

    .line 52
    .end local v0    # "animation":Landroid/view/animation/Animation;
    :cond_24
    if-eqz p1, :cond_2d

    .line 53
    new-instance v2, Landroid/graphics/Point;

    invoke-direct {v2, p1}, Landroid/graphics/Point;-><init>(Landroid/graphics/Point;)V

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->openOriginPoint:Landroid/graphics/Point;

    .line 55
    :cond_2d
    invoke-virtual {p0, v1, v1, p1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->setDisplayedChild(IZLandroid/graphics/Point;)V

    .line 58
    :goto_30
    return v1

    :cond_31
    const/4 v1, 0x0

    goto :goto_30
.end method

.method public setOnViewChangingStatusListener(Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator;->mListener:Lcom/adobe/creativesdk/aviary/widget/AdobeImageBottomBarAnimator$OnViewChangingStatusListener;

    .line 39
    return-void
.end method
