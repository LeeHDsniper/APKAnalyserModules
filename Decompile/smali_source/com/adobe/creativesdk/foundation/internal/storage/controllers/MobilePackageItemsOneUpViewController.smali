.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;
.super Ljava/lang/Object;
.source "MobilePackageItemsOneUpViewController.java"


# static fields
.field private static _sInstance:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;


# instance fields
.field private _assetPackagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

.field private _itemsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;",
            ">;"
        }
    .end annotation
.end field

.field private _startIndex:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private buildPackageItemsList()V
    .registers 3

    .prologue
    .line 63
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_itemsList:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_assetPackagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getPages()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 64
    return-void
.end method

.method public static createInstanceFromConfigurationBundle(Landroid/os/Bundle;)V
    .registers 7
    .param p0, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 40
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;-><init>()V

    .line 41
    .local v0, "mobilePackageController":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;
    const-string v5, "collectionhref"

    invoke-virtual {p0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 42
    .local v1, "packageCollectionHref":Ljava/lang/String;
    const-string v5, "collectionparenthref"

    invoke-virtual {p0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 44
    .local v2, "packageParentCollectionHref":Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewMobileCreationPackageItemsContainerFragment;->getPackagePagesFromHref(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    move-result-object v3

    .line 46
    .local v3, "pages":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    const-string v5, "startindex"

    invoke-virtual {p0, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 48
    .local v4, "startIndex":I
    invoke-virtual {v0, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->setStartIndex(I)V

    .line 49
    invoke-direct {v0, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->setPackage(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V

    .line 51
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->setInstance(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;)V

    .line 52
    return-void
.end method

.method public static createInstanceFromPackage(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;Ljava/util/ArrayList;I)V
    .registers 4
    .param p0, "pages"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .param p2, "startIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p1, "itemsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;-><init>()V

    .line 75
    .local v0, "controller":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;
    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->setPackageAndItems(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;Ljava/util/ArrayList;)V

    .line 76
    invoke-virtual {v0, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->setStartIndex(I)V

    .line 77
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->setInstance(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;)V

    .line 78
    return-void
.end method

.method public static getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;
    .registers 1

    .prologue
    .line 31
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    return-object v0
.end method

.method public static setInstance(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;)V
    .registers 1
    .param p0, "instance"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    .prologue
    .line 36
    sput-object p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;

    .line 37
    return-void
.end method

.method private setPackage(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;)V
    .registers 2
    .param p1, "pages"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_assetPackagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .line 56
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->buildPackageItemsList()V

    .line 57
    return-void
.end method

.method private setPackageAndItems(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;Ljava/util/ArrayList;)V
    .registers 3
    .param p1, "pages"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 81
    .local p2, "itemsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_assetPackagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    .line 82
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_itemsList:Ljava/util/ArrayList;

    .line 83
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_itemsList:Ljava/util/ArrayList;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_itemsList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getItemAtPos(I)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 91
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_itemsList:Ljava/util/ArrayList;

    if-eqz v0, :cond_17

    if-ltz p1, :cond_17

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_itemsList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_17

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_itemsList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    :goto_16
    return-object v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public getPackage()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_assetPackagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    return-object v0
.end method

.method public getStartIndex()I
    .registers 2

    .prologue
    .line 95
    iget v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_startIndex:I

    return v0
.end method

.method public saveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 67
    const-string v0, "startindex"

    iget v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_startIndex:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 68
    const-string v0, "collectionhref"

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_assetPackagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getHref()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    const-string v0, "collectionparenthref"

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_assetPackagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->getParentHref()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    return-void
.end method

.method public setStartIndex(I)V
    .registers 2
    .param p1, "startIndex"    # I

    .prologue
    .line 100
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/MobilePackageItemsOneUpViewController;->_startIndex:I

    .line 101
    return-void
.end method
