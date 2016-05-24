.class public Lrx/internal/operators/OperatorMerge;
.super Ljava/lang/Object;
.source "OperatorMerge.java"

# interfaces
.implements Lrx/Observable$Operator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorMerge$1;,
        Lrx/internal/operators/OperatorMerge$InnerSubscriber;,
        Lrx/internal/operators/OperatorMerge$MergeProducer;,
        Lrx/internal/operators/OperatorMerge$MergeSubscriber;,
        Lrx/internal/operators/OperatorMerge$HolderDelayErrors;,
        Lrx/internal/operators/OperatorMerge$HolderNoDelay;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Observable$Operator",
        "<TT;",
        "Lrx/Observable",
        "<+TT;>;>;"
    }
.end annotation


# instance fields
.field private final delayErrors:Z


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 104
    .local p0, "this":Lrx/internal/operators/OperatorMerge;, "Lrx/internal/operators/OperatorMerge<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    const/4 v0, 0x0

    iput-boolean v0, p0, Lrx/internal/operators/OperatorMerge;->delayErrors:Z

    .line 106
    return-void
.end method

.method private constructor <init>(Z)V
    .registers 2
    .param p1, "delayErrors"    # Z

    .prologue
    .line 108
    .local p0, "this":Lrx/internal/operators/OperatorMerge;, "Lrx/internal/operators/OperatorMerge<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    iput-boolean p1, p0, Lrx/internal/operators/OperatorMerge;->delayErrors:Z

    .line 110
    return-void
.end method

.method synthetic constructor <init>(ZLrx/internal/operators/OperatorMerge$1;)V
    .registers 3
    .param p1, "x0"    # Z
    .param p2, "x1"    # Lrx/internal/operators/OperatorMerge$1;

    .prologue
    .line 52
    .local p0, "this":Lrx/internal/operators/OperatorMerge;, "Lrx/internal/operators/OperatorMerge<TT;>;"
    invoke-direct {p0, p1}, Lrx/internal/operators/OperatorMerge;-><init>(Z)V

    return-void
.end method

.method public static instance(Z)Lrx/internal/operators/OperatorMerge;
    .registers 2
    .param p0, "delayErrors"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(Z)",
            "Lrx/internal/operators/OperatorMerge",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 69
    if-eqz p0, :cond_5

    .line 70
    sget-object v0, Lrx/internal/operators/OperatorMerge$HolderDelayErrors;->INSTANCE:Lrx/internal/operators/OperatorMerge;

    .line 72
    :goto_4
    return-object v0

    :cond_5
    sget-object v0, Lrx/internal/operators/OperatorMerge$HolderNoDelay;->INSTANCE:Lrx/internal/operators/OperatorMerge;

    goto :goto_4
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 52
    .local p0, "this":Lrx/internal/operators/OperatorMerge;, "Lrx/internal/operators/OperatorMerge<TT;>;"
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorMerge;->call(Lrx/Subscriber;)Lrx/Subscriber;

    move-result-object v0

    return-object v0
.end method

.method public call(Lrx/Subscriber;)Lrx/Subscriber;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)",
            "Lrx/Subscriber",
            "<",
            "Lrx/Observable",
            "<+TT;>;>;"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "this":Lrx/internal/operators/OperatorMerge;, "Lrx/internal/operators/OperatorMerge<TT;>;"
    .local p1, "child":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorMerge$MergeSubscriber;

    iget-boolean v1, p0, Lrx/internal/operators/OperatorMerge;->delayErrors:Z

    invoke-direct {v0, p1, v1}, Lrx/internal/operators/OperatorMerge$MergeSubscriber;-><init>(Lrx/Subscriber;Z)V

    return-object v0
.end method
