.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;
.super Ljava/lang/Object;
.source "AdobeUXMobilePackageItemOneUpViewerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "AssetsViewBaseActionBarController"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    .prologue
    .line 631
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected handleOptionItemSelect(I)Z
    .registers 6
    .param p1, "itemId"    # I

    .prologue
    const/high16 v3, 0x44800000

    .line 656
    sget v1, Lcom/adobe/creativesdk/foundation/assets/R$id;->adobe_mobiecreation_item_menu_download:I

    if-ne p1, v1, :cond_25

    .line 658
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->mIndexPos:I
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;->access$300(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->getItemAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    .line 659
    .local v0, "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    new-instance v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    invoke-direct {v2, v3, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;-><init>(FF)V

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController$1;

    invoke-direct {v3, p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->getRenditionWithType(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;Lcom/adobe/creativesdk/foundation/storage/IAdobeGenericRequestCallback;)V

    .line 702
    const/4 v1, 0x1

    .line 704
    .end local v0    # "file":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    :goto_24
    return v1

    :cond_25
    const/4 v1, 0x0

    goto :goto_24
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .registers 3
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 638
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 708
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXMobilePackageItemOneUpViewerActivity$AdobeUXMobilePackageItemFragment$AssetsViewBaseActionBarController;->handleOptionItemSelect(I)Z

    move-result v0

    return v0
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)V
    .registers 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 645
    return-void
.end method
