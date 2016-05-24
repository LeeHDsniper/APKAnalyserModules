.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$5;
.super Ljava/lang/Object;
.source "BillingContentFactory.java"

# interfaces
.implements Lrx/functions/Func1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->queryPurchases(Ljava/util/Map;)Lrx/Observable;
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
        "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/Long;",
        "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

.field final synthetic val$inputMap:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Ljava/util/Map;)V
    .registers 3
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 298
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$5;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$5;->val$inputMap:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 298
    check-cast p1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$5;->call(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public call(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Ljava/util/Map;
    .registers 8
    .param p1, "purchaseMap"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 302
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "transform back to map<long, packoptionwithprice> {%s}"

    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 303
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "final result: %s"

    new-array v2, v5, [Ljava/lang/Object;

    aput-object p1, v2, v4

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 304
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "input list was: %d"

    new-array v2, v5, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$5;->val$inputMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 305
    iget-object v0, p1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;->checked:Ljava/util/Map;

    return-object v0
.end method
