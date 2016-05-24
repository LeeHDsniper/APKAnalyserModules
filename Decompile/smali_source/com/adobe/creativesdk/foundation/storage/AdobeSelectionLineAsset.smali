.class public Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLineAsset;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
.source "AdobeSelectionLineAsset.java"


# instance fields
.field selectedItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

.field selectedPageIndex:I


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;I)V
    .registers 3
    .param p1, "file"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;
    .param p2, "pageIndex"    # I

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLineAsset;->selectedItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLineFile;

    .line 42
    iput p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLineAsset;->selectedPageIndex:I

    .line 44
    return-void
.end method
