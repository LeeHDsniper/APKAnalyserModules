.class public Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionDrawAsset;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
.source "AdobeSelectionDrawAsset.java"


# instance fields
.field selectedItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

.field selectedPageIndex:I


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;I)V
    .registers 3
    .param p1, "file"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;
    .param p2, "pageIndex"    # I

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionDrawAsset;->selectedItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDrawFile;

    .line 40
    iput p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionDrawAsset;->selectedPageIndex:I

    .line 42
    return-void
.end method
