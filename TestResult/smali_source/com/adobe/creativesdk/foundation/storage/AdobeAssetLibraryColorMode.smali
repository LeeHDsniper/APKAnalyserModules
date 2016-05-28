.class public final enum Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;
.super Ljava/lang/Enum;
.source "AdobeAssetLibraryColorMode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

.field public static final enum AdobeAssetLibraryColorModeCMYK:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

.field public static final enum AdobeAssetLibraryColorModeGray:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

.field public static final enum AdobeAssetLibraryColorModeHSB:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

.field public static final enum AdobeAssetLibraryColorModeLab:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

.field public static final enum AdobeAssetLibraryColorModeRGB:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

.field public static final enum AdobeAssetLibraryColorModeUnknown:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 8
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    const-string v1, "AdobeAssetLibraryColorModeUnknown"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeUnknown:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    .line 10
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    const-string v1, "AdobeAssetLibraryColorModeRGB"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeRGB:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    .line 12
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    const-string v1, "AdobeAssetLibraryColorModeCMYK"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeCMYK:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    .line 14
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    const-string v1, "AdobeAssetLibraryColorModeLab"

    invoke-direct {v0, v1, v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeLab:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    .line 16
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    const-string v1, "AdobeAssetLibraryColorModeHSB"

    invoke-direct {v0, v1, v7}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeHSB:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    .line 18
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    const-string v1, "AdobeAssetLibraryColorModeGray"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeGray:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    .line 6
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeUnknown:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeRGB:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeCMYK:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeLab:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeHSB:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->AdobeAssetLibraryColorModeGray:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

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

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 6
    const-class v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;
    .registers 1

    .prologue
    .line 6
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorMode;

    return-object v0
.end method
