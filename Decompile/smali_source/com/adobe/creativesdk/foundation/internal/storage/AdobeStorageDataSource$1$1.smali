.class Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1$1;
.super Ljava/lang/Object;
.source "AdobeStorageDataSource.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->onCompletion(Ljava/util/ArrayList;I)V
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
.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;

    .prologue
    .line 461
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)I
    .registers 5
    .param p1, "lhs"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .param p2, "rhs"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 464
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1$1;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource;->sortIndexCollator:Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;

    iget-object v0, v0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageSortIndexCollation;->currentSortState:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;->SORT_STATE_ASCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeUXAssetBrowserCommonTypes$AdobeUXAssetBrowserSortState;

    if-ne v0, v1, :cond_21

    .line 465
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 467
    :goto_20
    return v0

    :cond_21
    invoke-virtual {p2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    goto :goto_20
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .prologue
    .line 461
    check-cast p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    check-cast p2, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeStorageDataSource$1$1;->compare(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)I

    move-result v0

    return v0
.end method
