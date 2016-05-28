.class public Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionPhotoAsset;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
.source "AdobeSelectionPhotoAsset.java"


# instance fields
.field protected selectedItem:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;)V
    .registers 2
    .param p1, "asset"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionPhotoAsset;->selectedItem:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAsset;

    .line 32
    return-void
.end method
