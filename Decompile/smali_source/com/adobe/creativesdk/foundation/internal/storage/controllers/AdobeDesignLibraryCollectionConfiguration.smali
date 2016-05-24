.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;
.source "AdobeDesignLibraryCollectionConfiguration.java"


# instance fields
.field private designLibraryItemFilter:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;

.field private targetCollectionHref:Ljava/lang/String;

.field private targetParentCollectionHref:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromBundle(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 51
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewContainerConfiguration;->createFromBundle(Landroid/os/Bundle;)V

    .line 52
    const-string v2, "designCollectionHref"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;->targetCollectionHref:Ljava/lang/String;

    .line 53
    const-string v2, "designCollectionParentHref"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;->targetParentCollectionHref:Ljava/lang/String;

    .line 54
    const-string v2, "design_library_items_key"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Ljava/util/EnumSet;

    .line 55
    .local v1, "itemTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;>;"
    const-string v2, "design_library_items_filtertype"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    .line 56
    .local v0, "filterType":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;
    invoke-static {v1, v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;->createFromDesignLibraryItems(Ljava/util/EnumSet;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;->designLibraryItemFilter:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;

    .line 57
    return-void
.end method

.method getDesignLibraryItemFilter()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;->designLibraryItemFilter:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;

    return-object v0
.end method

.method public getTargetCollectionHref()Ljava/lang/String;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;->targetCollectionHref:Ljava/lang/String;

    return-object v0
.end method

.method public getTargetParentCollectionHref()Ljava/lang/String;
    .registers 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeDesignLibraryCollectionConfiguration;->targetParentCollectionHref:Ljava/lang/String;

    return-object v0
.end method
