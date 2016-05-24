.class public abstract Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;
.super Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;
.source "StoreListFragmentAbstract.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$OnStoreElementSelected;
    }
.end annotation


# static fields
.field protected static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field protected billingKey:Ljava/lang/String;

.field protected compositeSubscription:Lrx/subscriptions/CompositeSubscription;

.field protected firstTime:Z

.field protected packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

.field protected permanentSubscriptions:Lrx/subscriptions/CompositeSubscription;

.field protected selectionListener:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$OnStoreElementSelected;

.field private uuid:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 34
    const-string v0, "StoreListFragmentAbstract"

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;-><init>()V

    .line 106
    new-instance v0, Lrx/subscriptions/CompositeSubscription;

    invoke-direct {v0}, Lrx/subscriptions/CompositeSubscription;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->compositeSubscription:Lrx/subscriptions/CompositeSubscription;

    .line 107
    new-instance v0, Lrx/subscriptions/CompositeSubscription;

    invoke-direct {v0}, Lrx/subscriptions/CompositeSubscription;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->permanentSubscriptions:Lrx/subscriptions/CompositeSubscription;

    .line 43
    return-void
.end method


# virtual methods
.method protected fireOnItemClick(JLjava/lang/String;)V
    .registers 7
    .param p1, "packid"    # J
    .param p3, "from"    # Ljava/lang/String;

    .prologue
    .line 93
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->selectionListener:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$OnStoreElementSelected;

    if-eqz v0, :cond_d

    .line 94
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->selectionListener:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$OnStoreElementSelected;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->getPackType()Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    move-result-object v1

    invoke-interface {v0, p1, p2, v1, p3}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$OnStoreElementSelected;->onPackSelected(JLcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;Ljava/lang/String;)V

    .line 96
    :cond_d
    return-void
.end method

.method public bridge synthetic getActivity()Landroid/content/Context;
    .registers 2

    .prologue
    .line 32
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    return-object v0
.end method

.method protected getPackType()Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    return-object v0
.end method

.method public getUUID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 250
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->uuid:Ljava/lang/String;

    if-nez v0, :cond_e

    .line 251
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->uuid:Ljava/lang/String;

    .line 253
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->uuid:Ljava/lang/String;

    return-object v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 54
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->onAttach(Landroid/app/Activity;)V

    .line 55
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getBillingKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->billingKey:Ljava/lang/String;

    .line 56
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 47
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->onCreate(Landroid/os/Bundle;)V

    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->firstTime:Z

    .line 49
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "extra-pack-type"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->packType:Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;

    .line 50
    return-void
.end method

.method public onDestroyView()V
    .registers 2

    .prologue
    .line 75
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->onDestroyView()V

    .line 76
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->permanentSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->clear()V

    .line 77
    return-void
.end method

.method public onDetach()V
    .registers 2

    .prologue
    .line 81
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->selectionListener:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$OnStoreElementSelected;

    .line 82
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->onDetach()V

    .line 83
    return-void
.end method

.method protected onDownloadStatusChanged(JLjava/lang/String;I)V
    .registers 10
    .param p1, "packid"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "status"    # I

    .prologue
    .line 222
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onDownloadStatusChanged{packId:%d, packType:%s, status:%d}"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    const/4 v3, 0x2

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 223
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 8
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 87
    .local p1, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    const-wide/16 v0, -0x1

    cmp-long v0, p4, v0

    if-lez v0, :cond_9

    .line 88
    invoke-virtual {p0, p4, p5}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->selectPack(J)V

    .line 90
    :cond_9
    return-void
.end method

.method protected onPackInstalled(JLjava/lang/String;I)V
    .registers 10
    .param p1, "packId"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "purchased"    # I

    .prologue
    .line 226
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onPackInstalled{packId:%d, packType:%s, purchased:%d}"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    const/4 v3, 0x2

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 227
    return-void
.end method

.method protected onPurchaseSuccess(JLjava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V
    .registers 10
    .param p1, "packId"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "purchase"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    .prologue
    .line 230
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onPurchaseSuccess{packId:%d, packType:%s, purchase:%s}"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    const/4 v3, 0x2

    aput-object p4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 231
    return-void
.end method

.method protected onServiceFinished()V
    .registers 3

    .prologue
    .line 234
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onServiceFinished"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 235
    return-void
.end method

.method public onSetupDone(Landroid/util/Pair;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;",
            "Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 218
    .local p1, "result":Landroid/util/Pair;, "Landroid/util/Pair<Lcom/adobe/creativesdk/aviary/internal/account/AccountResult;Lcom/adobe/creativesdk/aviary/internal/cds/util/IabResult;>;"
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onSetupDone: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 219
    return-void
.end method

.method public onStart()V
    .registers 5

    .prologue
    .line 174
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->onStart()V

    .line 175
    sget-object v2, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "onStart"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 177
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->isContentServiceConnected()Z

    move-result v2

    if-eqz v2, :cond_35

    .line 178
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v2

    new-instance v3, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$6;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$6;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;)V

    invoke-virtual {v2, p0, v3}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->subscribeToPackDownloadStatusChanged(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v0

    .line 190
    .local v0, "s3":Lrx/Subscription;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v2

    new-instance v3, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$7;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$7;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;)V

    invoke-virtual {v2, p0, v3}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->subscribeToCdsFinised(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v1

    .line 202
    .local v1, "s4":Lrx/Subscription;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->compositeSubscription:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v2, v0}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 203
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->compositeSubscription:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v2, v1}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 208
    .end local v0    # "s3":Lrx/Subscription;
    .end local v1    # "s4":Lrx/Subscription;
    :goto_34
    return-void

    .line 205
    :cond_35
    sget-object v2, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "service not connected"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_34
.end method

.method public onStop()V
    .registers 3

    .prologue
    .line 212
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onStop"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 213
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->onStop()V

    .line 214
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->compositeSubscription:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->clear()V

    .line 215
    return-void
.end method

.method protected onUserAuthenticated(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V
    .registers 6
    .param p1, "userStatus"    # Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;

    .prologue
    .line 238
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onUserAuthenticated: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 239
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 60
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/fragments/ListFragmentAbstract;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 61
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->startSetup()V

    .line 62
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 63
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setScrollbarFadingEnabled(Z)V

    .line 64
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->getListView()Landroid/widget/ListView;

    move-result-object v0

    const/high16 v1, 0x2000000

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setScrollBarStyle(I)V

    .line 66
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "checkableList"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_33

    .line 67
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setChoiceMode(I)V

    .line 71
    :goto_32
    return-void

    .line 69
    :cond_33
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setChoiceMode(I)V

    goto :goto_32
.end method

.method public selectPack(J)V
    .registers 8
    .param p1, "id"    # J

    .prologue
    .line 242
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "selectPack: %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 243
    return-void
.end method

.method public setOnSelectedListener(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$OnStoreElementSelected;)V
    .registers 2
    .param p1, "listener"    # Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$OnStoreElementSelected;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->selectionListener:Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$OnStoreElementSelected;

    .line 100
    return-void
.end method

.method protected startSetup()V
    .registers 8

    .prologue
    .line 110
    sget-object v4, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "startSetup"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 112
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->isContentServiceConnected()Z

    move-result v4

    if-nez v4, :cond_15

    .line 113
    sget-object v4, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v5, "content manager service is unavailable!"

    invoke-interface {v4, v5}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 170
    :goto_14
    return-void

    .line 119
    :cond_15
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->startSetup()Lrx/Observable;

    move-result-object v4

    invoke-static {p0, v4}, Lrx/android/app/AppObservable;->bindSupportFragment(Landroid/support/v4/app/Fragment;Lrx/Observable;)Lrx/Observable;

    move-result-object v4

    new-instance v5, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$1;

    invoke-direct {v5, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$1;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;)V

    new-instance v6, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$2;

    invoke-direct {v6, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$2;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;)V

    .line 120
    invoke-virtual {v4, v5, v6}, Lrx/Observable;->subscribe(Lrx/functions/Action1;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v0

    .line 134
    .local v0, "s0":Lrx/Subscription;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v4

    new-instance v5, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$3;

    invoke-direct {v5, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$3;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;)V

    invoke-virtual {v4, p0, v5}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->subscribeToUserStatusChange(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v1

    .line 142
    .local v1, "s1":Lrx/Subscription;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v4

    new-instance v5, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$4;

    invoke-direct {v5, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$4;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;)V

    invoke-virtual {v4, p0, v5}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->subscribeToPackPurchased(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v2

    .line 154
    .local v2, "s2":Lrx/Subscription;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v4

    new-instance v5, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$5;

    invoke-direct {v5, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract$5;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;)V

    invoke-virtual {v4, p0, v5}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->subscribeToPackInstalled(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v3

    .line 166
    .local v3, "s3":Lrx/Subscription;
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->permanentSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v4, v0}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 167
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->permanentSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v4, v1}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 168
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->permanentSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v4, v2}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 169
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreListFragmentAbstract;->permanentSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v4, v3}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    goto :goto_14
.end method
