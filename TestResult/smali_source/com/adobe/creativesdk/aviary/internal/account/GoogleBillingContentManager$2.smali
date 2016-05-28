.class Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;
.super Ljava/lang/Object;
.source "GoogleBillingContentManager.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->queryInternal(Ljava/util/List;)Lrx/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/Observable$OnSubscribe",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

.field final synthetic val$skus:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;Ljava/util/List;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    .prologue
    .line 115
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;->val$skus:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 115
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;>;"
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 118
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "queryInternal. list size: %d, thread: %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;->val$skus:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 119
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 121
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;->val$skus:Ljava/util/List;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->filterList(Ljava/util/List;)V
    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->access$200(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;Ljava/util/List;)V

    .line 122
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "list size is now: %d"

    new-array v4, v6, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;->val$skus:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 125
    :try_start_3d
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;->val$skus:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_64

    .line 126
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_64

    .line 127
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->helper:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    move-result-object v2

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;->val$skus:Ljava/util/List;

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->queryInventory(ZLjava/util/List;Ljava/util/List;)Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    move-result-object v1

    .line 128
    .local v1, "inventory":Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->access$100(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->addAll(Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;)V
    :try_end_64
    .catch Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException; {:try_start_3d .. :try_end_64} :catch_77

    .line 136
    .end local v1    # "inventory":Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    :cond_64
    :goto_64
    invoke-virtual {p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v2

    if-nez v2, :cond_76

    .line 137
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$2;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->access$100(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    move-result-object v2

    invoke-virtual {p1, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 138
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V

    .line 140
    :cond_76
    return-void

    .line 131
    :catch_77
    move-exception v0

    .line 132
    .local v0, "e":Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabException;->printStackTrace()V

    goto :goto_64
.end method
