.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$2;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"

# interfaces
.implements Lrx/functions/Action1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;->call(Lrx/Subscriber;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/functions/Action1",
        "<",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/Long;",
        "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;

.field final synthetic val$subscriber:Lrx/Subscriber;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;Lrx/Subscriber;)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;

    .prologue
    .line 504
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$2;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$2;->val$subscriber:Lrx/Subscriber;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 504
    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$2;->call(Ljava/util/Map;)V

    return-void
.end method

.method public call(Ljava/util/Map;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 508
    .local p1, "resultMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$2;->val$subscriber:Lrx/Subscriber;

    invoke-virtual {v0}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 516
    :goto_8
    return-void

    .line 511
    :cond_9
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$2;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;

    iget-wide v0, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;->val$packId:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 512
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$2;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;

    iget-object v1, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$2;->val$subscriber:Lrx/Subscriber;

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$2;->this$1:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;

    iget-wide v4, v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15;->val$packId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->doVerifyPackOptionItem(Lrx/Subscriber;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;)V
    invoke-static {v1, v2, v0}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$900(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Lrx/Subscriber;Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;)V

    goto :goto_8

    .line 514
    :cond_2f
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$15$2;->val$subscriber:Lrx/Subscriber;

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Item not found!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lrx/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_8
.end method
