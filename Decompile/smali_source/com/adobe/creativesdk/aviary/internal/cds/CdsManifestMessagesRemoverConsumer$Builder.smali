.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$Builder;
.super Ljava/lang/Object;
.source "CdsManifestMessagesRemoverConsumer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private parser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$Builder;->context:Landroid/content/Context;

    .line 39
    return-void
.end method


# virtual methods
.method build()Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;
    .registers 5

    .prologue
    .line 47
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$Builder;->context:Landroid/content/Context;

    if-nez v0, :cond_c

    .line 48
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$Builder;->parser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    if-nez v0, :cond_18

    .line 51
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Parser is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 53
    :cond_18
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$Builder;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$Builder;->parser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer;-><init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$1;)V

    return-object v0
.end method

.method withParser(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$Builder;
    .registers 2
    .param p1, "parser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestMessagesRemoverConsumer$Builder;->parser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .line 43
    return-object p0
.end method
