.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$4;
.super Ljava/lang/Object;
.source "StoreListFragment.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


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
        "Lrx/Observable$OnSubscribe",
        "<",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/Long;",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;

.field final synthetic val$cursor:Landroid/database/Cursor;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;Landroid/database/Cursor;)V
    .registers 3
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;

    .prologue
    .line 809
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$4;->this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;

    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$4;->val$cursor:Landroid/database/Cursor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 809
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$4;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Ljava/util/Map<Ljava/lang/Long;Ljava/lang/String;>;>;"
    const/4 v7, -0x1

    .line 812
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 814
    .local v1, "packs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Ljava/lang/String;>;"
    sget-object v2, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "generatePurchaseMap::call: %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-interface {v2, v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 815
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$4;->val$cursor:Landroid/database/Cursor;

    if-eqz v2, :cond_4f

    .line 816
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$4;->val$cursor:Landroid/database/Cursor;

    invoke-interface {v2, v7}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 817
    :cond_20
    :goto_20
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$4;->val$cursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_4a

    .line 818
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$4;->val$cursor:Landroid/database/Cursor;

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->create(Landroid/database/Cursor;)Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    move-result-object v0

    .line 819
    .local v0, "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    if-eqz v0, :cond_20

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-lez v2, :cond_20

    .line 820
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_20

    .line 823
    .end local v0    # "pack":Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;
    :cond_4a
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$4;->val$cursor:Landroid/database/Cursor;

    invoke-interface {v2, v7}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 825
    :cond_4f
    invoke-virtual {p1, v1}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 826
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V

    .line 827
    return-void
.end method
