.class Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$3;
.super Ljava/lang/Object;
.source "AdobeCommonCache.java"

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    .prologue
    .line 203
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 4
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 206
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$3;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->clearAllCaches()V

    .line 207
    return-void
.end method
