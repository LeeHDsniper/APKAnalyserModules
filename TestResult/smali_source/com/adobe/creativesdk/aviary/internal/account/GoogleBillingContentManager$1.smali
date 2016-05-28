.class Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$1;
.super Ljava/lang/Object;
.source "GoogleBillingContentManager.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->queryPurchasesInternal()Lrx/Observable;
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


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 86
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$1;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 9
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
    const/4 v6, 0x0

    .line 89
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "queryPurchasesInternal: %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 90
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 92
    :try_start_14
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_31

    .line 93
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->helper:Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/util/IabHelper;->queryInventory(ZLjava/util/List;)Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    move-result-object v1

    .line 94
    .local v1, "inventory":Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->access$100(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->addAll(Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;)V

    .line 97
    .end local v1    # "inventory":Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    :cond_31
    invoke-virtual {p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v2

    if-nez v2, :cond_43

    .line 98
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager$1;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->mInventory:Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;->access$100(Lcom/adobe/creativesdk/aviary/internal/account/GoogleBillingContentManager;)Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    move-result-object v2

    invoke-virtual {p1, v2}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 99
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_43} :catch_44

    .line 108
    :cond_43
    :goto_43
    return-void

    .line 101
    :catch_44
    move-exception v0

    .line 102
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 104
    invoke-virtual {p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v2

    if-nez v2, :cond_43

    .line 105
    invoke-virtual {p1, v0}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_43
.end method
