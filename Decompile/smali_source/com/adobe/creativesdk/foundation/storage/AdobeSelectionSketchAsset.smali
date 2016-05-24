.class public Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionSketchAsset;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
.source "AdobeSelectionSketchAsset.java"


# instance fields
.field selectedItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

.field selectedPageIndex:I


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;I)V
    .registers 3
    .param p1, "file"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;
    .param p2, "pageIndex"    # I

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionSketchAsset;->selectedItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetSketchbook;

    .line 43
    iput p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionSketchAsset;->selectedPageIndex:I

    .line 45
    return-void
.end method
