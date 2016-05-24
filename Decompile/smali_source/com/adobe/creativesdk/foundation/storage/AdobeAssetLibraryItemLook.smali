.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
.source "AdobeAssetLibraryItemLook.java"


# instance fields
.field private rendition:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

.field private renditionHeight:F

.field private renditionWidth:F


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;IILcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V
    .registers 8
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .param p2, "renditionName"    # Ljava/lang/String;
    .param p3, "rendition"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .param p4, "renditionHeight"    # I
    .param p5, "renditionWidth"    # I
    .param p6, "library"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 33
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;->rendition:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 34
    int-to-float v0, p4

    iput v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;->renditionHeight:F

    .line 35
    int-to-float v0, p5

    iput v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;->renditionWidth:F

    .line 37
    return-void
.end method


# virtual methods
.method public getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .registers 2

    .prologue
    .line 25
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;->rendition:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    return-object v0
.end method

.method public getRenditionHeight()F
    .registers 2

    .prologue
    .line 21
    iget v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;->renditionHeight:F

    return v0
.end method

.method public getRenditionWidth()F
    .registers 2

    .prologue
    .line 17
    iget v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemLook;->renditionWidth:F

    return v0
.end method
