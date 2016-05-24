.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder$1;
.super Ljava/lang/Object;
.source "AdobeAssetsViewCCFilesBaseListViewController.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;->bindCellViewToAsset(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;

.field final synthetic val$uploadAssetCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;)V
    .registers 3
    .param p1, "this$2"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;

    .prologue
    .line 789
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder$1;->this$2:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder$1;->val$uploadAssetCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 5
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 792
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder$1;->this$2:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;

    check-cast p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;

    .end local p2    # "data":Ljava/lang/Object;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder$1;->val$uploadAssetCellView:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;

    invoke-virtual {v0, p2, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$LocalUploadAssetsToCellViewBinder;->updateUploadCellViewStatus(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadAssetData;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeAssetViewListBaseUploadAssetCellView;)V

    .line 793
    return-void
.end method
