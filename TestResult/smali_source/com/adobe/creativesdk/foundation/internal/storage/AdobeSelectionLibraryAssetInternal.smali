.class public Lcom/adobe/creativesdk/foundation/internal/storage/AdobeSelectionLibraryAssetInternal;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLibraryAsset;
.source "AdobeSelectionLibraryAssetInternal.java"


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V
    .registers 2
    .param p1, "library"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLibraryAsset;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 34
    return-void
.end method


# virtual methods
.method public setSelectedColorIDs(Ljava/util/ArrayList;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 37
    .local p1, "colorIDs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeSelectionLibraryAssetInternal;->selectedColorIDs:Ljava/util/ArrayList;

    .line 38
    return-void
.end method

.method public setSelectedColorThemeIDs(Ljava/util/ArrayList;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 40
    .local p1, "colorThemeIDs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeSelectionLibraryAssetInternal;->selectedColorThemeIDs:Ljava/util/ArrayList;

    .line 41
    return-void
.end method

.method public setSelectedImageIDs(Ljava/util/ArrayList;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p1, "imageIDs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/AdobeSelectionLibraryAssetInternal;->selectedImageIDs:Ljava/util/ArrayList;

    .line 44
    return-void
.end method
