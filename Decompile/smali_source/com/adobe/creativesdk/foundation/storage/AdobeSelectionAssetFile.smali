.class public Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAsset;
.source "AdobeSelectionAssetFile.java"


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;)V
    .registers 2
    .param p1, "file"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAsset;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;->selectedItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 33
    return-void
.end method


# virtual methods
.method public getSelectedItem()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionAssetFile;->selectedItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    return-object v0
.end method
