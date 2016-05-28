.class Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;
.super Ljava/lang/Object;
.source "AdobeStorageDataSource.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/storage/IAdobeAssetFolderNextPageCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->fetchAndFilterAllAdditionalPages()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    .prologue
    .line 791
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Ljava/util/ArrayList;I)V
    .registers 8
    .param p2, "totalItemsInFolder"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .local p1, "itemArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;>;"
    const/4 v4, 0x0

    .line 795
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iget-boolean v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->abortLoadingMorePagesWhileFiltering:Z

    if-eqz v2, :cond_1b

    .line 797
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v0

    .line 798
    .local v0, "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    if-eqz v0, :cond_12

    .line 799
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;->didStopLoadingMorePagesToFilter()V

    .line 801
    :cond_12
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iput-boolean v4, v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->abortLoadingMorePagesWhileFiltering:Z

    .line 802
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iput-boolean v4, v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadingItemsWhileFiltering:Z

    .line 818
    .end local v0    # "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    :goto_1a
    return-void

    .line 808
    :cond_1b
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iget-object v2, v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->items:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 809
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iget-object v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->items:Ljava/util/ArrayList;

    iput-object v3, v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->displayAssets:Ljava/util/ArrayList;

    .line 811
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeStorageDataSourceDidLoadNewPageNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 812
    .local v1, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 814
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iput-boolean v4, v2, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadingItemsWhileFiltering:Z

    .line 817
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iget-object v3, v3, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterString:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->filterWithSearchString(Ljava/lang/String;)V

    goto :goto_1a
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V
    .registers 5
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    .prologue
    .line 823
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->loadingItemsWhileFiltering:Z

    .line 825
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->getDelegate()Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->access$500(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;)Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;

    move-result-object v0

    .line 826
    .local v0, "delegateObj":Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;
    if-eqz v0, :cond_10

    .line 827
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/IAdobeStorageDataSourceDelegate;->didStopLoadingMorePagesToFilter()V

    .line 829
    :cond_10
    return-void
.end method

.method public bridge synthetic onError(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 791
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$2;->onError(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetException;)V

    return-void
.end method
