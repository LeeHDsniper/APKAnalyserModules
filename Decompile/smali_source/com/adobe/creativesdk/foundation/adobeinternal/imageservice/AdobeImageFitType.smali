.class public final enum Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;
.super Ljava/lang/Enum;
.source "AdobeImageFitType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

.field public static final enum AdobeImageConstrain:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

.field public static final enum AdobeImageCrop:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

.field public static final enum AdobeImageFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

.field public static final enum AdobeImageHFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

.field public static final enum AdobeImageStretch:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

.field public static final enum AdobeImageVFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

.field public static final enum AdobeImageWrap:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 7
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    const-string v1, "AdobeImageFit"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    .line 9
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    const-string v1, "AdobeImageConstrain"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageConstrain:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    .line 11
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    const-string v1, "AdobeImageCrop"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageCrop:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    .line 13
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    const-string v1, "AdobeImageWrap"

    invoke-direct {v0, v1, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageWrap:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    .line 15
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    const-string v1, "AdobeImageStretch"

    invoke-direct {v0, v1, v7}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageStretch:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    .line 17
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    const-string v1, "AdobeImageHFit"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageHFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    .line 19
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    const-string v1, "AdobeImageVFit"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageVFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    .line 6
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageConstrain:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageCrop:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageWrap:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageStretch:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageHFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->AdobeImageVFit:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 6
    const-class v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;
    .registers 1

    .prologue
    .line 6
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFitType;

    return-object v0
.end method
