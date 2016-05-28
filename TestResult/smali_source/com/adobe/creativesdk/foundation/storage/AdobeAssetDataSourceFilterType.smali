.class public final enum Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;
.super Ljava/lang/Enum;
.source "AdobeAssetDataSourceFilterType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

.field public static final enum ADOBE_ASSET_DATASOUCE_FILTER_EXCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

.field public static final enum ADOBE_ASSET_DATASOUCE_FILTER_INCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 27
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    const-string v1, "ADOBE_ASSET_DATASOUCE_FILTER_INCLUSION"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;->ADOBE_ASSET_DATASOUCE_FILTER_INCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    .line 29
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    const-string v1, "ADOBE_ASSET_DATASOUCE_FILTER_EXCLUSION"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;->ADOBE_ASSET_DATASOUCE_FILTER_EXCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    .line 24
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;->ADOBE_ASSET_DATASOUCE_FILTER_INCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;->ADOBE_ASSET_DATASOUCE_FILTER_EXCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

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
    .line 24
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 24
    const-class v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;
    .registers 1

    .prologue
    .line 24
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceFilterType;

    return-object v0
.end method
