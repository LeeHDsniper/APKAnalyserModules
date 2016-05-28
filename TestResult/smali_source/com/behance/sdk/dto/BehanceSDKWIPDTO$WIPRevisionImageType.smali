.class public final enum Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;
.super Ljava/lang/Enum;
.source "BehanceSDKWIPDTO.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/behance/sdk/dto/BehanceSDKWIPDTO;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "WIPRevisionImageType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

.field public static final enum HIGH_DEFINITION:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

.field public static final enum LIMIT_320:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

.field public static final enum NORMAL_RESOLUTION:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

.field public static final enum THUMBNAIL:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

.field public static final enum THUMBNAIL_SM:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

.field public static final enum THUMB_120:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

.field public static final enum THUMB_240:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

.field public static final enum THUMB_40:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

.field public static final enum THUMB_80:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 81
    new-instance v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    const-string v1, "THUMBNAIL_SM"

    invoke-direct {v0, v1, v3}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMBNAIL_SM:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    new-instance v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    const-string v1, "THUMBNAIL"

    invoke-direct {v0, v1, v4}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMBNAIL:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    new-instance v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    const-string v1, "NORMAL_RESOLUTION"

    invoke-direct {v0, v1, v5}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->NORMAL_RESOLUTION:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    new-instance v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    const-string v1, "HIGH_DEFINITION"

    invoke-direct {v0, v1, v6}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->HIGH_DEFINITION:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    new-instance v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    const-string v1, "THUMB_40"

    invoke-direct {v0, v1, v7}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMB_40:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    new-instance v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    const-string v1, "THUMB_80"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMB_80:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    new-instance v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    const-string v1, "THUMB_120"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMB_120:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    new-instance v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    const-string v1, "THUMB_240"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMB_240:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    new-instance v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    const-string v1, "LIMIT_320"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->LIMIT_320:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    .line 79
    const/16 v0, 0x9

    new-array v0, v0, [Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    sget-object v1, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMBNAIL_SM:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMBNAIL:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->NORMAL_RESOLUTION:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->HIGH_DEFINITION:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMB_40:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMB_80:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMB_120:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->THUMB_240:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->LIMIT_320:Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->$VALUES:[Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

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
    .line 79
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 79
    const-class v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;
    .registers 1

    .prologue
    .line 79
    sget-object v0, Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->$VALUES:[Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    invoke-virtual {v0}, [Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/dto/BehanceSDKWIPDTO$WIPRevisionImageType;

    return-object v0
.end method
