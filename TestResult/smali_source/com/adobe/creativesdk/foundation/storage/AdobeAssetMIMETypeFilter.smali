.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;
.super Ljava/lang/Object;
.source "AdobeAssetMIMETypeFilter.java"


# instance fields
.field private filterType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

.field private mimeTypes:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFromMimeTypes(Ljava/util/EnumSet;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;
    .registers 3
    .param p1, "filterType"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;",
            ">;",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;",
            ")",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "mimeTypes":Ljava/util/EnumSet;, "Ljava/util/EnumSet<Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;>;"
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;-><init>()V

    .line 50
    .local v0, "mimeFilterObj":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;
    iput-object p1, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;->filterType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    .line 51
    iput-object p0, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;->mimeTypes:Ljava/util/EnumSet;

    .line 52
    return-object v0
.end method


# virtual methods
.method public getFilterType()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;->filterType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    return-object v0
.end method

.method public getMimeTypes()Ljava/util/EnumSet;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/EnumSet",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;",
            ">;"
        }
    .end annotation

    .prologue
    .line 39
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilter;->mimeTypes:Ljava/util/EnumSet;

    return-object v0
.end method
