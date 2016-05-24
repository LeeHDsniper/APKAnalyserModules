.class public interface abstract Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHandler;
.super Ljava/lang/Object;
.source "AdobeCommonCacheHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract onHit(Ljava/lang/Object;Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheHitLocation;",
            ")V"
        }
    .end annotation
.end method

.method public abstract onMiss()V
.end method
