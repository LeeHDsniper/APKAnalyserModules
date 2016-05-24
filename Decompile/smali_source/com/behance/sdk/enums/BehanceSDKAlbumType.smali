.class public final enum Lcom/behance/sdk/enums/BehanceSDKAlbumType;
.super Ljava/lang/Enum;
.source "BehanceSDKAlbumType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/behance/sdk/enums/BehanceSDKAlbumType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/behance/sdk/enums/BehanceSDKAlbumType;

.field public static final enum CAMERA:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

.field public static final enum CREATIVE_CLOUD:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

.field public static final enum DEVICE_ALBUM:Lcom/behance/sdk/enums/BehanceSDKAlbumType;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 27
    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    const-string v1, "DEVICE_ALBUM"

    invoke-direct {v0, v1, v2}, Lcom/behance/sdk/enums/BehanceSDKAlbumType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->DEVICE_ALBUM:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    const-string v1, "CAMERA"

    invoke-direct {v0, v1, v3}, Lcom/behance/sdk/enums/BehanceSDKAlbumType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->CAMERA:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    new-instance v0, Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    const-string v1, "CREATIVE_CLOUD"

    invoke-direct {v0, v1, v4}, Lcom/behance/sdk/enums/BehanceSDKAlbumType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->CREATIVE_CLOUD:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    .line 26
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->DEVICE_ALBUM:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->CAMERA:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->CREATIVE_CLOUD:Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKAlbumType;

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
    .line 26
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/behance/sdk/enums/BehanceSDKAlbumType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 26
    const-class v0, Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    return-object v0
.end method

.method public static values()[Lcom/behance/sdk/enums/BehanceSDKAlbumType;
    .registers 1

    .prologue
    .line 26
    sget-object v0, Lcom/behance/sdk/enums/BehanceSDKAlbumType;->$VALUES:[Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    invoke-virtual {v0}, [Lcom/behance/sdk/enums/BehanceSDKAlbumType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/behance/sdk/enums/BehanceSDKAlbumType;

    return-object v0
.end method
