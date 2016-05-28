.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;
.super Ljava/lang/Object;
.source "AdobeAssetsViewCCFilesBaseListViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LocalUploadAssetsToCellViewBinder"
.end annotation


# instance fields
.field _assetsUploadObservers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Observer;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;)V
    .registers 3

    .prologue
    .line 766
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 767
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;->_assetsUploadObservers:Ljava/util/HashMap;

    .line 768
    return-void
.end method

.method private getUploadSession()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;
    .registers 2

    .prologue
    .line 812
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;->_uploadSession:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;->access$200(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public bindCellViewToAsset(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;)V
    .registers 6
    .param p1, "uploadAssetData"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;
    .param p2, "uploadAssetCellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;

    .prologue
    .line 788
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;->unBindCellView(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;)V

    .line 789
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder$1;

    invoke-direct {v0, p0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;)V

    .line 796
    .local v0, "observer":Ljava/util/Observer;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;->_assetsUploadObservers:Ljava/util/HashMap;

    iget-object v2, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->guid:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 797
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;->getUploadSession()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;->addObserverForAssetUpload(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Ljava/util/Observer;)V

    .line 798
    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;->updateUploadCellViewStatus(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;)V

    .line 800
    return-void
.end method

.method public resetBinder()V
    .registers 2

    .prologue
    .line 771
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;->_assetsUploadObservers:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 772
    return-void
.end method

.method public unBindCellView(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;)V
    .registers 6
    .param p1, "uploadAssetData"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;
    .param p2, "uploadAssetCellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;

    .prologue
    .line 803
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;->_assetsUploadObservers:Ljava/util/HashMap;

    iget-object v2, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->guid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Observer;

    .line 804
    .local v0, "observer":Ljava/util/Observer;
    if-nez v0, :cond_d

    .line 809
    :goto_c
    return-void

    .line 807
    :cond_d
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;->_assetsUploadObservers:Ljava/util/HashMap;

    iget-object v2, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->guid:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 808
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;->getUploadSession()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;->removeObserverForAssetUpload(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Ljava/util/Observer;)V

    goto :goto_c
.end method

.method protected updateUploadCellViewStatus(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;)V
    .registers 5
    .param p1, "uploadAssetData"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;
    .param p2, "uploadAssetCellView"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;

    .prologue
    .line 776
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;->isUploadAssetDataCellViewEqual(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;)Z
    invoke-static {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 781
    :goto_8
    return-void

    .line 779
    :cond_9
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->getStatus()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->setUploadStatus(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData$UploadStatus;)V

    .line 780
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;->getProgress()D

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;->setUploadProgres(D)V

    goto :goto_8
.end method
