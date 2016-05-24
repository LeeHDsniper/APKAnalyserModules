.class public final enum Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;
.super Ljava/lang/Enum;
.source "AdobeAssetMIMETypeFilterType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

.field public static final enum ADOBE_ASSET_MIMETYPE_FILTERTYPE_EXCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

.field public static final enum ADOBE_ASSET_MIMETYPE_FILTERTYPE_INCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 23
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    const-string v1, "ADOBE_ASSET_MIMETYPE_FILTERTYPE_INCLUSION"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;->ADOBE_ASSET_MIMETYPE_FILTERTYPE_INCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    .line 25
    new-instance v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    const-string v1, "ADOBE_ASSET_MIMETYPE_FILTERTYPE_EXCLUSION"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;->ADOBE_ASSET_MIMETYPE_FILTERTYPE_EXCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    .line 20
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;->ADOBE_ASSET_MIMETYPE_FILTERTYPE_INCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;->ADOBE_ASSET_MIMETYPE_FILTERTYPE_EXCLUSION:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 20
    const-class v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;
    .registers 1

    .prologue
    .line 20
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;->$VALUES:[Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/storage/AdobeAssetMIMETypeFilterType;

    return-object v0
.end method
