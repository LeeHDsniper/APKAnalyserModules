.class Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;
.super Ljava/lang/Object;
.source "AnimatorSet.java"

# interfaces
.implements Lcom/nineoldandroids/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nineoldandroids/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AnimatorSetListener"
.end annotation


# instance fields
.field private mAnimatorSet:Lcom/nineoldandroids/animation/AnimatorSet;

.field final synthetic this$0:Lcom/nineoldandroids/animation/AnimatorSet;


# direct methods
.method constructor <init>(Lcom/nineoldandroids/animation/AnimatorSet;Lcom/nineoldandroids/animation/AnimatorSet;)V
    .registers 3
    .param p2, "animatorSet"    # Lcom/nineoldandroids/animation/AnimatorSet;

    .prologue
    .line 711
    iput-object p1, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 712
    iput-object p2, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->mAnimatorSet:Lcom/nineoldandroids/animation/AnimatorSet;

    .line 713
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 6
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 716
    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    iget-boolean v2, v2, Lcom/nineoldandroids/animation/AnimatorSet;->mTerminated:Z

    if-nez v2, :cond_35

    .line 719
    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    # getter for: Lcom/nineoldandroids/animation/AnimatorSet;->mPlayingSet:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/nineoldandroids/animation/AnimatorSet;->access$000(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_35

    .line 720
    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    iget-object v2, v2, Lcom/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    if-eqz v2, :cond_35

    .line 721
    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    iget-object v2, v2, Lcom/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 722
    .local v1, "numListeners":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    if-ge v0, v1, :cond_35

    .line 723
    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    iget-object v2, v2, Lcom/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    iget-object v3, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->mAnimatorSet:Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-interface {v2, v3}, Lcom/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V

    .line 722
    add-int/lit8 v0, v0, 0x1

    goto :goto_21

    .line 728
    .end local v0    # "i":I
    .end local v1    # "numListeners":I
    :cond_35
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 11
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 732
    invoke-virtual {p1, p0}, Lcom/nineoldandroids/animation/Animator;->removeListener(Lcom/nineoldandroids/animation/Animator$AnimatorListener;)V

    .line 733
    iget-object v7, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    # getter for: Lcom/nineoldandroids/animation/AnimatorSet;->mPlayingSet:Ljava/util/ArrayList;
    invoke-static {v7}, Lcom/nineoldandroids/animation/AnimatorSet;->access$000(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 734
    iget-object v7, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->mAnimatorSet:Lcom/nineoldandroids/animation/AnimatorSet;

    # getter for: Lcom/nineoldandroids/animation/AnimatorSet;->mNodeMap:Ljava/util/HashMap;
    invoke-static {v7}, Lcom/nineoldandroids/animation/AnimatorSet;->access$100(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/HashMap;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 735
    .local v1, "animNode":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    const/4 v7, 0x1

    iput-boolean v7, v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;->done:Z

    .line 736
    iget-object v7, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    iget-boolean v7, v7, Lcom/nineoldandroids/animation/AnimatorSet;->mTerminated:Z

    if-nez v7, :cond_6a

    .line 739
    iget-object v7, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->mAnimatorSet:Lcom/nineoldandroids/animation/AnimatorSet;

    # getter for: Lcom/nineoldandroids/animation/AnimatorSet;->mSortedNodes:Ljava/util/ArrayList;
    invoke-static {v7}, Lcom/nineoldandroids/animation/AnimatorSet;->access$200(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/ArrayList;

    move-result-object v5

    .line 740
    .local v5, "sortedNodes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/AnimatorSet$Node;>;"
    const/4 v0, 0x1

    .line 741
    .local v0, "allDone":Z
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 742
    .local v4, "numSortedNodes":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2d
    if-ge v2, v4, :cond_3a

    .line 743
    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    iget-boolean v7, v7, Lcom/nineoldandroids/animation/AnimatorSet$Node;->done:Z

    if-nez v7, :cond_61

    .line 744
    const/4 v0, 0x0

    .line 748
    :cond_3a
    if-eqz v0, :cond_6a

    .line 751
    iget-object v7, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    iget-object v7, v7, Lcom/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    if-eqz v7, :cond_64

    .line 752
    iget-object v7, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    iget-object v7, v7, Lcom/nineoldandroids/animation/AnimatorSet;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/ArrayList;

    .line 754
    .local v6, "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 755
    .local v3, "numListeners":I
    const/4 v2, 0x0

    :goto_51
    if-ge v2, v3, :cond_64

    .line 756
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/nineoldandroids/animation/Animator$AnimatorListener;

    iget-object v8, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->mAnimatorSet:Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-interface {v7, v8}, Lcom/nineoldandroids/animation/Animator$AnimatorListener;->onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V

    .line 755
    add-int/lit8 v2, v2, 0x1

    goto :goto_51

    .line 742
    .end local v3    # "numListeners":I
    .end local v6    # "tmpListeners":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/Animator$AnimatorListener;>;"
    :cond_61
    add-int/lit8 v2, v2, 0x1

    goto :goto_2d

    .line 759
    :cond_64
    iget-object v7, p0, Lcom/nineoldandroids/animation/AnimatorSet$AnimatorSetListener;->mAnimatorSet:Lcom/nineoldandroids/animation/AnimatorSet;

    const/4 v8, 0x0

    # setter for: Lcom/nineoldandroids/animation/AnimatorSet;->mStarted:Z
    invoke-static {v7, v8}, Lcom/nineoldandroids/animation/AnimatorSet;->access$302(Lcom/nineoldandroids/animation/AnimatorSet;Z)Z

    .line 762
    .end local v0    # "allDone":Z
    .end local v2    # "i":I
    .end local v4    # "numSortedNodes":I
    .end local v5    # "sortedNodes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/nineoldandroids/animation/AnimatorSet$Node;>;"
    :cond_6a
    return-void
.end method

.method public onAnimationRepeat(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 766
    return-void
.end method

.method public onAnimationStart(Lcom/nineoldandroids/animation/Animator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 770
    return-void
.end method
