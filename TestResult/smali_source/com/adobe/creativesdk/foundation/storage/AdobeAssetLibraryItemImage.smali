.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
.source "AdobeAssetLibraryItemImage.java"


# instance fields
.field private image:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

.field private imageHeight:F

.field private imageWidth:F

.field private primaryComponentType:Ljava/lang/String;

.field private rendition:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

.field private renditionHeight:F

.field private renditionWidth:F


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;IILcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;IILjava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V
    .registers 12
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .param p2, "renditionName"    # Ljava/lang/String;
    .param p3, "image"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .param p4, "imageHeight"    # I
    .param p5, "imageWidth"    # I
    .param p6, "rendition"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .param p7, "renditionHeight"    # I
    .param p8, "renditionWidth"    # I
    .param p9, "primaryComponentType"    # Ljava/lang/String;
    .param p10, "library"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .prologue
    .line 103
    invoke-direct {p0, p1, p2, p10}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 106
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->image:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 107
    int-to-float v0, p4

    iput v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->imageHeight:F

    .line 108
    int-to-float v0, p5

    iput v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->imageWidth:F

    .line 109
    iput-object p6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->rendition:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 110
    int-to-float v0, p7

    iput v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->renditionHeight:F

    .line 111
    int-to-float v0, p8

    iput v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->renditionWidth:F

    .line 112
    iput-object p9, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->primaryComponentType:Ljava/lang/String;

    .line 114
    return-void
.end method


# virtual methods
.method public getImage()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->image:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    return-object v0
.end method

.method public getImageHeight()F
    .registers 2

    .prologue
    .line 76
    iget v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->imageHeight:F

    return v0
.end method

.method public getImageWidth()F
    .registers 2

    .prologue
    .line 80
    iget v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->imageWidth:F

    return v0
.end method

.method public getPrimaryComponentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->primaryComponentType:Ljava/lang/String;

    return-object v0
.end method

.method public getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemImage;->rendition:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    return-object v0
.end method
