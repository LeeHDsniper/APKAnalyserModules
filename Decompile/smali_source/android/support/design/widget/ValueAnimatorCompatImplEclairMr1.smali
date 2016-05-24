.class Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;
.super Landroid/support/design/widget/ValueAnimatorCompat$Impl;
.source "ValueAnimatorCompatImplEclairMr1.java"


# static fields
.field private static final sHandler:Landroid/os/Handler;


# instance fields
.field private mAnimatedFraction:F

.field private mDuration:I

.field private final mFloatValues:[F

.field private final mIntValues:[I

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mIsRunning:Z

.field private mListener:Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorListenerProxy;

.field private final mRunnable:Ljava/lang/Runnable;

.field private mStartTime:J

.field private mUpdateListener:Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorUpdateListenerProxy;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 33
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->sHandler:Landroid/os/Handler;

    return-void
.end method

.method constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x2

    .line 28
    invoke-direct {p0}, Landroid/support/design/widget/ValueAnimatorCompat$Impl;-><init>()V

    .line 38
    new-array v0, v1, [I

    iput-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mIntValues:[I

    .line 39
    new-array v0, v1, [F

    iput-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mFloatValues:[F

    .line 41
    const/16 v0, 0xc8

    iput v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mDuration:I

    .line 180
    new-instance v0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1$1;

    invoke-direct {v0, p0}, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1$1;-><init>(Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;)V

    iput-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->update()V

    return-void
.end method

.method private update()V
    .registers 11

    .prologue
    .line 151
    iget-boolean v3, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mIsRunning:Z

    if-eqz v3, :cond_41

    .line 153
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mStartTime:J

    sub-long v0, v4, v6

    .line 154
    .local v0, "elapsed":J
    long-to-float v3, v0

    iget v4, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mDuration:I

    int-to-float v4, v4

    div-float v2, v3, v4

    .line 155
    .local v2, "linearFraction":F
    iget-object v3, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mInterpolator:Landroid/view/animation/Interpolator;

    if-eqz v3, :cond_1c

    iget-object v3, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v3, v2}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v2

    .end local v2    # "linearFraction":F
    :cond_1c
    iput v2, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mAnimatedFraction:F

    .line 160
    iget-object v3, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mUpdateListener:Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorUpdateListenerProxy;

    if-eqz v3, :cond_27

    .line 161
    iget-object v3, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mUpdateListener:Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorUpdateListenerProxy;

    invoke-interface {v3}, Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorUpdateListenerProxy;->onAnimationUpdate()V

    .line 165
    :cond_27
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mStartTime:J

    iget v3, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mDuration:I

    int-to-long v8, v3

    add-long/2addr v6, v8

    cmp-long v3, v4, v6

    if-ltz v3, :cond_41

    .line 166
    const/4 v3, 0x0

    iput-boolean v3, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mIsRunning:Z

    .line 168
    iget-object v3, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mListener:Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorListenerProxy;

    if-eqz v3, :cond_41

    .line 169
    iget-object v3, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mListener:Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorListenerProxy;

    invoke-interface {v3}, Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorListenerProxy;->onAnimationEnd()V

    .line 174
    .end local v0    # "elapsed":J
    :cond_41
    iget-boolean v3, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mIsRunning:Z

    if-eqz v3, :cond_4e

    .line 176
    sget-object v3, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->sHandler:Landroid/os/Handler;

    iget-object v4, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mRunnable:Ljava/lang/Runnable;

    const-wide/16 v6, 0xa

    invoke-virtual {v3, v4, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 178
    :cond_4e
    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 3

    .prologue
    .line 118
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mIsRunning:Z

    .line 119
    sget-object v0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->sHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 121
    iget-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mListener:Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorListenerProxy;

    if-eqz v0, :cond_13

    .line 122
    iget-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mListener:Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorListenerProxy;

    invoke-interface {v0}, Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorListenerProxy;->onAnimationCancel()V

    .line 124
    :cond_13
    return-void
.end method

.method public getAnimatedFraction()F
    .registers 2

    .prologue
    .line 128
    iget v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mAnimatedFraction:F

    return v0
.end method

.method public getAnimatedIntValue()I
    .registers 4

    .prologue
    .line 97
    iget-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mIntValues:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v1, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mIntValues:[I

    const/4 v2, 0x1

    aget v1, v1, v2

    invoke-virtual {p0}, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->getAnimatedFraction()F

    move-result v2

    invoke-static {v0, v1, v2}, Landroid/support/design/widget/AnimationUtils;->lerp(IIF)I

    move-result v0

    return v0
.end method

.method public setIntValues(II)V
    .registers 5
    .param p1, "from"    # I
    .param p2, "to"    # I

    .prologue
    .line 91
    iget-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mIntValues:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 92
    iget-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mIntValues:[I

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 93
    return-void
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 2
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 76
    iput-object p1, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 77
    return-void
.end method

.method public setUpdateListener(Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorUpdateListenerProxy;)V
    .registers 2
    .param p1, "updateListener"    # Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorUpdateListenerProxy;

    .prologue
    .line 86
    iput-object p1, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mUpdateListener:Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorUpdateListenerProxy;

    .line 87
    return-void
.end method

.method public start()V
    .registers 5

    .prologue
    .line 50
    iget-boolean v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mIsRunning:Z

    if-eqz v0, :cond_5

    .line 67
    :goto_4
    return-void

    .line 55
    :cond_5
    iget-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mInterpolator:Landroid/view/animation/Interpolator;

    if-nez v0, :cond_10

    .line 56
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 59
    :cond_10
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mStartTime:J

    .line 60
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mIsRunning:Z

    .line 62
    iget-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mListener:Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorListenerProxy;

    if-eqz v0, :cond_22

    .line 63
    iget-object v0, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mListener:Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorListenerProxy;

    invoke-interface {v0}, Landroid/support/design/widget/ValueAnimatorCompat$Impl$AnimatorListenerProxy;->onAnimationStart()V

    .line 66
    :cond_22
    sget-object v0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->sHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroid/support/design/widget/ValueAnimatorCompatImplEclairMr1;->mRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0xa

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_4
.end method
