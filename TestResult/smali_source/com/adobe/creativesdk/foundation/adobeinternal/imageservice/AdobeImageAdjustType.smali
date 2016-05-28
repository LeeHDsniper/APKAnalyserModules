.class public final enum Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;
.super Ljava/lang/Enum;
.source "AdobeImageAdjustType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

.field public static final enum AdobeImageAdjustAll:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

.field public static final enum AdobeImageEyeLevelAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

.field public static final enum AdobeImageFullAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

.field public static final enum AdobeImageNoPerspectiveAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

.field public static final enum AdobeImageRectificationAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 9
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    const-string v1, "AdobeImageFullAdjust"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->AdobeImageFullAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    .line 10
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    const-string v1, "AdobeImageEyeLevelAdjust"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->AdobeImageEyeLevelAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    .line 11
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    const-string v1, "AdobeImageNoPerspectiveAdjust"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->AdobeImageNoPerspectiveAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    .line 12
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    const-string v1, "AdobeImageRectificationAdjust"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->AdobeImageRectificationAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    .line 13
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    const-string v1, "AdobeImageAdjustAll"

    invoke-direct {v0, v1, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->AdobeImageAdjustAll:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    .line 8
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->AdobeImageFullAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->AdobeImageEyeLevelAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->AdobeImageNoPerspectiveAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->AdobeImageRectificationAdjust:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->AdobeImageAdjustAll:Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

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
    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;
    .registers 1

    .prologue
    .line 8
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->$VALUES:[Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageAdjustType;

    return-object v0
.end method
