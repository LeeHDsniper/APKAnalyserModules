.class public final enum Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;
.super Ljava/lang/Enum;
.source "AdobeImageAdjustImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FlipType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

.field public static final enum FLIP_HORIZONTAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

.field public static final enum FLIP_NONE:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

.field public static final enum FLIP_VERTICAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;


# instance fields
.field public final nativeInt:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 2112
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    const-string v1, "FLIP_NONE"

    invoke-direct {v0, v1, v5, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_NONE:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    const-string v1, "FLIP_HORIZONTAL"

    invoke-direct {v0, v1, v3, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_HORIZONTAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    const-string v1, "FLIP_VERTICAL"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v4, v2}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_VERTICAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    .line 2110
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_NONE:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_HORIZONTAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->FLIP_VERTICAL:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->$VALUES:[Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p3, "ni"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 2115
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2116
    iput p3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->nativeInt:I

    .line 2117
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 2110
    const-class v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;
    .registers 1

    .prologue
    .line 2110
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->$VALUES:[Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$FlipType;

    return-object v0
.end method
