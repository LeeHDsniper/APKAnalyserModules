.class public Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLibraryAsset;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;
.source "AdobeSelectionLibraryAsset.java"


# instance fields
.field protected selectedColorIDs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected selectedColorThemeIDs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected selectedImageIDs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field selectedItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V
    .registers 2
    .param p1, "library"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeSelection;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLibraryAsset;->selectedItem:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .line 73
    return-void
.end method


# virtual methods
.method protected setSelectedColorIDs(Ljava/util/ArrayList;)V
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
    .line 76
    .local p1, "colorIDs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLibraryAsset;->selectedColorIDs:Ljava/util/ArrayList;

    .line 77
    return-void
.end method

.method protected setSelectedColorThemeIDs(Ljava/util/ArrayList;)V
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
    .line 79
    .local p1, "colorThemeIDs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLibraryAsset;->selectedColorThemeIDs:Ljava/util/ArrayList;

    .line 80
    return-void
.end method

.method protected setSelectedImageIDs(Ljava/util/ArrayList;)V
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
    .line 82
    .local p1, "imageIDs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeSelectionLibraryAsset;->selectedImageIDs:Ljava/util/ArrayList;

    .line 83
    return-void
.end method
