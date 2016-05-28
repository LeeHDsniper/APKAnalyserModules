.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
.source "AdobeAssetLibraryItemBrush.java"


# instance fields
.field private brush:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

.field private rendition:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

.field private renditionHeight:F

.field private renditionWidth:F


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;IILcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V
    .registers 9
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .param p2, "renditionName"    # Ljava/lang/String;
    .param p3, "brush"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .param p4, "rendition"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .param p5, "renditionHeight"    # I
    .param p6, "renditionWidth"    # I
    .param p7, "library"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .prologue
    .line 56
    invoke-direct {p0, p1, p2, p7}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 57
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->brush:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 58
    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->rendition:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 59
    int-to-float v0, p5

    iput v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->renditionHeight:F

    .line 60
    int-to-float v0, p6

    iput v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->renditionWidth:F

    .line 62
    return-void
.end method


# virtual methods
.method public getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->rendition:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    return-object v0
.end method

.method public getRenditionHeight()F
    .registers 2

    .prologue
    .line 40
    iget v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->renditionHeight:F

    return v0
.end method

.method public getRenditionWidth()F
    .registers 2

    .prologue
    .line 36
    iget v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->renditionWidth:F

    return v0
.end method

.method public nameOrIdForDisplay()Ljava/lang/String;
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->name:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 68
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->name:Ljava/lang/String;

    .line 72
    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemBrush;->itemID:Ljava/lang/String;

    goto :goto_6
.end method
