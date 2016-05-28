.class public final enum Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;
.super Ljava/lang/Enum;
.source "AdobeAssetLibraryColorThemeRule.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

.field public static final enum AdobeAssetLibraryColorThemeRuleAnalogous:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

.field public static final enum AdobeAssetLibraryColorThemeRuleComplimentary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

.field public static final enum AdobeAssetLibraryColorThemeRuleCustom:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

.field public static final enum AdobeAssetLibraryColorThemeRuleMonochromatic:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

.field public static final enum AdobeAssetLibraryColorThemeRuleNotSet:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

.field public static final enum AdobeAssetLibraryColorThemeRuleTriad:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

.field public static final enum AdobeAssetLibraryColorThemeRuleUnknown:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;


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
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    const-string v1, "AdobeAssetLibraryColorThemeRuleUnknown"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleUnknown:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    .line 25
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    const-string v1, "AdobeAssetLibraryColorThemeRuleNotSet"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleNotSet:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    .line 27
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    const-string v1, "AdobeAssetLibraryColorThemeRuleAnalogous"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleAnalogous:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    .line 29
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    const-string v1, "AdobeAssetLibraryColorThemeRuleComplimentary"

    invoke-direct {v0, v1, v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleComplimentary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    .line 31
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    const-string v1, "AdobeAssetLibraryColorThemeRuleMonochromatic"

    invoke-direct {v0, v1, v7}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleMonochromatic:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    .line 33
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    const-string v1, "AdobeAssetLibraryColorThemeRuleTriad"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleTriad:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    .line 35
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    const-string v1, "AdobeAssetLibraryColorThemeRuleCustom"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleCustom:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    .line 20
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleUnknown:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleNotSet:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleAnalogous:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleComplimentary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleMonochromatic:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleTriad:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleCustom:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

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

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 20
    const-class v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;
    .registers 1

    .prologue
    .line 20
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    return-object v0
.end method
