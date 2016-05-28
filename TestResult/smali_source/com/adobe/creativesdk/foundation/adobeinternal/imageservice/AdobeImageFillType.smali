.class public final enum Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;
.super Ljava/lang/Enum;
.source "AdobeImageFillType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

.field public static final enum AdobeImageGBFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

.field public static final enum AdobeImageGBLFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

.field public static final enum AdobeImageLBCFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

.field public static final enum AdobeImageRegularFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 8
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    const-string v1, "AdobeImageRegularFill"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->AdobeImageRegularFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    .line 9
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    const-string v1, "AdobeImageGBFill"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->AdobeImageGBFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    .line 10
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    const-string v1, "AdobeImageGBLFill"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->AdobeImageGBLFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    .line 11
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    const-string v1, "AdobeImageLBCFill"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->AdobeImageLBCFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    .line 6
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->AdobeImageRegularFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->AdobeImageGBFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->AdobeImageGBLFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->AdobeImageLBCFill:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 6
    const-class v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;
    .registers 1

    .prologue
    .line 6
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageFillType;

    return-object v0
.end method
