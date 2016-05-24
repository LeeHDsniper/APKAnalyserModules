.class public final enum Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;
.super Ljava/lang/Enum;
.source "BehanceSDKPublishImageValidationResult.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

.field public static final enum INVALID:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

.field public static final enum INVALID_FILE_TYPE:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

.field public static final enum INVALID_IMAGE_DIMENSIONS:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

.field public static final enum INVALID_SIZE:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

.field public static final enum VALID:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 8
    new-instance v0, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    const-string v1, "VALID"

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->VALID:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    .line 9
    new-instance v0, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    const-string v1, "INVALID_SIZE"

    invoke-direct {v0, v1, v3}, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->INVALID_SIZE:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    .line 10
    new-instance v0, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    const-string v1, "INVALID_IMAGE_DIMENSIONS"

    invoke-direct {v0, v1, v4}, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->INVALID_IMAGE_DIMENSIONS:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    .line 11
    new-instance v0, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    const-string v1, "INVALID_FILE_TYPE"

    invoke-direct {v0, v1, v5}, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->INVALID_FILE_TYPE:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    .line 12
    new-instance v0, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    const-string v1, "INVALID"

    invoke-direct {v0, v1, v6}, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->INVALID:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    .line 6
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    sget-object v1, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->VALID:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    aput-object v1, v0, v2

    sget-object v1, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->INVALID_SIZE:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    aput-object v1, v0, v3

    sget-object v1, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->INVALID_IMAGE_DIMENSIONS:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    aput-object v1, v0, v4

    sget-object v1, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->INVALID_FILE_TYPE:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    aput-object v1, v0, v5

    sget-object v1, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->INVALID:Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    aput-object v1, v0, v6

    sput-object v0, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->$VALUES:[Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

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

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 6
    const-class v0, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;
    .registers 1

    .prologue
    .line 6
    sget-object v0, Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->$VALUES:[Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    invoke-virtual {v0}, [Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/util/BehanceSDKPublishImageValidationResult;

    return-object v0
.end method
