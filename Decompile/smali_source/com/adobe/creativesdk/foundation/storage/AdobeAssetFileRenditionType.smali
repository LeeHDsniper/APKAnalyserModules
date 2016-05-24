.class public final enum Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;
.super Ljava/lang/Enum;
.source "AdobeAssetFileRenditionType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

.field public static final enum ADOBE_ASSET_FILE_RENDITION_TYPE_GIF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

.field public static final enum ADOBE_ASSET_FILE_RENDITION_TYPE_JPEG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

.field public static final enum ADOBE_ASSET_FILE_RENDITION_TYPE_PDF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

.field public static final enum ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

.field public static final enum ADOBE_ASSET_FILE_RENDITION_TYPE_TIFF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 27
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    const-string v1, "ADOBE_ASSET_FILE_RENDITION_TYPE_JPEG"

    invoke-direct {v0, v1, v2, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_JPEG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    .line 30
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    const-string v1, "ADOBE_ASSET_FILE_RENDITION_TYPE_PNG"

    invoke-direct {v0, v1, v3, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    .line 33
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    const-string v1, "ADOBE_ASSET_FILE_RENDITION_TYPE_PDF"

    invoke-direct {v0, v1, v4, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PDF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    .line 36
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    const-string v1, "ADOBE_ASSET_FILE_RENDITION_TYPE_GIF"

    invoke-direct {v0, v1, v5, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_GIF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    .line 39
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    const-string v1, "ADOBE_ASSET_FILE_RENDITION_TYPE_TIFF"

    invoke-direct {v0, v1, v6, v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_TIFF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    .line 24
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_JPEG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PNG:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_PDF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_GIF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->ADOBE_ASSET_FILE_RENDITION_TYPE_TIFF:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p3, "val"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 45
    iput p3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->value:I

    .line 46
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 24
    const-class v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;
    .registers 1

    .prologue
    .line 24
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;

    return-object v0
.end method


# virtual methods
.method public getIntVal()I
    .registers 2

    .prologue
    .line 50
    iget v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFileRenditionType;->value:I

    return v0
.end method
