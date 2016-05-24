.class public abstract Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;
.super Landroid/support/v4/app/Fragment;
.source "StoreDetailFragmentAbstract.java"

# interfaces
.implements Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;


# static fields
.field protected static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# instance fields
.field private mDetailView:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

.field private mPackId:J

.field private final mSubjectSubscriptions:Lrx/subscriptions/CompositeSubscription;

.field private uuid:Ljava/lang/String;

.field private visible:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 31
    const-class v0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 27
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mPackId:J

    .line 32
    new-instance v0, Lrx/subscriptions/CompositeSubscription;

    invoke-direct {v0}, Lrx/subscriptions/CompositeSubscription;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mSubjectSubscriptions:Lrx/subscriptions/CompositeSubscription;

    .line 36
    return-void
.end method


# virtual methods
.method public bridge synthetic getActivity()Landroid/content/Context;
    .registers 2

    .prologue
    .line 26
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    return-object v0
.end method

.method public getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;
    .registers 2

    .prologue
    .line 136
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v0

    return-object v0
.end method

.method public getUUID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->uuid:Ljava/lang/String;

    if-nez v0, :cond_e

    .line 41
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->uuid:Ljava/lang/String;

    .line 43
    :cond_e
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->uuid:Ljava/lang/String;

    return-object v0
.end method

.method public isContentServiceConnected()Z
    .registers 2

    .prologue
    .line 141
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/account/AdobeImageAccountDelegate;->isContentServiceConnected()Z

    move-result v0

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .registers 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 71
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onActivityCreated"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 72
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 73
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "extra-pack-id"

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mPackId:J

    .line 75
    iget-wide v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mPackId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_3a

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->visible:Z

    if-eqz v0, :cond_3a

    .line 76
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mDetailView:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    iget-wide v2, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mPackId:J

    const/4 v1, 0x1

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v1, v4}, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->update(JZLandroid/os/Bundle;)V

    .line 78
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->isContentServiceConnected()Z

    move-result v0

    if-eqz v0, :cond_3b

    .line 79
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->onServiceCreated(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V

    .line 84
    :cond_3a
    :goto_3a
    return-void

    .line 81
    :cond_3b
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "not connected"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    goto :goto_3a
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 2
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 66
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 67
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 7
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 48
    sget v1, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_store_detail_fragment:I

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 49
    .local v0, "view":Landroid/view/View;
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->onSetupView(Landroid/view/View;)V

    .line 50
    return-object v0
.end method

.method public onDestroyView()V
    .registers 3

    .prologue
    .line 88
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mDetailView:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->setParentFragment(Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;)V

    .line 89
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mSubjectSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->clear()V

    .line 90
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroyView()V

    .line 91
    return-void
.end method

.method public onDetach()V
    .registers 1

    .prologue
    .line 95
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDetach()V

    .line 96
    return-void
.end method

.method public onDownloadStatusChanged(JLjava/lang/String;I)V
    .registers 6
    .param p1, "packid"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "status"    # I

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->isDetached()Z

    move-result v0

    if-nez v0, :cond_11

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 112
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mDetailView:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->onDownloadStatusChanged(JLjava/lang/String;I)V

    .line 114
    :cond_11
    return-void
.end method

.method public onPackInstalled(JLjava/lang/String;I)V
    .registers 6
    .param p1, "packId"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "purchased"    # I

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->isDetached()Z

    move-result v0

    if-nez v0, :cond_11

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 118
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mDetailView:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->onPackInstalled(JLjava/lang/String;I)V

    .line 120
    :cond_11
    return-void
.end method

.method public onPurchaseSuccess(JLjava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V
    .registers 6
    .param p1, "packId"    # J
    .param p3, "packType"    # Ljava/lang/String;
    .param p4, "purchase"    # Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;

    .prologue
    .line 123
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->isDetached()Z

    move-result v0

    if-nez v0, :cond_11

    .line 124
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mDetailView:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->onPurchaseSuccess(JLjava/lang/String;Lcom/adobe/creativesdk/aviary/internal/cds/util/Purchase;)V

    .line 126
    :cond_11
    return-void
.end method

.method public onServiceCreated(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V
    .registers 7
    .param p1, "service"    # Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    .prologue
    .line 145
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mDetailView:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    if-eqz v4, :cond_46

    .line 146
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mDetailView:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    invoke-virtual {v4, p1}, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->onServiceCreated(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V

    .line 148
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mSubjectSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v4}, Lrx/subscriptions/CompositeSubscription;->clear()V

    .line 150
    new-instance v4, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$1;

    invoke-direct {v4, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$1;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;)V

    invoke-virtual {p1, p0, v4}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->subscribeToUserStatusChange(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v0

    .line 158
    .local v0, "s1":Lrx/Subscription;
    new-instance v4, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$2;

    invoke-direct {v4, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$2;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;)V

    invoke-virtual {p1, p0, v4}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->subscribeToPackInstalled(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v1

    .line 169
    .local v1, "s2":Lrx/Subscription;
    new-instance v4, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$3;

    invoke-direct {v4, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$3;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;)V

    invoke-virtual {p1, p0, v4}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->subscribeToPackDownloadStatusChanged(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v2

    .line 180
    .local v2, "s3":Lrx/Subscription;
    new-instance v4, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$4;

    invoke-direct {v4, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract$4;-><init>(Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;)V

    invoke-virtual {p1, p0, v4}, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;->subscribeToPackPurchased(Ljava/lang/Object;Lrx/functions/Action1;)Lrx/Subscription;

    move-result-object v3

    .line 192
    .local v3, "s4":Lrx/Subscription;
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mSubjectSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v4, v0}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 193
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mSubjectSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v4, v1}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 194
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mSubjectSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v4, v2}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 195
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mSubjectSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v4, v3}, Lrx/subscriptions/CompositeSubscription;->add(Lrx/Subscription;)V

    .line 197
    .end local v0    # "s1":Lrx/Subscription;
    .end local v1    # "s2":Lrx/Subscription;
    .end local v2    # "s3":Lrx/Subscription;
    .end local v3    # "s4":Lrx/Subscription;
    :cond_46
    return-void
.end method

.method protected final onSetupView(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 54
    check-cast p1, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    .end local p1    # "view":Landroid/view/View;
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mDetailView:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    .line 55
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mDetailView:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->setParentFragment(Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;)V

    .line 56
    return-void
.end method

.method public onUserAuthenticated(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V
    .registers 3
    .param p1, "userStatus"    # Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;

    .prologue
    .line 129
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->isDetached()Z

    move-result v0

    if-nez v0, :cond_11

    .line 130
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mDetailView:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->onUserAuthenticated(Lcom/adobe/creativesdk/aviary/internal/AdobeAccountUserStatus;)V

    .line 132
    :cond_11
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 60
    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 61
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->isFragmentVisible()Z

    move-result v0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->visible:Z

    .line 62
    return-void
.end method

.method public showPackInfo(J)V
    .registers 8
    .param p1, "packId"    # J

    .prologue
    const/4 v4, 0x0

    .line 99
    sget-object v0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "showPackInfo: %d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-interface {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 101
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mSubjectSubscriptions:Lrx/subscriptions/CompositeSubscription;

    invoke-virtual {v0}, Lrx/subscriptions/CompositeSubscription;->clear()V

    .line 102
    iput-wide p1, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mPackId:J

    .line 103
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->mDetailView:Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p2, v4, v1}, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->update(JZLandroid/os/Bundle;)V

    .line 105
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->isContentServiceConnected()Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 106
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->getContentService()Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;->onServiceCreated(Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;)V

    .line 108
    :cond_2b
    return-void
.end method
