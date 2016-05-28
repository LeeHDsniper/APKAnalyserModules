.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$3;
.super Ljava/lang/Object;
.source "StoreListFragment.java"

# interfaces
.implements Lrx/functions/Func1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->generatePurchaseMap(Landroid/database/Cursor;)Lrx/Observable;
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
        "Lrx/Observable",
        "<",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/Long;",
        "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;

    .prologue
    .line 830
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$3;->this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 830
    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$3;->call(Ljava/util/Map;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method

.method public call(Ljava/util/Map;)Lrx/Observable;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;)",
            "Lrx/Observable",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsUtils$PackOptionWithPrice;",
            ">;>;"
        }
    .end annotation

    .prologue
    .local p1, "longStringHashMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/String;>;"
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 833
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 834
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "generatePurchaseMap::concatMap::call: %s"

    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 835
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "array size: %d"

    new-array v2, v5, [Ljava/lang/Object;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 836
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$3;->this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->queryPurchases(Ljava/util/Map;)Lrx/Observable;

    move-result-object v0

    return-object v0
.end method
