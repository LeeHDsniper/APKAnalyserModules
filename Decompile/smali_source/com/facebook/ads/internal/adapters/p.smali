.class public abstract Lcom/facebook/ads/internal/adapters/p;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/facebook/ads/internal/adapters/AdAdapter;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract a(Landroid/content/Context;Lcom/facebook/ads/internal/adapters/q;Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/facebook/ads/internal/adapters/q;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract a(Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract b(Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract b()Z
.end method

.method public abstract d()Z
.end method

.method public abstract e()I
.end method

.method public final getPlacementType()Lcom/facebook/ads/internal/server/AdPlacementType;
    .registers 2

    sget-object v0, Lcom/facebook/ads/internal/server/AdPlacementType;->NATIVE:Lcom/facebook/ads/internal/server/AdPlacementType;

    return-object v0
.end method

.method public abstract i()Lcom/facebook/ads/NativeAd$Image;
.end method

.method public abstract t()Ljava/lang/String;
.end method

.method public abstract u()Ljava/lang/String;
.end method

.method public abstract v()Ljava/lang/String;
.end method

.method public abstract w()Z
.end method
