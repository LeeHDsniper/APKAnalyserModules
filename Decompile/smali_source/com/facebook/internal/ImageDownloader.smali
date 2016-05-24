.class public Lcom/facebook/internal/ImageDownloader;
.super Ljava/lang/Object;
.source "ImageDownloader.java"


# static fields
.field private static cacheReadQueue:Lcom/facebook/internal/WorkQueue;

.field private static downloadQueue:Lcom/facebook/internal/WorkQueue;

.field private static final pendingRequests:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 40
    new-instance v0, Lcom/facebook/internal/WorkQueue;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lcom/facebook/internal/WorkQueue;-><init>(I)V

    sput-object v0, Lcom/facebook/internal/ImageDownloader;->downloadQueue:Lcom/facebook/internal/WorkQueue;

    .line 41
    new-instance v0, Lcom/facebook/internal/WorkQueue;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lcom/facebook/internal/WorkQueue;-><init>(I)V

    sput-object v0, Lcom/facebook/internal/ImageDownloader;->cacheReadQueue:Lcom/facebook/internal/WorkQueue;

    .line 43
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/facebook/internal/ImageDownloader;->pendingRequests:Ljava/util/Map;

    return-void
.end method

.method public static clearCache(Landroid/content/Context;)V
    .registers 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 108
    invoke-static {p0}, Lcom/facebook/internal/ImageResponseCache;->clearCache(Landroid/content/Context;)V

    .line 109
    invoke-static {p0}, Lcom/facebook/internal/UrlRedirectCache;->clearCache(Landroid/content/Context;)V

    .line 110
    return-void
.end method
