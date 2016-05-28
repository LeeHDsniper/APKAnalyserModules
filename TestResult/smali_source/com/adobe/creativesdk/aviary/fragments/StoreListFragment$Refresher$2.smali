.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$2;
.super Ljava/lang/Object;
.source "StoreListFragment.java"

# interfaces
.implements Lrx/Observable$OnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->loadCursor()Lrx/Observable;
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
        "Landroid/database/Cursor;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;

    .prologue
    .line 791
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$2;->this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 791
    check-cast p1, Lrx/Subscriber;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$2;->call(Lrx/Subscriber;)V

    return-void
.end method

.method public call(Lrx/Subscriber;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/Subscriber",
            "<-",
            "Landroid/database/Cursor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 794
    .local p1, "subscriber":Lrx/Subscriber;, "Lrx/Subscriber<-Landroid/database/Cursor;>;"
    sget-object v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "loadCursor: %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 795
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 797
    invoke-virtual {p1}, Lrx/Subscriber;->isUnsubscribed()Z

    move-result v1

    if-nez v1, :cond_31

    .line 798
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$2;->this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;

    iget-object v1, v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$2;->this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;

    iget-object v2, v2, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->createCursorForAvailablePacks(Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Landroid/database/Cursor;

    move-result-object v0

    .line 799
    .local v0, "cursor":Landroid/database/Cursor;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher$2;->this$1:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;

    # setter for: Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->mCursor:Landroid/database/Cursor;
    invoke-static {v1, v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->access$302(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;Landroid/database/Cursor;)Landroid/database/Cursor;

    .line 800
    invoke-virtual {p1, v0}, Lrx/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 801
    invoke-virtual {p1}, Lrx/Subscriber;->onCompleted()V

    .line 803
    .end local v0    # "cursor":Landroid/database/Cursor;
    :cond_31
    return-void
.end method
