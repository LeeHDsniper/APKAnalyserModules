.class Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;
.super Ljava/lang/Object;
.source "AnimatorSet.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nineoldandroids/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DependencyListener"
.end annotation


# instance fields
.field private mAnimatorSet:Lcom/nineoldandroids/animation/AnimatorSet;

.field private mNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

.field private mRule:I


# direct methods
.method public constructor <init>(Lcom/nineoldandroids/animation/AnimatorSet;Lcom/nineoldandroids/animation/AnimatorSet$Node;I)V
    .registers 4
    .param p1, "animatorSet"    # Lcom/nineoldandroids/animation/AnimatorSet;
    .param p2, "node"    # Lcom/nineoldandroids/animation/AnimatorSet$Node;
    .param p3, "rule"    # I

    .prologue
    .line 635
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 636
    iput-object p1, p0, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->mAnimatorSet:Lcom/nineoldandroids/animation/AnimatorSet;

    .line 637
    iput-object p2, p0, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->mNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 638
    iput p3, p0, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->mRule:I

    .line 639
    return-void
.end method

.method private startIfReady(Lcom/nineoldandroids/animation/Animator;)V
    .registers 8
    .param p1, "dependencyAnimation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 680
    iget-object v4, p0, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->mAnimatorSet:Lcom/nineoldandroids/animation/AnimatorSet;

    iget-boolean v4, v4, Lcom/nineoldandroids/animation/AnimatorSet;->mTerminated:Z

    if-eqz v4, :cond_7

    .line 703
    :cond_6
    :goto_6
    return-void

    .line 684
    :cond_7
    const/4 v1, 0x0

    .line 685
    .local v1, "dependencyToRemove":Lcom/nineoldandroids/animation/AnimatorSet$Dependency;
    iget-object v4, p0, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->mNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    iget-object v4, v4, Lcom/nineoldandroids/animation/AnimatorSet$Node;->tmpDependencies:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 686
    .local v3, "numDependencies":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_11
    if-ge v2, v3, :cond_2d

    .line 687
    iget-object v4, p0, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->mNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    iget-object v4, v4, Lcom/nineoldandroids/animation/AnimatorSet$Node;->tmpDependencies:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;

    .line 688
    .local v0, "dependency":Lcom/nineoldandroids/animation/AnimatorSet$Dependency;
    iget v4, v0, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;->rule:I

    iget v5, p0, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->mRule:I

    if-ne v4, v5, :cond_53

    iget-object v4, v0, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;->node:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    iget-object v4, v4, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    if-ne v4, p1, :cond_53

    .line 692
    move-object v1, v0

    .line 693
    invoke-virtual {p1, p0}, Lcom/nineoldandroids/animation/Animator;->removeListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 697
    .end local v0    # "dependency":Lcom/nineoldandroids/animation/AnimatorSet$Dependency;
    :cond_2d
    iget-object v4, p0, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->mNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    iget-object v4, v4, Lcom/nineoldandroids/animation/AnimatorSet$Node;->tmpDependencies:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 698
    iget-object v4, p0, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->mNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    iget-object v4, v4, Lcom/nineoldandroids/animation/AnimatorSet$Node;->tmpDependencies:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_6

    .line 700
    iget-object v4, p0, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->mNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    iget-object v4, v4, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v4}, Lcom/nineoldandroids/animation/Animator;->start()V

    .line 701
    iget-object v4, p0, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->mAnimatorSet:Lcom/nineoldandroids/animation/AnimatorSet;

    # getter for: Lcom/nineoldandroids/animation/AnimatorSet;->mPlayingSet:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/nineoldandroids/animation/AnimatorSet;->access$000(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/ArrayList;

    move-result-object v4

    iget-object v5, p0, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->mNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    iget-object v5, v5, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 686
    .restart local v0    # "dependency":Lcom/nineoldandroids/animation/AnimatorSet$Dependency;
    :cond_53
    add-int/lit8 v2, v2, 0x1

    goto :goto_11
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 647
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 4
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 653
    iget v0, p0, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->mRule:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    .line 654
    invoke-direct {p0, p1}, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->startIfReady(Lcom/nineoldandroids/animation/Animator;)V

    .line 656
    :cond_8
    return-void
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 662
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 3
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 668
    iget v0, p0, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->mRule:I

    if-nez v0, :cond_7

    .line 669
    invoke-direct {p0, p1}, Lcom/nineoldandroids/animation/AnimatorSet$DependencyListener;->startIfReady(Lcom/nineoldandroids/animation/Animator;)V

    .line 671
    :cond_7
    return-void
.end method
