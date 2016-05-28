.class Lcom/nineoldandroids/animation/AnimatorSet$Dependency;
.super Ljava/lang/Object;
.source "AnimatorSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nineoldandroids/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Dependency"
.end annotation


# instance fields
.field public node:Lcom/nineoldandroids/animation/AnimatorSet$Node;

.field public rule:I


# direct methods
.method public constructor <init>(Lcom/nineoldandroids/animation/AnimatorSet$Node;I)V
    .registers 3
    .param p1, "node"    # Lcom/nineoldandroids/animation/AnimatorSet$Node;
    .param p2, "rule"    # I

    .prologue
    .line 862
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 863
    iput-object p1, p0, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;->node:Lcom/nineoldandroids/animation/AnimatorSet$Node;

    .line 864
    iput p2, p0, Lcom/nineoldandroids/animation/AnimatorSet$Dependency;->rule:I

    .line 865
    return-void
.end method
