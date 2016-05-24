.class public final enum Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;
.super Ljava/lang/Enum;
.source "AdobeImageAdjustImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ScaleType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

.field public static final enum CENTER:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

.field public static final enum CENTER_CROP:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

.field public static final enum CENTER_INSIDE:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

.field public static final enum FIT_CENTER:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

.field public static final enum FIT_END:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

.field public static final enum FIT_START:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

.field public static final enum FIT_XY:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

.field public static final enum MATRIX:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;


# instance fields
.field final nativeInt:I


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 2055
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    const-string v1, "MATRIX"

    invoke-direct {v0, v1, v4, v4}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->MATRIX:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    .line 2060
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    const-string v1, "FIT_XY"

    invoke-direct {v0, v1, v5, v5}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->FIT_XY:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    .line 2065
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    const-string v1, "FIT_START"

    invoke-direct {v0, v1, v6, v6}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->FIT_START:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    .line 2070
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    const-string v1, "FIT_CENTER"

    invoke-direct {v0, v1, v7, v7}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->FIT_CENTER:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    .line 2075
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    const-string v1, "FIT_END"

    invoke-direct {v0, v1, v8, v8}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->FIT_END:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    .line 2080
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    const-string v1, "CENTER"

    const/4 v2, 0x5

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->CENTER:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    .line 2088
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    const-string v1, "CENTER_CROP"

    const/4 v2, 0x6

    const/4 v3, 0x6

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->CENTER_CROP:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    .line 2096
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    const-string v1, "CENTER_INSIDE"

    const/4 v2, 0x7

    const/4 v3, 0x7

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->CENTER_INSIDE:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    .line 2049
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->MATRIX:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->FIT_XY:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->FIT_START:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->FIT_CENTER:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->FIT_END:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->CENTER:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->CENTER_CROP:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->CENTER_INSIDE:Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->$VALUES:[Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

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
    .line 2105
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2106
    iput p3, p0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->nativeInt:I

    .line 2107
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 2049
    const-class v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;
    .registers 1

    .prologue
    .line 2049
    sget-object v0, Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->$VALUES:[Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/aviary/widget/AdobeImageAdjustImageView$ScaleType;

    return-object v0
.end method
