.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->verifyPack(JLjava/lang/String;)Lrx/Observable;
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
        "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

.field final synthetic val$identifier:Ljava/lang/String;

.field final synthetic val$packId:J


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;JLjava/lang/String;)V
    .registers 5
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 485
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    iput-wide p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;->val$packId:J

    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;->val$identifier:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 485
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 488
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;>;"
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "verifyPack"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 489
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 491
    invoke-virtual {p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v2

    if-eqz v2, :cond_11

    .line 531
    :goto_10
    return-void

    .line 495
    :cond_11
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # getter for: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->mCacheMap:Ljava/util/Map;
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$800(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)Ljava/util/Map;

    move-result-object v2

    iget-wide v4, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;->val$packId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    .line 497
    .local v0, "item":Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;
    if-nez v0, :cond_58

    .line 498
    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "item from cache is null... we need to check it again!"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    .line 500
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 501
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/String;>;"
    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;->val$packId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;->val$identifier:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 502
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->queryPurchases(Ljava/util/Map;)Lrx/Observable;

    move-result-object v2

    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$2;

    invoke-direct {v3, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$2;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;Lrx/Subscriber;)V

    .line 503
    invoke-virtual {v2, v3}, Lrx/Observable;->doOnNext(Lrx/functions/Action1;)Lrx/Observable;

    move-result-object v2

    new-instance v3, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$1;

    invoke-direct {v3, p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;Lrx/Subscriber;)V

    .line 518
    invoke-virtual {v2, v3}, Lrx/Observable;->doOnError(Lrx/functions/Action1;)Lrx/Observable;

    move-result-object v2

    .line 527
    invoke-virtual {v2}, Lrx/Observable;->subscribe()Lrx/Subscription;

    goto :goto_10

    .line 529
    .end local v1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/String;>;"
    :cond_58
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->doVerifyPackOptionItem(Lrx/Subscriber;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;)V
    invoke-static {v2, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$900(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Lrx/Subscriber;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;)V

    goto :goto_10
.end method
