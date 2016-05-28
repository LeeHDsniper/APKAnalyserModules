.class Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1$1;
.super Ljava/lang/Object;
.source "AdobeAssetsViewMobileCreationPackageItemsListViewController.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1;->onCompletion([B)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/adobe/creativesdk/foundation/IAdobeGenericCompletionCallback",
        "<",
        "Landroid/graphics/drawable/BitmapDrawable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$2:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1;)V
    .registers 2
    .param p1, "this$2"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1;

    .prologue
    .line 226
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1$1;->this$2:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/graphics/drawable/BitmapDrawable;)V
    .registers 4
    .param p1, "requestResult"    # Landroid/graphics/drawable/BitmapDrawable;

    .prologue
    .line 229
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1$1;->this$2:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1;->val$packageItemCellViewHolder:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;->getPage()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1$1;->this$2:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1;

    iget-object v1, v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1;->val$file:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 230
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1$1;->this$2:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1;->val$packageItemCellViewHolder:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;->setImage(Landroid/graphics/drawable/BitmapDrawable;)V
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;Landroid/graphics/drawable/BitmapDrawable;)V

    .line 233
    :goto_19
    return-void

    .line 232
    :cond_1a
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1$1;->this$2:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1;

    iget-object v1, v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1;->val$packageItemCellViewHolder:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;

    const/4 v0, 0x0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;->setImage(Landroid/graphics/drawable/BitmapDrawable;)V
    invoke-static {v1, v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;->access$100(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$PackageItemCellViewHolder;Landroid/graphics/drawable/BitmapDrawable;)V

    goto :goto_19
.end method

.method public bridge synthetic onCompletion(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 226
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsListViewController$MobileCreationPackageItemsListViewAdapter$1$1;->onCompletion(Landroid/graphics/drawable/BitmapDrawable;)V

    return-void
.end method
