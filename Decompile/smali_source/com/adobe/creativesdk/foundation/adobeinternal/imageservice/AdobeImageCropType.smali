.class public final enum Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;
.super Ljava/lang/Enum;
.source "AdobeImageCropType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

.field public static final enum AdobeImageCropToFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

.field public static final enum AdobeImageNoCrop:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

.field public static final enum AdobeImageSmartFillCrop:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 8
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    const-string v1, "AdobeImageNoCrop"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->AdobeImageNoCrop:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    .line 9
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    const-string v1, "AdobeImageCropToFit"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->AdobeImageCropToFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    .line 10
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    const-string v1, "AdobeImageSmartFillCrop"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->AdobeImageSmartFillCrop:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    .line 6
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->AdobeImageNoCrop:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->AdobeImageCropToFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->AdobeImageSmartFillCrop:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 6
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 6
    const-class v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;
    .registers 1

    .prologue
    .line 6
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageCropType;

    return-object v0
.end method
