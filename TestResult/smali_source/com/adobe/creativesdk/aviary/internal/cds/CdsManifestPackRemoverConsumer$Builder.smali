.class Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;
.super Ljava/lang/Object;
.source "CdsManifestPackRemoverConsumer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Builder"
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

.field private parser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;->context:Landroid/content/Context;

    .line 56
    return-void
.end method


# virtual methods
.method build()Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;
    .registers 6

    .prologue
    .line 69
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;->context:Landroid/content/Context;

    if-nez v0, :cond_c

    .line 70
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;->parser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    if-nez v0, :cond_18

    .line 73
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Parser is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_18
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;->parser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;->operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer;-><init>(Landroid/content/Context;Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;Lcom/adobe/creativesdk/aviary/internal/cds/Operations;Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$1;)V

    return-object v0
.end method

.method withOperations(Lcom/adobe/creativesdk/aviary/internal/cds/Operations;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;
    .registers 2
    .param p1, "operations"    # Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;->operations:Lcom/adobe/creativesdk/aviary/internal/cds/Operations;

    .line 65
    return-object p0
.end method

.method withParser(Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;)Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;
    .registers 2
    .param p1, "parser"    # Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .prologue
    .line 59
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/cds/CdsManifestPackRemoverConsumer$Builder;->parser:Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;

    .line 60
    return-object p0
.end method
