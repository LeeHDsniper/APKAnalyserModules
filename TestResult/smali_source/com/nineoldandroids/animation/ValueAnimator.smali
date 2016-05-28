.class public Lcom/nineoldandroids/animation/ValueAnimator;
.super Lcom/nineoldandroids/animation/Animator;
.source "ValueAnimator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;,
        Lcom/nineoldandroids/animation/ValueAnimator$AnimationHandler;
    }
.end annotation


# static fields
.field private static sAnimationHandler:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lcom/nineoldandroids/animation/ValueAnimator$AnimationHandler;",
            ">;"
        }
    .end annotation
.end field

.field private static final sAnimations:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/ValueAnimator;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final sDefaultInterpolator:Landroid/view/animation/Interpolator;

.field private static final sDelayedAnims:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/ValueAnimator;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final sEndingAnims:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/ValueAnimator;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final sFloatEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

.field private static sFrameDelay:J

.field private static final sIntEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

.field private static final sPendingAnimations:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/ValueAnimator;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final sReadyAnims:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/ValueAnimator;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private mCurrentFraction:F

.field private mCurrentIteration:I

.field private mDelayStartTime:J

.field private mDuration:J

.field mInitialized:Z

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mPlayingBackwards:Z

.field mPlayingState:I

.field private mRepeatCount:I

.field private mRepeatMode:I

.field private mRunning:Z

.field mSeekTime:J

.field private mStartDelay:J

.field mStartTime:J

.field private mStarted:Z

.field private mStartedDelay:Z

.field private mUpdateListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;",
            ">;"
        }
    .end annotation
.end field

.field mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

.field mValuesMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/nineoldandroids/animation/PropertyValuesHolder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 94
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lcom/nineoldandroids/animation/ValueAnimator;->sAnimationHandler:Ljava/lang/ThreadLocal;

    .line 98
    new-instance v0, Lcom/nineoldandroids/animation/ValueAnimator$1;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/ValueAnimator$1;-><init>()V

    sput-object v0, Lcom/nineoldandroids/animation/ValueAnimator;->sAnimations:Ljava/lang/ThreadLocal;

    .line 107
    new-instance v0, Lcom/nineoldandroids/animation/ValueAnimator$2;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/ValueAnimator$2;-><init>()V

    sput-object v0, Lcom/nineoldandroids/animation/ValueAnimator;->sPendingAnimations:Ljava/lang/ThreadLocal;

    .line 119
    new-instance v0, Lcom/nineoldandroids/animation/ValueAnimator$3;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/ValueAnimator$3;-><init>()V

    sput-object v0, Lcom/nineoldandroids/animation/ValueAnimator;->sDelayedAnims:Ljava/lang/ThreadLocal;

    .line 127
    new-instance v0, Lcom/nineoldandroids/animation/ValueAnimator$4;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/ValueAnimator$4;-><init>()V

    sput-object v0, Lcom/nineoldandroids/animation/ValueAnimator;->sEndingAnims:Ljava/lang/ThreadLocal;

    .line 135
    new-instance v0, Lcom/nineoldandroids/animation/ValueAnimator$5;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/ValueAnimator$5;-><init>()V

    sput-object v0, Lcom/nineoldandroids/animation/ValueAnimator;->sReadyAnims:Ljava/lang/ThreadLocal;

    .line 144
    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    sput-object v0, Lcom/nineoldandroids/animation/ValueAnimator;->sDefaultInterpolator:Landroid/view/animation/Interpolator;

    .line 148
    new-instance v0, Lcom/nineoldandroids/animation/IntEvaluator;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/IntEvaluator;-><init>()V

    sput-object v0, Lcom/nineoldandroids/animation/ValueAnimator;->sIntEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    .line 149
    new-instance v0, Lcom/nineoldandroids/animation/FloatEvaluator;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/FloatEvaluator;-><init>()V

    sput-object v0, Lcom/nineoldandroids/animation/ValueAnimator;->sFloatEvaluator:Lcom/nineoldandroids/animation/TypeEvaluator;

    .line 222
    const-wide/16 v0, 0xa

    sput-wide v0, Lcom/nineoldandroids/animation/ValueAnimator;->sFrameDelay:J

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 283
    invoke-direct {p0}, Lcom/nineoldandroids/animation/Animator;-><init>()V

    .line 85
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mSeekTime:J

    .line 155
    iput-boolean v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingBackwards:Z

    .line 161
    iput v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mCurrentIteration:I

    .line 166
    const/4 v0, 0x0

    iput v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mCurrentFraction:F

    .line 171
    iput-boolean v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartedDelay:Z

    .line 187
    iput v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingState:I

    .line 197
    iput-boolean v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mRunning:Z

    .line 203
    iput-boolean v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStarted:Z

    .line 209
    iput-boolean v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mInitialized:Z

    .line 216
    const-wide/16 v0, 0x12c

    iput-wide v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mDuration:J

    .line 219
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartDelay:J

    .line 226
    iput v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mRepeatCount:I

    .line 233
    const/4 v0, 0x1

    iput v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mRepeatMode:I

    .line 240
    sget-object v0, Lcom/nineoldandroids/animation/ValueAnimator;->sDefaultInterpolator:Landroid/view/animation/Interpolator;

    iput-object v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 245
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mUpdateListeners:Ljava/util/ArrayList;

    .line 284
    return-void
.end method

.method static synthetic access$000()Ljava/lang/ThreadLocal;
    .registers 1

    .prologue
    .line 43
    sget-object v0, Lcom/nineoldandroids/animation/ValueAnimator;->sAnimations:Ljava/lang/ThreadLocal;

    return-object v0
.end method

.method static synthetic access$100()Ljava/lang/ThreadLocal;
    .registers 1

    .prologue
    .line 43
    sget-object v0, Lcom/nineoldandroids/animation/ValueAnimator;->sDelayedAnims:Ljava/lang/ThreadLocal;

    return-object v0
.end method

.method static synthetic access$1000()J
    .registers 2

    .prologue
    .line 43
    sget-wide v0, Lcom/nineoldandroids/animation/ValueAnimator;->sFrameDelay:J

    return-wide v0
.end method

.method static synthetic access$200()Ljava/lang/ThreadLocal;
    .registers 1

    .prologue
    .line 43
    sget-object v0, Lcom/nineoldandroids/animation/ValueAnimator;->sPendingAnimations:Ljava/lang/ThreadLocal;

    return-object v0
.end method

.method static synthetic access$300(Lcom/nineoldandroids/animation/ValueAnimator;)J
    .registers 3
    .param p0, "x0"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 43
    iget-wide v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartDelay:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 1
    .param p0, "x0"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/nineoldandroids/animation/ValueAnimator;->startAnimation()V

    return-void
.end method

.method static synthetic access$500()Ljava/lang/ThreadLocal;
    .registers 1

    .prologue
    .line 43
    sget-object v0, Lcom/nineoldandroids/animation/ValueAnimator;->sReadyAnims:Ljava/lang/ThreadLocal;

    return-object v0
.end method

.method static synthetic access$600()Ljava/lang/ThreadLocal;
    .registers 1

    .prologue
    .line 43
    sget-object v0, Lcom/nineoldandroids/animation/ValueAnimator;->sEndingAnims:Ljava/lang/ThreadLocal;

    return-object v0
.end method

.method static synthetic access$700(Lcom/nineoldandroids/animation/ValueAnimator;J)Z
    .registers 4
    .param p0, "x0"    # Lcom/nineoldandroids/animation/ValueAnimator;
    .param p1, "x1"    # J

    .prologue
    .line 43
    invoke-direct {p0, p1, p2}, Lcom/nineoldandroids/animation/ValueAnimator;->delayedAnimationFrame(J)Z

    move-result v0

    return v0
.end method

.method static synthetic access$802(Lcom/nineoldandroids/animation/ValueAnimator;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/nineoldandroids/animation/ValueAnimator;
    .param p1, "x1"    # Z

    .prologue
    .line 43
    iput-boolean p1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mRunning:Z

    return p1
.end method

.method static synthetic access$900(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 1
    .param p0, "x0"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/nineoldandroids/animation/ValueAnimator;->endAnimation()V

    return-void
.end method

.method private delayedAnimationFrame(J)Z
    .registers 10
    .param p1, "currentTime"    # J

    .prologue
    const/4 v2, 0x1

    .line 1071
    iget-boolean v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartedDelay:Z

    if-nez v3, :cond_b

    .line 1072
    iput-boolean v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartedDelay:Z

    .line 1073
    iput-wide p1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mDelayStartTime:J

    .line 1084
    :cond_9
    const/4 v2, 0x0

    :goto_a
    return v2

    .line 1075
    :cond_b
    iget-wide v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mDelayStartTime:J

    sub-long v0, p1, v4

    .line 1076
    .local v0, "deltaTime":J
    iget-wide v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartDelay:J

    cmp-long v3, v0, v4

    if-lez v3, :cond_9

    .line 1079
    iget-wide v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartDelay:J

    sub-long v4, v0, v4

    sub-long v4, p1, v4

    iput-wide v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartTime:J

    .line 1080
    iput v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingState:I

    goto :goto_a
.end method

.method private endAnimation()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 1025
    sget-object v3, Lcom/nineoldandroids/animation/ValueAnimator;->sAnimations:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1026
    sget-object v3, Lcom/nineoldandroids/animation/ValueAnimator;->sPendingAnimations:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1027
    sget-object v3, Lcom/nineoldandroids/animation/ValueAnimator;->sDelayedAnims:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1028
    iput v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingState:I

    .line 1029
    iget-boolean v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mRunning:Z

    if-eqz v3, :cond_47

    iget-object v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mListeners:Ljava/util/ArrayList;

    if-eqz v3, :cond_47

    .line 1030
    iget-object v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 1032
    .local v2, "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 1033
    .local v1, "numListeners":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_39
    if-ge v0, v1, :cond_47

    .line 1034
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    invoke-interface {v3, p0}, Lcom/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V

    .line 1033
    add-int/lit8 v0, v0, 0x1

    goto :goto_39

    .line 1037
    .end local v0    # "i":I
    .end local v1    # "numListeners":I
    .end local v2    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_47
    iput-boolean v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mRunning:Z

    .line 1038
    iput-boolean v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStarted:Z

    .line 1039
    return-void
.end method

.method public static varargs ofFloat([F)Lcom/nineoldandroids/animation/ValueAnimator;
    .registers 2
    .param p0, "values"    # [F

    .prologue
    .line 315
    new-instance v0, Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/ValueAnimator;-><init>()V

    .line 316
    .local v0, "anim":Lcom/nineoldandroids/animation/ValueAnimator;
    invoke-virtual {v0, p0}, Lcom/nineoldandroids/animation/ValueAnimator;->setFloatValues([F)V

    .line 317
    return-object v0
.end method

.method public static varargs ofInt([I)Lcom/nineoldandroids/animation/ValueAnimator;
    .registers 2
    .param p0, "values"    # [I

    .prologue
    .line 298
    new-instance v0, Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/ValueAnimator;-><init>()V

    .line 299
    .local v0, "anim":Lcom/nineoldandroids/animation/ValueAnimator;
    invoke-virtual {v0, p0}, Lcom/nineoldandroids/animation/ValueAnimator;->setIntValues([I)V

    .line 300
    return-object v0
.end method

.method public static varargs ofObject(Lcom/nineoldandroids/animation/TypeEvaluator;[Ljava/lang/Object;)Lcom/nineoldandroids/animation/ValueAnimator;
    .registers 3
    .param p0, "evaluator"    # Lcom/nineoldandroids/animation/TypeEvaluator;
    .param p1, "values"    # [Ljava/lang/Object;

    .prologue
    .line 352
    new-instance v0, Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-direct {v0}, Lcom/nineoldandroids/animation/ValueAnimator;-><init>()V

    .line 353
    .local v0, "anim":Lcom/nineoldandroids/animation/ValueAnimator;
    invoke-virtual {v0, p1}, Lcom/nineoldandroids/animation/ValueAnimator;->setObjectValues([Ljava/lang/Object;)V

    .line 354
    invoke-virtual {v0, p0}, Lcom/nineoldandroids/animation/ValueAnimator;->setEvaluator(Lcom/nineoldandroids/animation/TypeEvaluator;)V

    .line 355
    return-object v0
.end method

.method private start(Z)V
    .registers 12
    .param p1, "playBackwards"    # Z

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 917
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v4

    if-nez v4, :cond_10

    .line 918
    new-instance v4, Landroid/util/AndroidRuntimeException;

    const-string v5, "Animators may only be run on Looper threads"

    invoke-direct {v4, v5}, Landroid/util/AndroidRuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 920
    :cond_10
    iput-boolean p1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingBackwards:Z

    .line 921
    iput v8, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mCurrentIteration:I

    .line 922
    iput v8, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingState:I

    .line 923
    iput-boolean v9, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStarted:Z

    .line 924
    iput-boolean v8, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartedDelay:Z

    .line 925
    sget-object v4, Lcom/nineoldandroids/animation/ValueAnimator;->sPendingAnimations:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v4, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 926
    iget-wide v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartDelay:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_57

    .line 928
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/ValueAnimator;->getCurrentPlayTime()J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lcom/nineoldandroids/animation/ValueAnimator;->setCurrentPlayTime(J)V

    .line 929
    iput v8, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingState:I

    .line 930
    iput-boolean v9, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mRunning:Z

    .line 932
    iget-object v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mListeners:Ljava/util/ArrayList;

    if-eqz v4, :cond_57

    .line 933
    iget-object v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    .line 935
    .local v3, "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 936
    .local v2, "numListeners":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_49
    if-ge v1, v2, :cond_57

    .line 937
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    invoke-interface {v4, p0}, Lcom/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V

    .line 936
    add-int/lit8 v1, v1, 0x1

    goto :goto_49

    .line 941
    .end local v1    # "i":I
    .end local v2    # "numListeners":I
    .end local v3    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_57
    sget-object v4, Lcom/nineoldandroids/animation/ValueAnimator;->sAnimationHandler:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nineoldandroids/animation/ValueAnimator$AnimationHandler;

    .line 942
    .local v0, "animationHandler":Lcom/nineoldandroids/animation/ValueAnimator$AnimationHandler;
    if-nez v0, :cond_6c

    .line 943
    new-instance v0, Lcom/nineoldandroids/animation/ValueAnimator$AnimationHandler;

    .end local v0    # "animationHandler":Lcom/nineoldandroids/animation/ValueAnimator$AnimationHandler;
    const/4 v4, 0x0

    invoke-direct {v0, v4}, Lcom/nineoldandroids/animation/ValueAnimator$AnimationHandler;-><init>(Lcom/nineoldandroids/animation/ValueAnimator$1;)V

    .line 944
    .restart local v0    # "animationHandler":Lcom/nineoldandroids/animation/ValueAnimator$AnimationHandler;
    sget-object v4, Lcom/nineoldandroids/animation/ValueAnimator;->sAnimationHandler:Ljava/lang/ThreadLocal;

    invoke-virtual {v4, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 946
    :cond_6c
    invoke-virtual {v0, v8}, Lcom/nineoldandroids/animation/ValueAnimator$AnimationHandler;->sendEmptyMessage(I)Z

    .line 947
    return-void
.end method

.method private startAnimation()V
    .registers 9

    .prologue
    .line 1046
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/ValueAnimator;->initAnimation()V

    .line 1047
    sget-object v3, Lcom/nineoldandroids/animation/ValueAnimator;->sAnimations:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1048
    iget-wide v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartDelay:J

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-lez v3, :cond_35

    iget-object v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mListeners:Ljava/util/ArrayList;

    if-eqz v3, :cond_35

    .line 1051
    iget-object v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 1053
    .local v2, "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 1054
    .local v1, "numListeners":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_27
    if-ge v0, v1, :cond_35

    .line 1055
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    invoke-interface {v3, p0}, Lcom/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V

    .line 1054
    add-int/lit8 v0, v0, 0x1

    goto :goto_27

    .line 1058
    .end local v0    # "i":I
    .end local v1    # "numListeners":I
    .end local v2    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_35
    return-void
.end method


# virtual methods
.method public addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;

    .prologue
    .line 820
    iget-object v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mUpdateListeners:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 821
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mUpdateListeners:Ljava/util/ArrayList;

    .line 823
    :cond_b
    iget-object v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mUpdateListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 824
    return-void
.end method

.method animateValue(F)V
    .registers 6
    .param p1, "fraction"    # F

    .prologue
    .line 1169
    iget-object v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v3, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result p1

    .line 1170
    iput p1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mCurrentFraction:F

    .line 1171
    iget-object v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    array-length v2, v3

    .line 1172
    .local v2, "numValues":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    if-ge v0, v2, :cond_18

    .line 1173
    iget-object v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    aget-object v3, v3, v0

    invoke-virtual {v3, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->calculateValue(F)V

    .line 1172
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 1175
    :cond_18
    iget-object v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mUpdateListeners:Ljava/util/ArrayList;

    if-eqz v3, :cond_33

    .line 1176
    iget-object v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mUpdateListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 1177
    .local v1, "numListeners":I
    const/4 v0, 0x0

    :goto_23
    if-ge v0, v1, :cond_33

    .line 1178
    iget-object v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mUpdateListeners:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-interface {v3, p0}, Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;->onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V

    .line 1177
    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    .line 1181
    .end local v1    # "numListeners":I
    :cond_33
    return-void
.end method

.method animationFrame(J)Z
    .registers 16
    .param p1, "currentTime"    # J

    .prologue
    const-wide/16 v10, 0x0

    const/4 v5, 0x1

    const/high16 v6, 0x3f800000

    .line 1100
    const/4 v0, 0x0

    .line 1102
    .local v0, "done":Z
    iget v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingState:I

    if-nez v4, :cond_14

    .line 1103
    iput v5, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingState:I

    .line 1104
    iget-wide v8, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mSeekTime:J

    cmp-long v4, v8, v10

    if-gez v4, :cond_1a

    .line 1105
    iput-wide p1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartTime:J

    .line 1112
    :cond_14
    :goto_14
    iget v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingState:I

    packed-switch v4, :pswitch_data_8e

    .line 1143
    :goto_19
    return v0

    .line 1107
    :cond_1a
    iget-wide v8, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mSeekTime:J

    sub-long v8, p1, v8

    iput-wide v8, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartTime:J

    .line 1109
    const-wide/16 v8, -0x1

    iput-wide v8, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mSeekTime:J

    goto :goto_14

    .line 1115
    :pswitch_25
    iget-wide v8, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mDuration:J

    cmp-long v4, v8, v10

    if-lez v4, :cond_5f

    iget-wide v8, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartTime:J

    sub-long v8, p1, v8

    long-to-float v4, v8

    iget-wide v8, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mDuration:J

    long-to-float v7, v8

    div-float v1, v4, v7

    .line 1116
    .local v1, "fraction":F
    :goto_35
    cmpl-float v4, v1, v6

    if-ltz v4, :cond_7b

    .line 1117
    iget v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mCurrentIteration:I

    iget v7, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mRepeatCount:I

    if-lt v4, v7, :cond_44

    iget v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mRepeatCount:I

    const/4 v7, -0x1

    if-ne v4, v7, :cond_87

    .line 1119
    :cond_44
    iget-object v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mListeners:Ljava/util/ArrayList;

    if-eqz v4, :cond_61

    .line 1120
    iget-object v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 1121
    .local v3, "numListeners":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4f
    if-ge v2, v3, :cond_61

    .line 1122
    iget-object v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    invoke-interface {v4, p0}, Lcom/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V

    .line 1121
    add-int/lit8 v2, v2, 0x1

    goto :goto_4f

    .end local v1    # "fraction":F
    .end local v2    # "i":I
    .end local v3    # "numListeners":I
    :cond_5f
    move v1, v6

    .line 1115
    goto :goto_35

    .line 1125
    .restart local v1    # "fraction":F
    :cond_61
    iget v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mRepeatMode:I

    const/4 v7, 0x2

    if-ne v4, v7, :cond_6d

    .line 1126
    iget-boolean v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingBackwards:Z

    if-eqz v4, :cond_85

    const/4 v4, 0x0

    :goto_6b
    iput-boolean v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingBackwards:Z

    .line 1128
    :cond_6d
    iget v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mCurrentIteration:I

    float-to-int v5, v1

    add-int/2addr v4, v5

    iput v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mCurrentIteration:I

    .line 1129
    rem-float/2addr v1, v6

    .line 1130
    iget-wide v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartTime:J

    iget-wide v8, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mDuration:J

    add-long/2addr v4, v8

    iput-wide v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartTime:J

    .line 1136
    :cond_7b
    :goto_7b
    iget-boolean v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingBackwards:Z

    if-eqz v4, :cond_81

    .line 1137
    sub-float v1, v6, v1

    .line 1139
    :cond_81
    invoke-virtual {p0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->animateValue(F)V

    goto :goto_19

    :cond_85
    move v4, v5

    .line 1126
    goto :goto_6b

    .line 1132
    :cond_87
    const/4 v0, 0x1

    .line 1133
    invoke-static {v1, v6}, Ljava/lang/Math;->min(FF)F

    move-result v1

    goto :goto_7b

    .line 1112
    nop

    :pswitch_data_8e
    .packed-switch 0x1
        :pswitch_25
        :pswitch_25
    .end packed-switch
.end method

.method public cancel()V
    .registers 5

    .prologue
    .line 958
    iget v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingState:I

    if-nez v3, :cond_20

    sget-object v3, Lcom/nineoldandroids/animation/ValueAnimator;->sPendingAnimations:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_20

    sget-object v3, Lcom/nineoldandroids/animation/ValueAnimator;->sDelayedAnims:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_47

    .line 961
    :cond_20
    iget-boolean v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mRunning:Z

    if-eqz v3, :cond_44

    iget-object v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mListeners:Ljava/util/ArrayList;

    if-eqz v3, :cond_44

    .line 962
    iget-object v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 964
    .local v2, "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_34
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_44

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    .line 965
    .local v1, "listener":Lcom/nineoldandroids/animation/Animator$AnimatorListener;
    invoke-interface {v1, p0}, Lcom/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V

    goto :goto_34

    .line 968
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lcom/nineoldandroids/animation/Animator$AnimatorListener;
    .end local v2    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_44
    invoke-direct {p0}, Lcom/nineoldandroids/animation/ValueAnimator;->endAnimation()V

    .line 970
    :cond_47
    return-void
.end method

.method public bridge synthetic clone()Lcom/nineoldandroids/animation/Animator;
    .registers 2

    .prologue
    .line 43
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/ValueAnimator;->clone()Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/nineoldandroids/animation/ValueAnimator;
    .registers 12

    .prologue
    const/4 v10, 0x0

    .line 1185
    invoke-super {p0}, Lcom/nineoldandroids/animation/Animator;->clone()Lcom/nineoldandroids/animation/Animator;

    move-result-object v0

    check-cast v0, Lcom/nineoldandroids/animation/ValueAnimator;

    .line 1186
    .local v0, "anim":Lcom/nineoldandroids/animation/ValueAnimator;
    iget-object v7, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mUpdateListeners:Ljava/util/ArrayList;

    if-eqz v7, :cond_27

    .line 1187
    iget-object v5, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mUpdateListeners:Ljava/util/ArrayList;

    .line 1188
    .local v5, "oldListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, v0, Lcom/nineoldandroids/animation/ValueAnimator;->mUpdateListeners:Ljava/util/ArrayList;

    .line 1189
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 1190
    .local v3, "numListeners":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    if-ge v1, v3, :cond_27

    .line 1191
    iget-object v7, v0, Lcom/nineoldandroids/animation/ValueAnimator;->mUpdateListeners:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1190
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 1194
    .end local v1    # "i":I
    .end local v3    # "numListeners":I
    .end local v5    # "oldListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;>;"
    :cond_27
    const-wide/16 v8, -0x1

    iput-wide v8, v0, Lcom/nineoldandroids/animation/ValueAnimator;->mSeekTime:J

    .line 1195
    iput-boolean v10, v0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingBackwards:Z

    .line 1196
    iput v10, v0, Lcom/nineoldandroids/animation/ValueAnimator;->mCurrentIteration:I

    .line 1197
    iput-boolean v10, v0, Lcom/nineoldandroids/animation/ValueAnimator;->mInitialized:Z

    .line 1198
    iput v10, v0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingState:I

    .line 1199
    iput-boolean v10, v0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartedDelay:Z

    .line 1200
    iget-object v6, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    .line 1201
    .local v6, "oldValues":[Lcom/nineoldandroids/animation/PropertyValuesHolder;
    if-eqz v6, :cond_5e

    .line 1202
    array-length v4, v6

    .line 1203
    .local v4, "numValues":I
    new-array v7, v4, [Lcom/nineoldandroids/animation/PropertyValuesHolder;

    iput-object v7, v0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    .line 1204
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7, v4}, Ljava/util/HashMap;-><init>(I)V

    iput-object v7, v0, Lcom/nineoldandroids/animation/ValueAnimator;->mValuesMap:Ljava/util/HashMap;

    .line 1205
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_46
    if-ge v1, v4, :cond_5e

    .line 1206
    aget-object v7, v6, v1

    invoke-virtual {v7}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->clone()Lcom/nineoldandroids/animation/PropertyValuesHolder;

    move-result-object v2

    .line 1207
    .local v2, "newValuesHolder":Lcom/nineoldandroids/animation/PropertyValuesHolder;
    iget-object v7, v0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    aput-object v2, v7, v1

    .line 1208
    iget-object v7, v0, Lcom/nineoldandroids/animation/ValueAnimator;->mValuesMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->getPropertyName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1205
    add-int/lit8 v1, v1, 0x1

    goto :goto_46

    .line 1211
    .end local v1    # "i":I
    .end local v2    # "newValuesHolder":Lcom/nineoldandroids/animation/PropertyValuesHolder;
    .end local v4    # "numValues":I
    :cond_5e
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/ValueAnimator;->clone()Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v0

    return-object v0
.end method

.method public getAnimatedValue()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 744
    iget-object v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    array-length v0, v0

    if-lez v0, :cond_13

    .line 745
    iget-object v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    .line 748
    :goto_12
    return-object v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public getCurrentPlayTime()J
    .registers 5

    .prologue
    .line 556
    iget-boolean v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mInitialized:Z

    if-eqz v0, :cond_8

    iget v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingState:I

    if-nez v0, :cond_b

    .line 557
    :cond_8
    const-wide/16 v0, 0x0

    .line 559
    :goto_a
    return-wide v0

    :cond_b
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartTime:J

    sub-long/2addr v0, v2

    goto :goto_a
.end method

.method initAnimation()V
    .registers 4

    .prologue
    .line 490
    iget-boolean v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mInitialized:Z

    if-nez v2, :cond_17

    .line 491
    iget-object v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    array-length v1, v2

    .line 492
    .local v1, "numValues":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    if-ge v0, v1, :cond_14

    .line 493
    iget-object v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->init()V

    .line 492
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 495
    :cond_14
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mInitialized:Z

    .line 497
    .end local v0    # "i":I
    .end local v1    # "numValues":I
    :cond_17
    return-void
.end method

.method public isRunning()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 993
    iget v1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingState:I

    if-eq v1, v0, :cond_9

    iget-boolean v1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mRunning:Z

    if-eqz v1, :cond_a

    :cond_9
    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isStarted()Z
    .registers 2

    .prologue
    .line 998
    iget-boolean v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStarted:Z

    return v0
.end method

.method public setCurrentPlayTime(J)V
    .registers 8
    .param p1, "playTime"    # J

    .prologue
    .line 538
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/ValueAnimator;->initAnimation()V

    .line 539
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    .line 540
    .local v0, "currentTime":J
    iget v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingState:I

    const/4 v3, 0x1

    if-eq v2, v3, :cond_11

    .line 541
    iput-wide p1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mSeekTime:J

    .line 542
    const/4 v2, 0x2

    iput v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mPlayingState:I

    .line 544
    :cond_11
    sub-long v2, v0, p1

    iput-wide v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartTime:J

    .line 545
    invoke-virtual {p0, v0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->animationFrame(J)Z

    .line 546
    return-void
.end method

.method public bridge synthetic setDuration(J)Lcom/nineoldandroids/animation/Animator;
    .registers 4
    .param p1, "x0"    # J

    .prologue
    .line 43
    invoke-virtual {p0, p1, p2}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v0

    return-object v0
.end method

.method public setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;
    .registers 6
    .param p1, "duration"    # J

    .prologue
    .line 510
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_1f

    .line 511
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Animators cannot have negative duration: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 514
    :cond_1f
    iput-wide p1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mDuration:J

    .line 515
    return-object p0
.end method

.method public setEvaluator(Lcom/nineoldandroids/animation/TypeEvaluator;)V
    .registers 4
    .param p1, "value"    # Lcom/nineoldandroids/animation/TypeEvaluator;

    .prologue
    .line 898
    if-eqz p1, :cond_13

    iget-object v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    array-length v0, v0

    if-lez v0, :cond_13

    .line 899
    iget-object v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setEvaluator(Lcom/nineoldandroids/animation/TypeEvaluator;)V

    .line 901
    :cond_13
    return-void
.end method

.method public varargs setFloatValues([F)V
    .registers 6
    .param p1, "values"    # [F

    .prologue
    const/4 v3, 0x0

    .line 401
    if-eqz p1, :cond_6

    array-length v1, p1

    if-nez v1, :cond_7

    .line 412
    :cond_6
    :goto_6
    return-void

    .line 404
    :cond_7
    iget-object v1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    if-eqz v1, :cond_10

    iget-object v1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    array-length v1, v1

    if-nez v1, :cond_21

    .line 405
    :cond_10
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/nineoldandroids/animation/PropertyValuesHolder;

    const-string v2, ""

    invoke-static {v2, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Lcom/nineoldandroids/animation/PropertyValuesHolder;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {p0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setValues([Lcom/nineoldandroids/animation/PropertyValuesHolder;)V

    .line 411
    :goto_1e
    iput-boolean v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mInitialized:Z

    goto :goto_6

    .line 407
    :cond_21
    iget-object v1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    aget-object v0, v1, v3

    .line 408
    .local v0, "valuesHolder":Lcom/nineoldandroids/animation/PropertyValuesHolder;
    invoke-virtual {v0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setFloatValues([F)V

    goto :goto_1e
.end method

.method public varargs setIntValues([I)V
    .registers 6
    .param p1, "values"    # [I

    .prologue
    const/4 v3, 0x0

    .line 373
    if-eqz p1, :cond_6

    array-length v1, p1

    if-nez v1, :cond_7

    .line 384
    :cond_6
    :goto_6
    return-void

    .line 376
    :cond_7
    iget-object v1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    if-eqz v1, :cond_10

    iget-object v1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    array-length v1, v1

    if-nez v1, :cond_21

    .line 377
    :cond_10
    const/4 v1, 0x1

    new-array v1, v1, [Lcom/nineoldandroids/animation/PropertyValuesHolder;

    const-string v2, ""

    invoke-static {v2, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Lcom/nineoldandroids/animation/PropertyValuesHolder;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {p0, v1}, Lcom/nineoldandroids/animation/ValueAnimator;->setValues([Lcom/nineoldandroids/animation/PropertyValuesHolder;)V

    .line 383
    :goto_1e
    iput-boolean v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mInitialized:Z

    goto :goto_6

    .line 379
    :cond_21
    iget-object v1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    aget-object v0, v1, v3

    .line 380
    .local v0, "valuesHolder":Lcom/nineoldandroids/animation/PropertyValuesHolder;
    invoke-virtual {v0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setIntValues([I)V

    goto :goto_1e
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 3
    .param p1, "value"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 865
    if-eqz p1, :cond_5

    .line 866
    iput-object p1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mInterpolator:Landroid/view/animation/Interpolator;

    .line 870
    :goto_4
    return-void

    .line 868
    :cond_5
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mInterpolator:Landroid/view/animation/Interpolator;

    goto :goto_4
.end method

.method public varargs setObjectValues([Ljava/lang/Object;)V
    .registers 7
    .param p1, "values"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 433
    if-eqz p1, :cond_6

    array-length v1, p1

    if-nez v1, :cond_7

    .line 445
    :cond_6
    :goto_6
    return-void

    .line 436
    :cond_7
    iget-object v1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    if-eqz v1, :cond_10

    iget-object v1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    array-length v1, v1

    if-nez v1, :cond_24

    .line 437
    :cond_10
    const/4 v1, 0x1

    new-array v2, v1, [Lcom/nineoldandroids/animation/PropertyValuesHolder;

    const-string v3, ""

    const/4 v1, 0x0

    check-cast v1, Lcom/nineoldandroids/animation/TypeEvaluator;

    invoke-static {v3, v1, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Lcom/nineoldandroids/animation/TypeEvaluator;[Ljava/lang/Object;)Lcom/nineoldandroids/animation/PropertyValuesHolder;

    move-result-object v1

    aput-object v1, v2, v4

    invoke-virtual {p0, v2}, Lcom/nineoldandroids/animation/ValueAnimator;->setValues([Lcom/nineoldandroids/animation/PropertyValuesHolder;)V

    .line 444
    :goto_21
    iput-boolean v4, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mInitialized:Z

    goto :goto_6

    .line 440
    :cond_24
    iget-object v1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    aget-object v0, v1, v4

    .line 441
    .local v0, "valuesHolder":Lcom/nineoldandroids/animation/PropertyValuesHolder;
    invoke-virtual {v0, p1}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->setObjectValues([Ljava/lang/Object;)V

    goto :goto_21
.end method

.method public setStartDelay(J)V
    .registers 4
    .param p1, "startDelay"    # J

    .prologue
    .line 702
    iput-wide p1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mStartDelay:J

    .line 703
    return-void
.end method

.method public varargs setValues([Lcom/nineoldandroids/animation/PropertyValuesHolder;)V
    .registers 7
    .param p1, "values"    # [Lcom/nineoldandroids/animation/PropertyValuesHolder;

    .prologue
    .line 456
    array-length v1, p1

    .line 457
    .local v1, "numValues":I
    iput-object p1, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    .line 458
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValuesMap:Ljava/util/HashMap;

    .line 459
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    if-ge v0, v1, :cond_1b

    .line 460
    aget-object v2, p1, v0

    .line 461
    .local v2, "valuesHolder":Lcom/nineoldandroids/animation/PropertyValuesHolder;
    iget-object v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValuesMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->getPropertyName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 464
    .end local v2    # "valuesHolder":Lcom/nineoldandroids/animation/PropertyValuesHolder;
    :cond_1b
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mInitialized:Z

    .line 465
    return-void
.end method

.method public start()V
    .registers 2

    .prologue
    .line 951
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nineoldandroids/animation/ValueAnimator;->start(Z)V

    .line 952
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 1256
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ValueAnimator@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1257
    .local v1, "returnVal":Ljava/lang/String;
    iget-object v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    if-eqz v2, :cond_47

    .line 1258
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_20
    iget-object v2, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    array-length v2, v2

    if-ge v0, v2, :cond_47

    .line 1259
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n    "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/nineoldandroids/animation/ValueAnimator;->mValues:[Lcom/nineoldandroids/animation/PropertyValuesHolder;

    aget-object v3, v3, v0

    invoke-virtual {v3}, Lcom/nineoldandroids/animation/PropertyValuesHolder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1258
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    .line 1262
    .end local v0    # "i":I
    :cond_47
    return-object v1
.end method
