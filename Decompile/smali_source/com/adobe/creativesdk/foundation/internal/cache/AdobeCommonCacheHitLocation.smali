.class public final enum Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;
.super Ljava/lang/Enum;
.source "AdobeCommonCacheHitLocation.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

.field public static final enum AdobeCommonCacheHitLocationDisk:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

.field public static final enum AdobeCommonCacheHitLocationMemory:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 25
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    const-string v1, "AdobeCommonCacheHitLocationMemory"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;->AdobeCommonCacheHitLocationMemory:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    .line 27
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    const-string v1, "AdobeCommonCacheHitLocationDisk"

    invoke-direct {v0, v1, v3}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;->AdobeCommonCacheHitLocationDisk:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    .line 22
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;->AdobeCommonCacheHitLocationMemory:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    aput-object v1, v0, v2

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;->AdobeCommonCacheHitLocationDisk:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    aput-object v1, v0, v3

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

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
    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    return-object v0
.end method

.method public static values()[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;
    .registers 1

    .prologue
    .line 22
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;->$VALUES:[Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    invoke-virtual {v0}, [Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;

    return-object v0
.end method
