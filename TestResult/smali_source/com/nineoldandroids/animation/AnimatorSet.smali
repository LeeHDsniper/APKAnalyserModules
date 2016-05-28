.class public final Lcom/nineoldandroids/animation/AnimatorSet;
.super Lcom/nineoldandroids/animation/Animator;
.source "AnimatorSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nineoldandroids/animation/AnimatorSet$Builder;,
        Lcom/nineoldandroids/animation/AnimatorSet$Node;,
        Lcom/nineoldandroids/animation/AnimatorSet$Dependency;,
        Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;,
        Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;
    }
.end annotation


# instance fields
.field private mDelayAnim:Lcom/nineoldandroids/animation/ValueAnimator;

.field private mDuration:J

.field private mNeedsSort:Z

.field private mNodeMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/nineoldandroids/animation/Animator;",
            "Lcom/nineoldandroids/animation/AnimatorSet$Node;",
            ">;"
        }
    .end annotation
.end field

.field private mNodes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/AnimatorSet$Node;",
            ">;"
        }
    .end annotation
.end field

.field private mPlayingSet:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field private mSetListener:Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

.field private mSortedNodes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/AnimatorSet$Node;",
            ">;"
        }
    .end annotation
.end field

.field private mStartDelay:J

.field private mStarted:Z

.field mTerminated:Z


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 45
    invoke-direct {p0}, Lcom/nineoldandroids/animation/Animator;-><init>()V

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mPlayingSet:Ljava/util/ArrayList;

    .line 66
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodeMap:Ljava/util/HashMap;

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    .line 80
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    .line 87
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    .line 89
    iput-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mSetListener:Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    .line 98
    iput-boolean v1, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mTerminated:Z

    .line 104
    iput-boolean v1, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mStarted:Z

    .line 107
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mStartDelay:J

    .line 110
    iput-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    .line 116
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mDuration:J

    .line 1012
    return-void
.end method

.method static synthetic access$000(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/nineoldandroids/animation/AnimatorSet;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mPlayingSet:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/HashMap;
    .registers 2
    .param p0, "x0"    # Lcom/nineoldandroids/animation/AnimatorSet;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodeMap:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$200(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/nineoldandroids/animation/AnimatorSet;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$302(Lcom/nineoldandroids/animation/AnimatorSet;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/nineoldandroids/animation/AnimatorSet;
    .param p1, "x1"    # Z

    .prologue
    .line 45
    iput-boolean p1, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mStarted:Z

    return p1
.end method

.method static synthetic access$400(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/nineoldandroids/animation/AnimatorSet;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    return-object v0
.end method

.method private sortNodes()V
    .registers 15

    .prologue
    const/4 v13, 0x0

    .line 785
    iget-boolean v11, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    if-eqz v11, :cond_9c

    .line 786
    iget-object v11, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 787
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 788
    .local v9, "roots":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/AnimatorSet$Node;>;"
    iget-object v11, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 789
    .local v6, "numNodes":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_16
    if-ge v1, v6, :cond_32

    .line 790
    iget-object v11, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 791
    .local v3, "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v11, v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    if-eqz v11, :cond_2c

    iget-object v11, v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-nez v11, :cond_2f

    .line 792
    :cond_2c
    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 789
    :cond_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 795
    .end local v3    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    :cond_32
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 796
    .local v10, "tmpRoots":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/AnimatorSet$Node;>;"
    :goto_37
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-lez v11, :cond_84

    .line 797
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v7

    .line 798
    .local v7, "numRoots":I
    const/4 v1, 0x0

    :goto_42
    if-ge v1, v7, :cond_7a

    .line 799
    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 800
    .local v8, "root":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v11, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 801
    iget-object v11, v8, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependents:Ljava/util/ArrayList;

    if-eqz v11, :cond_77

    .line 802
    iget-object v11, v8, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependents:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 803
    .local v5, "numDependents":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_5a
    if-ge v2, v5, :cond_77

    .line 804
    iget-object v11, v8, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependents:Ljava/util/ArrayList;

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 805
    .restart local v3    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v11, v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 806
    iget-object v11, v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-nez v11, :cond_74

    .line 807
    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 803
    :cond_74
    add-int/lit8 v2, v2, 0x1

    goto :goto_5a

    .line 798
    .end local v2    # "j":I
    .end local v3    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    .end local v5    # "numDependents":I
    :cond_77
    add-int/lit8 v1, v1, 0x1

    goto :goto_42

    .line 812
    .end local v8    # "root":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    :cond_7a
    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 813
    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 814
    invoke-virtual {v10}, Ljava/util/ArrayList;->clear()V

    goto :goto_37

    .line 816
    .end local v7    # "numRoots":I
    :cond_84
    iput-boolean v13, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    .line 817
    iget-object v11, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    iget-object v12, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-eq v11, v12, :cond_ee

    .line 818
    new-instance v11, Ljava/lang/IllegalStateException;

    const-string v12, "Circular dependencies cannot exist in AnimatorSet"

    invoke-direct {v11, v12}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 825
    .end local v1    # "i":I
    .end local v6    # "numNodes":I
    .end local v9    # "roots":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/AnimatorSet$Node;>;"
    .end local v10    # "tmpRoots":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/AnimatorSet$Node;>;"
    :cond_9c
    iget-object v11, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 826
    .restart local v6    # "numNodes":I
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_a3
    if-ge v1, v6, :cond_ee

    .line 827
    iget-object v11, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 828
    .restart local v3    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v11, v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    if-eqz v11, :cond_e9

    iget-object v11, v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-lez v11, :cond_e9

    .line 829
    iget-object v11, v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 830
    .local v4, "numDependencies":I
    const/4 v2, 0x0

    .restart local v2    # "j":I
    :goto_c0
    if-ge v2, v4, :cond_e9

    .line 831
    iget-object v11, v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    invoke-virtual {v11, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;

    .line 832
    .local v0, "dependency":Lcom/nineoldandroids/animation/AnimatorSet$Dependency;
    iget-object v11, v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    if-nez v11, :cond_d5

    .line 833
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iput-object v11, v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    .line 835
    :cond_d5
    iget-object v11, v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    iget-object v12, v0, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;->node:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_e6

    .line 836
    iget-object v11, v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    iget-object v12, v0, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;->node:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 830
    :cond_e6
    add-int/lit8 v2, v2, 0x1

    goto :goto_c0

    .line 842
    .end local v0    # "dependency":Lcom/nineoldandroids/animation/AnimatorSet$Dependency;
    .end local v2    # "j":I
    .end local v4    # "numDependencies":I
    :cond_e9
    iput-boolean v13, v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;->done:Z

    .line 826
    add-int/lit8 v1, v1, 0x1

    goto :goto_a3

    .line 845
    .end local v3    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    :cond_ee
    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 6

    .prologue
    .line 284
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mTerminated:Z

    .line 285
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/AnimatorSet;->isStarted()Z

    move-result v4

    if-eqz v4, :cond_74

    .line 286
    const/4 v3, 0x0

    .line 287
    .local v3, "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    iget-object v4, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    if-eqz v4, :cond_2a

    .line 288
    iget-object v4, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    check-cast v3, Ljava/util/ArrayList;

    .line 289
    .restart local v3    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    .line 290
    .local v1, "listener":Lcom/nineoldandroids/animation/Animator$AnimatorListener;
    invoke-interface {v1, p0}, Lcom/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V

    goto :goto_1a

    .line 293
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lcom/nineoldandroids/animation/Animator$AnimatorListener;
    :cond_2a
    iget-object v4, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    if-eqz v4, :cond_51

    iget-object v4, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v4}, Lcom/nineoldandroids/animation/ValueAnimator;->isRunning()Z

    move-result v4

    if-eqz v4, :cond_51

    .line 296
    iget-object v4, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    invoke-virtual {v4}, Lcom/nineoldandroids/animation/ValueAnimator;->cancel()V

    .line 302
    :cond_3b
    if-eqz v3, :cond_71

    .line 303
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "i$":Ljava/util/Iterator;
    :goto_41
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_71

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    .line 304
    .restart local v1    # "listener":Lcom/nineoldandroids/animation/Animator$AnimatorListener;
    invoke-interface {v1, p0}, Lcom/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V

    goto :goto_41

    .line 297
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lcom/nineoldandroids/animation/Animator$AnimatorListener;
    :cond_51
    iget-object v4, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_3b

    .line 298
    iget-object v4, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .restart local v0    # "i$":Ljava/util/Iterator;
    :goto_5f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 299
    .local v2, "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v4, v2, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v4}, Lcom/nineoldandroids/animation/Animator;->cancel()V

    goto :goto_5f

    .line 307
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    :cond_71
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mStarted:Z

    .line 309
    .end local v3    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_74
    return-void
.end method

.method public bridge synthetic clone()Lcom/nineoldandroids/animation/Animator;
    .registers 2

    .prologue
    .line 45
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/AnimatorSet;->clone()Lcom/nineoldandroids/animation/AnimatorSet;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/nineoldandroids/animation/AnimatorSet;
    .registers 16

    .prologue
    const/4 v13, 0x0

    const/4 v14, 0x0

    .line 551
    invoke-super {p0}, Lcom/nineoldandroids/animation/Animator;->clone()Lcom/nineoldandroids/animation/Animator;

    move-result-object v0

    check-cast v0, Lcom/nineoldandroids/animation/AnimatorSet;

    .line 560
    .local v0, "anim":Lcom/nineoldandroids/animation/AnimatorSet;
    const/4 v12, 0x1

    iput-boolean v12, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    .line 561
    iput-boolean v13, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mTerminated:Z

    .line 562
    iput-boolean v13, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mStarted:Z

    .line 563
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    iput-object v12, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mPlayingSet:Ljava/util/ArrayList;

    .line 564
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    iput-object v12, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodeMap:Ljava/util/HashMap;

    .line 565
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    iput-object v12, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    .line 566
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    iput-object v12, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    .line 571
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 572
    .local v11, "nodeCloneMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Lcom/nineoldandroids/animation/AnimatorSet$Node;Lcom/nineoldandroids/animation/AnimatorSet$Node;>;"
    iget-object v12, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_36
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_9b

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 573
    .local v9, "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    invoke-virtual {v9}, Lcom/nineoldandroids/animation/AnimatorSet$Node;->clone()Lcom/nineoldandroids/animation/AnimatorSet$Node;

    move-result-object v10

    .line 574
    .local v10, "nodeClone":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    invoke-virtual {v11, v9, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 575
    iget-object v12, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v12, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 576
    iget-object v12, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodeMap:Ljava/util/HashMap;

    iget-object v13, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v12, v13, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 578
    iput-object v14, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    .line 579
    iput-object v14, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->tmpDependencies:Ljava/util/ArrayList;

    .line 580
    iput-object v14, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependents:Ljava/util/ArrayList;

    .line 581
    iput-object v14, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    .line 584
    iget-object v12, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v12}, Lcom/nineoldandroids/animation/Animator;->getListeners()Ljava/util/ArrayList;

    move-result-object v2

    .line 585
    .local v2, "cloneListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    if-eqz v2, :cond_36

    .line 586
    const/4 v8, 0x0

    .line 587
    .local v8, "listenersToRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_6a
    :goto_6a
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_85

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    .line 588
    .local v7, "listener":Lcom/nineoldandroids/animation/Animator$AnimatorListener;
    instance-of v12, v7, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    if-eqz v12, :cond_6a

    .line 589
    if-nez v8, :cond_81

    .line 590
    new-instance v8, Ljava/util/ArrayList;

    .end local v8    # "listenersToRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 592
    .restart local v8    # "listenersToRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_81
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6a

    .line 595
    .end local v7    # "listener":Lcom/nineoldandroids/animation/Animator$AnimatorListener;
    :cond_85
    if-eqz v8, :cond_36

    .line 596
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_8b
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_36

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    .line 597
    .restart local v7    # "listener":Lcom/nineoldandroids/animation/Animator$AnimatorListener;
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_8b

    .line 604
    .end local v2    # "cloneListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v7    # "listener":Lcom/nineoldandroids/animation/Animator$AnimatorListener;
    .end local v8    # "listenersToRemove":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    .end local v9    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    .end local v10    # "nodeClone":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    :cond_9b
    iget-object v12, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_a1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_dc

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 605
    .restart local v9    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    invoke-virtual {v11, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 606
    .restart local v10    # "nodeClone":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v12, v9, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    if-eqz v12, :cond_a1

    .line 607
    iget-object v12, v9, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .restart local v6    # "i$":Ljava/util/Iterator;
    :goto_bd
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_a1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;

    .line 608
    .local v4, "dependency":Lcom/nineoldandroids/animation/AnimatorSet$Dependency;
    iget-object v12, v4, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;->node:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    invoke-virtual {v11, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 609
    .local v3, "clonedDependencyNode":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    new-instance v1, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;

    iget v12, v4, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;->rule:I

    invoke-direct {v1, v3, v12}, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;-><init>(Lcom/nineoldandroids/animation/AnimatorSet$Node;I)V

    .line 611
    .local v1, "cloneDependency":Lcom/nineoldandroids/animation/AnimatorSet$Dependency;
    invoke-virtual {v10, v1}, Lcom/nineoldandroids/animation/AnimatorSet$Node;->addDependency(Lcom/nineoldandroids/animation/AnimatorSet$Dependency;)V

    goto :goto_bd

    .line 616
    .end local v1    # "cloneDependency":Lcom/nineoldandroids/animation/AnimatorSet$Dependency;
    .end local v3    # "clonedDependencyNode":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    .end local v4    # "dependency":Lcom/nineoldandroids/animation/AnimatorSet$Dependency;
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v9    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    .end local v10    # "nodeClone":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    :cond_dc
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
    .line 45
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/AnimatorSet;->clone()Lcom/nineoldandroids/animation/AnimatorSet;

    move-result-object v0

    return-object v0
.end method

.method public isRunning()Z
    .registers 4

    .prologue
    .line 357
    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 358
    .local v1, "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v2, v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v2}, Lcom/nineoldandroids/animation/Animator;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 359
    const/4 v2, 0x1

    .line 362
    .end local v1    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    :goto_1b
    return v2

    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public isStarted()Z
    .registers 2

    .prologue
    .line 367
    iget-boolean v0, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mStarted:Z

    return v0
.end method

.method public play(Lcom/nineoldandroids/animation/Animator;)Lcom/nineoldandroids/animation/AnimatorSet$Builder;
    .registers 3
    .param p1, "anim"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 268
    if-eqz p1, :cond_b

    .line 269
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    .line 270
    new-instance v0, Lcom/nineoldandroids/animation/AnimatorSet$Builder;

    invoke-direct {v0, p0, p1}, Lcom/nineoldandroids/animation/AnimatorSet$Builder;-><init>(Lcom/nineoldandroids/animation/AnimatorSet;Lcom/nineoldandroids/animation/Animator;)V

    .line 272
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public varargs playSequentially([Lcom/nineoldandroids/animation/Animator;)V
    .registers 5
    .param p1, "items"    # [Lcom/nineoldandroids/animation/Animator;

    .prologue
    const/4 v2, 0x1

    .line 160
    if-eqz p1, :cond_e

    .line 161
    iput-boolean v2, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    .line 162
    array-length v1, p1

    if-ne v1, v2, :cond_f

    .line 163
    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {p0, v1}, Lcom/nineoldandroids/animation/AnimatorSet;->play(Lcom/nineoldandroids/animation/Animator;)Lcom/nineoldandroids/animation/AnimatorSet$Builder;

    .line 170
    :cond_e
    return-void

    .line 165
    :cond_f
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_e

    .line 166
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lcom/nineoldandroids/animation/AnimatorSet;->play(Lcom/nineoldandroids/animation/Animator;)Lcom/nineoldandroids/animation/AnimatorSet$Builder;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    aget-object v2, p1, v2

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->before(Lcom/nineoldandroids/animation/Animator;)Lcom/nineoldandroids/animation/AnimatorSet$Builder;

    .line 165
    add-int/lit8 v0, v0, 0x1

    goto :goto_10
.end method

.method public varargs playTogether([Lcom/nineoldandroids/animation/Animator;)V
    .registers 5
    .param p1, "items"    # [Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 125
    if-eqz p1, :cond_18

    .line 126
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNeedsSort:Z

    .line 127
    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-virtual {p0, v2}, Lcom/nineoldandroids/animation/AnimatorSet;->play(Lcom/nineoldandroids/animation/Animator;)Lcom/nineoldandroids/animation/AnimatorSet$Builder;

    move-result-object v0

    .line 128
    .local v0, "builder":Lcom/nineoldandroids/animation/AnimatorSet$Builder;
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_d
    array-length v2, p1

    if-ge v1, v2, :cond_18

    .line 129
    aget-object v2, p1, v1

    invoke-virtual {v0, v2}, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->with(Lcom/nineoldandroids/animation/Animator;)Lcom/nineoldandroids/animation/AnimatorSet$Builder;

    .line 128
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 132
    .end local v0    # "builder":Lcom/nineoldandroids/animation/AnimatorSet$Builder;
    .end local v1    # "i":I
    :cond_18
    return-void
.end method

.method public bridge synthetic setDuration(J)Lcom/nineoldandroids/animation/Animator;
    .registers 4
    .param p1, "x0"    # J

    .prologue
    .line 45
    invoke-virtual {p0, p1, p2}, Lcom/nineoldandroids/animation/AnimatorSet;->setDuration(J)Lcom/nineoldandroids/animation/AnimatorSet;

    move-result-object v0

    return-object v0
.end method

.method public setDuration(J)Lcom/nineoldandroids/animation/AnimatorSet;
    .registers 8
    .param p1, "duration"    # J

    .prologue
    .line 415
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-gez v2, :cond_e

    .line 416
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "duration must be a value of zero or greater"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 418
    :cond_e
    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 421
    .local v1, "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v2, v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v2, p1, p2}, Lcom/nineoldandroids/animation/Animator;->setDuration(J)Lcom/nineoldandroids/animation/Animator;

    goto :goto_14

    .line 423
    .end local v1    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    :cond_26
    iput-wide p1, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mDuration:J

    .line 424
    return-object p0
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;)V
    .registers 5
    .param p1, "interpolator"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 234
    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 235
    .local v1, "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v2, v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v2, p1}, Lcom/nineoldandroids/animation/Animator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    goto :goto_6

    .line 237
    .end local v1    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    :cond_18
    return-void
.end method

.method public setStartDelay(J)V
    .registers 4
    .param p1, "startDelay"    # J

    .prologue
    .line 389
    iput-wide p1, p0, Lcom/nineoldandroids/animation/AnimatorSet;->mStartDelay:J

    .line 390
    return-void
.end method

.method public start()V
    .registers 23

    .prologue
    .line 451
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/nineoldandroids/animation/AnimatorSet;->mTerminated:Z

    .line 452
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/nineoldandroids/animation/AnimatorSet;->mStarted:Z

    .line 456
    invoke-direct/range {p0 .. p0}, Lcom/nineoldandroids/animation/AnimatorSet;->sortNodes()V

    .line 458
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v14

    .line 459
    .local v14, "numSortedNodes":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1e
    if-ge v6, v14, :cond_6c

    .line 460
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 462
    .local v10, "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v0, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/nineoldandroids/animation/Animator;->getListeners()Ljava/util/ArrayList;

    move-result-object v15

    .line 463
    .local v15, "oldListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    if-eqz v15, :cond_69

    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v17

    if-lez v17, :cond_69

    .line 464
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v15}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 467
    .local v4, "clonedListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :cond_47
    :goto_47
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_69

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    .line 468
    .local v9, "listener":Lcom/nineoldandroids/animation/Animator$AnimatorListener;
    instance-of v0, v9, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;

    move/from16 v17, v0

    if-nez v17, :cond_5f

    instance-of v0, v9, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    move/from16 v17, v0

    if-eqz v17, :cond_47

    .line 470
    :cond_5f
    iget-object v0, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Lcom/nineoldandroids/animation/Animator;->removeListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    goto :goto_47

    .line 459
    .end local v4    # "clonedListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v9    # "listener":Lcom/nineoldandroids/animation/Animator$AnimatorListener;
    :cond_69
    add-int/lit8 v6, v6, 0x1

    goto :goto_1e

    .line 480
    .end local v10    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    .end local v15    # "oldListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_6c
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 481
    .local v11, "nodesToStart":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/AnimatorSet$Node;>;"
    const/4 v6, 0x0

    :goto_72
    if-ge v6, v14, :cond_103

    .line 482
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 483
    .restart local v10    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mSetListener:Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    move-object/from16 v17, v0

    if-nez v17, :cond_9b

    .line 484
    new-instance v17, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2}, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;-><init>(Lcom/nineoldandroids/animation/AnimatorSet;Lcom/nineoldandroids/animation/AnimatorSet;)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/nineoldandroids/animation/AnimatorSet;->mSetListener:Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    .line 486
    :cond_9b
    iget-object v0, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    if-eqz v17, :cond_ab

    iget-object v0, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v17

    if-nez v17, :cond_be

    .line 487
    :cond_ab
    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 497
    :goto_ae
    iget-object v0, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mSetListener:Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Lcom/nineoldandroids/animation/Animator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 481
    add-int/lit8 v6, v6, 0x1

    goto :goto_72

    .line 489
    :cond_be
    iget-object v0, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v12

    .line 490
    .local v12, "numDependencies":I
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_c7
    if-ge v8, v12, :cond_f4

    .line 491
    iget-object v0, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;

    .line 492
    .local v5, "dependency":Lcom/nineoldandroids/animation/AnimatorSet$Dependency;
    iget-object v0, v5, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;->node:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    move-object/from16 v17, v0

    new-instance v18, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;

    iget v0, v5, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;->rule:I

    move/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    move/from16 v2, v19

    invoke-direct {v0, v1, v10, v2}, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;-><init>(Lcom/nineoldandroids/animation/AnimatorSet;Lcom/nineoldandroids/animation/AnimatorSet$Node;I)V

    invoke-virtual/range {v17 .. v18}, Lcom/nineoldandroids/animation/Animator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 490
    add-int/lit8 v8, v8, 0x1

    goto :goto_c7

    .line 495
    .end local v5    # "dependency":Lcom/nineoldandroids/animation/AnimatorSet$Dependency;
    :cond_f4
    iget-object v0, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/ArrayList;

    move-object/from16 v0, v17

    iput-object v0, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->tmpDependencies:Ljava/util/ArrayList;

    goto :goto_ae

    .line 500
    .end local v8    # "j":I
    .end local v10    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    .end local v12    # "numDependencies":I
    :cond_103
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mStartDelay:J

    move-wide/from16 v18, v0

    const-wide/16 v20, 0x0

    cmp-long v17, v18, v20

    if-gtz v17, :cond_134

    .line 501
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .restart local v7    # "i$":Ljava/util/Iterator;
    :goto_113
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_173

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 502
    .restart local v10    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v0, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/nineoldandroids/animation/Animator;->start()V

    .line 503
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mPlayingSet:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    iget-object v0, v10, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_113

    .line 506
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v10    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    :cond_134
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v0, v0, [F

    move-object/from16 v17, v0

    fill-array-data v17, :array_1ee

    invoke-static/range {v17 .. v17}, Lcom/nineoldandroids/animation/ValueAnimator;->ofFloat([F)Lcom/nineoldandroids/animation/ValueAnimator;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    .line 507
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mStartDelay:J

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Lcom/nineoldandroids/animation/ValueAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ValueAnimator;

    .line 508
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    move-object/from16 v17, v0

    new-instance v18, Lcom/nineoldandroids/animation/AnimatorSet$1;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v11}, Lcom/nineoldandroids/animation/AnimatorSet$1;-><init>(Lcom/nineoldandroids/animation/AnimatorSet;Ljava/util/ArrayList;)V

    invoke-virtual/range {v17 .. v18}, Lcom/nineoldandroids/animation/ValueAnimator;->addListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 524
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mDelayAnim:Lcom/nineoldandroids/animation/ValueAnimator;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/nineoldandroids/animation/ValueAnimator;->start()V

    .line 526
    :cond_173
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    if-eqz v17, :cond_1a0

    .line 527
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/ArrayList;

    .line 529
    .local v16, "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v13

    .line 530
    .local v13, "numListeners":I
    const/4 v6, 0x0

    :goto_18c
    if-ge v6, v13, :cond_1a0

    .line 531
    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-interface {v0, v1}, Lcom/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V

    .line 530
    add-int/lit8 v6, v6, 0x1

    goto :goto_18c

    .line 534
    .end local v13    # "numListeners":I
    .end local v16    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_1a0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v17

    if-nez v17, :cond_1ed

    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mStartDelay:J

    move-wide/from16 v18, v0

    const-wide/16 v20, 0x0

    cmp-long v17, v18, v20

    if-nez v17, :cond_1ed

    .line 537
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/nineoldandroids/animation/AnimatorSet;->mStarted:Z

    .line 538
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    if-eqz v17, :cond_1ed

    .line 539
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/ArrayList;

    .line 541
    .restart local v16    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v13

    .line 542
    .restart local v13    # "numListeners":I
    const/4 v6, 0x0

    :goto_1d9
    if-ge v6, v13, :cond_1ed

    .line 543
    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-interface {v0, v1}, Lcom/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V

    .line 542
    add-int/lit8 v6, v6, 0x1

    goto :goto_1d9

    .line 547
    .end local v13    # "numListeners":I
    .end local v16    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_1ed
    return-void

    .line 506
    :array_1ee
    .array-data 4
        0x0
        0x3f800000
    .end array-data
.end method
