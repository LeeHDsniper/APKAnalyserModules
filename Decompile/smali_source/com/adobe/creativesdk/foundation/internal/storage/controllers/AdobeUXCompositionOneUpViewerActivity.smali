.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXCompositionOneUpViewerActivity;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;
.source "AdobeUXCompositionOneUpViewerActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 73
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected updateTitleOfActivity()V
    .registers 5

    .prologue
    .line 78
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXCompositionOneUpViewerActivity;->mPhotoNumber:Landroid/widget/TextView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 80
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getPackage()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getName()Ljava/lang/String;

    move-result-object v1

    .line 81
    .local v1, "title":Ljava/lang/String;
    if-nez v1, :cond_2f

    .line 82
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    move-result-object v2

    iget v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXCompositionOneUpViewerActivity;->mPos:I

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getItemAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    .line 83
    .local v0, "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_lineordrawcollection_singular:I

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v1

    .line 84
    instance-of v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetCompPage;

    if-eqz v2, :cond_33

    .line 85
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_composition_collection_singular:I

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v1

    .line 90
    .end local v0    # "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    :cond_2f
    :goto_2f
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXCompositionOneUpViewerActivity;->setActionBarTitle(Ljava/lang/String;)V

    .line 91
    return-void

    .line 86
    .restart local v0    # "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    :cond_33
    instance-of v2, v0, Lcom/adobe/creativesdk/foundation/internal/storage/asset/AdobeAssetPSMixPage;

    if-eqz v2, :cond_2f

    .line 87
    sget v2, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_psmix_collection_singular:I

    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeLocalizedMgr;->getLocalizedString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_2f
.end method
