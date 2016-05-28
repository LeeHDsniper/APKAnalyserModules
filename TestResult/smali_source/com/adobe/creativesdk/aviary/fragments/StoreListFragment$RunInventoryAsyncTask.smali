.class Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RunInventoryAsyncTask;
.super Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;
.source "StoreListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RunInventoryAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask",
        "<",
        "Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

.field final synthetic this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    .prologue
    .line 886
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RunInventoryAsyncTask;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 886
    check-cast p1, [Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RunInventoryAsyncTask;->doInBackground([Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)Ljava/lang/Void;
    .registers 6
    .param p1, "params"    # [Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .prologue
    const/4 v3, 0x0

    .line 891
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "RunInventoryAsyncTask::execute"

    new-array v2, v3, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 892
    aget-object v0, p1, v3

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RunInventoryAsyncTask;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 893
    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic doPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 886
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RunInventoryAsyncTask;->doPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected doPostExecute(Ljava/lang/Void;)V
    .registers 6
    .param p1, "aVoid"    # Ljava/lang/Void;

    .prologue
    .line 898
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "RunInventoryAsyncTask::doPostExecute"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->verbose(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 899
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/os/AdobeImageAsyncTask;->doPostExecute(Ljava/lang/Object;)V

    .line 900
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RunInventoryAsyncTask;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_3b

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RunInventoryAsyncTask;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3b

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RunInventoryAsyncTask;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->compositeSubscription:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->isUnsubscribed()Z

    move-result v0

    if-nez v0, :cond_3b

    .line 901
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RunInventoryAsyncTask;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;->compositeSubscription:Lrx/subscriptions/CompositeSubscription;

    new-instance v1, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RunInventoryAsyncTask;->this$0:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$RunInventoryAsyncTask;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    invoke-direct {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment;Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;)V

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragment$Refresher;->execute()Lrx/Subscriber;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 903
    :cond_3b
    return-void
.end method
