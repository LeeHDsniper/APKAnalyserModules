.class public Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
.source "AdobeAssetLibraryItemCharacterStyle.java"


# instance fields
.field private rendition:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

.field private renditionHeight:F

.field private renditionWidth:F

.field private styleData:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lorg/json/JSONObject;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;IILcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V
    .registers 9
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .param p2, "renditionName"    # Ljava/lang/String;
    .param p3, "styleData"    # Lorg/json/JSONObject;
    .param p4, "rendition"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .param p5, "renditionHeight"    # I
    .param p6, "renditionWidth"    # I
    .param p7, "library"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .prologue
    .line 76
    invoke-direct {p0, p1, p2, p7}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 78
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->styleData:Lorg/json/JSONObject;

    .line 79
    iput-object p4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->rendition:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    .line 80
    int-to-float v0, p5

    iput v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->renditionHeight:F

    .line 81
    int-to-float v0, p6

    iput v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->renditionWidth:F

    .line 83
    return-void
.end method


# virtual methods
.method public getRendition()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->rendition:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFile;

    return-object v0
.end method

.method public getRenditionHeight()F
    .registers 2

    .prologue
    .line 56
    iget v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->renditionHeight:F

    return v0
.end method

.method public getRenditionWidth()F
    .registers 2

    .prologue
    .line 64
    iget v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->renditionWidth:F

    return v0
.end method

.method public getStyleData()Lorg/json/JSONObject;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->styleData:Lorg/json/JSONObject;

    return-object v0
.end method

.method public nameOrIdForDisplay()Ljava/lang/String;
    .registers 13

    .prologue
    .line 88
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/storage/library/AdobeAssetLibraryItemCharacterStyle;->getStyleData()Lorg/json/JSONObject;

    move-result-object v7

    .line 89
    .local v7, "styleData":Lorg/json/JSONObject;
    const-wide/16 v4, 0x0

    .line 90
    .local v4, "fontSizeVal":D
    const-string v8, "fontFamily"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 92
    .local v1, "fontFamilyName":Ljava/lang/String;
    const/4 v0, 0x0

    .line 93
    .local v0, "fontDisplayName":Ljava/lang/String;
    const/4 v2, 0x0

    .line 94
    .local v2, "fontSize":Ljava/lang/String;
    const/4 v3, 0x0

    .line 95
    .local v3, "fontSizeUnit":Ljava/lang/String;
    const-string v8, "fontSize"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 96
    .local v6, "sizeDict":Lorg/json/JSONObject;
    if-eqz v6, :cond_23

    .line 97
    const-string v8, "value"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 99
    const-string v8, "type"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 105
    :cond_23
    if-eqz v1, :cond_52

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_52

    .line 108
    if-eqz v2, :cond_31

    .line 110
    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    .line 112
    :cond_31
    const-string v9, "%s %.1f%s"

    const/4 v8, 0x3

    new-array v10, v8, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v1, v10, v8

    const/4 v11, 0x1

    if-eqz v2, :cond_4c

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v8

    :goto_40
    aput-object v8, v10, v11

    const/4 v8, 0x2

    if-eqz v3, :cond_4f

    .end local v3    # "fontSizeUnit":Ljava/lang/String;
    :goto_45
    aput-object v3, v10, v8

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 124
    :goto_4b
    return-object v0

    .line 112
    .restart local v3    # "fontSizeUnit":Ljava/lang/String;
    :cond_4c
    const-string v8, ""

    goto :goto_40

    :cond_4f
    const-string v3, ""

    goto :goto_45

    .line 121
    :cond_52
    invoke-super {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;->nameOrIdForDisplay()Ljava/lang/String;

    move-result-object v0

    goto :goto_4b
.end method
