.class public final enum Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;
.super Ljava/lang/Enum;
.source "AdobeAssetMimeTypes.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

.field public static final enum MIMETYPE_BMP:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

.field public static final enum MIMETYPE_DMG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

.field public static final enum MIMETYPE_DNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

.field public static final enum MIMETYPE_GIF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

.field public static final enum MIMETYPE_ILLUSTRATOR:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

.field public static final enum MIMETYPE_JPEG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

.field public static final enum MIMETYPE_MP4:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

.field public static final enum MIMETYPE_OCTETSTREAM:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

.field public static final enum MIMETYPE_PDF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

.field public static final enum MIMETYPE_PHOTOSHOP:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

.field public static final enum MIMETYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

.field public static final enum MIMETYPE_QUICKTIME:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

.field public static final enum MIMETYPE_RAW:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

.field public static final enum MIMETYPE_TIFF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;


# instance fields
.field private mimeType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 30
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    const-string v1, "MIMETYPE_OCTETSTREAM"

    const-string v2, "application/octet-stream"

    invoke-direct {v0, v1, v4, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_OCTETSTREAM:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 33
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    const-string v1, "MIMETYPE_PHOTOSHOP"

    const-string v2, "image/vnd.adobe.photoshop"

    invoke-direct {v0, v1, v5, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_PHOTOSHOP:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 36
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    const-string v1, "MIMETYPE_JPEG"

    const-string v2, "image/jpeg"

    invoke-direct {v0, v1, v6, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_JPEG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 40
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    const-string v1, "MIMETYPE_ILLUSTRATOR"

    const-string v2, "application/illustrator"

    invoke-direct {v0, v1, v7, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_ILLUSTRATOR:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 43
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    const-string v1, "MIMETYPE_GIF"

    const-string v2, "image/gif"

    invoke-direct {v0, v1, v8, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_GIF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 46
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    const-string v1, "MIMETYPE_PNG"

    const/4 v2, 0x5

    const-string v3, "image/png"

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 49
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    const-string v1, "MIMETYPE_TIFF"

    const/4 v2, 0x6

    const-string v3, "image/tiff"

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_TIFF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 52
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    const-string v1, "MIMETYPE_BMP"

    const/4 v2, 0x7

    const-string v3, "image/bmp"

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_BMP:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 55
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    const-string v1, "MIMETYPE_PDF"

    const/16 v2, 0x8

    const-string v3, "application/pdf"

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_PDF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 58
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    const-string v1, "MIMETYPE_DMG"

    const/16 v2, 0x9

    const-string v3, "application/x-diskcopy"

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_DMG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 61
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    const-string v1, "MIMETYPE_DNG"

    const/16 v2, 0xa

    const-string v3, "image/x-adobe-dng"

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_DNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 64
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    const-string v1, "MIMETYPE_RAW"

    const/16 v2, 0xb

    const-string v3, "image/x-dcraw"

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_RAW:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 67
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    const-string v1, "MIMETYPE_MP4"

    const/16 v2, 0xc

    const-string v3, "video/mp4"

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_MP4:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 68
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    const-string v1, "MIMETYPE_QUICKTIME"

    const/16 v2, 0xd

    const-string v3, "video/quicktime"

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_QUICKTIME:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    .line 28
    const/16 v0, 0xe

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_OCTETSTREAM:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_PHOTOSHOP:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_JPEG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_ILLUSTRATOR:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    aput-object v1, v0, v7

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_GIF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_TIFF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_BMP:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_PDF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_DMG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_DNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_RAW:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_MP4:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->MIMETYPE_QUICKTIME:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 4
    .param p3, "mimeType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 73
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 74
    iput-object p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->mimeType:Ljava/lang/String;

    .line 75
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 28
    const-class v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;
    .registers 1

    .prologue
    .line 28
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;

    return-object v0
.end method


# virtual methods
.method public getMimeType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMimeTypes;->mimeType:Ljava/lang/String;

    return-object v0
.end method
