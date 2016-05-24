.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$17;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"

# interfaces
.implements Lrx/functions/Func1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->queryAdobePurchaseMap(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;
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
        "Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;",
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
    .line 615
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$17;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$17;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 615
    check-cast p1, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$17;->call(Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public call(Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;)Lrx/Observable;
    .registers 13
    .param p1, "inventory"    # Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;",
            ")",
            "Lrx/Observable",
            "<+",
            "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 618
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v7, "queryAdobePurchaseMap::concatMap {%s}"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-interface {v6, v7, v8}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 620
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$17;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    iget-object v6, v6, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->adobeMap:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 621
    .local v3, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Long;Ljava/lang/String;>;>;"
    :cond_1d
    :goto_1d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_b5

    .line 622
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 624
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 625
    .local v4, "packId":J
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 627
    .local v2, "identifier":Ljava/lang/String;
    invoke-virtual {p1, v2}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeInventory;->hasPurchase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1d

    .line 629
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$17;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCacheMap:Ljava/util/Map;
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$800(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Ljava/util/Map;

    move-result-object v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    .line 631
    .local v0, "current":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "current before: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 633
    if-eqz v0, :cond_6f

    iget-object v6, v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->option:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->OWNED:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    if-eq v6, v7, :cond_82

    .line 634
    :cond_6f
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;->RESTORE:Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;

    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;->from(Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOption;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    move-result-object v0

    .line 636
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$17;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCacheMap:Ljava/util/Map;
    invoke-static {v6}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$800(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Ljava/util/Map;

    move-result-object v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v6, v7, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 639
    :cond_82
    sget-object v6, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "current before: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 642
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$17;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    iget-object v6, v6, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->checked:Ljava/util/Map;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v6, v7, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 644
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$17;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    iget-object v6, v6, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->googleMap:Ljava/util/Map;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 646
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto/16 :goto_1d

    .line 649
    .end local v0    # "current":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Ljava/lang/String;>;"
    .end local v2    # "identifier":Ljava/lang/String;
    .end local v4    # "packId":J
    :cond_b5
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$17;->val$map:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    invoke-static {v6}, Lrx/Observable;->just(Ljava/lang/Object;)Lrx/Observable;

    move-result-object v6

    return-object v6
.end method
