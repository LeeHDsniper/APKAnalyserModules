.class Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$6;
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
        "Lrx/Observable",
        "<+",
        "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    .prologue
    .line 288
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$6;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 288
    check-cast p1, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$6;->call(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public call(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;
    .registers 7
    .param p1, "purchaseMap"    # Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
            ")",
            "Lrx/Observable",
            "<+",
            "Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 292
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "4. query the google services {%s}"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 293
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$6;->this$0:Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;

    # invokes: Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->queryGooglePurchaseMap(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;->access$000(Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory;Lcom/adobe/creativesdk/aviary/internal/account/BillingContentFactory$PurchaseMap;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
