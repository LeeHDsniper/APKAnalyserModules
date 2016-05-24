.class public final enum Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;
.super Ljava/lang/Enum;
.source "AdobeCommonCachePolicies.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

.field public static final enum AdobeCommonCacheAllowOfflineUse:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

.field public static final enum AdobeCommonCacheEvictionFIFO:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

.field public static final enum AdobeCommonCacheEvictionLRU:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

.field public static final enum AdobeCommonCacheEvictionLSF:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

.field public static final enum AdobeCommonCachePolicyUnset:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;


# instance fields
.field private value:I


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x4

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 29
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    const-string v1, "AdobeCommonCachePolicyUnset"

    invoke-direct {v0, v1, v3, v3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCachePolicyUnset:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    .line 33
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    const-string v1, "AdobeCommonCacheEvictionLRU"

    invoke-direct {v0, v1, v4, v4}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionLRU:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    .line 37
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    const-string v1, "AdobeCommonCacheEvictionFIFO"

    invoke-direct {v0, v1, v5, v5}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionFIFO:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    .line 41
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    const-string v1, "AdobeCommonCacheEvictionLSF"

    invoke-direct {v0, v1, v7, v6}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionLSF:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    .line 48
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    const-string v1, "AdobeCommonCacheAllowOfflineUse"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v6, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheAllowOfflineUse:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    .line 24
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCachePolicyUnset:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    aput-object v1, v0, v3

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionLRU:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    aput-object v1, v0, v4

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionFIFO:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    aput-object v1, v0, v5

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheEvictionLSF:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    aput-object v1, v0, v7

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->AdobeCommonCacheAllowOfflineUse:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    aput-object v1, v0, v6

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p3, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 52
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 53
    iput p3, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->value:I

    .line 54
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 24
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;
    .registers 1

    .prologue
    .line 24
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCachePolicies;

    return-object v0
.end method
