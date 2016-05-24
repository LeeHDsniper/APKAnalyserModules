.class Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$1;
.super Ljava/lang/Object;
.source "AdobeAssetDataSource.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;->allItemsLoaded()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    .prologue
    .line 233
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)I
    .registers 6
    .param p1, "obj1"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .param p2, "obj2"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 236
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;

    .end local p1    # "obj1":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->getModificationDate()Ljava/util/Date;

    move-result-object v0

    .line 237
    .local v0, "first":Ljava/util/Date;
    check-cast p2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;

    .end local p2    # "obj2":Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackage;->getModificationDate()Ljava/util/Date;

    move-result-object v1

    .line 238
    .local v1, "second":Ljava/util/Date;
    invoke-virtual {v1, v0}, Ljava/util/Date;->compareTo(Ljava/util/Date;)I

    move-result v2

    return v2
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .prologue
    .line 233
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    check-cast p2, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeAssetDataSource$1$1;->compare(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)I

    move-result v0

    return v0
.end method
