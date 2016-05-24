.class Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$2;
.super Ljava/lang/Object;
.source "AdobeCommonCacheInstance.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;-><init>(Ljava/util/concurrent/ExecutorService;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/util/Map$Entry",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Long;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .prologue
    .line 158
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$2;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .prologue
    .line 158
    check-cast p1, Ljava/util/Map$Entry;

    check-cast p2, Ljava/util/Map$Entry;

    invoke-virtual {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$2;->compare(Ljava/util/Map$Entry;Ljava/util/Map$Entry;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/util/Map$Entry;Ljava/util/Map$Entry;)I
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 161
    .local p1, "lhs":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;"
    .local p2, "rhs":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Long;>;"
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/lang/Long;->compareTo(Ljava/lang/Long;)I

    move-result v0

    return v0
.end method
