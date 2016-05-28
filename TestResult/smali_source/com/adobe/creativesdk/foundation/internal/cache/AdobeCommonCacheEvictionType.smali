.class public final enum Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;
.super Ljava/lang/Enum;
.source "AdobeCommonCacheEvictionType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

.field public static final enum AdobeCommonCacheCriticalEviction:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

.field public static final enum AdobeCommonCacheNormalEviction:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 27
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    const-string v1, "AdobeCommonCacheCriticalEviction"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;->AdobeCommonCacheCriticalEviction:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    .line 31
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    const-string v1, "AdobeCommonCacheNormalEviction"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;->AdobeCommonCacheNormalEviction:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    .line 23
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;->AdobeCommonCacheCriticalEviction:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;->AdobeCommonCacheNormalEviction:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

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
    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 23
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;
    .registers 1

    .prologue
    .line 23
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheEvictionType;

    return-object v0
.end method
