.class public interface abstract Lcom/adobe/creativesdk/foundation/internal/storage/controllers/IAdobeAssetContainerListViewDelegate;
.super Ljava/lang/Object;
.source "IAdobeAssetContainerListViewDelegate.java"


# virtual methods
.method public abstract getHostActivity()Landroid/support/v4/app/FragmentActivity;
.end method

.method public abstract handleAssetClickAction(Ljava/lang/Object;)V
.end method

.method public abstract handleLongClickOnAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
.end method

.method public abstract loadMoreItemsFromDataSource()V
.end method

.method public abstract navigateToCollection(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;)V
.end method

.method public abstract reloadAssetItemsFromDataSourceDueToSwipeRefresh()V
.end method
