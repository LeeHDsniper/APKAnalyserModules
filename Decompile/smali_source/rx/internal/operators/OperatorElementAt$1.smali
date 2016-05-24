.class Lrx/internal/operators/OperatorElementAt$1;
.super Lrx/Subscriber;
.source "OperatorElementAt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorElementAt;->call(Lrx/Subscriber;)Lrx/Subscriber;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lrx/Subscriber",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private currentIndex:I

.field final synthetic this$0:Lrx/internal/operators/OperatorElementAt;

.field final synthetic val$subscriber:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lrx/internal/operators/OperatorElementAt;Lrx/Subscriber;Lrx/Subscriber;)V
    .registers 5

    .prologue
    .line 49
    .local p0, "this":Lrx/internal/operators/OperatorElementAt$1;, "Lrx/internal/operators/OperatorElementAt.1;"
    .local p2, "x0":Lrx/Subscriber;, "Lrx/Subscriber<*>;"
    iput-object p1, p0, Lrx/internal/operators/OperatorElementAt$1;->this$0:Lrx/internal/operators/OperatorElementAt;

    iput-object p3, p0, Lrx/internal/operators/OperatorElementAt$1;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0, p2}, Lrx/Subscriber;-><init>(Lrx/Subscriber;)V

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lrx/internal/operators/OperatorElementAt$1;->currentIndex:I

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .registers 5

    .prologue
    .line 71
    .local p0, "this":Lrx/internal/operators/OperatorElementAt$1;, "Lrx/internal/operators/OperatorElementAt.1;"
    iget v0, p0, Lrx/internal/operators/OperatorElementAt$1;->currentIndex:I

    iget-object v1, p0, Lrx/internal/operators/OperatorElementAt$1;->this$0:Lrx/internal/operators/OperatorElementAt;

    # getter for: Lrx/internal/operators/OperatorElementAt;->index:I
    invoke-static {v1}, Lrx/internal/operators/OperatorElementAt;->access$000(Lrx/internal/operators/OperatorElementAt;)I

    move-result v1

    if-gt v0, v1, :cond_22

    .line 73
    iget-object v0, p0, Lrx/internal/operators/OperatorElementAt$1;->this$0:Lrx/internal/operators/OperatorElementAt;

    # getter for: Lrx/internal/operators/OperatorElementAt;->hasDefault:Z
    invoke-static {v0}, Lrx/internal/operators/OperatorElementAt;->access$100(Lrx/internal/operators/OperatorElementAt;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 74
    iget-object v0, p0, Lrx/internal/operators/OperatorElementAt$1;->val$subscriber:Lrx/Subscriber;

    iget-object v1, p0, Lrx/internal/operators/OperatorElementAt$1;->this$0:Lrx/internal/operators/OperatorElementAt;

    # getter for: Lrx/internal/operators/OperatorElementAt;->defaultValue:Ljava/lang/Object;
    invoke-static {v1}, Lrx/internal/operators/OperatorElementAt;->access$200(Lrx/internal/operators/OperatorElementAt;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 75
    iget-object v0, p0, Lrx/internal/operators/OperatorElementAt$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 80
    :cond_22
    :goto_22
    return-void

    .line 77
    :cond_23
    iget-object v0, p0, Lrx/internal/operators/OperatorElementAt$1;->val$subscriber:Lrx/Subscriber;

    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lrx/internal/operators/OperatorElementAt$1;->this$0:Lrx/internal/operators/OperatorElementAt;

    # getter for: Lrx/internal/operators/OperatorElementAt;->index:I
    invoke-static {v3}, Lrx/internal/operators/OperatorElementAt;->access$000(Lrx/internal/operators/OperatorElementAt;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is out of bounds"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_22
.end method

.method public onError(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 66
    .local p0, "this":Lrx/internal/operators/OperatorElementAt$1;, "Lrx/internal/operators/OperatorElementAt.1;"
    iget-object v0, p0, Lrx/internal/operators/OperatorElementAt$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    .line 67
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lrx/internal/operators/OperatorElementAt$1;, "Lrx/internal/operators/OperatorElementAt.1;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget v0, p0, Lrx/internal/operators/OperatorElementAt$1;->currentIndex:I

    iget-object v1, p0, Lrx/internal/operators/OperatorElementAt$1;->this$0:Lrx/internal/operators/OperatorElementAt;

    # getter for: Lrx/internal/operators/OperatorElementAt;->index:I
    invoke-static {v1}, Lrx/internal/operators/OperatorElementAt;->access$000(Lrx/internal/operators/OperatorElementAt;)I

    move-result v1

    if-ne v0, v1, :cond_1b

    .line 56
    iget-object v0, p0, Lrx/internal/operators/OperatorElementAt$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0, p1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 57
    iget-object v0, p0, Lrx/internal/operators/OperatorElementAt$1;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->onCompleted()V

    .line 61
    :goto_14
    iget v0, p0, Lrx/internal/operators/OperatorElementAt$1;->currentIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lrx/internal/operators/OperatorElementAt$1;->currentIndex:I

    .line 62
    return-void

    .line 59
    :cond_1b
    const-wide/16 v0, 0x1

    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorElementAt$1;->request(J)V

    goto :goto_14
.end method
