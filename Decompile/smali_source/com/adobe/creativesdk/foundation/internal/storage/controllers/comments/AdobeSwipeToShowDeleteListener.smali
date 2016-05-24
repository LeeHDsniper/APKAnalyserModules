.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;
.super Ljava/lang/Object;
.source "AdobeSwipeToShowDeleteListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private isButtonVisible:Z

.field private mAnimationTime:J

.field private mDownX:F

.field private mDownY:F

.field private mMaxFlingVelocity:I

.field private mMinFlingVelocity:I

.field private mSlop:I

.field private mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

.field private mSwiping:Z

.field private mSwipingSlop:I

.field private mTranslationX:F

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private mView:Landroid/view/View;

.field private mViewWidth:I

.field private maxSwipeLimit:I


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;I)V
    .registers 8
    .param p1, "view"    # Landroid/view/View;
    .param p2, "commandHandler"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;
    .param p3, "maxSwipeLimit"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v1, 0x1

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mViewWidth:I

    .line 32
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->isButtonVisible:Z

    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 37
    .local v0, "vc":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSlop:I

    .line 38
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v1

    mul-int/lit8 v1, v1, 0x10

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mMinFlingVelocity:I

    .line 39
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mMaxFlingVelocity:I

    .line 40
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x10e0000

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v2, v1

    iput-wide v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mAnimationTime:J

    .line 42
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    .line 43
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    .line 44
    iput p3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->maxSwipeLimit:I

    .line 45
    return-void
.end method

.method private animateDeleteButton(F)V
    .registers 7
    .param p1, "x"    # F

    .prologue
    .line 54
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    const-string v2, "x"

    const/4 v3, 0x1

    new-array v3, v3, [F

    const/4 v4, 0x0

    aput p1, v3, v4

    invoke-static {v1, v2, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 55
    .local v0, "animator":Landroid/animation/ObjectAnimator;
    const-wide/16 v2, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 56
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 57
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 16
    .param p1, "v"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .prologue
    .line 60
    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mTranslationX:F

    const/4 v11, 0x0

    invoke-virtual {p2, v10, v11}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 62
    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mViewWidth:I

    const/4 v11, 0x2

    if-ge v10, v11, :cond_13

    .line 63
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getWidth()I

    move-result v10

    iput v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mViewWidth:I

    .line 65
    :cond_13
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v10

    packed-switch v10, :pswitch_data_2b4

    .line 274
    :cond_1a
    :goto_1a
    const/4 v10, 0x0

    :goto_1b
    return v10

    .line 70
    :pswitch_1c
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v10

    iput v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mDownX:F

    .line 71
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v10

    iput v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mDownY:F

    .line 72
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    invoke-interface {v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->canSwipe()Z

    move-result v10

    if-eqz v10, :cond_3b

    .line 74
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v10

    iput-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 75
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v10, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 77
    :cond_3b
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    if-eqz v10, :cond_49

    .line 78
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    const/4 v11, 0x1

    invoke-interface {v10, v11}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 80
    :cond_49
    const/4 v10, 0x1

    goto :goto_1b

    .line 83
    :pswitch_4b
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    invoke-interface {v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->stoppedSwiping()V

    .line 85
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v10, :cond_1a

    .line 89
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    invoke-interface {v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->canSwipe()Z

    move-result v10

    if-nez v10, :cond_62

    .line 91
    const/4 v10, 0x0

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->animateDeleteButton(F)V

    .line 92
    const/4 v10, 0x0

    goto :goto_1b

    .line 97
    :cond_62
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v10

    iget v11, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mDownX:F

    sub-float v3, v10, v11

    .line 98
    .local v3, "deltaX":F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    .line 99
    .local v2, "currentX":F
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v10, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 100
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v11, 0x3e8

    invoke-virtual {v10, v11}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 101
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v10}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v8

    .line 102
    .local v8, "velocityX":F
    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 103
    .local v0, "absVelocityX":F
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v10}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v10

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 104
    .local v1, "absVelocityY":F
    const/4 v5, 0x0

    .line 105
    .local v5, "dismiss":Z
    const/4 v6, 0x0

    .line 107
    .local v6, "dismissRight":Z
    const/4 v7, 0x0

    .line 108
    .local v7, "velocityHandled":Z
    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mMinFlingVelocity:I

    int-to-float v10, v10

    cmpg-float v10, v10, v0

    if-gtz v10, :cond_c8

    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mMaxFlingVelocity:I

    int-to-float v10, v10

    cmpg-float v10, v0, v10

    if-gtz v10, :cond_c8

    iget-boolean v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwiping:Z

    if-eqz v10, :cond_c8

    .line 110
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v10}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v10

    const/4 v11, 0x0

    cmpl-float v10, v10, v11

    if-lez v10, :cond_112

    const/4 v6, 0x1

    .line 112
    :goto_af
    const/4 v10, 0x0

    cmpg-float v10, v8, v10

    if-gez v10, :cond_114

    const/4 v10, 0x0

    cmpg-float v10, v3, v10

    if-gez v10, :cond_114

    .line 113
    const/4 v7, 0x1

    .line 114
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    const/4 v11, 0x1

    const/4 v12, 0x1

    invoke-interface {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->handleDeleteVisibility(ZZ)V

    .line 115
    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->maxSwipeLimit:I

    neg-int v10, v10

    int-to-float v10, v10

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->animateDeleteButton(F)V

    .line 126
    :cond_c8
    :goto_c8
    if-nez v7, :cond_ee

    iget-boolean v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwiping:Z

    if-eqz v10, :cond_ee

    .line 128
    const/4 v10, 0x0

    cmpg-float v10, v3, v10

    if-gez v10, :cond_12b

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v10

    iget v11, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->maxSwipeLimit:I

    div-int/lit8 v11, v11, 0x2

    int-to-float v11, v11

    cmpl-float v10, v10, v11

    if-ltz v10, :cond_12b

    .line 129
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    const/4 v11, 0x1

    const/4 v12, 0x1

    invoke-interface {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->handleDeleteVisibility(ZZ)V

    .line 130
    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->maxSwipeLimit:I

    neg-int v10, v10

    int-to-float v10, v10

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->animateDeleteButton(F)V

    .line 152
    :cond_ee
    :goto_ee
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v10}, Landroid/view/VelocityTracker;->recycle()V

    .line 153
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 154
    const/4 v10, 0x0

    iput v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mTranslationX:F

    .line 155
    const/4 v10, 0x0

    iput v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mDownX:F

    .line 156
    const/4 v10, 0x0

    iput v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mDownY:F

    .line 157
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwiping:Z

    .line 158
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    if-eqz v10, :cond_1a

    .line 159
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    const/4 v11, 0x0

    invoke-interface {v10, v11}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto/16 :goto_1a

    .line 110
    :cond_112
    const/4 v6, 0x0

    goto :goto_af

    .line 118
    :cond_114
    const/4 v10, 0x0

    cmpl-float v10, v8, v10

    if-lez v10, :cond_c8

    const/4 v10, 0x0

    cmpl-float v10, v3, v10

    if-lez v10, :cond_c8

    .line 119
    const/4 v7, 0x1

    .line 120
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-interface {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->handleDeleteVisibility(ZZ)V

    .line 121
    const/4 v10, 0x0

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->animateDeleteButton(F)V

    goto :goto_c8

    .line 132
    :cond_12b
    const/4 v10, 0x0

    cmpg-float v10, v3, v10

    if-gez v10, :cond_149

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v10

    iget v11, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->maxSwipeLimit:I

    div-int/lit8 v11, v11, 0x2

    int-to-float v11, v11

    cmpg-float v10, v10, v11

    if-gez v10, :cond_149

    .line 133
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-interface {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->handleDeleteVisibility(ZZ)V

    .line 134
    const/4 v10, 0x0

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->animateDeleteButton(F)V

    goto :goto_ee

    .line 136
    :cond_149
    const/4 v10, 0x0

    cmpl-float v10, v3, v10

    if-lez v10, :cond_16f

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v10

    iget v11, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->maxSwipeLimit:I

    div-int/lit8 v11, v11, 0x2

    int-to-float v11, v11

    cmpl-float v10, v10, v11

    if-ltz v10, :cond_16f

    .line 137
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    invoke-interface {v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->isVisible()Z

    move-result v10

    if-eqz v10, :cond_ee

    .line 138
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-interface {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->handleDeleteVisibility(ZZ)V

    .line 139
    const/4 v10, 0x0

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->animateDeleteButton(F)V

    goto :goto_ee

    .line 142
    :cond_16f
    const/4 v10, 0x0

    cmpl-float v10, v3, v10

    if-lez v10, :cond_ee

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v10

    iget v11, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->maxSwipeLimit:I

    div-int/lit8 v11, v11, 0x2

    int-to-float v11, v11

    cmpg-float v10, v10, v11

    if-gez v10, :cond_ee

    .line 144
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    invoke-interface {v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->isVisible()Z

    move-result v10

    if-eqz v10, :cond_ee

    .line 146
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    const/4 v11, 0x1

    const/4 v12, 0x1

    invoke-interface {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->handleDeleteVisibility(ZZ)V

    .line 147
    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->maxSwipeLimit:I

    neg-int v10, v10

    int-to-float v10, v10

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->animateDeleteButton(F)V

    goto/16 :goto_ee

    .line 164
    .end local v0    # "absVelocityX":F
    .end local v1    # "absVelocityY":F
    .end local v2    # "currentX":F
    .end local v3    # "deltaX":F
    .end local v5    # "dismiss":Z
    .end local v6    # "dismissRight":Z
    .end local v7    # "velocityHandled":Z
    .end local v8    # "velocityX":F
    :pswitch_199
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v10, :cond_1a

    .line 168
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    if-eqz v10, :cond_1e0

    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    invoke-interface {v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->isSwiping()Z

    move-result v10

    if-eqz v10, :cond_1e0

    .line 171
    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->maxSwipeLimit:I

    neg-int v10, v10

    int-to-float v10, v10

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->animateDeleteButton(F)V

    .line 172
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    const/4 v11, 0x1

    const/4 v12, 0x1

    invoke-interface {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->handleDeleteVisibility(ZZ)V

    .line 180
    :goto_1b7
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    invoke-interface {v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->stoppedSwiping()V

    .line 183
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v10}, Landroid/view/VelocityTracker;->recycle()V

    .line 184
    const/4 v10, 0x0

    iput-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 185
    const/4 v10, 0x0

    iput v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mTranslationX:F

    .line 186
    const/4 v10, 0x0

    iput v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mDownX:F

    .line 187
    const/4 v10, 0x0

    iput v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mDownY:F

    .line 188
    const/4 v10, 0x0

    iput-boolean v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwiping:Z

    .line 189
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    if-eqz v10, :cond_1a

    .line 190
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    const/4 v11, 0x0

    invoke-interface {v10, v11}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto/16 :goto_1a

    .line 177
    :cond_1e0
    const/4 v10, 0x0

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->animateDeleteButton(F)V

    .line 178
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-interface {v10, v11, v12}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->handleDeleteVisibility(ZZ)V

    goto :goto_1b7

    .line 196
    :pswitch_1ec
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v10, :cond_1a

    .line 199
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    invoke-interface {v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->canSwipe()Z

    move-result v10

    const/4 v11, 0x1

    if-ne v10, v11, :cond_29f

    .line 200
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    if-eqz v10, :cond_207

    .line 201
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    const/4 v11, 0x1

    invoke-interface {v10, v11}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 203
    :cond_207
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v10, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 204
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v10

    iget v11, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mDownX:F

    sub-float v3, v10, v11

    .line 205
    .restart local v3    # "deltaX":F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v10

    iget v11, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mDownY:F

    sub-float v4, v10, v11

    .line 206
    .local v4, "deltaY":F
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v10

    iget v11, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSlop:I

    int-to-float v11, v11

    cmpl-float v10, v10, v11

    if-lez v10, :cond_273

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v10

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v11

    const/high16 v12, 0x40000000

    div-float/2addr v11, v12

    cmpg-float v10, v10, v11

    if-gez v10, :cond_273

    .line 207
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    invoke-interface {v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->startedSwiping()V

    .line 208
    const/4 v10, 0x1

    iput-boolean v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwiping:Z

    .line 209
    const/4 v10, 0x0

    cmpl-float v10, v3, v10

    if-lez v10, :cond_26f

    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSlop:I

    :goto_245
    iput v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipingSlop:I

    .line 227
    :cond_247
    :goto_247
    iget-boolean v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwiping:Z

    if-eqz v10, :cond_1a

    .line 228
    const/4 v10, 0x0

    cmpl-float v10, v3, v10

    if-lez v10, :cond_282

    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    invoke-interface {v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->isVisible()Z

    move-result v10

    if-eqz v10, :cond_282

    .line 230
    move v9, v3

    .line 232
    .local v9, "x":F
    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->maxSwipeLimit:I

    int-to-float v10, v10

    cmpl-float v10, v9, v10

    if-lez v10, :cond_263

    .line 233
    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->maxSwipeLimit:I

    int-to-float v9, v10

    .line 234
    :cond_263
    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->maxSwipeLimit:I

    int-to-float v10, v10

    sub-float v9, v10, v9

    .line 236
    neg-float v10, v9

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->animateDeleteButton(F)V

    .line 254
    .end local v9    # "x":F
    :cond_26c
    :goto_26c
    const/4 v10, 0x1

    goto/16 :goto_1b

    .line 209
    :cond_26f
    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSlop:I

    neg-int v10, v10

    goto :goto_245

    .line 222
    :cond_273
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    if-eqz v10, :cond_247

    .line 223
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    const/4 v11, 0x0

    invoke-interface {v10, v11}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_247

    .line 238
    :cond_282
    const/4 v10, 0x0

    cmpg-float v10, v3, v10

    if-gez v10, :cond_26c

    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mSwipeCommandHandler:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;

    invoke-interface {v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/IAdobeSwipeCommandHandler;->isVisible()Z

    move-result v10

    if-nez v10, :cond_26c

    .line 240
    neg-float v9, v3

    .line 242
    .restart local v9    # "x":F
    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->maxSwipeLimit:I

    int-to-float v10, v10

    cmpl-float v10, v9, v10

    if-lez v10, :cond_29a

    .line 243
    iget v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->maxSwipeLimit:I

    int-to-float v9, v10

    .line 244
    :cond_29a
    neg-float v10, v9

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->animateDeleteButton(F)V

    goto :goto_26c

    .line 265
    .end local v3    # "deltaX":F
    .end local v4    # "deltaY":F
    .end local v9    # "x":F
    :cond_29f
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    if-eqz v10, :cond_2ad

    .line 266
    iget-object v10, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->mView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    const/4 v11, 0x0

    invoke-interface {v10, v11}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 267
    :cond_2ad
    const/4 v10, 0x0

    invoke-direct {p0, v10}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeSwipeToShowDeleteListener;->animateDeleteButton(F)V

    .line 268
    const/4 v10, 0x0

    goto/16 :goto_1b

    .line 65
    :pswitch_data_2b4
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_4b
        :pswitch_1ec
        :pswitch_199
    .end packed-switch
.end method
