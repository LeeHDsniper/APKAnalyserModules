.class public final Lrx/internal/operators/OperatorElementAt;
.super Ljava/lang/Object;
.source "OperatorElementAt.java"

# interfaces
.implements Lrx/Observable$Operator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/Observable$Operator",
        "<TT;TT;>;"
    }
.end annotation


# instance fields
.field private final defaultValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final hasDefault:Z

.field private final index:I


# direct methods
.method public constructor <init>(I)V
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 31
    .local p0, "this":Lrx/internal/operators/OperatorElementAt;, "Lrx/internal/operators/OperatorElementAt<TT;>;"
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lrx/internal/operators/OperatorElementAt;-><init>(ILjava/lang/Object;Z)V

    .line 32
    return-void
.end method

.method private constructor <init>(ILjava/lang/Object;Z)V
    .registers 7
    .param p1, "index"    # I
    .param p3, "hasDefault"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;Z)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "this":Lrx/internal/operators/OperatorElementAt;, "Lrx/internal/operators/OperatorElementAt<TT;>;"
    .local p2, "defaultValue":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    if-gez p1, :cond_1e

    .line 40
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is out of bounds"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_1e
    iput p1, p0, Lrx/internal/operators/OperatorElementAt;->index:I

    .line 43
    iput-object p2, p0, Lrx/internal/operators/OperatorElementAt;->defaultValue:Ljava/lang/Object;

    .line 44
    iput-boolean p3, p0, Lrx/internal/operators/OperatorElementAt;->hasDefault:Z

    .line 45
    return-void
.end method

.method static synthetic access$000(Lrx/internal/operators/OperatorElementAt;)I
    .registers 2
    .param p0, "x0"    # Lrx/internal/operators/OperatorElementAt;

    .prologue
    .line 24
    iget v0, p0, Lrx/internal/operators/OperatorElementAt;->index:I

    return v0
.end method

.method static synthetic access$100(Lrx/internal/operators/OperatorElementAt;)Z
    .registers 2
    .param p0, "x0"    # Lrx/internal/operators/OperatorElementAt;

    .prologue
    .line 24
    iget-boolean v0, p0, Lrx/internal/operators/OperatorElementAt;->hasDefault:Z

    return v0
.end method

.method static synthetic access$200(Lrx/internal/operators/OperatorElementAt;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lrx/internal/operators/OperatorElementAt;

    .prologue
    .line 24
    iget-object v0, p0, Lrx/internal/operators/OperatorElementAt;->defaultValue:Ljava/lang/Object;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 24
    .local p0, "this":Lrx/internal/operators/OperatorElementAt;, "Lrx/internal/operators/OperatorElementAt<TT;>;"
    check-cast p1, Lrx/Subscriber;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorElementAt;->call(Lrx/Subscriber;)Lrx/Subscriber;

    move-result-object v0

    return-object v0
.end method

.method public call(Lrx/Subscriber;)Lrx/Subscriber;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-TT;>;)",
            "Lrx/Subscriber",
            "<-TT;>;"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "this":Lrx/internal/operators/OperatorElementAt;, "Lrx/internal/operators/OperatorElementAt<TT;>;"
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-TT;>;"
    new-instance v0, Lrx/internal/operators/OperatorElementAt$1;

    invoke-direct {v0, p0, p1, p1}, Lrx/internal/operators/OperatorElementAt$1;-><init>(Lrx/internal/operators/OperatorElementAt;Lrx/Subscriber;Lrx/Subscriber;)V

    return-object v0
.end method
