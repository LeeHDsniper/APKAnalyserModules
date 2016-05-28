.class Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;
.super Lit/sephiroth/android/library/viewrevealanimator/RevealAnimatorImpl;
.source "LollipopRevealAnimatorImpl.java"


# instance fields
.field private mAnimator:Landroid/animation/Animator;

.field private mAnimatorAnimating:Z


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;)V
    .registers 2
    .param p1, "animator"    # Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/viewrevealanimator/RevealAnimatorImpl;-><init>(Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;)V

    .line 24
    return-void
.end method

.method static synthetic access$002(Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;Z)Z
    .registers 2
    .param p0, "x0"    # Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;
    .param p1, "x1"    # Z

    .prologue
    .line 18
    iput-boolean p1, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->mAnimatorAnimating:Z

    return p1
.end method

.method static synthetic access$100(Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;IIZLandroid/graphics/Point;)V
    .registers 5
    .param p0, "x0"    # Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # Z
    .param p4, "x4"    # Landroid/graphics/Point;

    .prologue
    .line 18
    invoke-direct {p0, p1, p2, p3, p4}, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->circularReveal(IIZLandroid/graphics/Point;)V

    return-void
.end method

.method private circularHide(IILandroid/graphics/Point;)V
    .registers 14
    .param p1, "previousIndex"    # I
    .param p2, "nextIndex"    # I
    .param p3, "origin"    # Landroid/graphics/Point;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 34
    const/4 v6, 0x1

    iput-boolean v6, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->mAnimatorAnimating:Z

    .line 35
    iget-object v6, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    invoke-virtual {v6, p1}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 36
    .local v5, "previousView":Landroid/view/View;
    iget-object v6, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    invoke-virtual {v6, v5}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getViewRadius(Landroid/view/View;)I

    move-result v1

    .line 37
    .local v1, "finalRadius":I
    iget-object v6, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    invoke-virtual {v6, v5}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getViewCenter(Landroid/view/View;)Landroid/graphics/Point;

    move-result-object v4

    .line 39
    .local v4, "newPoint":Landroid/graphics/Point;
    if-eqz p3, :cond_31

    .line 40
    invoke-static {p3, v4}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->distance(Landroid/graphics/Point;Landroid/graphics/Point;)D

    move-result-wide v2

    .line 41
    .local v2, "distance":D
    int-to-double v6, v1

    add-double/2addr v6, v2

    double-to-int v1, v6

    .line 42
    new-instance v4, Landroid/graphics/Point;

    .end local v4    # "newPoint":Landroid/graphics/Point;
    iget v6, p3, Landroid/graphics/Point;->x:I

    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v7

    sub-int/2addr v6, v7

    iget v7, p3, Landroid/graphics/Point;->y:I

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-direct {v4, v6, v7}, Landroid/graphics/Point;-><init>(II)V

    .line 46
    .end local v2    # "distance":D
    .restart local v4    # "newPoint":Landroid/graphics/Point;
    :cond_31
    iget v6, v4, Landroid/graphics/Point;->x:I

    iget v7, v4, Landroid/graphics/Point;->y:I

    int-to-float v8, v1

    const/4 v9, 0x0

    invoke-static {v5, v6, v7, v8, v9}, Landroid/view/ViewAnimationUtils;->createCircularReveal(Landroid/view/View;IIFF)Landroid/animation/Animator;

    move-result-object v0

    .line 47
    .local v0, "animator":Landroid/animation/Animator;
    new-instance v6, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;

    invoke-direct {v6, p0, p1, p2, p3}, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$1;-><init>(Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;IILandroid/graphics/Point;)V

    invoke-virtual {v0, v6}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 78
    iput-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->mAnimator:Landroid/animation/Animator;

    .line 79
    iget-object v6, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    invoke-virtual {v6}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getAnimationDuration()I

    move-result v6

    int-to-long v6, v6

    invoke-virtual {v0, v6, v7}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 80
    iget-object v6, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    invoke-virtual {v6}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 81
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 83
    return-void
.end method

.method private circularReveal(IIZLandroid/graphics/Point;)V
    .registers 23
    .param p1, "previousIndex"    # I
    .param p2, "nextIndex"    # I
    .param p3, "hideBeforeReveal"    # Z
    .param p4, "origin"    # Landroid/graphics/Point;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 95
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->mAnimatorAnimating:Z

    .line 96
    if-nez p3, :cond_50

    move/from16 v0, p2

    move/from16 v1, p1

    if-le v0, v1, :cond_4e

    const/4 v15, 0x1

    .line 97
    .local v15, "isReveal":Z
    :goto_e
    move-object/from16 v0, p0

    iget-object v2, v0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    move/from16 v0, p2

    invoke-virtual {v2, v0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getChildAt(I)Landroid/view/View;

    move-result-object v17

    .line 98
    .local v17, "nextView":Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v2, v0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    move/from16 v0, p1

    invoke-virtual {v2, v0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 99
    .local v8, "previousView":Landroid/view/View;
    if-eqz v15, :cond_52

    move-object/from16 v4, v17

    .line 101
    .local v4, "targetView":Landroid/view/View;
    :goto_26
    if-eqz p3, :cond_54

    .line 102
    invoke-virtual/range {p0 .. p2}, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->showOnlyNoAnimation(II)V

    .line 107
    :goto_2b
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v2

    if-eqz v2, :cond_37

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v2

    if-nez v2, :cond_5b

    .line 108
    :cond_37
    invoke-virtual {v4}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v9

    new-instance v2, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;

    move-object/from16 v3, p0

    move/from16 v5, p1

    move/from16 v6, p2

    move/from16 v7, p3

    move-object/from16 v8, p4

    invoke-direct/range {v2 .. v8}, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$2;-><init>(Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;Landroid/view/View;IIZLandroid/graphics/Point;)V

    .end local v8    # "previousView":Landroid/view/View;
    invoke-virtual {v9, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 184
    :goto_4d
    return-void

    .line 96
    .end local v4    # "targetView":Landroid/view/View;
    .end local v15    # "isReveal":Z
    .end local v17    # "nextView":Landroid/view/View;
    :cond_4e
    const/4 v15, 0x0

    goto :goto_e

    :cond_50
    const/4 v15, 0x1

    goto :goto_e

    .restart local v8    # "previousView":Landroid/view/View;
    .restart local v15    # "isReveal":Z
    .restart local v17    # "nextView":Landroid/view/View;
    :cond_52
    move-object v4, v8

    .line 99
    goto :goto_26

    .line 104
    .restart local v4    # "targetView":Landroid/view/View;
    :cond_54
    const/4 v2, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2b

    .line 131
    :cond_5b
    move-object/from16 v0, p0

    iget-object v2, v0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    invoke-virtual {v2, v4}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getViewRadius(Landroid/view/View;)I

    move-result v14

    .line 132
    .local v14, "finalRadius":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    invoke-virtual {v2, v4}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getViewCenter(Landroid/view/View;)Landroid/graphics/Point;

    move-result-object v16

    .line 134
    .local v16, "newPoint":Landroid/graphics/Point;
    if-eqz p4, :cond_91

    .line 135
    move-object/from16 v0, p4

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->distance(Landroid/graphics/Point;Landroid/graphics/Point;)D

    move-result-wide v12

    .line 136
    .local v12, "distance":D
    int-to-double v2, v14

    add-double/2addr v2, v12

    double-to-int v14, v2

    .line 137
    new-instance v16, Landroid/graphics/Point;

    .end local v16    # "newPoint":Landroid/graphics/Point;
    move-object/from16 v0, p4

    iget v2, v0, Landroid/graphics/Point;->x:I

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int/2addr v2, v3

    move-object/from16 v0, p4

    iget v3, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v5

    sub-int/2addr v3, v5

    move-object/from16 v0, v16

    invoke-direct {v0, v2, v3}, Landroid/graphics/Point;-><init>(II)V

    .line 140
    .end local v12    # "distance":D
    .restart local v16    # "newPoint":Landroid/graphics/Point;
    :cond_91
    move-object/from16 v0, v16

    iget v5, v0, Landroid/graphics/Point;->x:I

    move-object/from16 v0, v16

    iget v6, v0, Landroid/graphics/Point;->y:I

    if-eqz v15, :cond_d0

    const/4 v2, 0x0

    move v3, v2

    :goto_9d
    if-eqz v15, :cond_d3

    int-to-float v2, v14

    .line 141
    :goto_a0
    invoke-static {v4, v5, v6, v3, v2}, Landroid/view/ViewAnimationUtils;->createCircularReveal(Landroid/view/View;IIFF)Landroid/animation/Animator;

    move-result-object v11

    .line 143
    .local v11, "animator":Landroid/animation/Animator;
    new-instance v5, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;

    move-object/from16 v6, p0

    move/from16 v7, p3

    move/from16 v9, p1

    move/from16 v10, p2

    invoke-direct/range {v5 .. v10}, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl$3;-><init>(Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;ZLandroid/view/View;II)V

    invoke-virtual {v11, v5}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 180
    move-object/from16 v0, p0

    iput-object v11, v0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->mAnimator:Landroid/animation/Animator;

    .line 181
    move-object/from16 v0, p0

    iget-object v2, v0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget v2, v2, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mAnimationDuration:I

    int-to-long v2, v2

    invoke-virtual {v11, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 182
    move-object/from16 v0, p0

    iget-object v2, v0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-object v2, v2, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v11, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 183
    invoke-virtual {v11}, Landroid/animation/Animator;->start()V

    goto/16 :goto_4d

    .line 140
    .end local v11    # "animator":Landroid/animation/Animator;
    :cond_d0
    int-to-float v2, v14

    move v3, v2

    goto :goto_9d

    :cond_d3
    const/4 v2, 0x0

    goto :goto_a0
.end method


# virtual methods
.method public shouldAnimate()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 218
    iget-boolean v1, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->mAnimatorAnimating:Z

    if-eqz v1, :cond_6

    .line 226
    :cond_5
    :goto_5
    return v0

    .line 222
    :cond_6
    iget-object v1, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-boolean v1, v1, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mAnimateFirstTime:Z

    if-nez v1, :cond_12

    iget-object v1, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    iget-boolean v1, v1, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->mFirstTime:Z

    if-nez v1, :cond_5

    .line 226
    :cond_12
    const/4 v0, 0x1

    goto :goto_5
.end method

.method public showOnly(IILandroid/graphics/Point;)V
    .registers 5
    .param p1, "previousChild"    # I
    .param p2, "childIndex"    # I
    .param p3, "origin"    # Landroid/graphics/Point;

    .prologue
    .line 188
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    invoke-virtual {v0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getHideBeforeReveal()Z

    move-result v0

    if-nez v0, :cond_12

    .line 189
    iget-object v0, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    invoke-virtual {v0}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getHideBeforeReveal()Z

    move-result v0

    invoke-direct {p0, p1, p2, v0, p3}, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->circularReveal(IIZLandroid/graphics/Point;)V

    .line 193
    :goto_11
    return-void

    .line 191
    :cond_12
    invoke-direct {p0, p1, p2, p3}, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->circularHide(IILandroid/graphics/Point;)V

    goto :goto_11
.end method

.method public showOnlyNoAnimation(II)V
    .registers 6
    .param p1, "previousIndex"    # I
    .param p2, "childIndex"    # I

    .prologue
    .line 201
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v2, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    invoke-virtual {v2}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1b

    .line 202
    iget-object v2, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->parent:Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;

    invoke-virtual {v2, v1}, Lit/sephiroth/android/library/viewrevealanimator/ViewRevealAnimator;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 203
    .local v0, "child":Landroid/view/View;
    if-ne v1, p2, :cond_18

    const/4 v2, 0x0

    :goto_12
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 201
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 203
    :cond_18
    const/16 v2, 0x8

    goto :goto_12

    .line 206
    .end local v0    # "child":Landroid/view/View;
    :cond_1b
    iget-object v2, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->mAnimator:Landroid/animation/Animator;

    if-eqz v2, :cond_24

    .line 207
    iget-object v2, p0, Lit/sephiroth/android/library/viewrevealanimator/LollipopRevealAnimatorImpl;->mAnimator:Landroid/animation/Animator;

    invoke-virtual {v2}, Landroid/animation/Animator;->cancel()V

    .line 209
    :cond_24
    return-void
.end method
