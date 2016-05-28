.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
.source "AdobeAssetLibraryItemColor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor$1;
    }
.end annotation


# instance fields
.field private colorAlpha:Ljava/lang/Number;

.field private colorComponents:Ljava/lang/Object;

.field private colorMode:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

.field private colorProfileName:Ljava/lang/String;

.field private colorType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorType;

.field private renditionAlpha:Ljava/lang/Number;

.field private renditionComponents:Ljava/lang/Object;

.field private renditionMode:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

.field private renditionProfileName:Ljava/lang/String;

.field private renditionType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorType;


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Number;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Number;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V
    .registers 15
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .param p2, "renditionName"    # Ljava/lang/String;
    .param p3, "colorType"    # Ljava/lang/String;
    .param p4, "colorMode"    # Ljava/lang/String;
    .param p5, "colorComponents"    # Ljava/lang/Object;
    .param p6, "colorAlpha"    # Ljava/lang/Number;
    .param p7, "colorProfileName"    # Ljava/lang/String;
    .param p8, "renditionType"    # Ljava/lang/String;
    .param p9, "renditionMode"    # Ljava/lang/String;
    .param p10, "renditionComponents"    # Ljava/lang/Object;
    .param p11, "renditionAlpha"    # Ljava/lang/Number;
    .param p12, "renditionProfileName"    # Ljava/lang/String;
    .param p13, "library"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .prologue
    .line 97
    invoke-direct {p0, p1, p2, p13}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 99
    invoke-static {p3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorTypeForStringType(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorType;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorType;

    .line 100
    invoke-static {p4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorModeForStringMode(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorMode:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    .line 101
    iput-object p5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorComponents:Ljava/lang/Object;

    .line 102
    iput-object p6, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorAlpha:Ljava/lang/Number;

    .line 103
    iput-object p7, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorProfileName:Ljava/lang/String;

    .line 105
    invoke-static {p8}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorTypeForStringType(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorType;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->renditionType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorType;

    .line 106
    invoke-static {p9}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorModeForStringMode(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->renditionMode:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    .line 107
    iput-object p10, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->renditionComponents:Ljava/lang/Object;

    .line 108
    iput-object p11, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->renditionAlpha:Ljava/lang/Number;

    .line 109
    iput-object p12, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->renditionProfileName:Ljava/lang/String;

    .line 113
    return-void
.end method

.method static colorModeForStringMode(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;
    .registers 2
    .param p0, "colorMode"    # Ljava/lang/String;

    .prologue
    .line 209
    if-nez p0, :cond_4

    .line 210
    const/4 v0, 0x0

    .line 235
    :goto_3
    return-object v0

    .line 212
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 214
    const-string v0, "rgb"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 216
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeRGB:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    goto :goto_3

    .line 218
    :cond_13
    const-string v0, "cmyk"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 220
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeCMYK:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    goto :goto_3

    .line 222
    :cond_1e
    const-string v0, "lab"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    .line 224
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeLab:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    goto :goto_3

    .line 226
    :cond_29
    const-string v0, "hsb"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 228
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeHSB:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    goto :goto_3

    .line 230
    :cond_34
    const-string v0, "gray"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 232
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeGray:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    goto :goto_3

    .line 235
    :cond_3f
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeUnknown:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    goto :goto_3
.end method

.method static colorTypeForStringType(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorType;
    .registers 2
    .param p0, "colorType"    # Ljava/lang/String;

    .prologue
    .line 194
    if-nez p0, :cond_4

    .line 195
    const/4 v0, 0x0

    .line 204
    :goto_3
    return-object v0

    .line 197
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 199
    const-string v0, "spot"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    .line 201
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorType;->AdobeAssetLibraryColorTypeSpot:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorType;

    goto :goto_3

    .line 204
    :cond_13
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorType;->AdobeAssetLibraryColorTypeProcess:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorType;

    goto :goto_3
.end method

.method private grayHex()Ljava/lang/String;
    .registers 7

    .prologue
    .line 307
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorComponents:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    .line 308
    .local v0, "colorValue":Ljava/lang/Number;
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v1

    .line 310
    .local v1, "gray":I
    const-string v2, "#%02X"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private hex()Ljava/lang/String;
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 263
    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor$1;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetLibraryColorMode:[I

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorMode:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_1e

    .line 278
    :goto_e
    :pswitch_e
    return-object v0

    .line 266
    :pswitch_f
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->rgbHex()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 270
    :pswitch_14
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->grayHex()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 272
    :pswitch_19
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->hsbHex()Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 263
    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_f
        :pswitch_e
        :pswitch_14
        :pswitch_19
        :pswitch_e
        :pswitch_e
    .end packed-switch
.end method

.method private hsbHex()Ljava/lang/String;
    .registers 9

    .prologue
    .line 295
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorComponents:Ljava/lang/Object;

    check-cast v1, Lorg/json/JSONObject;

    .line 296
    .local v1, "colorDict":Lorg/json/JSONObject;
    const-string v4, "h"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    .line 297
    .local v2, "h":I
    const-string v4, "s"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    .line 298
    .local v3, "s":I
    const-string v4, "b"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    .line 301
    .local v0, "b":I
    const-string v4, "#%02X%02X%02X"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private renditionHex()Ljava/lang/String;
    .registers 9

    .prologue
    .line 315
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->renditionComponents:Ljava/lang/Object;

    check-cast v1, Lorg/json/JSONObject;

    .line 316
    .local v1, "colorDict":Lorg/json/JSONObject;
    const-string v4, "r"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    .line 317
    .local v3, "r":I
    const-string v4, "g"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    .line 318
    .local v2, "g":I
    const-string v4, "b"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    .line 321
    .local v0, "b":I
    const-string v4, "#%02X%02X%02X"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private rgbHex()Ljava/lang/String;
    .registers 9

    .prologue
    .line 284
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorComponents:Ljava/lang/Object;

    check-cast v1, Lorg/json/JSONObject;

    .line 285
    .local v1, "colorDict":Lorg/json/JSONObject;
    const-string v4, "r"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    .line 286
    .local v3, "r":I
    const-string v4, "g"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    .line 287
    .local v2, "g":I
    const-string v4, "b"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    .line 290
    .local v0, "b":I
    const-string v4, "#%02X%02X%02X"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public color()I
    .registers 3

    .prologue
    .line 117
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorMode:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    if-nez v0, :cond_6

    .line 119
    const/4 v0, -0x1

    .line 136
    :goto_5
    return v0

    .line 121
    :cond_6
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor$1;->$SwitchMap$com$adobe$creativesdk$foundation$storage$AdobeAssetLibraryColorMode:[I

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorMode:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_36

    .line 136
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->rgbRenditionColor()I

    move-result v0

    goto :goto_5

    .line 124
    :pswitch_18
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->rgbColor()I

    move-result v0

    goto :goto_5

    .line 126
    :pswitch_1d
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->rgbRenditionColor()I

    move-result v0

    goto :goto_5

    .line 128
    :pswitch_22
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->grayColor()I

    move-result v0

    goto :goto_5

    .line 130
    :pswitch_27
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->hsbColor()I

    move-result v0

    goto :goto_5

    .line 132
    :pswitch_2c
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->rgbRenditionColor()I

    move-result v0

    goto :goto_5

    .line 134
    :pswitch_31
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->rgbRenditionColor()I

    move-result v0

    goto :goto_5

    .line 121
    :pswitch_data_36
    .packed-switch 0x1
        :pswitch_18
        :pswitch_1d
        :pswitch_22
        :pswitch_27
        :pswitch_2c
        :pswitch_31
    .end packed-switch
.end method

.method public colorNameOrHexValue()Ljava/lang/String;
    .registers 3

    .prologue
    .line 242
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->name:Ljava/lang/String;

    if-eqz v1, :cond_7

    .line 244
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->name:Ljava/lang/String;

    .line 255
    :cond_6
    :goto_6
    return-object v0

    .line 248
    :cond_7
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->hex()Ljava/lang/String;

    move-result-object v0

    .line 249
    .local v0, "hex":Ljava/lang/String;
    if-nez v0, :cond_6

    .line 255
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->renditionHex()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method grayColor()I
    .registers 13

    .prologue
    const-wide/high16 v10, 0x4059000000000000L

    .line 168
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorComponents:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Number;

    .line 169
    .local v3, "gray":Ljava/lang/Number;
    invoke-virtual {v3}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v8

    sub-double v8, v10, v8

    div-double v4, v8, v10

    .line 170
    .local v4, "grayAdjusted":D
    const-wide v8, 0x406fe00000000000L

    mul-double v0, v8, v4

    .line 171
    .local v0, "color":D
    new-instance v7, Ljava/lang/Double;

    invoke-direct {v7, v0, v1}, Ljava/lang/Double;-><init>(D)V

    invoke-virtual {v7}, Ljava/lang/Double;->intValue()I

    move-result v2

    .line 172
    .local v2, "colorVal":I
    invoke-static {v2, v2, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v6

    .line 173
    .local v6, "rgb":I
    return v6
.end method

.method hsbColor()I
    .registers 8

    .prologue
    .line 153
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorComponents:Ljava/lang/Object;

    check-cast v2, Lorg/json/JSONObject;

    .line 154
    .local v2, "colorDict":Lorg/json/JSONObject;
    const-string v6, "h"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    int-to-float v3, v6

    .line 155
    .local v3, "h":F
    const-string v6, "s"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    int-to-float v5, v6

    .line 156
    .local v5, "s":F
    const-string v6, "b"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v6

    int-to-float v0, v6

    .line 158
    .local v0, "b":F
    const/4 v6, 0x3

    new-array v4, v6, [F

    const/4 v6, 0x0

    aput v3, v4, v6

    const/4 v6, 0x1

    aput v5, v4, v6

    const/4 v6, 0x2

    aput v0, v4, v6

    .line 159
    .local v4, "hsb":[F
    invoke-static {v4}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v1

    .line 161
    .local v1, "color":I
    return v1
.end method

.method rgbColor()I
    .registers 6

    .prologue
    .line 142
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->colorComponents:Ljava/lang/Object;

    check-cast v1, Lorg/json/JSONObject;

    .line 143
    .local v1, "colorDict":Lorg/json/JSONObject;
    const-string v4, "r"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    .line 144
    .local v3, "r":I
    const-string v4, "g"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    .line 145
    .local v2, "g":I
    const-string v4, "b"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    .line 147
    .local v0, "b":I
    const/16 v4, 0xff

    invoke-static {v4, v3, v2, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v4

    return v4
.end method

.method rgbRenditionColor()I
    .registers 6

    .prologue
    .line 178
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->renditionComponents:Ljava/lang/Object;

    if-eqz v4, :cond_1f

    .line 180
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColor;->renditionComponents:Ljava/lang/Object;

    check-cast v1, Lorg/json/JSONObject;

    .line 181
    .local v1, "colorDict":Lorg/json/JSONObject;
    const-string v4, "r"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    .line 182
    .local v3, "r":I
    const-string v4, "g"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    .line 183
    .local v2, "g":I
    const-string v4, "b"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    .line 185
    .local v0, "b":I
    invoke-static {v3, v2, v0}, Landroid/graphics/Color;->rgb(III)I

    move-result v4

    .line 189
    .end local v0    # "b":I
    .end local v1    # "colorDict":Lorg/json/JSONObject;
    .end local v2    # "g":I
    .end local v3    # "r":I
    :goto_1e
    return v4

    :cond_1f
    const/4 v4, -0x1

    goto :goto_1e
.end method
