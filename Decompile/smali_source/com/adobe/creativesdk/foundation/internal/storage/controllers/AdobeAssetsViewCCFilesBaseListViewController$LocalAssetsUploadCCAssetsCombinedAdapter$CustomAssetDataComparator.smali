.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$CustomAssetDataComparator;
.super Ljava/lang/Object;
.source "AdobeAssetsViewCCFilesBaseListViewController.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "CustomAssetDataComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;",
        ">;"
    }
.end annotation


# instance fields
.field private _isSortByAlpha:Z

.field final synthetic this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;Z)V
    .registers 4
    .param p1, "this$1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;
    .param p2, "isSortByAlpha"    # Z

    .prologue
    .line 543
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$CustomAssetDataComparator;->this$1:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 541
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$CustomAssetDataComparator;->_isSortByAlpha:Z

    .line 544
    iput-boolean p2, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$CustomAssetDataComparator;->_isSortByAlpha:Z

    .line 545
    return-void
.end method

.method private compareAlpha(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)I
    .registers 8
    .param p1, "o1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    .param p2, "o2"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    .prologue
    const/4 v4, 0x0

    .line 548
    const/4 v2, 0x0

    .line 549
    .local v2, "result":I
    iget-object v3, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->title:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v0

    .line 550
    .local v0, "o1FirstAlpha":C
    iget-object v3, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->title:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    .line 551
    .local v1, "o2FirstAlpha":C
    if-le v0, v1, :cond_1a

    .line 552
    const/4 v2, 0x1

    .line 558
    :cond_19
    :goto_19
    return v2

    .line 554
    :cond_1a
    if-ge v0, v1, :cond_19

    .line 555
    const/4 v2, -0x1

    goto :goto_19
.end method

.method private compareDate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)I
    .registers 9
    .param p1, "o1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    .param p2, "o2"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    .prologue
    .line 561
    const/4 v4, 0x0

    .line 562
    .local v4, "result":I
    iget-object v5, p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->modificationDate:Ljava/util/Date;

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    .line 563
    .local v0, "o1Date":J
    iget-object v5, p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;->modificationDate:Ljava/util/Date;

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    .line 564
    .local v2, "o2Date":J
    cmp-long v5, v0, v2

    if-lez v5, :cond_13

    .line 565
    const/4 v4, -0x1

    .line 571
    :cond_12
    :goto_12
    return v4

    .line 567
    :cond_13
    cmp-long v5, v0, v2

    if-gez v5, :cond_12

    .line 568
    const/4 v4, 0x1

    goto :goto_12
.end method


# virtual methods
.method public compare(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)I
    .registers 4
    .param p1, "o1"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;
    .param p2, "o2"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    .prologue
    .line 576
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$CustomAssetDataComparator;->_isSortByAlpha:Z

    if-eqz v0, :cond_9

    .line 577
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$CustomAssetDataComparator;->compareAlpha(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)I

    move-result v0

    .line 579
    :goto_8
    return v0

    :cond_9
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$CustomAssetDataComparator;->compareDate(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)I

    move-result v0

    goto :goto_8
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .prologue
    .line 539
    check-cast p1, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    check-cast p2, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCCFilesBaseListViewController$LocalAssetsUploadCCAssetsCombinedAdapter$CustomAssetDataComparator;->compare(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetsViewCellAssetData;)I

    move-result v0

    return v0
.end method
