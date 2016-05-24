.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilter;
.super Ljava/lang/Object;
.source "AdobeAssetDataSourceFilter.java"


# instance fields
.field private dataSources:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;",
            ">;"
        }
    .end annotation
.end field

.field private filterType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;


# direct methods
.method public static allSupportedDataSources()Ljava/util/EnumSet;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 83
    const-class v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    invoke-static {v0}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getInclusiveDataSources()Ljava/util/EnumSet;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilter;->isInclusive()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilter;->dataSources:Ljava/util/EnumSet;

    .line 53
    :cond_8
    return-object v0

    .line 46
    :cond_9
    invoke-static {}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilter;->allSupportedDataSources()Ljava/util/EnumSet;

    move-result-object v0

    .line 47
    .local v0, "allDataSources":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;>;"
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilter;->dataSources:Ljava/util/EnumSet;

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilter;->dataSources:Ljava/util/EnumSet;

    invoke-virtual {v2}, Ljava/util/EnumSet;->size()I

    move-result v2

    if-eqz v2, :cond_8

    .line 50
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilter;->dataSources:Ljava/util/EnumSet;

    invoke-virtual {v2}, Ljava/util/EnumSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

    .line 51
    .local v1, "type":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;
    invoke-virtual {v0, v1}, Ljava/util/EnumSet;->remove(Ljava/lang/Object;)Z

    goto :goto_1f
.end method

.method public isInclusive()Z
    .registers 3

    .prologue
    .line 38
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilter;->filterType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;->ADOBE_ASSET_DATASOUCE_FILTER_INCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method
