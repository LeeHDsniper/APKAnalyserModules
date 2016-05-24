.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;
.super Ljava/lang/Object;
.source "CdsManifestMessagesConsumer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

.field private threadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

.field private wifiOnly:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;->context:Landroid/content/Context;

    .line 69
    return-void
.end method


# virtual methods
.method public build()Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;
    .registers 7

    .prologue
    .line 87
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;->manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    if-nez v0, :cond_c

    .line 88
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "manifest parser cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_c
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;->context:Landroid/content/Context;

    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;->wifiOnly:Z

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;->threadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;->manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer;-><init>(Landroid/content/Context;ZLcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$1;)V

    return-object v0
.end method

.method public withParser(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;
    .registers 2
    .param p1, "parser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;->manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .line 83
    return-object p0
.end method

.method public withThreadPool(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;
    .registers 2
    .param p1, "threadPool"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .prologue
    .line 77
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;->threadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .line 78
    return-object p0
.end method

.method public withWifiOnly(Z)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;
    .registers 2
    .param p1, "value"    # Z

    .prologue
    .line 72
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesConsumer$Builder;->wifiOnly:Z

    .line 73
    return-object p0
.end method
