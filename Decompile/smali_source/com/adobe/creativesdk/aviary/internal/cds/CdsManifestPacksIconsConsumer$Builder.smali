.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;
.super Ljava/lang/Object;
.source "CdsManifestPacksIconsConsumer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

.field private packList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private threadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

.field private wifiOnly:Z


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 257
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 258
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->context:Landroid/content/Context;

    .line 259
    return-void
.end method


# virtual methods
.method build()Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;
    .registers 8

    .prologue
    .line 282
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->context:Landroid/content/Context;

    if-nez v0, :cond_c

    .line 283
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 285
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    if-nez v0, :cond_18

    .line 286
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Parser is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 288
    :cond_18
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->threadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    if-nez v0, :cond_24

    .line 289
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "ThreadPool is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 292
    :cond_24
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->threadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->wifiOnly:Z

    iget-object v5, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->packList:Ljava/util/ArrayList;

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer;-><init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;ZLjava/util/ArrayList;Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$1;)V

    return-object v0
.end method

.method wifiOnly(Z)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;
    .registers 2
    .param p1, "wifiOnly"    # Z

    .prologue
    .line 262
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->wifiOnly:Z

    .line 263
    return-object p0
.end method

.method public withDefinedList(Ljava/util/ArrayList;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;",
            ">;)",
            "Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;"
        }
    .end annotation

    .prologue
    .line 277
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/adobe/creativesdk/aviary/internal/cds/PacksColumns$PackCursorWrapper;>;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->packList:Ljava/util/ArrayList;

    .line 278
    return-object p0
.end method

.method withParser(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;
    .registers 2
    .param p1, "parser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .prologue
    .line 267
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->manifestParser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .line 268
    return-object p0
.end method

.method withThreadPool(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;
    .registers 2
    .param p1, "threadPool"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .prologue
    .line 272
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPacksIconsConsumer$Builder;->threadPool:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    .line 273
    return-object p0
.end method
