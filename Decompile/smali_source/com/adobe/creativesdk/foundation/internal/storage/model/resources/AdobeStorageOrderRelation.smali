.class public final enum Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;
.super Ljava/lang/Enum;
.source "AdobeStorageOrderRelation.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

.field public static final enum ADOBE_STORAGE_ORDER_ASCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

.field public static final enum ADOBE_STORAGE_ORDER_DESCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 30
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    const-string v1, "ADOBE_STORAGE_ORDER_ASCENDING"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;->ADOBE_STORAGE_ORDER_ASCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    .line 33
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    const-string v1, "ADOBE_STORAGE_ORDER_DESCENDING"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;->ADOBE_STORAGE_ORDER_DESCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    .line 28
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;->ADOBE_STORAGE_ORDER_ASCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;->ADOBE_STORAGE_ORDER_DESCENDING:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    aput-object v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

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
    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 28
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;
    .registers 1

    .prologue
    .line 28
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStorageOrderRelation;

    return-object v0
.end method
