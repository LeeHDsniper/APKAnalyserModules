.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;
.super Ljava/lang/Object;
.source "CdsManifestPacksConsumer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

.field private operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

.field private threadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

.field private wifiOnly:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->context:Landroid/content/Context;

    .line 77
    return-void
.end method


# virtual methods
.method public build()Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;
    .registers 8

    .prologue
    .line 100
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    if-nez v0, :cond_c

    .line 101
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "manifest parser cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 103
    :cond_c
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->context:Landroid/content/Context;

    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->wifiOnly:Z

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->threadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer;-><init>(Landroid/content/Context;ZLcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/cds/Operations;Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$1;)V

    return-object v0
.end method

.method public withOperations(Lcom/adobe/creativesdk/aviary/internal/cds/Operations;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;
    .registers 2
    .param p1, "operations"    # Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    .line 86
    return-object p0
.end method

.method public withParser(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;
    .registers 2
    .param p1, "parser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .prologue
    .line 95
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .line 96
    return-object p0
.end method

.method public withThreadPool(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;
    .registers 2
    .param p1, "threadPool"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->threadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .line 91
    return-object p0
.end method

.method public withWifiOnly(Z)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 80
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksConsumer$Builder;->wifiOnly:Z

    .line 81
    return-object p0
.end method
