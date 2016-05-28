.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;
.super Ljava/lang/Object;
.source "AdobeAssetDesignLibraryItemFilter.java"


# instance fields
.field private designLibraryItemTypes:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;",
            ">;"
        }
    .end annotation
.end field

.field private filterType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFromDesignLibraryItems(Ljava/util/EnumSet;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;
    .registers 3
    .param p1, "filterType"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;",
            ")",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;"
        }
    .end annotation

    .prologue
    .line 22
    .local p0, "designLibraryItems":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;>;"
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;-><init>()V

    .line 23
    .local v0, "designLibraryItemFilter":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;
    iput-object p0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;->designLibraryItemTypes:Ljava/util/EnumSet;

    .line 24
    iput-object p1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;->filterType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    .line 26
    return-object v0
.end method


# virtual methods
.method public getInclusiveDesignLibraryItems()Ljava/util/EnumSet;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 45
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;->isInclusive()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 46
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;->designLibraryItemTypes:Ljava/util/EnumSet;

    .line 56
    :cond_8
    return-object v0

    .line 49
    :cond_9
    const-class v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    invoke-static {v2}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    .line 50
    .local v0, "allTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;>;"
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;->designLibraryItemTypes:Ljava/util/EnumSet;

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;->designLibraryItemTypes:Ljava/util/EnumSet;

    invoke-virtual {v2}, Ljava/util/EnumSet;->size()I

    move-result v2

    if-eqz v2, :cond_8

    .line 53
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;->designLibraryItemTypes:Ljava/util/EnumSet;

    invoke-virtual {v2}, Ljava/util/EnumSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_21
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    .line 54
    .local v1, "type":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;
    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->remove(Ljava/lang/Object;)Z

    goto :goto_21
.end method

.method public isInclusive()Z
    .registers 3

    .prologue
    .line 31
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilter;->filterType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;->ADOBE_ASSET_DESIGNLIBRARYITEM_FILTER_INCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method
