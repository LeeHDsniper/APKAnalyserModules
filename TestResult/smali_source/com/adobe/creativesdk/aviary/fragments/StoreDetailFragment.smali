.class public Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragment;
.super Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;
.source "StoreDetailFragment.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragmentAbstract;-><init>()V

    return-void
.end method

.method public static newInstance(JLcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;Z)Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragment;
    .registers 8
    .param p0, "packID"    # J
    .param p2, "packType"    # Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;
    .param p3, "animateDetailView"    # Z

    .prologue
    .line 19
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 20
    .local v0, "arguments":Landroid/os/Bundle;
    const-string v2, "extra-pack-id"

    invoke-virtual {v0, v2, p0, p1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 21
    const-string v2, "extras-details-from"

    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/internal/cds/Cds$PackType;->toCdsString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    const-string v2, "animateDetailView"

    invoke-virtual {v0, v2, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 23
    new-instance v1, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragment;

    invoke-direct {v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragment;-><init>()V

    .line 24
    .local v1, "fragment":Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragment;
    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragment;->setArguments(Landroid/os/Bundle;)V

    .line 25
    return-object v1
.end method


# virtual methods
.method public isFragmentVisible()Z
    .registers 2

    .prologue
    .line 15
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreDetailFragment;->getParentFragment()Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/fragments/StoreContainerFragment;->isFragmentVisible(Landroid/support/v4/app/Fragment;)Z

    move-result v0

    return v0
.end method
