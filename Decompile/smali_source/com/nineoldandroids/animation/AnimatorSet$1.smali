.class Lcom/nineoldandroids/animation/AnimatorSet$1;
.super Lcom/nineoldandroids/animation/AnimatorListenerAdapter;
.source "AnimatorSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nineoldandroids/animation/AnimatorSet;->start()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field canceled:Z

.field final synthetic this$0:Lcom/nineoldandroids/animation/AnimatorSet;

.field final synthetic val$nodesToStart:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/nineoldandroids/animation/AnimatorSet;Ljava/util/ArrayList;)V
    .registers 4

    .prologue
    .line 508
    iput-object p1, p0, Lcom/nineoldandroids/animation/AnimatorSet$1;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    iput-object p2, p0, Lcom/nineoldandroids/animation/AnimatorSet$1;->val$nodesToStart:Ljava/util/ArrayList;

    invoke-direct {p0}, Lcom/nineoldandroids/animation/AnimatorListenerAdapter;-><init>()V

    .line 509
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nineoldandroids/animation/AnimatorSet$1;->canceled:Z

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Lcom/nineoldandroids/animation/Animator;)V
    .registers 3
    .param p1, "anim"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 511
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nineoldandroids/animation/AnimatorSet$1;->canceled:Z

    .line 512
    return-void
.end method

.method public onAnimationEnd(Lcom/nineoldandroids/animation/Animator;)V
    .registers 7
    .param p1, "anim"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 514
    iget-boolean v3, p0, Lcom/nineoldandroids/animation/AnimatorSet$1;->canceled:Z

    if-nez v3, :cond_28

    .line 515
    iget-object v3, p0, Lcom/nineoldandroids/animation/AnimatorSet$1;->val$nodesToStart:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 516
    .local v2, "numNodes":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    if-ge v0, v2, :cond_28

    .line 517
    iget-object v3, p0, Lcom/nineoldandroids/animation/AnimatorSet$1;->val$nodesToStart:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 518
    .local v1, "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v3, v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v3}, Lcom/nineoldandroids/animation/Animator;->start()V

    .line 519
    iget-object v3, p0, Lcom/nineoldandroids/animation/AnimatorSet$1;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    # getter for: Lcom/nineoldandroids/animation/AnimatorSet;->mPlayingSet:Ljava/util/ArrayList;
    invoke-static {v3}, Lcom/nineoldandroids/animation/AnimatorSet;->access$000(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/ArrayList;

    move-result-object v3

    iget-object v4, v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 516
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 522
    .end local v0    # "i":I
    .end local v1    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    .end local v2    # "numNodes":I
    :cond_28
    return-void
.end method
