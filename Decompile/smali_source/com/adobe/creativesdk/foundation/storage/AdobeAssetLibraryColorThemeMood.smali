.class public final enum Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;
.super Ljava/lang/Enum;
.source "AdobeAssetLibraryColorThemeMood.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

.field public static final enum AdobeAssetLibraryColorThemeMoodBright:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

.field public static final enum AdobeAssetLibraryColorThemeMoodColorful:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

.field public static final enum AdobeAssetLibraryColorThemeMoodCustom:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

.field public static final enum AdobeAssetLibraryColorThemeMoodDark:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

.field public static final enum AdobeAssetLibraryColorThemeMoodMuted:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

.field public static final enum AdobeAssetLibraryColorThemeMoodNotSet:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

.field public static final enum AdobeAssetLibraryColorThemeMoodUnknown:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 23
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    const-string v1, "AdobeAssetLibraryColorThemeMoodUnknown"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodUnknown:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    .line 25
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    const-string v1, "AdobeAssetLibraryColorThemeMoodNotSet"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodNotSet:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    .line 27
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    const-string v1, "AdobeAssetLibraryColorThemeMoodColorful"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodColorful:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    .line 29
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    const-string v1, "AdobeAssetLibraryColorThemeMoodBright"

    invoke-direct {v0, v1, v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodBright:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    .line 31
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    const-string v1, "AdobeAssetLibraryColorThemeMoodMuted"

    invoke-direct {v0, v1, v7}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodMuted:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    .line 33
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    const-string v1, "AdobeAssetLibraryColorThemeMoodDark"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodDark:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    .line 35
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    const-string v1, "AdobeAssetLibraryColorThemeMoodCustom"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodCustom:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    .line 20
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodUnknown:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodNotSet:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodColorful:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodBright:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodMuted:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodDark:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodCustom:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

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
    .line 20
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 20
    const-class v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;
    .registers 1

    .prologue
    .line 20
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    return-object v0
.end method
