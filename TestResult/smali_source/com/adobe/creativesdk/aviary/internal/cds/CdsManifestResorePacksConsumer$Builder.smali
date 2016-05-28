.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;
.super Ljava/lang/Object;
.source "CdsManifestResorePacksConsumer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private iterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

.field private threadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

.field private wifiOnly:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->context:Landroid/content/Context;

    .line 59
    return-void
.end method


# virtual methods
.method public build()Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;
    .registers 8

    .prologue
    .line 82
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    if-nez v0, :cond_c

    .line 83
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "manifest parser cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_c
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->context:Landroid/content/Context;

    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->wifiOnly:Z

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->threadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->iterator:Ljava/util/Iterator;

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer;-><init>(Landroid/content/Context;ZLcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Ljava/util/Iterator;Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$1;)V

    return-object v0
.end method

.method public withIterator(Ljava/util/Iterator;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;"
        }
    .end annotation

    .prologue
    .line 77
    .local p1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->iterator:Ljava/util/Iterator;

    .line 78
    return-object p0
.end method

.method public withParser(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;
    .registers 2
    .param p1, "parser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .line 73
    return-object p0
.end method

.method public withThreadPool(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;
    .registers 2
    .param p1, "threadPool"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->threadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .line 68
    return-object p0
.end method

.method public withWifiOnly(Z)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 62
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestResorePacksConsumer$Builder;->wifiOnly:Z

    .line 63
    return-object p0
.end method
