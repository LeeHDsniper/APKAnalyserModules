.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;
.source "AdobeAssetPackagePages.java"


# instance fields
.field pages:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;-><init>()V

    .line 42
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V
    .registers 3
    .param p1, "res"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;
    .param p2, "resP"    # Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;-><init>(Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageResourceCollection;)V

    .line 37
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "other"    # Ljava/lang/Object;

    .prologue
    .line 47
    instance-of v0, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

    if-eqz v0, :cond_9

    .line 48
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 50
    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public getPages()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;->pages:Ljava/util/ArrayList;

    return-object v0
.end method
