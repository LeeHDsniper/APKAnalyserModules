.class public Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;
.super Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;
.source "StoreDetailLayout.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 19
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    return-void
.end method


# virtual methods
.method public getArguments()Landroid/os/Bundle;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    if-eqz v0, :cond_b

    .line 101
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 103
    :goto_a
    return-object v0

    :cond_b
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    goto :goto_a
.end method

.method public getUUID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;->getUUID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isValidContext()Z
    .registers 2

    .prologue
    .line 90
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->getParentFragment()Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    move-result-object v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 4
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 39
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v1, "onConfigurationChanged"

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 40
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 41
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->resetPositions()V

    .line 42
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mPack:Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    if-eqz v0, :cond_24

    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mPreviewView:Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailPreviews;->clearAll()V

    .line 44
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mTextViewGroup:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout$1;-><init>(Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 57
    :cond_24
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 84
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    .line 85
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/widget/PackDetailLayout;->onDetachedFromWindow()V

    .line 86
    return-void
.end method

.method protected onForceUpdate()V
    .registers 5

    .prologue
    .line 79
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->getPackId()J

    move-result-wide v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->update(JZLandroid/os/Bundle;)V

    .line 80
    return-void
.end method

.method protected onPackLoaded(Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;)V
    .registers 6
    .param p1, "pack"    # Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;

    .prologue
    .line 24
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 25
    .local v0, "attrs":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "pack"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    if-eqz v1, :cond_48

    .line 28
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "extras-details-from"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_31

    .line 29
    const-string v1, "from"

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    invoke-interface {v2}, Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "extras-details-from"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    :cond_31
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;->getActivity()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_48

    .line 32
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;->getActivity()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v1

    const-string v2, "shop_details: opened"

    invoke-virtual {v1, v2, v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEventAttributes(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 35
    :cond_48
    return-void
.end method

.method protected updateStatusBarColor()Z
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 61
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    if-eqz v2, :cond_13

    .line 62
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    check-cast v0, Landroid/support/v4/app/Fragment;

    .line 63
    .local v0, "parent":Landroid/support/v4/app/Fragment;
    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "updateStatusColor"

    invoke-virtual {v2, v3, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 65
    .end local v0    # "parent":Landroid/support/v4/app/Fragment;
    :cond_13
    return v1
.end method

.method protected updateToolbarColor()Z
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 70
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    if-eqz v2, :cond_13

    .line 71
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/widget/StoreDetailLayout;->mParent:Lcom/adobe/creativesdk/aviary/fragments/StoreFragment;

    check-cast v0, Landroid/support/v4/app/Fragment;

    .line 72
    .local v0, "parent":Landroid/support/v4/app/Fragment;
    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "updateToolbarColor"

    invoke-virtual {v2, v3, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 74
    .end local v0    # "parent":Landroid/support/v4/app/Fragment;
    :cond_13
    return v1
.end method
