.class public Lcom/nineoldandroids/animation/AnimatorSet$Builder;
.super Ljava/lang/Object;
.source "AnimatorSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nineoldandroids/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Builder"
.end annotation


# instance fields
.field private mCurrentNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

.field final synthetic this$0:Lcom/nineoldandroids/animation/AnimatorSet;


# direct methods
.method constructor <init>(Lcom/nineoldandroids/animation/AnimatorSet;Lcom/nineoldandroids/animation/Animator;)V
    .registers 5
    .param p2, "anim"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 1027
    iput-object p1, p0, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1028
    # getter for: Lcom/nineoldandroids/animation/AnimatorSet;->mNodeMap:Ljava/util/HashMap;
    invoke-static {p1}, Lcom/nineoldandroids/animation/AnimatorSet;->access$100(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    iput-object v0, p0, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->mCurrentNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 1029
    iget-object v0, p0, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->mCurrentNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    if-nez v0, :cond_2e

    .line 1030
    new-instance v0, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    invoke-direct {v0, p2}, Lcom/nineoldandroids/animation/AnimatorSet$Node;-><init>(Lcom/nineoldandroids/animation/Animator;)V

    iput-object v0, p0, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->mCurrentNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 1031
    # getter for: Lcom/nineoldandroids/animation/AnimatorSet;->mNodeMap:Ljava/util/HashMap;
    invoke-static {p1}, Lcom/nineoldandroids/animation/AnimatorSet;->access$100(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->mCurrentNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    invoke-virtual {v0, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1032
    # getter for: Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;
    invoke-static {p1}, Lcom/nineoldandroids/animation/AnimatorSet;->access$400(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->mCurrentNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1034
    :cond_2e
    return-void
.end method


# virtual methods
.method public before(Lcom/nineoldandroids/animation/Animator;)Lcom/nineoldandroids/animation/AnimatorSet$Builder;
    .registers 6
    .param p1, "anim"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 1064
    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    # getter for: Lcom/nineoldandroids/animation/AnimatorSet;->mNodeMap:Ljava/util/HashMap;
    invoke-static {v2}, Lcom/nineoldandroids/animation/AnimatorSet;->access$100(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 1065
    .local v1, "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    if-nez v1, :cond_25

    .line 1066
    new-instance v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .end local v1    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    invoke-direct {v1, p1}, Lcom/nineoldandroids/animation/AnimatorSet$Node;-><init>(Lcom/nineoldandroids/animation/Animator;)V

    .line 1067
    .restart local v1    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    # getter for: Lcom/nineoldandroids/animation/AnimatorSet;->mNodeMap:Ljava/util/HashMap;
    invoke-static {v2}, Lcom/nineoldandroids/animation/AnimatorSet;->access$100(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1068
    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    # getter for: Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/nineoldandroids/animation/AnimatorSet;->access$400(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1070
    :cond_25
    new-instance v0, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;

    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->mCurrentNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    const/4 v3, 0x1

    invoke-direct {v0, v2, v3}, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;-><init>(Lcom/nineoldandroids/animation/AnimatorSet$Node;I)V

    .line 1071
    .local v0, "dependency":Lcom/nineoldandroids/animation/AnimatorSet$Dependency;
    invoke-virtual {v1, v0}, Lcom/nineoldandroids/animation/AnimatorSet$Node;->addDependency(Lcom/nineoldandroids/animation/AnimatorSet$Dependency;)V

    .line 1072
    return-object p0
.end method

.method public with(Lcom/nineoldandroids/animation/Animator;)Lcom/nineoldandroids/animation/AnimatorSet$Builder;
    .registers 6
    .param p1, "anim"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    .line 1044
    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    # getter for: Lcom/nineoldandroids/animation/AnimatorSet;->mNodeMap:Ljava/util/HashMap;
    invoke-static {v2}, Lcom/nineoldandroids/animation/AnimatorSet;->access$100(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 1045
    .local v1, "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    if-nez v1, :cond_25

    .line 1046
    new-instance v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .end local v1    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    invoke-direct {v1, p1}, Lcom/nineoldandroids/animation/AnimatorSet$Node;-><init>(Lcom/nineoldandroids/animation/Animator;)V

    .line 1047
    .restart local v1    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    # getter for: Lcom/nineoldandroids/animation/AnimatorSet;->mNodeMap:Ljava/util/HashMap;
    invoke-static {v2}, Lcom/nineoldandroids/animation/AnimatorSet;->access$100(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v2, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1048
    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->this$0:Lcom/nineoldandroids/animation/AnimatorSet;

    # getter for: Lcom/nineoldandroids/animation/AnimatorSet;->mNodes:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/nineoldandroids/animation/AnimatorSet;->access$400(Lcom/nineoldandroids/animation/AnimatorSet;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1050
    :cond_25
    new-instance v0, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;

    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet$Builder;->mCurrentNode:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3}, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;-><init>(Lcom/nineoldandroids/animation/AnimatorSet$Node;I)V

    .line 1051
    .local v0, "dependency":Lcom/nineoldandroids/animation/AnimatorSet$Dependency;
    invoke-virtual {v1, v0}, Lcom/nineoldandroids/animation/AnimatorSet$Node;->addDependency(Lcom/nineoldandroids/animation/AnimatorSet$Dependency;)V

    .line 1052
    return-object p0
.end method
