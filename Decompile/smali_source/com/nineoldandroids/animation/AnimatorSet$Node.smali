.class Lcom/nineoldandroids/animation/AnimatorSet$Node;
.super Ljava/lang/Object;
.source "AnimatorSet.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nineoldandroids/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Node"
.end annotation


# instance fields
.field public animation:Lcom/nineoldandroids/animation/Animator;

.field public dependencies:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/AnimatorSet$Dependency;",
            ">;"
        }
    .end annotation
.end field

.field public done:Z

.field public nodeDependencies:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/AnimatorSet$Node;",
            ">;"
        }
    .end annotation
.end field

.field public nodeDependents:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/AnimatorSet$Node;",
            ">;"
        }
    .end annotation
.end field

.field public tmpDependencies:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/nineoldandroids/animation/AnimatorSet$Dependency;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/nineoldandroids/animation/Animator;)V
    .registers 3
    .param p1, "animation"    # Lcom/nineoldandroids/animation/Animator;

    .prologue
    const/4 v0, 0x0

    .line 923
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 883
    iput-object v0, p0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    .line 894
    iput-object v0, p0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->tmpDependencies:Ljava/util/ArrayList;

    .line 900
    iput-object v0, p0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    .line 907
    iput-object v0, p0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependents:Ljava/util/ArrayList;

    .line 914
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->done:Z

    .line 924
    iput-object p1, p0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    .line 925
    return-void
.end method


# virtual methods
.method public addDependency(Lcom/nineoldandroids/animation/AnimatorSet$Dependency;)V
    .registers 5
    .param p1, "dependency"    # Lcom/nineoldandroids/animation/AnimatorSet$Dependency;

    .prologue
    .line 933
    iget-object v1, p0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    if-nez v1, :cond_12

    .line 934
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    .line 935
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    .line 937
    :cond_12
    iget-object v1, p0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->dependencies:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 938
    iget-object v1, p0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    iget-object v2, p1, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;->node:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_28

    .line 939
    iget-object v1, p0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependencies:Ljava/util/ArrayList;

    iget-object v2, p1, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;->node:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 941
    :cond_28
    iget-object v0, p1, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;->node:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 942
    .local v0, "dependencyNode":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v1, v0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependents:Ljava/util/ArrayList;

    if-nez v1, :cond_35

    .line 943
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependents:Ljava/util/ArrayList;

    .line 945
    :cond_35
    iget-object v1, v0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->nodeDependents:Ljava/util/ArrayList;

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 946
    return-void
.end method

.method public clone()Lcom/nineoldandroids/animation/AnimatorSet$Node;
    .registers 4

    .prologue
    .line 951
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 952
    .local v1, "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    iget-object v2, p0, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;

    invoke-virtual {v2}, Lcom/nineoldandroids/animation/Animator;->clone()Lcom/nineoldandroids/animation/Animator;

    move-result-object v2

    iput-object v2, v1, Lcom/nineoldandroids/animation/AnimatorSet$Node;->animation:Lcom/nineoldandroids/animation/Animator;
    :try_end_e
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_e} :catch_f

    .line 953
    return-object v1

    .line 954
    .end local v1    # "node":Lcom/nineoldandroids/animation/AnimatorSet$Node;
    :catch_f
    move-exception v0

    .line 955
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 874
    invoke-virtual {p0}, Lcom/nineoldandroids/animation/AnimatorSet$Node;->clone()Lcom/nineoldandroids/animation/AnimatorSet$Node;

    move-result-object v0

    return-object v0
.end method
