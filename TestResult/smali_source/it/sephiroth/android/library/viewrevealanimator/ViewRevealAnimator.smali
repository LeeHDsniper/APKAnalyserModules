.class public Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;
.super Landroid/widget/FrameLayout;
.source "ViewRevealAnimator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewAnimationListener;,
        Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewChangedListener;
    }
.end annotation


# instance fields
.field mAnimateFirstTime:Z

.field mAnimationDuration:I

.field mFirstTime:Z

.field mHideBeforeReveal:Z

.field mInAnimation:Landroid/view/animation/Animation;

.field mInstance:Lit/sephiroth/android/library/viewrevealanimator/RevealAnimator;

.field mInterpolator:Landroid/view/animation/Interpolator;

.field mOutAnimation:Landroid/view/animation/Animation;

.field mViewAnimationListener:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewAnimationListener;

.field mViewChangedListener:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewChangedListener;

.field mWhichChild:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 58
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 62
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 63
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/16 v11, 0x15

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 66
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    iput v9, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    .line 38
    iput-boolean v10, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mFirstTime:Z

    .line 39
    iput-boolean v10, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mAnimateFirstTime:Z

    .line 68
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v8, v11, :cond_68

    .line 69
    new-instance v8, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;

    invoke-direct {v8, p0}, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;-><init>(Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;)V

    iput-object v8, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInstance:Lit/sephiroth/android/library/viewrevealanimator/RevealAnimator;

    .line 74
    :goto_18
    sget-object v8, Lit/sephiroth/android/library/viewrevealanimator/R$styleable;->ViewRelealAnimator:[I

    invoke-virtual {p1, p2, v8, p3, v9}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 76
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v8, Lit/sephiroth/android/library/viewrevealanimator/R$styleable;->ViewRelealAnimator_android_inAnimation:I

    invoke-virtual {v0, v8, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    .line 77
    .local v6, "resourceIn":I
    sget v8, Lit/sephiroth/android/library/viewrevealanimator/R$styleable;->ViewRelealAnimator_android_outAnimation:I

    invoke-virtual {v0, v8, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v7

    .line 78
    .local v7, "resourceOut":I
    sget v8, Lit/sephiroth/android/library/viewrevealanimator/R$styleable;->ViewRelealAnimator_android_animateFirstView:I

    invoke-virtual {v0, v8, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    .line 79
    .local v2, "flag":Z
    sget v8, Lit/sephiroth/android/library/viewrevealanimator/R$styleable;->ViewRelealAnimator_android_animationDuration:I

    const/16 v9, 0x190

    invoke-virtual {v0, v8, v9}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    .line 80
    .local v1, "animationDuration":I
    sget v8, Lit/sephiroth/android/library/viewrevealanimator/R$styleable;->ViewRelealAnimator_vra_hideBeforeReveal:I

    invoke-virtual {v0, v8, v10}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    .line 82
    .local v3, "hideBeforeReveal":Z
    invoke-virtual {p0, p1, v6}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setInAnimation(Landroid/content/Context;I)V

    .line 83
    invoke-virtual {p0, p1, v7}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setOutAnimation(Landroid/content/Context;I)V

    .line 84
    invoke-virtual {p0, v2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setAnimateFirstView(Z)V

    .line 86
    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setAnimationDuration(I)V

    .line 87
    invoke-virtual {p0, v3}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setHideBeforeReveal(Z)V

    .line 89
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v8, v11, :cond_61

    .line 90
    sget v8, Lit/sephiroth/android/library/viewrevealanimator/R$styleable;->ViewRelealAnimator_android_interpolator:I

    const v9, 0x10c0006

    .line 91
    invoke-virtual {v0, v8, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    .line 92
    .local v5, "resID":I
    invoke-static {p1, v5}, Landroid/view/animation/AnimationUtils;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object v4

    .line 93
    .local v4, "interpolator":Landroid/view/animation/Interpolator;
    invoke-virtual {p0, v4}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 96
    .end local v4    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v5    # "resID":I
    :cond_61
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 97
    invoke-direct {p0, p1, p2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->initViewAnimator(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 98
    return-void

    .line 71
    .end local v0    # "a":Landroid/content/res/TypedArray;
    .end local v1    # "animationDuration":I
    .end local v2    # "flag":Z
    .end local v3    # "hideBeforeReveal":Z
    .end local v6    # "resourceIn":I
    .end local v7    # "resourceOut":I
    :cond_68
    new-instance v8, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;

    invoke-direct {v8, p0}, Lit/sephiroth/android/library/viewrevealanimator/ICSRevealAnimatorImpl;-><init>(Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;)V

    iput-object v8, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInstance:Lit/sephiroth/android/library/viewrevealanimator/RevealAnimator;

    goto :goto_18
.end method

.method public static final distance(Landroid/graphics/Point;Landroid/graphics/Point;)D
    .registers 6
    .param p0, "origin"    # Landroid/graphics/Point;
    .param p1, "newPoint"    # Landroid/graphics/Point;

    .prologue
    .line 54
    iget v0, p0, Landroid/graphics/Point;->x:I

    iget v1, p1, Landroid/graphics/Point;->x:I

    sub-int/2addr v0, v1

    iget v1, p0, Landroid/graphics/Point;->x:I

    iget v2, p1, Landroid/graphics/Point;->x:I

    sub-int/2addr v1, v2

    mul-int/2addr v0, v1

    iget v1, p0, Landroid/graphics/Point;->y:I

    iget v2, p1, Landroid/graphics/Point;->y:I

    sub-int/2addr v1, v2

    iget v2, p0, Landroid/graphics/Point;->y:I

    iget v3, p1, Landroid/graphics/Point;->y:I

    sub-int/2addr v2, v3

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    return-wide v0
.end method

.method private initViewAnimator(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, 0x1

    .line 101
    if-nez p2, :cond_7

    .line 102
    invoke-virtual {p0, v3}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setMeasureAllChildren(Z)V

    .line 113
    :goto_6
    return-void

    .line 106
    :cond_7
    sget-object v2, Lit/sephiroth/android/library/viewrevealanimator/R$styleable;->ViewRelealAnimator:[I

    invoke-virtual {p1, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 109
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v2, Lit/sephiroth/android/library/viewrevealanimator/R$styleable;->ViewRelealAnimator_android_measureAllChildren:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 111
    .local v1, "measureAllChildren":Z
    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setMeasureAllChildren(Z)V

    .line 112
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_6
.end method

.method private shouldAnimate()Z
    .registers 2

    .prologue
    .line 228
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInstance:Lit/sephiroth/android/library/viewrevealanimator/RevealAnimator;

    invoke-interface {v0}, Lit/sephiroth/android/library/viewrevealanimator/RevealAnimator;->shouldAnimate()Z

    move-result v0

    return v0
.end method


# virtual methods
.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .registers 7
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    const/4 v2, 0x0

    .line 236
    invoke-super {p0, p1, p2, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 237
    invoke-virtual {p0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1d

    .line 238
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 242
    :goto_e
    if-ltz p2, :cond_1c

    iget v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    if-lt v0, p2, :cond_1c

    .line 243
    iget v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    add-int/lit8 v0, v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v2, v1}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setDisplayedChild(IZLandroid/graphics/Point;)V

    .line 245
    :cond_1c
    return-void

    .line 240
    :cond_1d
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_e
.end method

.method public getAnimateFirstView()Z
    .registers 2

    .prologue
    .line 396
    iget-boolean v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mAnimateFirstTime:Z

    return v0
.end method

.method public getAnimationDuration()I
    .registers 2

    .prologue
    .line 384
    iget v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mAnimationDuration:I

    return v0
.end method

.method public getBaseline()I
    .registers 2

    .prologue
    .line 405
    invoke-virtual {p0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getCurrentView()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_b

    invoke-super {p0}, Landroid/widget/FrameLayout;->getBaseline()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    invoke-virtual {p0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getCurrentView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getBaseline()I

    move-result v0

    goto :goto_a
.end method

.method public getCurrentView()Landroid/view/View;
    .registers 2

    .prologue
    .line 300
    iget v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayedChild()I
    .registers 2

    .prologue
    .line 167
    iget v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    return v0
.end method

.method public getHideBeforeReveal()Z
    .registers 2

    .prologue
    .line 376
    iget-boolean v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mHideBeforeReveal:Z

    return v0
.end method

.method public getInAnimation()Landroid/view/animation/Animation;
    .registers 2

    .prologue
    .line 311
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInAnimation:Landroid/view/animation/Animation;

    return-object v0
.end method

.method public getInterpolator()Landroid/view/animation/Interpolator;
    .registers 2

    .prologue
    .line 392
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInterpolator:Landroid/view/animation/Interpolator;

    return-object v0
.end method

.method public getOutAnimation()Landroid/view/animation/Animation;
    .registers 2

    .prologue
    .line 333
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mOutAnimation:Landroid/view/animation/Animation;

    return-object v0
.end method

.method protected getViewCenter(Landroid/view/View;)Landroid/graphics/Point;
    .registers 4
    .param p1, "targetView"    # Landroid/view/View;

    .prologue
    .line 196
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 197
    .local v0, "newPoint":Landroid/graphics/Point;
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    iput v1, v0, Landroid/graphics/Point;->x:I

    .line 198
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    iput v1, v0, Landroid/graphics/Point;->y:I

    .line 202
    return-object v0
.end method

.method public getViewRadius(Landroid/view/View;)I
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method protected onAnimationCompleted(II)V
    .registers 4
    .param p1, "prevIndex"    # I
    .param p2, "curIndex"    # I

    .prologue
    .line 218
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mViewAnimationListener:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewAnimationListener;

    if-eqz v0, :cond_9

    .line 219
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mViewAnimationListener:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewAnimationListener;

    invoke-interface {v0, p1, p2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewAnimationListener;->onViewAnimationCompleted(II)V

    .line 221
    :cond_9
    return-void
.end method

.method protected onAnimationStarted(II)V
    .registers 4
    .param p1, "prevIndex"    # I
    .param p2, "curIndex"    # I

    .prologue
    .line 212
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mViewAnimationListener:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewAnimationListener;

    if-eqz v0, :cond_9

    .line 213
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mViewAnimationListener:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewAnimationListener;

    invoke-interface {v0, p1, p2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewAnimationListener;->onViewAnimationStarted(II)V

    .line 215
    :cond_9
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 3
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .prologue
    .line 410
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 411
    const-class v0, Landroid/widget/ViewAnimator;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 412
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 3
    .param p1, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .prologue
    .line 416
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 417
    const-class v0, Landroid/widget/ViewAnimator;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 418
    return-void
.end method

.method protected onViewChanged(II)V
    .registers 4
    .param p1, "prevIndex"    # I
    .param p2, "curIndex"    # I

    .prologue
    .line 206
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mViewChangedListener:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewChangedListener;

    if-eqz v0, :cond_9

    .line 207
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mViewChangedListener:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewChangedListener;

    invoke-interface {v0, p1, p2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewChangedListener;->onViewChanged(II)V

    .line 209
    :cond_9
    return-void
.end method

.method public removeAllViews()V
    .registers 2

    .prologue
    .line 249
    invoke-super {p0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 250
    const/4 v0, 0x0

    iput v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    .line 251
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mFirstTime:Z

    .line 252
    return-void
.end method

.method public removeView(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 256
    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->indexOfChild(Landroid/view/View;)I

    move-result v0

    .line 257
    .local v0, "index":I
    if-ltz v0, :cond_9

    .line 258
    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->removeViewAt(I)V

    .line 260
    :cond_9
    return-void
.end method

.method public removeViewAt(I)V
    .registers 6
    .param p1, "index"    # I

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 264
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->removeViewAt(I)V

    .line 265
    invoke-virtual {p0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getChildCount()I

    move-result v0

    .line 266
    .local v0, "childCount":I
    if-nez v0, :cond_11

    .line 267
    iput v2, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    .line 268
    const/4 v1, 0x1

    iput-boolean v1, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mFirstTime:Z

    .line 274
    :cond_10
    :goto_10
    return-void

    .line 269
    :cond_11
    iget v1, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    if-lt v1, v0, :cond_1b

    .line 270
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1, v2, v3}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setDisplayedChild(IZLandroid/graphics/Point;)V

    goto :goto_10

    .line 271
    :cond_1b
    iget v1, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    if-ne v1, p1, :cond_10

    .line 272
    iget v1, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    invoke-virtual {p0, v1, v2, v3}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setDisplayedChild(IZLandroid/graphics/Point;)V

    goto :goto_10
.end method

.method public removeViewInLayout(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 277
    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->removeView(Landroid/view/View;)V

    .line 278
    return-void
.end method

.method public removeViews(II)V
    .registers 6
    .param p1, "start"    # I
    .param p2, "count"    # I

    .prologue
    const/4 v2, 0x0

    .line 281
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->removeViews(II)V

    .line 282
    invoke-virtual {p0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getChildCount()I

    move-result v0

    if-nez v0, :cond_10

    .line 283
    iput v2, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    .line 284
    const/4 v0, 0x1

    iput-boolean v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mFirstTime:Z

    .line 288
    :cond_f
    :goto_f
    return-void

    .line 285
    :cond_10
    iget v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    if-lt v0, p1, :cond_f

    iget v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    add-int v1, p1, p2

    if-ge v0, v1, :cond_f

    .line 286
    iget v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v2, v1}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setDisplayedChild(IZLandroid/graphics/Point;)V

    goto :goto_f
.end method

.method public removeViewsInLayout(II)V
    .registers 3
    .param p1, "start"    # I
    .param p2, "count"    # I

    .prologue
    .line 291
    invoke-virtual {p0, p1, p2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->removeViews(II)V

    .line 292
    return-void
.end method

.method public setAnimateFirstView(Z)V
    .registers 2
    .param p1, "animate"    # Z

    .prologue
    .line 400
    iput-boolean p1, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mAnimateFirstTime:Z

    .line 401
    return-void
.end method

.method public setAnimationDuration(I)V
    .registers 2
    .param p1, "value"    # I

    .prologue
    .line 380
    iput p1, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mAnimationDuration:I

    .line 381
    return-void
.end method

.method public setDisplayedChild(I)V
    .registers 4
    .param p1, "whichChild"    # I

    .prologue
    .line 129
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setDisplayedChild(IZLandroid/graphics/Point;)V

    .line 130
    return-void
.end method

.method public setDisplayedChild(IZ)V
    .registers 4
    .param p1, "whichChild"    # I
    .param p2, "animate"    # Z

    .prologue
    .line 133
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setDisplayedChild(IZLandroid/graphics/Point;)V

    .line 134
    return-void
.end method

.method public setDisplayedChild(IZLandroid/graphics/Point;)V
    .registers 7
    .param p1, "whichChild"    # I
    .param p2, "animate"    # Z
    .param p3, "origin"    # Landroid/graphics/Point;

    .prologue
    const/4 v0, 0x0

    .line 141
    iget v2, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    if-ne p1, v2, :cond_6

    .line 159
    :cond_5
    :goto_5
    return-void

    .line 146
    :cond_6
    iget v1, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    .line 147
    .local v1, "mPreviousChild":I
    iput p1, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    .line 149
    invoke-virtual {p0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getChildCount()I

    move-result v2

    if-lt p1, v2, :cond_25

    .line 150
    iput v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    .line 154
    :cond_12
    :goto_12
    invoke-virtual {p0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getFocusedChild()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_19

    const/4 v0, 0x1

    .line 155
    .local v0, "hasFocus":Z
    :cond_19
    iget v2, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    invoke-virtual {p0, v1, v2, p2, p3}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->showOnly(IIZLandroid/graphics/Point;)V

    .line 156
    if-eqz v0, :cond_5

    .line 157
    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->requestFocus(I)Z

    goto :goto_5

    .line 151
    .end local v0    # "hasFocus":Z
    :cond_25
    if-gez p1, :cond_12

    .line 152
    invoke-virtual {p0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mWhichChild:I

    goto :goto_12
.end method

.method public setHideBeforeReveal(Z)V
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 372
    iput-boolean p1, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mHideBeforeReveal:Z

    .line 373
    return-void
.end method

.method public setInAnimation(Landroid/content/Context;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resourceID"    # I

    .prologue
    .line 356
    invoke-static {p1, p2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 357
    return-void
.end method

.method public setInAnimation(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "inAnimation"    # Landroid/view/animation/Animation;

    .prologue
    .line 322
    iput-object p1, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInAnimation:Landroid/view/animation/Animation;

    .line 323
    return-void
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 2
    .param p1, "mInterpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 388
    iput-object p1, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 389
    return-void
.end method

.method public setOnViewAnimationListener(Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewAnimationListener;)V
    .registers 2
    .param p1, "listener"    # Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewAnimationListener;

    .prologue
    .line 120
    iput-object p1, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mViewAnimationListener:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewAnimationListener;

    .line 121
    return-void
.end method

.method public setOnViewChangedListener(Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewChangedListener;)V
    .registers 2
    .param p1, "listener"    # Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewChangedListener;

    .prologue
    .line 116
    iput-object p1, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mViewChangedListener:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator$OnViewChangedListener;

    .line 117
    return-void
.end method

.method public setOutAnimation(Landroid/content/Context;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resourceID"    # I

    .prologue
    .line 368
    invoke-static {p1, p2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 369
    return-void
.end method

.method public setOutAnimation(Landroid/view/animation/Animation;)V
    .registers 2
    .param p1, "outAnimation"    # Landroid/view/animation/Animation;

    .prologue
    .line 344
    iput-object p1, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mOutAnimation:Landroid/view/animation/Animation;

    .line 345
    return-void
.end method

.method showOnly(IIZLandroid/graphics/Point;)V
    .registers 7
    .param p1, "previousChild"    # I
    .param p2, "childIndex"    # I
    .param p3, "animate"    # Z
    .param p4, "origin"    # Landroid/graphics/Point;

    .prologue
    const/4 v0, 0x0

    .line 183
    if-eqz p3, :cond_17

    invoke-direct {p0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->shouldAnimate()Z

    move-result v1

    if-eqz v1, :cond_17

    const/4 p3, 0x1

    .line 185
    :goto_a
    iput-boolean v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mFirstTime:Z

    .line 187
    if-nez p3, :cond_19

    .line 188
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInstance:Lit/sephiroth/android/library/viewrevealanimator/RevealAnimator;

    invoke-interface {v0, p1, p2}, Lit/sephiroth/android/library/viewrevealanimator/RevealAnimator;->showOnlyNoAnimation(II)V

    .line 189
    invoke-virtual {p0, p1, p2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->onViewChanged(II)V

    .line 193
    :goto_16
    return-void

    :cond_17
    move p3, v0

    .line 183
    goto :goto_a

    .line 191
    :cond_19
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInstance:Lit/sephiroth/android/library/viewrevealanimator/RevealAnimator;

    invoke-interface {v0, p1, p2, p4}, Lit/sephiroth/android/library/viewrevealanimator/RevealAnimator;->showOnly(IILandroid/graphics/Point;)V

    goto :goto_16
.end method
