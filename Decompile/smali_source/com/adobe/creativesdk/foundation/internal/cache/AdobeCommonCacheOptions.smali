.class public final enum Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;
.super Ljava/lang/Enum;
.source "AdobeCommonCacheOptions.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

.field public static final enum AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

.field public static final enum AdobeCommonCacheKeepOnDiskCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

.field public static final enum AdobeCommonCacheUnset:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 24
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    const-string v1, "AdobeCommonCacheUnset"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheUnset:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    .line 26
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    const-string v1, "AdobeCommonCacheKeepInMemoryCache"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    .line 28
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    const-string v1, "AdobeCommonCacheKeepOnDiskCache"

    invoke-direct {v0, v1, v4}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepOnDiskCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    .line 21
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheUnset:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepInMemoryCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->AdobeCommonCacheKeepOnDiskCache:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    aput-object v1, v0, v4

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

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
    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 21
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;
    .registers 1

    .prologue
    .line 21
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheOptions;

    return-object v0
.end method
