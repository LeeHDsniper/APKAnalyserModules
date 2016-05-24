.class Lcom/facebook/Request$4;
.super Ljava/lang/Object;
.source "Request.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/Request;->runCallbacks(Lcom/facebook/RequestBatch;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$callbacks:Ljava/util/ArrayList;

.field private final synthetic val$requests:Lcom/facebook/RequestBatch;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;Lcom/facebook/RequestBatch;)V
    .registers 3

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/Request$4;->val$callbacks:Ljava/util/ArrayList;

    iput-object p2, p0, Lcom/facebook/Request$4;->val$requests:Lcom/facebook/RequestBatch;

    .line 1655
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 1657
    iget-object v3, p0, Lcom/facebook/Request$4;->val$callbacks:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_6
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1d

    .line 1661
    iget-object v3, p0, Lcom/facebook/Request$4;->val$requests:Lcom/facebook/RequestBatch;

    invoke-virtual {v3}, Lcom/facebook/RequestBatch;->getCallbacks()Ljava/util/List;

    move-result-object v1

    .line 1662
    .local v1, "batchCallbacks":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/RequestBatch$Callback;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_16
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_2f

    .line 1665
    return-void

    .line 1657
    .end local v1    # "batchCallbacks":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/RequestBatch$Callback;>;"
    :cond_1d
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    .line 1658
    .local v2, "pair":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/facebook/Request$Callback;Lcom/facebook/Response;>;"
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Lcom/facebook/Request$Callback;

    iget-object v4, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Lcom/facebook/Response;

    invoke-interface {v3, v4}, Lcom/facebook/Request$Callback;->onCompleted(Lcom/facebook/Response;)V

    goto :goto_6

    .line 1662
    .end local v2    # "pair":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/facebook/Request$Callback;Lcom/facebook/Response;>;"
    .restart local v1    # "batchCallbacks":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/RequestBatch$Callback;>;"
    :cond_2f
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/RequestBatch$Callback;

    .line 1663
    .local v0, "batchCallback":Lcom/facebook/RequestBatch$Callback;
    iget-object v4, p0, Lcom/facebook/Request$4;->val$requests:Lcom/facebook/RequestBatch;

    invoke-interface {v0, v4}, Lcom/facebook/RequestBatch$Callback;->onBatchCompleted(Lcom/facebook/RequestBatch;)V

    goto :goto_16
.end method
