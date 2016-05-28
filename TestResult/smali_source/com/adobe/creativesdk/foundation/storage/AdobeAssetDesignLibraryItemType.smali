.class public final enum Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;
.super Ljava/lang/Enum;
.source "AdobeAssetDesignLibraryItemType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

.field public static final enum AdobeAssetDesignLibraryItemBrushes:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

.field public static final enum AdobeAssetDesignLibraryItemCharacterStyles:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

.field public static final enum AdobeAssetDesignLibraryItemColorThemes:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

.field public static final enum AdobeAssetDesignLibraryItemColors:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

.field public static final enum AdobeAssetDesignLibraryItemImages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

.field public static final enum AdobeAssetDesignLibraryItemLayoutStyles:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

.field public static final enum AdobeAssetDesignLibraryItemLooks:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 11
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    const-string v1, "AdobeAssetDesignLibraryItemBrushes"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemBrushes:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    .line 16
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    const-string v1, "AdobeAssetDesignLibraryItemCharacterStyles"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemCharacterStyles:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    .line 21
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    const-string v1, "AdobeAssetDesignLibraryItemColors"

    invoke-direct {v0, v1, v5}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemColors:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    .line 26
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    const-string v1, "AdobeAssetDesignLibraryItemColorThemes"

    invoke-direct {v0, v1, v6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemColorThemes:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    .line 31
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    const-string v1, "AdobeAssetDesignLibraryItemLayoutStyles"

    invoke-direct {v0, v1, v7}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemLayoutStyles:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    .line 36
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    const-string v1, "AdobeAssetDesignLibraryItemImages"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemImages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    .line 41
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    const-string v1, "AdobeAssetDesignLibraryItemLooks"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemLooks:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    .line 6
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemBrushes:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemCharacterStyles:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemColors:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemColorThemes:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemLayoutStyles:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemImages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->AdobeAssetDesignLibraryItemLooks:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 6
    const-class v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;
    .registers 1

    .prologue
    .line 6
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemType;

    return-object v0
.end method
