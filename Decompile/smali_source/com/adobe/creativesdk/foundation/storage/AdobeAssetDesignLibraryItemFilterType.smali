.class public final enum Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;
.super Ljava/lang/Enum;
.source "AdobeAssetDesignLibraryItemFilterType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

.field public static final enum ADOBE_ASSET_DESIGNLIBRARYITEM_FILTER_EXCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

.field public static final enum ADOBE_ASSET_DESIGNLIBRARYITEM_FILTER_INCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 11
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    const-string v1, "ADOBE_ASSET_DESIGNLIBRARYITEM_FILTER_INCLUSION"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;->ADOBE_ASSET_DESIGNLIBRARYITEM_FILTER_INCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    .line 15
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    const-string v1, "ADOBE_ASSET_DESIGNLIBRARYITEM_FILTER_EXCLUSION"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;->ADOBE_ASSET_DESIGNLIBRARYITEM_FILTER_EXCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    .line 6
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;->ADOBE_ASSET_DESIGNLIBRARYITEM_FILTER_INCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;->ADOBE_ASSET_DESIGNLIBRARYITEM_FILTER_EXCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 6
    const-class v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;
    .registers 1

    .prologue
    .line 6
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDesignLibraryItemFilterType;

    return-object v0
.end method
