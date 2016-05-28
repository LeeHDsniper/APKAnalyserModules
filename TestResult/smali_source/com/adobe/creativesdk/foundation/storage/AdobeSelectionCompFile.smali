.class public Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionCompFile;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
.source "AdobeSelectionCompFile.java"


# instance fields
.field selectedItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetCompFile;

.field selectedPageIndex:I


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetCompFile;I)V
    .registers 3
    .param p1, "file"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetCompFile;
    .param p2, "pageIndex"    # I

    .prologue
    .line 38
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionCompFile;->selectedItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetCompFile;

    .line 40
    iput p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionCompFile;->selectedPageIndex:I

    .line 42
    return-void
.end method
