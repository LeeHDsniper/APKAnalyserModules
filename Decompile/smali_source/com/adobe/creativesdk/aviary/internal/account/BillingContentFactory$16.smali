.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$16;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"

# interfaces
.implements Lrx/functions/Func1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->queryGooglePurchaseMap(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Func1",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;",
        "Lrx/Observable",
        "<+",
        "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

.field final synthetic val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 561
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$16;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$16;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 561
    check-cast p1, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$16;->call(Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public call(Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;)Lrx/Observable;
    .registers 15
    .param p1, "inventory"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;",
            ")",
            "Lrx/Observable",
            "<+",
            "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 564
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "queryGooglePurchaseMap::concatMap {%s}"

    new-array v9, v12, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-interface {v5, v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 566
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$16;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->googleMap:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 567
    .local v4, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Long;Ljava/lang/String;>;>;"
    :goto_1d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_bb

    .line 568
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 570
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 571
    .local v6, "packId":J
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 573
    .local v3, "identifier":Ljava/lang/String;
    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->hasPurchase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_84

    .line 574
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$16;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCacheMap:Ljava/util/Map;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$800(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Ljava/util/Map;

    move-result-object v5

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v5, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    .line 575
    .local v0, "current":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    if-eqz v0, :cond_57

    iget-object v5, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    sget-object v8, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->OWNED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    if-eq v5, v8, :cond_6a

    .line 576
    :cond_57
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->RESTORE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v0

    .line 578
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$16;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCacheMap:Ljava/util/Map;
    invoke-static {v5}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$800(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Ljava/util/Map;

    move-result-object v5

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v5, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 581
    :cond_6a
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$16;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->checked:Ljava/util/Map;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v5, v8, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 583
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$16;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->adobeMap:Ljava/util/Map;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v5, v8}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 584
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_1d

    .line 586
    .end local v0    # "current":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    :cond_84
    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->hasDetails(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_ae

    .line 587
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {p1, v5}, Lcom/adobe/creativesdk/aviary/internal/cds/util/Inventory;->getSkuDetails(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/util/SkuDetails;

    move-result-object v1

    .line 588
    .local v1, "detail":Lcom/adobe/creativesdk/aviary/internal/cds/util/SkuDetails;
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$16;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    iget-object v5, v5, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->checked:Ljava/util/Map;

    .line 590
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    sget-object v9, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->PURCHASE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    .line 592
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/util/SkuDetails;->getPrice()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v9

    .line 589
    invoke-interface {v5, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 593
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto/16 :goto_1d

    .line 596
    .end local v1    # "detail":Lcom/adobe/creativesdk/aviary/internal/cds/util/SkuDetails;
    :cond_ae
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v8, "Google doesn\'t know about this item! {%s}"

    new-array v9, v12, [Ljava/lang/Object;

    aput-object v3, v9, v11

    invoke-interface {v5, v8, v9}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_1d

    .line 600
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Ljava/lang/String;>;"
    .end local v3    # "identifier":Ljava/lang/String;
    .end local v6    # "packId":J
    :cond_bb
    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$16;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    invoke-static {v5}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v5

    return-object v5
.end method
