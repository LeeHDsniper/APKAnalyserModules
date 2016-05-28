.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$9;
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
        "Ljava/util/Map",
        "<",
        "Ljava/lang/Long;",
        "Ljava/lang/String;",
        ">;",
        "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 259
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$9;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call(Ljava/util/Map;)Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;"
        }
    .end annotation

    .prologue
    .line 262
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/String;>;"
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "1. tranform to purchasemap {%s}"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 263
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    invoke-direct {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 259
    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$9;->call(Ljava/util/Map;)Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    move-result-object v0

    return-object v0
.end method
