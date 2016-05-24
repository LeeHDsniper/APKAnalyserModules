.class public final enum Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;
.super Ljava/lang/Enum;
.source "AdobeStoragePagingMode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

.field public static final enum AdobeStorageFirstPage:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

.field public static final enum AdobeStorageNextPageAppend:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

.field public static final enum AdobeStorageNextPageReplace:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 31
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    const-string v1, "AdobeStorageFirstPage"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->AdobeStorageFirstPage:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    .line 34
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    const-string v1, "AdobeStorageNextPageAppend"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->AdobeStorageNextPageAppend:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    .line 37
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    const-string v1, "AdobeStorageNextPageReplace"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->AdobeStorageNextPageReplace:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    .line 29
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->AdobeStorageFirstPage:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->AdobeStorageNextPageAppend:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->AdobeStorageNextPageReplace:Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

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
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;
    .registers 1

    .prologue
    .line 29
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/storage/model/resources/AdobeStoragePagingMode;

    return-object v0
.end method
